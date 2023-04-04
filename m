Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467456D66E4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:11:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiJI-0005Lr-BW; Tue, 04 Apr 2023 11:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pjiJF-0005Li-NY
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:10:57 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pjiJD-0004eA-Rs
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:10:57 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A68FD1FD67;
 Tue,  4 Apr 2023 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680621053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uW2teHuggs2kVkqN79EIuyO/2ev1z3qmpKXTOYdf0Us=;
 b=y32sZ2HzlhEgD9R/IHB9ELWORxJ54mL4KDUjKwy8nffV+NCVfybIuLVAZVXUa7uvXbOTL4
 pRGdL4e9e/dsAz1DIWnK0k0BzP+5hAg5Uk3RtziY6X+DZ5F4UL0c377ZJ9xOsCqzhz7WO+
 NSSZNsKLHEOj1AkYQwiUPLvGBehQBBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680621053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uW2teHuggs2kVkqN79EIuyO/2ev1z3qmpKXTOYdf0Us=;
 b=EO5ifdIAhgVUn7oQ+QGZm+AA/AvVGnYMw1MqUbY0iP9MySHtbsuuyHw7C2nlsqOGPOM+Fr
 54S0/AVQ/3tZqeBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6049413920;
 Tue,  4 Apr 2023 15:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OPTOFf09LGTSfAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 04 Apr 2023 15:10:53 +0000
Message-ID: <ef16fb3d-e7ff-198a-6cb6-d0bdae5dfb3c@suse.de>
Date: Tue, 4 Apr 2023 17:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with multifd
 and fixed-ram
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com, Juan Quintela <quintela@redhat.com>
References: <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <875yagpywy.fsf@suse.de> <ZCdWJ59rqY6oScvg@x1n>
 <d2b40262-3791-8820-5104-e4eb313cd796@suse.de> <ZCsogia3r7ePKBR9@x1n>
 <e4a0c911-aa51-e700-640d-2876881bd077@suse.de> <ZCw56BMiiZlX6nTH@x1n>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <ZCw56BMiiZlX6nTH@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 4/4/23 16:53, Peter Xu wrote:
> On Tue, Apr 04, 2023 at 10:00:16AM +0200, Claudio Fontana wrote:
>> Hi Peter,
> 
> Hi, Claudio,
> 
>>
>> On 4/3/23 21:26, Peter Xu wrote:
>>> Hi, Claudio,
>>>
>>> Thanks for the context.
>>>
>>> On Mon, Apr 03, 2023 at 09:47:26AM +0200, Claudio Fontana wrote:
>>>> Hi, not sure if what is asked here is context in terms of the previous
>>>> upstream discussions or our specific requirement we are trying to bring
>>>> upstream.
>>>>
>>>> In terms of the specific requirement we are trying to bring upstream, we
>>>> need to get libvirt+QEMU VM save and restore functionality to be able to
>>>> transfer VM sizes of ~30 GB (4/8 vcpus) in roughly 5 seconds.  When an
>>>> event trigger happens, the VM needs to be quickly paused and saved to
>>>> disk safely, including datasync, and another VM needs to be restored,
>>>> also in ~5 secs.  For our specific requirement, the VM is never running
>>>> when its data (mostly consisting of RAM) is saved.
>>>>
>>>> I understand that the need to handle also the "live" case comes from
>>>> upstream discussions about solving the "general case", where someone
>>>> might want to do this for "live" VMs, but if helpful I want to highlight
>>>> that it is not part of the specific requirement we are trying to address,
>>>> and for this specific case won't also in the future, as the whole point
>>>> of the trigger is to replace the running VM with another VM, so it cannot
>>>> be kept running.
>>>
>>> From what I read so far, that scenario suites exactly what live snapshot
>>> would do with current QEMU - that at least should involve a snapshot on the
>>> disks being used or I can't see how that can be live.  So it looks like a
>>> separate request.
>>>
>>>> The reason we are using "migrate" here likely stems from the fact that
>>>> existing libvirt code currently uses QMP migrate to implement the save
>>>> and restore commands.  And in my personal view, I think that reusing the
>>>> existing building blocks (migration, multifd) would be preferable, to
>>>> avoid having to maintain two separate ways to do the same thing.  That
>>>> said, it could be done in a different way, if the performance can keep
>>>> up. Just thinking of reducing the overall effort and also maintenance
>>>> surface.
>>>
>>> I would vaguely guess the performance can not only keep up but better than
>>> what the current solution would provide, due to the possibility of (1)
>>> batch handling of continuous guest pages, and (2) completely no dirty
>>> tracking overhead.
>>>
>>> For (2), it's not about wr-protect page faults or vmexits due to PML being
>>> full (because vcpus will be stopped anyway..), it's about enabling the
>>> dirty tracking (which already contains overhead, especially when huge pages
>>> are enabled, to split huge pages in EPT pgtables) and all the bitmap
>>> operations QEMU does during live migration even if the VM is not live.
>>
>> something we could profile for, I do not remember it being really an important source of overhead in my previous profile runs,
>> but maybe worthwhile redoing the profiling with Fabiano's patchset.
> 
> Yes I don't know the detailed number either, it should depend on the guest
> configuration (mem size, mem type, kernel version etc).  It could be less a
> concern comparing to the time used elsewhere.  More on this on below.
> 
>>
>>>
>>> IMHO reusing multifd may or may not be a good idea here, because it'll of
>>> course also complicate multifd code, hence makes multifd harder to
>>> maintain, while not in a good way, because as I mentioned I don't think it
>>> can use much of what multifd provides.
>>
>>
>> The main advantage we get is the automatic multithreading of the qemu_savevm_state_iterate code in my view.
>>
>> Reimplementing the same thing again has the potential to cause bitrot for this use case, and using multiple fds for the transfer is exactly what is needed here,
>> and in my understanding the same exact reason multifd exists: to take advantage of high bandwidth migration channels.
>>
>> The only adjustment needed to multifd is the ability to work with block devices (file fds) as the migration channels instead of just sockets,
>> so it seems a very natural extension of multifd to me.
> 
> Yes, since I haven't looked at the multifd patches at all so I don't have
> solid clue on how much it'll affect multifd.  I'll leave that to Juan.
> 
>>
>>>
>>> I don't have a strong opinion on the impl (even though I do have a
>>> preference..), but I think at least we should still check on two things:
>>>
>>>   - Being crystal clear on the use case above, and double check whether "VM
>>>     stop" should be the default operation at the start of the new cmd - we
>>>     shouldn't assume the user will be aware of doing this, neither should
>>>     we assume the user is aware of the performance implications.
>>
>>
>> Not sure I can identify what you are asking specifically: the use case is to stop executing the currently running VM as soon as possible, save it to disk, then restore another VM as soon as possible.
>> Probably I missed something there.
> 
> Yes, then IMHO as mentioned we should make "vm stop" part of the command
> procedure if vm was still running when invoked.  Then we can already
> optimize dirty logging of above (2) with the current framework. E.g., we
> already optimized live snapshot to not enable dirty logging:
> 
>         if (!migrate_background_snapshot()) {
>             memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>             migration_bitmap_sync_precopy(rs);
>         }
> 
> Maybe that can also be done for fixed-ram migration, so no matter how much
> overhead there will be, that can be avoided.

