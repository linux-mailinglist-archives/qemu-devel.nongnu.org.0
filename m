Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11901439F0B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:13:24 +0200 (CEST)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5PP-0006E5-3z
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mf5Mg-0003TI-IV
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:10:35 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48304 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mf5Mb-0000PH-AR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:10:31 -0400
Received: from [192.168.106.118]
 (dynamic-095-114-012-148.95.114.pool.telefonica.de [95.114.12.148])
 by csgraf.de (Postfix) with ESMTPSA id 05E3560803C7;
 Mon, 25 Oct 2021 21:10:26 +0200 (CEST)
Message-ID: <a19cfe8f-a013-b2da-7893-50d7c1ecfecd@csgraf.de>
Date: Mon, 25 Oct 2021 21:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] hvf: Avoid mapping regions < PAGE_SIZE as ram
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Cameron Esfahani <dirty@apple.com>
References: <20211025082558.96864-1-agraf@csgraf.de>
 <6c9b6035-276c-1e15-7b7f-81094473368b@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <6c9b6035-276c-1e15-7b7f-81094473368b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.846,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 25.10.21 19:11, Paolo Bonzini wrote:
> On 25/10/21 10:25, Alexander Graf wrote:
>> HVF has generic memory listener code that adds all RAM regions as HVF 
>> RAM
>> regions. However, HVF can only handle page aligned, page granule 
>> regions.
>>
>> So let's ignore regions that are not page aligned and sized. They 
>> will be
>> trapped as MMIO instead.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   accel/hvf/hvf-accel-ops.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
>> index 6bf319d34c..090155853a 100644
>> --- a/accel/hvf/hvf-accel-ops.c
>> +++ b/accel/hvf/hvf-accel-ops.c
>> @@ -135,6 +135,12 @@ static void hvf_set_phys_mem(MemoryRegionSection 
>> *section, bool add)
>>           }
>>       }
>>   +    if (int128_get64(section->size) & (qemu_real_host_page_size - 
>> 1) ||
>> +        section->offset_within_address_space & 
>> (qemu_real_host_page_size - 1)) {
>> +        /* Not page aligned, so we can not map as RAM */
>> +        add = false;
>> +    }
>> +
>>       mem = hvf_find_overlap_slot(
>>               section->offset_within_address_space,
>>               int128_get64(section->size));
>>
>
> Queued, thanks.


You probably want v2 instead :)

Alex



