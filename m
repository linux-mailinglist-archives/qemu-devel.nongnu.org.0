Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00604E7056
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 10:57:54 +0100 (CET)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXghd-0005AS-MO
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 05:57:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nXggE-0004Mx-8R
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 05:56:26 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nXggC-0000cB-Hj
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 05:56:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A447F21100;
 Fri, 25 Mar 2022 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648202181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cre4hFYwlAM2rFjOeZ1sQW5IYOT+vE9x+G63HFyIYmk=;
 b=t08x5HGtxZ3GQVkMdBrhHeZUAZmfS/z0d76FVbRrnIOXYnPD6iDjUh+iX9UPT7HuZhZWDd
 0WxvdvppaQ79N5WHi5GFST8FTaLuTwYkrugaAXnjUG2411p0cfObee7s5Tu48cYT5U+77k
 eoMo2wsBeRMYQ7UfGl7JRvXWI58wm6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648202181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cre4hFYwlAM2rFjOeZ1sQW5IYOT+vE9x+G63HFyIYmk=;
 b=lghReCAQSx/6ucBPkuNFAYWTgK7e+/Wwq65w9U3zxC9/rx14apUMbXckFl1Q2Qk6nJGjq4
 EexB43Rk6CKgUNAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A04A132E9;
 Fri, 25 Mar 2022 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m/2vE8WRPWLzDQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 25 Mar 2022 09:56:21 +0000
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
To: Andrea Righi <andrea.righi@canonical.com>,
 Jiri Denemark <jdenemar@redhat.com>
References: <Yi94mQUfrxMVbiLM@redhat.com>
 <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de> <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de> <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de> <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
 <Yjgtw9AWsFy/Ssvr@arighi-desktop>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <51cd8361-cc98-d2e7-8b58-ed561b1fd70d@suse.de>
Date: Fri, 25 Mar 2022 10:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <Yjgtw9AWsFy/Ssvr@arighi-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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
Cc: libvir-list@redhat.com, Jim Fehlig <jfehlig@suse.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 8:55 AM, Andrea Righi wrote:
> On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
> ...
>> I have lots of questions here, and I tried to involve Jiri and Andrea Righi here, who a long time ago proposed a POSIX_FADV_NOREUSE implementation.
>>
>> 1) What is the reason iohelper was introduced?
>>
>> 2) Was Jiri's comment about the missing linux implementation of POSIX_FADV_NOREUSE?
>>
>> 3) if using O_DIRECT is the only reason for iohelper to exist (...?), would replacing it with posix_fadvise remove the need for iohelper?
>>
>> 4) What has stopped Andreas' or another POSIX_FADV_NOREUSE implementation in the kernel?
> 
> For what I remember (it was a long time ago sorry) I stopped to pursue
> the POSIX_FADV_NOREUSE idea, because we thought that moving to a
> memcg-based solution was a better and more flexible approach, assuming
> memcg would have given some form of specific page cache control. As of
> today I think we still don't have any specific page cache control
> feature in memcg, so maybe we could reconsider the FADV_NOREUSE idea (or
> something similar)?
> 
> Maybe even introduce a separate FADV_<something> flag if we don't want
> to bind a specific implementation of this feature to a standard POSIX
> flag (even if FADV_NOREUSE is still implemented as a no-op in the
> kernel).
> 
> The thing that I liked about the fadvise approach is its simplicity from
> an application perspective, because it's just a syscall and that's it,
> without having to deal with any other subsystems (cgroups, sysfs, and
> similar).
> 
> -Andrea


Thanks Andrea,

I guess for this specific use case I am still missing some key understanding on the role of iohelper in libvirt,

Jiri Denemark's comment seems to suggest that having an implementation of FADV_NOREUSE would remove the need for iohelper entirely,

so I assume this would remove the extra copy of the data which seems to impose a substantial throughput penalty when migrating to a file.

I guess I am hoping for Jiri to weigh in on this, or anyone with a clear understanding of this matter.

Ciao,

Claudio



> 
>>
>> Lots of questions..
>>
>> Thanks for all your insight,
>>
>> Claudio
>>
>>>
>>> Dave
>>>
>>>> Ciao,
>>>>
>>>> C
>>>>
>>>>>>
>>>>>> In the above tests with libvirt, were you using the
>>>>>> --bypass-cache flag or not ?
>>>>>
>>>>> No, I do not. Tests with ramdisk did not show a notable difference for me,
>>>>>
>>>>> but tests with /dev/null were not possible, since the command line is not accepted:
>>>>>
>>>>> # virsh save centos7 /dev/null
>>>>> Domain 'centos7' saved to /dev/null
>>>>> [OK]
>>>>>
>>>>> # virsh save centos7 /dev/null --bypass-cache
>>>>> error: Failed to save domain 'centos7' to /dev/null
>>>>> error: Failed to create file '/dev/null': Invalid argument
>>>>>
>>>>>
>>>>>>
>>>>>> Hopefully use of O_DIRECT doesn't make a difference for
>>>>>> /dev/null, since the I/O is being immediately thrown
>>>>>> away and so ought to never go into I/O cache. 
>>>>>>
>>>>>> In terms of the comparison, we still have libvirt iohelper
>>>>>> giving QEMU a pipe, while your test above gives QEMU a
>>>>>> UNIX socket.
>>>>>>
>>>>>> So I still wonder if the delta is caused by the pipe vs socket
>>>>>> difference, as opposed to netcat vs libvirt iohelper code.
>>>>>
>>>>> I'll look into this aspect, thanks!
>>>>
> 


