Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69C6D3E5C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:47:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEud-0007FX-VN; Mon, 03 Apr 2023 03:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pjEua-0007F6-An
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:47:32 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pjEuX-0000AU-V3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:47:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CF1221B37;
 Mon,  3 Apr 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680508047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOFCpny12O6rCFqUWd9TQMjKSst+X2SU1jq/FrE9aVg=;
 b=Til7satdfMUSuPPRKaRyl37HMoGB4HDAoBn79n6AUOtKiQdO/Saho4EFZmW6U3mFFgpyf0
 v1KbI6+lH6EJ10I+dByxnGroPZDmMRvO3eaujMhqQsw1CqgPvZxhn13chiEzL7EhWnBfJX
 tzQqJttR84g1p19cp4tQetOPGeiwD/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680508047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOFCpny12O6rCFqUWd9TQMjKSst+X2SU1jq/FrE9aVg=;
 b=RY2XpdYg84eAiE+veYGqVpLP4NQdnDOewZ5cv4W7HgPs2osCsL0x5H6esEILcd1Mxpm4+9
 9H3LOgIEu5pG6kDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 157691331A;
 Mon,  3 Apr 2023 07:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hyCeA4+EKmQcKgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 03 Apr 2023 07:47:27 +0000
Message-ID: <d2b40262-3791-8820-5104-e4eb313cd796@suse.de>
Date: Mon, 3 Apr 2023 09:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with multifd
 and fixed-ram
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com, Juan Quintela <quintela@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <875yagpywy.fsf@suse.de> <ZCdWJ59rqY6oScvg@x1n>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <ZCdWJ59rqY6oScvg@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 23:52, Peter Xu wrote:
> On Fri, Mar 31, 2023 at 03:18:37PM -0300, Fabiano Rosas wrote:
>> Peter Xu <peterx@redhat.com> writes:
>>
>>> On Fri, Mar 31, 2023 at 05:10:16PM +0100, Daniel P. Berrangé wrote:
>>>> On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
>>>>> On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
>>>>>> Peter Xu <peterx@redhat.com> writes:
>>>>>>
>>>>>>> On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
>>>>>>>>>> Outgoing migration to file. NVMe disk. XFS filesystem.
>>>>>>>>>>
>>>>>>>>>> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
>>>>>>>>>>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
>>>>>>>>>>   10m -v`:
>>>>>>>>>>
>>>>>>>>>> migration type  | MB/s | pages/s |  ms
>>>>>>>>>> ----------------+------+---------+------
>>>>>>>>>> savevm io_uring |  434 |  102294 | 71473
>>>>>>>>>
>>>>>>>>> So I assume this is the non-live migration scenario.  Could you explain
>>>>>>>>> what does io_uring mean here?
>>>>>>>>>
>>>>>>>>
>>>>>>>> This table is all non-live migration. This particular line is a snapshot
>>>>>>>> (hmp_savevm->save_snapshot). I thought it could be relevant because it
>>>>>>>> is another way by which we write RAM into disk.
>>>>>>>
>>>>>>> I see, so if all non-live that explains, because I was curious what's the
>>>>>>> relationship between this feature and the live snapshot that QEMU also
>>>>>>> supports.
>>>>>>>
>>>>>>> I also don't immediately see why savevm will be much slower, do you have an
>>>>>>> answer?  Maybe it's somewhere but I just overlooked..
>>>>>>>
>>>>>>
>>>>>> I don't have a concrete answer. I could take a jab and maybe blame the
>>>>>> extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
>>>>>> of bandwidth limits?
>>>>>
>>>>> IMHO it would be great if this can be investigated and reasons provided in
>>>>> the next cover letter.
>>>>>
>>>>>>
>>>>>>> IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
>>>>>>> "we can stop the VM".  It smells slightly weird to build this on top of
>>>>>>> "migrate" from that pov, rather than "savevm", though.  Any thoughts on
>>>>>>> this aspect (on why not building this on top of "savevm")?
>>>>>>>
>>>>>>
>>>>>> I share the same perception. I have done initial experiments with
>>>>>> savevm, but I decided to carry on the work that was already started by
>>>>>> others because my understanding of the problem was yet incomplete.
>>>>>>
>>>>>> One point that has been raised is that the fixed-ram format alone does
>>>>>> not bring that many performance improvements. So we'll need
>>>>>> multi-threading and direct-io on top of it. Re-using multifd
>>>>>> infrastructure seems like it could be a good idea.
>>>>>
>>>>> The thing is IMHO concurrency is not as hard if VM stopped, and when we're
>>>>> 100% sure locally on where the page will go.
>>>>
>>>> We shouldn't assume the VM is stopped though. When saving to the file
>>>> the VM may still be active. The fixed-ram format lets us re-write the
>>>> same memory location on disk multiple times in this case, thus avoiding
>>>> growth of the file size.
>>>
>>> Before discussing on reusing multifd below, now I have a major confusing on
>>> the use case of the feature..
>>>
>>> The question is whether we would like to stop the VM after fixed-ram
>>> migration completes.  I'm asking because:
>>>
>>
>> We would.
>>
>>>   1. If it will stop, then it looks like a "VM suspend" to me. If so, could
>>>      anyone help explain why we don't stop the VM first then migrate?
>>>      Because it avoids copying single pages multiple times, no fiddling
>>>      with dirty tracking at all - we just don't ever track anything.  In
>>>      short, we'll stop the VM anyway, then why not stop it slightly
>>>      earlier?
>>>
>>
>> Looking at the previous discussions I don't see explicit mentions of a
>> requirement either way (stop before or stop after). I agree it makes
>> more sense to stop the guest first and then migrate without having to
>> deal with dirty pages.
>>
>> I presume libvirt just migrates without altering the guest run state so
>> we implemented this to work in both scenarios. But even then, it seems
>> QEMU could store the current VM state, stop it, migrate and restore the
>> state on the destination.
> 
> Yes, I can understand having a unified interface for libvirt would be great
> in this case.  So I am personally not against reusing qmp command "migrate"
> if that would help in any case from libvirt pov.
> 
> However this is an important question to be answered very sure before
> building more things on top.  IOW, even if reusing QMP migrate, we could
> consider a totally different impl (e.g. don't reuse migration thread model).
> 
> As I mentioned above it seems just ideal we always stop the VM so it could
> be part of the command (unlike normal QMP migrate), then it's getting more
> like save_snapshot() as there's the vm_stop().  We should make sure when
> the user uses the new cmd it'll always do that because that's the most
> performant (comparing to enabling dirty tracking and live migrate).
> 
>>
>> I might be missing context here since I wasn't around when this work
>> started. Someone correct me if I'm wrong please.


Hi, not sure if what is asked here is context in terms of the previous upstream discussions or our specific requirement we are trying to bring upstream.

In terms of the specific requirement we are trying to bring upstream, we need to get libvirt+QEMU VM save and restore functionality to be able to transfer VM sizes of ~30 GB (4/8 vcpus) in roughly 5 seconds.
When an event trigger happens, the VM needs to be quickly paused and saved to disk safely, including datasync, and another VM needs to be restored, also in ~5 secs.
For our specific requirement, the VM is never running when its data (mostly consisting of RAM) is saved.

I understand that the need to handle also the "live" case comes from upstream discussions about solving the "general case",
where someone might want to do this for "live" VMs, but if helpful I want to highlight that it is not part of the specific requirement we are trying to address,
and for this specific case won't also in the future, as the whole point of the trigger is to replace the running VM with another VM, so it cannot be kept running.

The reason we are using "migrate" here likely stems from the fact that existing libvirt code currently uses QMP migrate to implement the save and restore commands.
And in my personal view, I think that reusing the existing building blocks (migration, multifd) would be preferable, to avoid having to maintain two separate ways to do the same thing.

That said, it could be done in a different way, if the performance can keep up. Just thinking of reducing the overall effort and also maintenance surface.

Ciao,

Claudio

> 
> Yes, it would be great if someone can help clarify.
> 
> Thanks,
> 
>>
>>>   2. If it will not stop, then it's "VM live snapshot" to me.  We have
>>>      that, aren't we?  That's more efficient because it'll wr-protect all
>>>      guest pages, any write triggers a CoW and we only copy the guest pages
>>>      once and for all.
>>>
>>> Either way to go, there's no need to copy any page more than once.  Did I
>>> miss anything perhaps very important?
>>>
>>> I would guess it's option (1) above, because it seems we don't snapshot the
>>> disk alongside.  But I am really not sure now..
>>>
>>
> 


