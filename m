Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129CA4DC3CF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:16:12 +0100 (CET)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnAw-0001Zs-J1
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:16:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nUn7B-0000MI-8j
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:12:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nUn79-0004UG-1g
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:12:16 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 385C91F38D;
 Thu, 17 Mar 2022 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647511932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+AFr8TBuCkPYJ6TLsl/p5Kqu4gAIrS6uFNtFw5oMxM=;
 b=ypWywvz7keATAZaBNcK9oja5xat/FeeCHHzjpduXyWkXQDNRhv+BrwUEew+Uezz7eDfDcL
 0HTha561tCehKJCwPbokoPLC+s9Aq73MoPwsGNR2t46sWtcT/JKij+M+L9bwyCr5gXm5Ku
 wRUVE6ybpiFq2gYIER3W0EvQHJjCmk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647511932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+AFr8TBuCkPYJ6TLsl/p5Kqu4gAIrS6uFNtFw5oMxM=;
 b=02cwIdFYc+OaZZIbpG5AVCpr0reldaSba345gmllZ1RKuPSAr5GUCD2PIhQwsa7jIs+H9L
 nusIFY7gEbHWhGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A8F213B4B;
 Thu, 17 Mar 2022 10:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NVq7AHwJM2KdNQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 17 Mar 2022 10:12:12 +0000
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220312163001.3811-1-cfontana@suse.de>
 <Yi94mQUfrxMVbiLM@redhat.com> <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com> <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
