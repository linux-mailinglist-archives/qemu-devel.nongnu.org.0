Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9ED21C38
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 19:09:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRgMK-0006Is-8G
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 13:09:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kenneth.heitke@intel.com>) id 1hRgLC-0005zi-NZ
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:08:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kenneth.heitke@intel.com>) id 1hRgLB-0005bY-Lu
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:08:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:28260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kenneth.heitke@intel.com>)
	id 1hRgL9-0005UB-Cm; Fri, 17 May 2019 13:08:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2019 10:08:11 -0700
Received: from unknown (HELO [10.232.112.136]) ([10.232.112.136])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
	17 May 2019 10:08:10 -0700
To: qemu-block@nongnu.org, keith.busch@intel.com, kwolf@redhat.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
References: <20190405214117.1850-1-kenneth.heitke@intel.com>
	<20190514060225.GA1350@apples.localdomain>
	<1f607df5-b523-e517-c439-392725fd441b@intel.com>
	<20190517053504.GA17341@apples.localdomain>
	<20190517062442.GB17341@apples.localdomain>
From: "Heitke, Kenneth" <kenneth.heitke@intel.com>
Message-ID: <b6b37b74-4fae-eb7d-dd6b-ae1ec8b34b1e@intel.com>
Date: Fri, 17 May 2019 11:08:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517062442.GB17341@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
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



On 5/17/2019 12:24 AM, Klaus Birkelund wrote:
> On Fri, May 17, 2019 at 07:35:04AM +0200, Klaus Birkelund wrote:
>> Hi Kenneth,
>>
>> On Thu, May 16, 2019 at 05:24:47PM -0600, Heitke, Kenneth wrote:
>>> Hi Klaus, thank you for you review. I have one comment inline
>>>
>>> On 5/14/2019 12:02 AM, Klaus Birkelund wrote:
>>>> On Fri, Apr 05, 2019 at 03:41:17PM -0600, Kenneth Heitke wrote:
>>>>> Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
>>>>> ---
>>>>>    hw/block/nvme.c       | 120 +++++++++++++++++++++++++++++++++++++++++-
>>>>>    hw/block/nvme.h       |   3 ++
>>>>>    hw/block/trace-events |   2 +
>>>>>    include/block/nvme.h  |   2 +
>>>>>    4 files changed, 125 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>>>> index 7caf92532a..e775e89299 100644
>>>>> --- a/hw/block/nvme.c
>>>>> +++ b/hw/block/nvme.c
>>>>> @@ -219,6 +219,30 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
>>>>>        return NVME_INVALID_FIELD | NVME_DNR;
>>>>>    }
>>>>> +static uint16_t nvme_dma_write_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>>>>> +                                   uint64_t prp1, uint64_t prp2)
>>>>> +{
>>>>> +    QEMUSGList qsg;
>>>>> +    QEMUIOVector iov;
>>>>> +    uint16_t status = NVME_SUCCESS;
>>>>> +
>>>>> +    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
>>>>> +        return NVME_INVALID_FIELD | NVME_DNR;
>>>>> +    }
>>>>> +    if (qsg.nsg > 0) {
>>>>> +        if (dma_buf_write(ptr, len, &qsg)) {
>>>>> +            status = NVME_INVALID_FIELD | NVME_DNR;
>>>>> +        }
>>>>> +        qemu_sglist_destroy(&qsg);
>>>>> +    } else {
>>>>> +        if (qemu_iovec_from_buf(&iov, 0, ptr, len) != len) {
>>>>
>>>> This should be `qemu_iovec_to_buf`.
>>>>
>>>
>>> This function is transferring data from the "host" to the device so I
>>> believe I am using the correct function.
>>>
>>
>> Exactly, but this means that you need to populate `ptr` with data
>> described by the prps, hence dma_buf_*write* and qemu_iovec_*to*_buf. In
>> this case `ptr` is set to the address of the uint64_t timestamp, and
>> that is what we need to write to.
>>
> 
> I was going to argue with the fact that nvme_dma_read_prp uses
> qemu_iovec_from_buf. But it uses _to_buf which as far as I can tell is
> also wrong.
> 

I think the iovec_to/from_buf is only used in the case of the controller 
memory buffer. I'm trying to exercise that path to verify if the correct 
functions are being used but I'm running into issues (io is being 
directed to bar0 instead of bar2).


