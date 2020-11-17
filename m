Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B72B5B58
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:46 +0100 (CET)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewjF-000635-17
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kewgj-0004Qa-Np
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:50:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:59764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kewge-0004Ta-5Y
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:50:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DD56AF62;
 Tue, 17 Nov 2020 08:50:02 +0000 (UTC)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
 <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
 <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
 <d2a538ca-d865-07d7-1c8f-380633bd4b0e@redhat.com>
 <f97fc536-d666-4a5e-5178-8ee86b2f3f7b@suse.de>
 <483cc7e9-fc93-2994-49cb-bd97e383dbb6@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a64eea56-f54d-f2df-4036-0ffddf24aee2@suse.de>
Date: Tue, 17 Nov 2020 09:50:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <483cc7e9-fc93-2994-49cb-bd97e383dbb6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:53:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 8:38 AM, Paolo Bonzini wrote:
> On 17/11/20 07:55, Hannes Reinecke wrote:
>> On 11/16/20 11:00 PM, Paolo Bonzini wrote:
>>> On 16/11/20 20:05, Hannes Reinecke wrote:
>>>>>> +    if (sreq->host_status == SCSI_HOST_OK) {
>>>>>> +        SCSISense sense;
>>>>>> +
>>>>>> +        sreq->status = 
>>>>>> scsi_sense_from_host_status(sreq->host_status, &sense);
>>>>>> +        if (sreq->status == CHECK_CONDITION) {
>>>>>> +            scsi_req_build_sense(sreq, sense);
>>>>>> +        }
>>>>>> +    }
>>>>>
>>>>> Should be != of course.
>>>>>
>>>> No.
>>>> scsi_req_build_sense() transfers the sense code from the second 
>>>> argument
>>>> into a proper SCSI sense. Which is only set if the status is 
>>>> CHECK_CONDITION...
>>>
>>> I mean sreq->host_status != SCSI_HOST_OK.  I might be wrong, but 
>>> every other HBA is using that...
>>>
>> Bah. Yes, of course, you are right.
>>
>> Shall I resubmit? Or how is the process nowadays?
> 
> Depends on how busy and grumpy I am. :)  Since we're right in the middle 
> of the freeze, let me send a RFC patch for Linux to clean up DID_* a 
> little bit.
> 
What's your intention there? I do have (of course) a larger patchset for 
revisiting the SCSI status codes, so I could resubmit those portions 
relating to DID_ codes ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