Message-ID: <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
Date: Thu, 17 Mar 2022 11:12:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 1:17 PM, Claudio Fontana wrote:
> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
>>>>> the first user is the qemu driver,
>>>>>
>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
>>>>>
>>>>> This improves the situation by 400%.
>>>>>
>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
>>>>> compared with direct qemu migration to a nc socket to a file.
>>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> ---
>>>>>  src/qemu/qemu_driver.c    |  6 +++---
>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
>>>>>  src/util/virfile.c        | 12 ++++++++++++
>>>>>  src/util/virfile.h        |  1 +
>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
>>>>>
>>>>> Hello, I initially thought this to be a qemu performance issue,
>>>>> so you can find the discussion about this in qemu-devel:
>>>>>
>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
>>>>>
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
>>>>>
>>>>> RFC since need to validate idea, and it is only lightly tested:
>>>>>
>>>>> save     - about 400% benefit in throughput, getting around 20 Gbps to /dev/null,
>>>>>            and around 13 Gbps to a ramdisk.
>>>>> 	   By comparison, direct qemu migration to a nc socket is around 24Gbps.
>>>>>
>>>>> restore  - not tested, _should_ also benefit in the "bypass_cache" case
>>>>> coredump - not tested, _should_ also benefit like for save
>>>>>
>>>>> Thanks for your comments and review,
>>>>>
>>>>> Claudio
>>>>>
>>>>>
>>>>> diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
>>>>> index c1b3bd8536..be248c1e92 100644
>>>>> --- a/src/qemu/qemu_driver.c
>>>>> +++ b/src/qemu/qemu_driver.c
>>>>> @@ -3044,7 +3044,7 @@ doCoreDump(virQEMUDriver *driver,
>>>>>      virFileWrapperFd *wrapperFd = NULL;
>>>>>      int directFlag = 0;
>>>>>      bool needUnlink = false;
>>>>> -    unsigned int flags = VIR_FILE_WRAPPER_NON_BLOCKING;
>>>>> +    unsigned int wrapperFlags = VIR_FILE_WRAPPER_NON_BLOCKING | VIR_FILE_WRAPPER_BIG_PIPE;
>>>>>      const char *memory_dump_format = NULL;
>>>>>      g_autoptr(virQEMUDriverConfig) cfg = virQEMUDriverGetConfig(driver);
>>>>>      g_autoptr(virCommand) compressor = NULL;
>>>>> @@ -3059,7 +3059,7 @@ doCoreDump(virQEMUDriver *driver,
>>>>>  
>>>>>      /* Create an empty file with appropriate ownership.  */
>>>>>      if (dump_flags & VIR_DUMP_BYPASS_CACHE) {
>>>>> -        flags |= VIR_FILE_WRAPPER_BYPASS_CACHE;
>>>>> +        wrapperFlags |= VIR_FILE_WRAPPER_BYPASS_CACHE;
>>>>>          directFlag = virFileDirectFdFlag();
>>>>>          if (directFlag < 0) {
>>>>>              virReportError(VIR_ERR_OPERATION_FAILED, "%s",
>>>>> @@ -3072,7 +3072,7 @@ doCoreDump(virQEMUDriver *driver,
>>>>>                               &needUnlink)) < 0)
>>>>>          goto cleanup;
>>>>>  
>>>>> -    if (!(wrapperFd = virFileWrapperFdNew(&fd, path, flags)))
>>>>> +    if (!(wrapperFd = virFileWrapperFdNew(&fd, path, wrapperFlags)))
>>>>>          goto cleanup;
>>>>>  
>>>>>      if (dump_flags & VIR_DUMP_MEMORY_ONLY) {
>>>>> diff --git a/src/qemu/qemu_saveimage.c b/src/qemu/qemu_saveimage.c
>>>>> index c0139041eb..1b522a1542 100644
>>>>> --- a/src/qemu/qemu_saveimage.c
>>>>> +++ b/src/qemu/qemu_saveimage.c
>>>>> @@ -267,7 +267,7 @@ qemuSaveImageCreate(virQEMUDriver *driver,
>>>>>      int fd = -1;
>>>>>      int directFlag = 0;
>>>>>      virFileWrapperFd *wrapperFd = NULL;
>>>>> -    unsigned int wrapperFlags = VIR_FILE_WRAPPER_NON_BLOCKING;
>>>>> +    unsigned int wrapperFlags = VIR_FILE_WRAPPER_NON_BLOCKING | VIR_FILE_WRAPPER_BIG_PIPE;
>>>>>  
>>>>>      /* Obtain the file handle.  */
>>>>>      if ((flags & VIR_DOMAIN_SAVE_BYPASS_CACHE)) {
>>>>> @@ -463,10 +463,11 @@ qemuSaveImageOpen(virQEMUDriver *driver,
>>>>>      if ((fd = qemuDomainOpenFile(cfg, NULL, path, oflags, NULL)) < 0)
>>>>>          return -1;
>>>>>  
>>>>> -    if (bypass_cache &&
>>>>> -        !(*wrapperFd = virFileWrapperFdNew(&fd, path,
>>>>> -                                           VIR_FILE_WRAPPER_BYPASS_CACHE)))
>>>>> -        return -1;
>>>>> +    if (bypass_cache) {
>>>>> +        unsigned int wrapperFlags = VIR_FILE_WRAPPER_BYPASS_CACHE | VIR_FILE_WRAPPER_BIG_PIPE;
>>>>> +        if (!(*wrapperFd = virFileWrapperFdNew(&fd, path, wrapperFlags)))
>>>>> +            return -1;
>>>>> +    }
>>>>>  
>>>>>      data = g_new0(virQEMUSaveData, 1);
>>>>>  
>>>>> diff --git a/src/util/virfile.c b/src/util/virfile.c
>>>>> index a04f888e06..fdacd17890 100644
>>>>> --- a/src/util/virfile.c
>>>>> +++ b/src/util/virfile.c
>>>>> @@ -282,6 +282,18 @@ virFileWrapperFdNew(int *fd, const char *name, unsigned int flags)
>>>>>  
>>>>>      ret->cmd = virCommandNewArgList(iohelper_path, name, NULL);
>>>>>  
>>>>> +    if (flags & VIR_FILE_WRAPPER_BIG_PIPE) {
>>>>> +        /*
>>>>> +         * virsh save/resume would slow to a crawl with a default pipe size (usually 64k).
>>>>> +         * This improves the situation by 400%, although going through io_helper still incurs
>>>>> +         * in a performance penalty compared with a direct qemu migration to a socket.
>>>>> +         */
>>>>> +        int pipe_sz, rv = virFileReadValueInt(&pipe_sz, "/proc/sys/fs/pipe-max-size");
>>>>
>>>> This is fine as an experiment but I don't think it is that safe
>>>> to use in the real world. There could be a variety of reasons why
>>>> an admin can enlarge this value, and we shouldn't assume the max
>>>> size is sensible for libvirt/QEMU to use.
>>>>
>>>> I very much suspect there are diminishing returns here in terms
>>>> of buffer sizes.
>>>>
>>>> 64k is obvious too small, but 1 MB, may be sufficiently large
>>>> that the bottleneck is then elsewhere in our code. IOW, If the
>>>> pipe max size is 100 MB, we shouldn't blindly use it. Can you
>>>> do a few tests with varying sizes to see where a sensible
>>>> tradeoff falls ?
>>>
>>>
>>> Hi Daniel,
>>>
>>> this is a very good point. Actually I see very diminishing returns after the default pipe-max-size (1MB).
>>>
>>> The idea was that beyond allowing larger size, the admin could have set a _smaller_ pipe-max-size,
>>> so we want to use that in that case, otherwise an attempt to use 1MB would result in EPERM, if the process does not have CAP_SYS_RESOURCE or CAP_SYS_ADMIN.
>>> I am not sure if used with Kubevirt, for example, CAP_SYS_RESOURCE or CAP_SYS_ADMIN would be available...?
>>>
>>> So maybe one idea could be to use the minimum between /proc/sys/fs/pipe-max-size and for example 1MB, but will do more testing to see where the actual break point is.
>>
>> That's reasonable.
>>
> 
> Just as an update: still running tests with various combinations, and larger VMs (to RAM, to slow disk, and now to nvme).
> 
> For now no clear winner yet. There seems to be a significant benefit already going from 1MB (my previous default) to 2MB,
> but anything more than 16MB seems to not improve anything at all.
> 
> But I just need to do more testing, more runs.
> 
> Thanks,
> 
> Claudio
> 

Current results show these experimental averages maximum throughput migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP "query-migrate", tests repeated 5 times for each).
VM Size is 60G, most of the memory effectively touched before migration, through user application allocating and touching all memory with pseudorandom data.

64K:     5200 Mbps (current situation)
128K:    5800 Mbps
256K:   20900 Mbps
512K:   21600 Mbps
1M:     22800 Mbps
2M:     22800 Mbps
4M:     22400 Mbps
8M:     22500 Mbps
16M:    22800 Mbps
32M:    22900 Mbps
64M:    22900 Mbps
128M:   22800 Mbps

This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.

As for the theoretical limit for the libvirt architecture,
I ran a qemu migration directly issuing the appropriate QMP commands, setting the same migration parameters as per libvirt, and then migrating to a socket netcatted to /dev/null via
{"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } : 

QMP:    37000 Mbps

---

So although the Pipe size improves things (in particular the large jump is for the 256K size, although 1M seems a very good value),
there is still a second bottleneck in there somewhere that accounts for a loss of ~14200 Mbps in throughput.

Thanks,

Claudio





