Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB235F0C4A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:15:26 +0200 (CEST)
Received: from localhost ([::1]:59106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFrR-000138-A9
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1oeEZl-0007Vb-4E
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:53:05 -0400
Received: from wp530.webpack.hosteurope.de
 ([2a01:488:42:1000:50ed:8234::]:59994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1oeEZh-0004bE-ML
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:53:03 -0400
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oeEZd-0005wF-Di; Fri, 30 Sep 2022 13:52:57 +0200
Message-ID: <99249078-2026-c76c-87eb-8e3ac5dde73d@leemhuis.info>
Date: Fri, 30 Sep 2022 13:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Content-Language: en-US, de-DE
To: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1664538781;
 16d3f3be; 
X-HE-SMSGID: 1oeEZd-0005wF-Di
Received-SPF: pass client-ip=2a01:488:42:1000:50ed:8234::;
 envelope-from=regressions@leemhuis.info; helo=wp530.webpack.hosteurope.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.583,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Sep 2022 09:08:39 -0400
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

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker. This might be a Qemu
bug, but it's exposed by kernel change, so I at least want to have it in
the tracking. I'll simply remove it in a few weeks, if it turns out that
nobody except Maxim hits this.

On 29.09.22 17:41, Maxim Levitsky wrote:
> Hi!
>  
> Recently I noticed that this commit broke the boot of some of the VMs that I run on my dev machine.
>  
> It seems that I am not the first to notice this but in my case it is a bit different
>  
> https://lore.kernel.org/all/e0038866ac54176beeac944c9116f7a9bdec7019.camel@linux.ibm.com/
>  
> My VM is a normal x86 VM, and it uses virtio-blk in the guest to access the virtual disk,
> which is a qcow2 file stored on ext4 filesystem which is stored on NVME drive with 4K sectors.
> (however I was also able to reproduce this on a raw file)
>  
> It seems that the only two things that is needed to reproduce the issue are:
>  
> 1. The qcow2/raw file has to be located on a drive which has 4K hardware block size.
> 2. Qemu needs to use direct IO (both aio and 'threads' reproduce this). 
>  
> I did some debugging and I isolated the kernel change in behavior from qemu point of view:
>  
>  
> Qemu, when using direct IO, 'probes' the underlying file.
>  
> It probes two things:
>  
> 1. It probes the minimum block size it can read.
>    It does so by trying to read 1, 512, 1024, 2048 and 4096 bytes at offset 0,
>    using a 4096 bytes aligned buffer, and notes the first read that works as the hardware block size.
>  
>    (The relevant function is 'raw_probe_alignment' in src/block/file-posix.c in qemu source code).
>  
>  
> 2. It probes the buffer alignment by reading 4096 bytes also at file offset 0,
>    this time using a buffer that is 1, 512, 1024, 2048 and 4096 aligned
>    (this is done by allocating a buffer which is 4K aligned and adding 1/512 and so on to its address)
>  
>    First successful read is saved as the required buffer alignment. 
>  
>  
> Before the patch, both probes would yield 4096 and everything would work fine.
> (The file in question is stored on 4K block device)
>  
>  
> After the patch the buffer alignment probe succeeds at 512 bytes.
> This means that the kernel now allows to read 4K of data at file offset 0 with a buffer that
> is only 512 bytes aligned. 
>  
> It is worth to note that the probe was done using 'pread' syscall.
>  
>  
> Later on, qemu likely reads the 1st 512 sector of the drive.
>  
> It uses preadv with 2 io vectors:
>  
> First one is for 512 bytes and it seems to have 0xC00 offset into page 
> (likely depends on debug session but seems to be consistent)
>  
> Second one is for 3584 bytes and also has a buffer that is not 4K aligned.
> (0x200 page offset this time)
>  
> This means that the qemu does respect the 4K block size but only respects 512 bytes buffer alignment,
> which is consistent with the result of the probing.
>  
> And that preadv fails with -EINVAL
>  
> Forcing qemu to use 4K buffer size fixes the issue, as well as reverting the offending commit.
>  
> Any patches, suggestions are welcome.
> 
> I use 6.0-rc7, using mainline master branch as yesterday.
>  
> Best regards,
> 	Maxim Levitsky
> 
Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced bf8d08532bc1
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

