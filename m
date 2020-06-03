Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EF1EC933
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 07:58:48 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgMQJ-000842-Bl
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 01:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1jgMPb-0007Rh-40
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:58:03 -0400
Received: from mail.ispras.ru ([83.149.199.45]:47926)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1jgMPZ-0000Ws-G4
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:58:02 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 47993CD465;
 Wed,  3 Jun 2020 08:57:57 +0300 (MSK)
Subject: Re: [PATCH v2] icount: make dma reads deterministic
To: Kevin Wolf <kwolf@redhat.com>, Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
References: <158823737122.27545.13132967751052120169.stgit@pasha-ThinkPad-X280>
 <20200602155440.GK5940@linux.fritz.box>
From: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <ed02a968-88f1-edc4-46f9-1b69c1e06d70@ispras.ru>
Date: Wed, 3 Jun 2020 08:57:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200602155440.GK5940@linux.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=83.149.199.45; envelope-from=dovgaluk@ispras.ru;
 helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:57:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 02.06.2020 18:54, Kevin Wolf wrote:
> Am 30.04.2020 um 11:02 hat Pavel Dovgalyuk geschrieben:
>> From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
>>
>> Windows guest sometimes makes DMA requests with overlapping
>> target addresses. This leads to the following structure of iov for
>> the block driver:
>>
>> addr size1
>> addr size2
>> addr size3
>>
>> It means that three adjacent disk blocks should be read into the same
>> memory buffer. Windows does not expects anything from these bytes
>> (should it be data from the first block, or the last one, or some mix),
>> but uses them somehow. It leads to non-determinism of the guest execution,
>> because block driver does not preserve any order of reading.
>>
>> This situation was discusses in the mailing list at least twice:
>> https://lists.gnu.org/archive/html/qemu-devel/2010-09/msg01996.html
>> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg05185.html
>>
>> This patch makes such disk reads deterministic in icount mode.
>> It splits the whole request into several parts. Parts may overlap,
>> but SGs inside one part do not overlap.
>> Parts that are processed later overwrite the prior ones in case
>> of overlapping.
>>
>> Examples for different SG part sequences:
>>
>> 1)
>> A1 1000
>> A2 1000
>> A1 1000
>> A3 1000
>> ->
>> One request is split into two.
>> A1 1000
>> A2 1000
>> --
>> A1 1000
>> A3 1000
>>
>> 2)
>> A1 800
>> A2 1000
>> A1 1000
>> ->
>> A1 800
>> A2 1000
>> --
>> A1 1000
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
>>
>> --
>>
>> v2:
>>   - Rewritten the loop to split the request instead of skipping the parts
>>     (suggested by Kevin Wolf)
>> ---
>>   dma-helpers.c |   20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/dma-helpers.c b/dma-helpers.c
>> index e8a26e81e1..a49f9a0e34 100644
>> --- a/dma-helpers.c
>> +++ b/dma-helpers.c
>> @@ -13,6 +13,8 @@
>>   #include "trace-root.h"
>>   #include "qemu/thread.h"
>>   #include "qemu/main-loop.h"
>> +#include "sysemu/cpus.h"
>> +#include "qemu/range.h"
>>   
>>   /* #define DEBUG_IOMMU */
>>   
>> @@ -142,6 +144,24 @@ static void dma_blk_cb(void *opaque, int ret)
>>           cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
>>           cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
>>           mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
>> +        /*
>> +         * Make reads deterministic in icount mode. Windows sometimes issues
>> +         * disk read requests with overlapping SGs. It leads
>> +         * to non-determinism, because resulting buffer contents may be mixed
>> +         * from several sectors. This code splits all SGs into several
>> +         * groups. SGs in every group do not overlap.
>> +         */
>> +        if (use_icount && dbs->dir == DMA_DIRECTION_FROM_DEVICE) {
>> +            int i;
>> +            for (i = 0 ; i < dbs->iov.niov ; ++i) {
>> +                if (ranges_overlap((intptr_t)dbs->iov.iov[i].iov_base,
>> +                                   dbs->iov.iov[i].iov_len, (intptr_t)mem,
>> +                                   cur_len)) {
>> +                    mem = NULL;
> Doesn't this leak mem, i.e. should we call dma_memory_unmap()?

Thanks, I missed, that the memory is unmapped on request finish.

> Did you verify that it is guaranteed that mapping the same guest memory
> twice results in the same host address? v1 compared the SG list (which
> has guest addresses) rather than the resulting QEMUIOVector (which has
> host addresses).

We don't need the host addresses to be equivalent in different runs.

The order of the SG list entries is deterministic. This is enough for 
successful exclusion of the duplicate entries.

>
>> +                    break;
>> +                }
>> +            }
>> +        }
>>           if (!mem)
>>               break;
>>           qemu_iovec_add(&dbs->iov, mem, cur_len);
> Kevin
>

