Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DD2210FF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 01:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRPmD-0003Nl-1m
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 19:27:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kenneth.heitke@intel.com>) id 1hRPkW-0002Xf-HJ
	for qemu-devel@nongnu.org; Thu, 16 May 2019 19:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kenneth.heitke@intel.com>) id 1hRPkS-0007C7-LX
	for qemu-devel@nongnu.org; Thu, 16 May 2019 19:25:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:32112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kenneth.heitke@intel.com>)
	id 1hRPkH-0006vl-1x; Thu, 16 May 2019 19:25:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 16:24:49 -0700
Received: from unknown (HELO [10.232.112.136]) ([10.232.112.136])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
	16 May 2019 16:24:48 -0700
To: qemu-block@nongnu.org, keith.busch@intel.com, kwolf@redhat.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
References: <20190405214117.1850-1-kenneth.heitke@intel.com>
	<20190514060225.GA1350@apples.localdomain>
From: "Heitke, Kenneth" <kenneth.heitke@intel.com>
Message-ID: <1f607df5-b523-e517-c439-392725fd441b@intel.com>
Date: Thu, 16 May 2019 17:24:47 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514060225.GA1350@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] nvme: add Get/Set Feature
 Timestamp support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Klaus, thank you for you review. I have one comment inline

On 5/14/2019 12:02 AM, Klaus Birkelund wrote:
> On Fri, Apr 05, 2019 at 03:41:17PM -0600, Kenneth Heitke wrote:
>> Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
>> ---
>>   hw/block/nvme.c       | 120 +++++++++++++++++++++++++++++++++++++++++-
>>   hw/block/nvme.h       |   3 ++
>>   hw/block/trace-events |   2 +
>>   include/block/nvme.h  |   2 +
>>   4 files changed, 125 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 7caf92532a..e775e89299 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -219,6 +219,30 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
>>       return NVME_INVALID_FIELD | NVME_DNR;
>>   }
>>   
>> +static uint16_t nvme_dma_write_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>> +                                   uint64_t prp1, uint64_t prp2)
>> +{
>> +    QEMUSGList qsg;
>> +    QEMUIOVector iov;
>> +    uint16_t status = NVME_SUCCESS;
>> +
>> +    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
>> +        return NVME_INVALID_FIELD | NVME_DNR;
>> +    }
>> +    if (qsg.nsg > 0) {
>> +        if (dma_buf_write(ptr, len, &qsg)) {
>> +            status = NVME_INVALID_FIELD | NVME_DNR;
>> +        }
>> +        qemu_sglist_destroy(&qsg);
>> +    } else {
>> +        if (qemu_iovec_from_buf(&iov, 0, ptr, len) != len) {
> 
> This should be `qemu_iovec_to_buf`.
> 

This function is transferring data from the "host" to the device so I
believe I am using the correct function.

