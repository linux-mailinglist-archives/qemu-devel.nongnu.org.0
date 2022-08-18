Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5D598C72
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 21:17:47 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOl1V-0000E8-Dq
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 15:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oOkym-0006tw-Lw
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:14:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oOkyk-0005T4-HQ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:14:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6556F5C2BA;
 Thu, 18 Aug 2022 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660850093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6gM/rL9X3Nm5fYXVCATMuS4Q4meB0OZ0TfQEjkqhcw=;
 b=sfZYv5MhYiheX7Jz6/irhFa3GUAv3vB/9KdCGf4ZQFZoKfXEYBtHOTRPswD6P9rxS84hol
 7Hgtl1jf6wBkqk9rUWeEpAFjtX/1jQkYsTbfLEuAOSADnMR2+fSUdE/Gqx8MJHDsDyeVjO
 6vds3v2p3e1A379dE3uSIcgVtBOLTvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660850093;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6gM/rL9X3Nm5fYXVCATMuS4Q4meB0OZ0TfQEjkqhcw=;
 b=7Ow2SQae6womKKepbclL0uC4/udqqJY0YHpGuzrOeZqpFvV1EzKrrHLe96vv+dw8vLxNnI
 8M5ljrVshnRLNdAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12770139B7;
 Thu, 18 Aug 2022 19:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +FFgAq2P/mKwZwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 18 Aug 2022 19:14:53 +0000
Message-ID: <0102a304-a6dc-4308-81ac-4c7a2dbc4b06@suse.de>
Date: Thu, 18 Aug 2022 21:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: towards a workable O_DIRECT outmigration to a file
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Nikolay Borisov <nborisov@suse.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, Claudio Fontana <Claudio.Fontana@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, quintela@redhat.com
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <6f8a6a33-5a68-0eeb-d278-9397b1fd0015@suse.com> <Yv4ys6e0kK/2BMFk@work-vm>
 <f1aa569d-e70f-1b7d-7e10-d6615cfafd7d@suse.de> <Yv5pcSfuLajkZSsb@work-vm>
 <4c984c87-d8c4-0af5-0619-9509a23f916c@suse.de> <Yv6Jt65jKNGyokFZ@work-vm>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yv6Jt65jKNGyokFZ@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/22 20:49, Dr. David Alan Gilbert wrote:
