Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DF220CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 14:26:50 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvgUq-0000yh-TM
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 08:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jvgTt-0000YJ-Ao
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 08:25:49 -0400
Received: from [195.135.220.15] (port=54882 helo=mx2.suse.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jvgTr-0002vx-7D
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 08:25:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD3E5AC90;
 Wed, 15 Jul 2020 12:25:48 +0000 (UTC)
Subject: Re: migration: broken snapshot saves appear on s390 when small fields
 in migration stream removed
From: Claudio Fontana <cfontana@suse.de>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <8bbafdec-836d-b7de-cab8-7a325b6e238d@suse.de>
 <55c406cd-b9ca-4e9b-0acd-d33cfe2a70e3@redhat.com>
 <bf074240-8cc3-96ff-e95e-bd301822b756@suse.de>
 <ea3b617f-c2ea-534c-06ba-f5f9f43828a7@suse.de>
 <8125b1ff-373a-aadc-eccf-27c567007a27@redhat.com>
 <8ff7eeab-bef1-0957-a95c-72819680c431@suse.de>
Message-ID: <f3b08043-e933-cec5-d61e-5d386b73a6c7@suse.de>
Date: Wed, 15 Jul 2020 14:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8ff7eeab-bef1-0957-a95c-72819680c431@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 195.135.220.15 (failed)
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 23:03:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, RDNS_NONE=0.793,
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
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/20 1:10 PM, Claudio Fontana wrote:
> Hi Thomas,
> 
> On 7/14/20 4:35 PM, Thomas Huth wrote:
>> On 14/07/2020 16.29, Claudio Fontana wrote:
>>> Hello,
>>>
>>> I have some tiny progress in narrowing down this issue, possibly a qcow2 issue, still unclear,
>>> but involving Kevin Wolf and Max Reitz.
>>>
>>>
>>> The reproducer again:
>>>
>>>> --------------------------------------------cut-------------------------------------------
>>>> diff --git a/cpus.c b/cpus.c
>>>> index 41d1c5099f..443b88697a 100644
>>>> --- a/cpus.c
>>>> +++ b/cpus.c
>>>> @@ -643,7 +643,7 @@ static void qemu_account_warp_timer(void)
>>>>  
>>>>  static bool icount_state_needed(void *opaque)
>>>>  {
>>>> -    return use_icount;
>>>> +    return 0;
>>>>  }
>>>>  
>>>>  static bool warp_timer_state_needed(void *opaque)
>>>> --------------------------------------------cut-------------------------------------------
>>>
>>> This issue for now appears on s390 only:
>>>
>>> On s390 hardware, test 267 fails (both kvm and tcg) in the qcow2 backing file part, with broken migration stream data in the s390-skeys vmsave (old style).
>> [...]
>>> If someone has a good idea let me know - first attempts to reproduce on x86 failed, but maybe more work could lead to it.
>>
> 
> small update: in the GOOD case (enough padding added) a qcow_merge() is triggered for the last write of 16202 bytes.
> In the BAD case (not enough padding added) a qcow_merge() is not triggered for the last write of 16201 bytes.

I am talking about merge_cow() here, and it is more complicated. Will post a better explanation later on.

> 
> Note: manually flushing with qemu_fflush in s390-skeys vmsave also works (maybe got lost in the noise).