Understood, agree.

Would it make sense to check for something like if (!runstate_is_running())
instead of checking for the specific multifd + fixed-ram feature?

I think from a high level perspective, there should not be dirtying if the vcpus are not running right?
This could even be a bit more future proof to avoid checking for many features, if they all happen to share the fact that vcpus are not running.

> 
> PS: I think similar optimizations can be done too in ram_save_complete() or
> ram_state_pending_exact().. maybe we should move the check into
> migration_bitmap_sync_precopy() so it can be skipped as a whole when it can.

makes sense, interesting.

I wonder if ramblock_is_ignored() could be optimized a bit too, since it seems to consume roughly the same amount of cpu as the dirty bitmap handling, even when "ignore-shared" is not used.

this feature was added by:

commit fbd162e629aaf8a7e464af44d2f73d06b26428ad
Author: Yury Kotov <yury-kotov@yandex-team.ru>
Date:   Fri Feb 15 20:45:46 2019 +0300

    migration: Add an ability to ignore shared RAM blocks
    
    If ignore-shared capability is set then skip shared RAMBlocks during the
    RAM migration.
    Also, move qemu_ram_foreach_migratable_block (and rename) to the
    migration code, because it requires access to the migration capabilities.
    
    Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
    Message-Id: <20190215174548.2630-4-yury-kotov@yandex-team.ru>
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Probably not that important, just to mention since we were thinking of possible small optimizations.
I would like to share the complete previous callgrind data, but cannot find a way to export them in a readable state, could export the graph though as PDF if helpful.

Likely we'd need a new round of measurements with perf...

Ciao,

Claudio

> 
> Thanks,
> 
>>
>>>
>>>   - Making sure the image layout is well defined, so:
>>>
>>>     - It'll be extensible in the future, and,
>>>
>>>     - If someone would like to refactor it to not use the migration thread
>>>       model anymore, the image format, hopefully, can be easy to keep
>>>       untouched so it can be compatible with the current approach.
>>>
>>> Just my two cents. I think Juan should have the best grasp on this.
>>>
>>> Thanks,
>>>
>>
>> Ciao,
>>
>> Claudio
>>
> 


