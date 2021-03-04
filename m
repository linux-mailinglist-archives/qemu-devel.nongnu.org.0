Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742732D781
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:17:57 +0100 (CET)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHqfj-0007l9-Iz
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lHqdR-0006sh-9s; Thu, 04 Mar 2021 11:15:33 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:23448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lHqdP-0006JN-2b; Thu, 04 Mar 2021 11:15:33 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C108E462C8;
 Thu,  4 Mar 2021 17:07:17 +0100 (CET)
Subject: Re: Potential regression in 'qemu-img convert' to LVM
To: Nir Soffer <nsoffer@redhat.com>
References: <1b7b5aa0-2ab0-75a5-68f4-01eb4684dbcb@proxmox.com>
 <CAMRbyyuLboa+XWAmboC5Q6ZQ2KoVXMKJC=r+fGiHPTMEJR8JnA@mail.gmail.com>
 <c00f320b-4d8b-d345-acc5-ba43202a05e3@proxmox.com>
 <CAMRbyyuAxb+qKSUAH_4XSzWYQz3+agAbEv+X93WTKG+1+kifRQ@mail.gmail.com>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <94b3a174-224a-a21a-08d5-1f5d93c339f5@proxmox.com>
Date: Thu, 4 Mar 2021 17:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuAxb+qKSUAH_4XSzWYQz3+agAbEv+X93WTKG+1+kifRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2021 21:03, Nir Soffer wrote:
> On Tue, Sep 15, 2020 at 2:51 PM Stefan Reiter <s.reiter@proxmox.com> wrote:
>>
>> On 9/15/20 11:08 AM, Nir Soffer wrote:
>>> On Mon, Sep 14, 2020 at 3:25 PM Stefan Reiter <s.reiter@proxmox.com> wrote:
>>>>
>>>> Hi list,
>>>>
>>>> following command fails since 5.1 (tested on kernel 5.4.60):
>>>>
>>>> # qemu-img convert -p -f raw -O raw /dev/zvol/pool/disk-1 /dev/vg/disk-1
>>>> qemu-img: error while writing at byte 2157968896: Device or resource busy
>>>>
>>>> (source is ZFS here, but doesn't matter in practice, it always fails the
>>>> same; offset changes slightly but consistently hovers around 2^31)
>>>>
>>>> strace shows the following:
>>>> fallocate(13, FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, 2157968896,
>>>> 4608) = -1 EBUSY (Device or resource busy)
>>>
>>> What is the size of the LV?
>>>
>>
>> Same as the source, 5GB in my test case. Created with:
>>
>> # lvcreate -ay --size 5242880k --name disk-1 vg
>>
>>> Does it happen if you change sparse minimum size (-S)?
>>>
>>> For example: -S 64k
>>>
>>>       qemu-img convert -p -f raw -O raw -S 64k /dev/zvol/pool/disk-1
>>> /dev/vg/disk-1
>>>
>>
>> Tried a few different values, always the same result: EBUSY at byte
>> 2157968896.
>>
>>>> Other fallocate calls leading up to this work fine.
>>>>
>>>> This happens since commit edafc70c0c "qemu-img convert: Don't pre-zero
>>>> images", before that all fallocates happened at the start. Reverting the
>>>> commit and calling qemu-img exactly the same way on the same data works
>>>> fine.
>>>
>>> But slowly, doing up to 100% more work for fully allocated images.
>>>
>>
>> Of course, I'm not saying the patch is wrong, reverting it just avoids
>> triggering the bug.
>>
>>>> Simply retrying the syscall on EBUSY (like EINTR) does *not* work,
>>>> once it fails it keeps failing with the same error.
>>>>
>>>> I couldn't find anything related to EBUSY on fallocate, and it only
>>>> happens on LVM targets... Any idea or pointers where to look?
>>>
>>> Is this thin LV?
>>>
>>
>> No, regular LV. See command above.
>>
>>> This works for us using regular LVs.
>>>
>>> Which kernel? which distro?
>>>
>>
>> Reproducible on:
>> * PVE w/ kernel 5.4.60 (Ubuntu based)
>> * Manjaro w/ kernel 5.8.6
>>
>> I found that it does not happen with all images, I suppose there must be
>> a certain number of smaller holes for it to happen. I am using a VM
>> image with a bare-bones Alpine Linux installation, but it's not an
>> isolated case, we've had two people report the issue on our bug tracker:
>> https://bugzilla.proxmox.com/show_bug.cgi?id=3002
> 
> I think that this issue may be fixed by
> https://lists.nongnu.org/archive/html/qemu-block/2020-11/msg00358.html
> 
> Nir
> 
> 

Sorry for the late reply, but yes, I can confirm this fixes the issue.

~