> * Claudio Fontana (cfontana@suse.de) wrote:
>> On 8/18/22 18:31, Dr. David Alan Gilbert wrote:
>>> * Claudio Fontana (cfontana@suse.de) wrote:
>>>> On 8/18/22 14:38, Dr. David Alan Gilbert wrote:
>>>>> * Nikolay Borisov (nborisov@suse.com) wrote:
>>>>>> [adding Juan and David to cc as I had missed them. ]
>>>>>
>>>>> Hi Nikolay,
>>>>>
>>>>>> On 11.08.22 г. 16:47 ч., Nikolay Borisov wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I'm currently looking into implementing a 'file:' uri for migration save
>>>>>>> in qemu. Ideally the solution will be O_DIRECT compatible. I'm aware of
>>>>>>> the branch https://gitlab.com/berrange/qemu/-/tree/mig-file. In the
>>>>>>> process of brainstorming how a solution would like the a couple of
>>>>>>> questions transpired that I think warrant wider discussion in the
>>>>>>> community.
>>>>>
>>>>> OK, so this seems to be a continuation with Claudio and Daniel and co as
>>>>> of a few months back.  I'd definitely be leaving libvirt sides of the
>>>>> question here to Dan, and so that also means definitely looking at that
>>>>> tree above.
>>>>
>>>> Hi Dave, yes, Nikolai is trying to continue on the qemu side.
>>>>
>>>> We have something working with libvirt for our short term needs which offers good performance,
>>>> but it is clear that that simple solution is barred for upstream libvirt merging.
>>>>
>>>>
>>>>>
>>>>>>> First, implementing a solution which is self-contained within qemu would
>>>>>>> be easy enough( famous last words) but the gist is one  has to only care
>>>>>>> about the format within qemu. However, I'm being told that what libvirt
>>>>>>> does is prepend its own custom header to the resulting saved file, then
>>>>>>> slipstreams the migration stream from qemu. Now with the solution that I
>>>>>>> envision I intend to keep all write-related logic inside qemu, this
>>>>>>> means there's no way to incorporate the logic of libvirt. The reason I'd
>>>>>>> like to keep the write process within qemu is to avoid an extra copy of
>>>>>>> data between the two processes (qemu outging migration and libvirt),
>>>>>>> with the current fd approach qemu is passed an fd, data is copied
>>>>>>> between qemu/libvirt and finally the libvirt_iohelper writes the data.
>>>>>>> So the question which remains to be answered is how would libvirt make
>>>>>>> use of this new functionality in qemu? I was thinking something along
>>>>>>> the lines of :
>>>>>>>
>>>>>>> 1. Qemu writes its migration stream to a file, ideally on a filesystem
>>>>>>> which supports reflink - xfs/btrfs
>>>>>>>
>>>>>>> 2. Libvirt writes it's header to a separate file
>>>>>>> 2.1 Reflinks the qemu's stream right after its header
>>>>>>> 2.2 Writes its trailer
>>>>>>>
>>>>>>> 3. Unlink() qemu's file, now only libvirt's file remains on-disk.
>>>>>>>
>>>>>>> I wouldn't call this solution hacky though it definitely leaves some
>>>>>>> bitter aftertaste.
>>>>>
>>>>> Wouldn't it be simpler to tell libvirt to write it's header, then tell
>>>>> qemu to append everything?
>>>>
>>>> I would think so as well. 
>>>>
>>>>>
>>>>>>> Another solution would be to extend the 'fd:' protocol to allow multiple
>>>>>>> descriptors (for multifd) support to be passed in. The reason dup()
>>>>>>> can't be used is because in order for multifd to be supported it's
>>>>>>> required to be able to write to multiple, non-overlapping regions of the
>>>>>>> file. And duplicated fd's share their offsets etc. But that really seems
>>>>>>> more or less hacky. Alternatively it's possible that pwrite() are used
>>>>>>> to write to non-overlapping regions in the file. Any feedback is
>>>>>>> welcomed.
>>>>>
>>>>> I do like the idea of letting fd: take multiple fd's.
>>>>
>>>> Fine in my view, I think we will still need then a helper process in libvirt to merge the data into a single file, no?
>>>> In case the libvirt multifd to single file multithreaded helper I proposed before is helpful as a reference you could reuse/modify those patches.
>>>
>>> Eww that's messy isn't it.
>>> (You don't fancy a huge sparse file do you?)
>>
>> Wait am I missing something obvious here?
>>
>> Maybe we don't need any libvirt extra process.
>>
>> why don't we open the _single_ file multiple times from libvirt,
>>
>> Lets say the "main channel" fd is opened, we write the libvirt header,
>> then reopen again the same file multiple times,
>> and finally pass all fds to qemu, one fd for each parallel transfer channel we want to use
>> (so we solve all the permissions, security labels issues etc).
>>
>> And then from QEMU we can write to those fds at the right offsets for each separate channel,
>> which is easier from QEMU because we can know exactly how much data we need to transfer before starting the migration,
>> so we have even less need for "holes", possibly only minor ones for single byte adjustments
>> for uneven division of the interleaved file.
>>
>> What is wrong with this one, or does anyone see some other better approach?
> 
> You'd have to know exactly how to space the channels position in the
> file, unless you somehow controlled it; the allocation across the
> multifd threads is load/scheduler/random I think, so you'd have to
> assume the worst case of everything going to one thread.
> I.e. a big sparse area and then something to tell you where they are.

No why, just split the work evenly between threads, with each one writing to interleaved areas depending on the thread index,
pass the relevant parallel=n parameter from libvirt at save/restore time so qemu knows how to split the data.

Ciao,

C

> 
> Dave
> 
>> Thanks,
>>
>> C
>>
>>>
>>>> Maybe this new way will be acceptable to libvirt,
>>>> ie avoiding the multifd code -> socket, but still merging the data from the multiple fds into a single file?
>>>
>>> It feels to me like the problem here is really what we want is something
>>> closer to a dump than the migration code; you don't need all that
>>> overhead of the code to deal with live migration bitmaps and dirty pages
>>> that aren't going to happen.
>>> Something that just does a nice single write(2) (for each memory
>>> region);
>>> and then ties the device state on.
>>>
>>> Dave
>>>
>>>>>
>>>>> Dave
>>>>>
>>>>
>>>> Thanks for your comments,
>>>>
>>>> Claudio
>>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Nikolay
>>>>>>
>>>>
>>


