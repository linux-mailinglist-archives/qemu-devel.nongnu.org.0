Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3024FAFF1
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 22:00:06 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nddjA-0005ft-6p
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 16:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nddhy-0004zf-3Q
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 15:58:50 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nddhv-0006QI-Uw
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 15:58:49 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C90A210E7;
 Sun, 10 Apr 2022 19:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649620724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNTwNvSv5vkftAgEegltQ5YhyQCFSQeQQ6BZHicnI7I=;
 b=T8AWxrsoQGJTbV1Kdwui2PnPvKnhCDsPoXZbLBv5GT44b4PDyZWfHRzSD3H+QqE+QzabHS
 W8BZX2OFF5Hn9RXuwN+Zy0HRJ4hPFxkTgrGRp15//ywwXlUbO8+/t6mk4WivtzARpm3kCS
 lMmivh4aai3TpjnavUvuk+Jhga1Kx8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649620724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNTwNvSv5vkftAgEegltQ5YhyQCFSQeQQ6BZHicnI7I=;
 b=ub6t26pKgq2vBCAIEXdoS1dZEbkLv4zROKyak1ZQCSDyNbMqfBnwmJZmHAdW5fKb7nCodK
 rbkRHLWeD0knvkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D19DA13A91;
 Sun, 10 Apr 2022 19:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2SC8MPM2U2JtDAAAMHmgww
 (envelope-from <cfontana@suse.de>); Sun, 10 Apr 2022 19:58:43 +0000
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <Yi94mQUfrxMVbiLM@redhat.com>
 <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de> <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de> <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de> <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de> <Yj2aa9OXv2CTQi/j@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ec74fb54-a00b-1705-e9cc-3b9b59e91505@suse.de>
Date: Sun, 10 Apr 2022 21:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <Yj2aa9OXv2CTQi/j@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: libvir-list@redhat.com, andrea.righi@canonical.com,
 Jiri Denemark <jdenemar@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On 3/25/22 11:33 AM, Daniel P. Berrangé wrote:
> On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
>> On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
>>> * Claudio Fontana (cfontana@suse.de) wrote:
>>>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
>>>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
>>>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
>>>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
>>>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
>>>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
>>>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
>>>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
>>>>>>>>>>>> the first user is the qemu driver,
>>>>>>>>>>>>
>>>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
>>>>>>>>>>>>
>>>>>>>>>>>> This improves the situation by 400%.
>>>>>>>>>>>>
>>>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
>>>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>>>>>>>>> ---
>>>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
>>>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
>>>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
>>>>>>>>>>>>  src/util/virfile.h        |  1 +
>>>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
>>>>>>>>>>>> so you can find the discussion about this in qemu-devel:
>>>>>>>>>>>>
>>>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
>>>>>>>>>>>>
>>>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
>>>>>>
>>>>>>
>>>>>>> Current results show these experimental averages maximum throughput
>>>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
>>>>>>> "query-migrate", tests repeated 5 times for each).
>>>>>>> VM Size is 60G, most of the memory effectively touched before migration,
>>>>>>> through user application allocating and touching all memory with
>>>>>>> pseudorandom data.
>>>>>>>
>>>>>>> 64K:     5200 Mbps (current situation)
>>>>>>> 128K:    5800 Mbps
>>>>>>> 256K:   20900 Mbps
>>>>>>> 512K:   21600 Mbps
>>>>>>> 1M:     22800 Mbps
>>>>>>> 2M:     22800 Mbps
>>>>>>> 4M:     22400 Mbps
>>>>>>> 8M:     22500 Mbps
>>>>>>> 16M:    22800 Mbps
>>>>>>> 32M:    22900 Mbps
>>>>>>> 64M:    22900 Mbps
>>>>>>> 128M:   22800 Mbps
>>>>>>>
>>>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
>>>>>>
>>>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
>>>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
>>>>>> not try to go higher.
>>>>>>
>>>>>>> As for the theoretical limit for the libvirt architecture,
>>>>>>> I ran a qemu migration directly issuing the appropriate QMP
>>>>>>> commands, setting the same migration parameters as per libvirt,
>>>>>>> and then migrating to a socket netcatted to /dev/null via
>>>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
>>>>>>>
>>>>>>> QMP:    37000 Mbps
>>>>>>
>>>>>>> So although the Pipe size improves things (in particular the
>>>>>>> large jump is for the 256K size, although 1M seems a very good value),
>>>>>>> there is still a second bottleneck in there somewhere that
>>>>>>> accounts for a loss of ~14200 Mbps in throughput.
>>>>
>>>>
>>>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
>>>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
>>>>
>>>> ~50000 mbps qemu to netcat socket to /dev/null
>>>> ~35500 mbps virsh save to /dev/null
>>>>
>>>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
>>>
>>> It might be closer to RAM or cache bandwidth limited though; for an extra copy.
>>
>> I was thinking about sendfile(2) in iohelper, but that probably can't work as the input fd is a socket, I am getting EINVAL.
>>
>> One thing that I noticed is:
>>
>> ommit afe6e58aedcd5e27ea16184fed90b338569bd042
>> Author: Jiri Denemark <jdenemar@redhat.com>
>> Date:   Mon Feb 6 14:40:48 2012 +0100
>>
>>     util: Generalize virFileDirectFd
>>     
>>     virFileDirectFd was used for accessing files opened with O_DIRECT using
>>     libvirt_iohelper. We will want to use the helper for accessing files
>>     regardless on O_DIRECT and thus virFileDirectFd was generalized and
>>     renamed to virFileWrapperFd.
>>
>>
>> And in particular the comment in src/util/virFile.c:
>>
>>     /* XXX support posix_fadvise rather than O_DIRECT, if the kernel support                                                                                                 
>>      * for that is decent enough. In that case, we will also need to                                                                                                         
>>      * explicitly support VIR_FILE_WRAPPER_NON_BLOCKING since                                                                                                                
>>      * VIR_FILE_WRAPPER_BYPASS_CACHE alone will no longer require spawning                                                                                                   
>>      * iohelper.                                                                                                                                                             
>>      */
>>
>> by Jiri Denemark.
>>
>> I have lots of questions here, and I tried to involve Jiri and Andrea Righi here, who a long time ago proposed a POSIX_FADV_NOREUSE implementation.
>>
>> 1) What is the reason iohelper was introduced?
> 
> With POSIX you can't get sensible results from poll() on FDs associated with
> plain files. It will always report the file as readable/writable, and the
> userspace caller will get blocked any time the I/O operation causes the
> kernel to read/write from the underlying (potentially very slow) storage.
> 
> IOW if you give QEMU an FD associated with a plain file and tell it to
> migrate to that, the guest OS will get stalled.
> 
> To avoid this we have to give QEMU an FD that is NOT a plain file, but
> rather something on which poll() works correctly to avoid blocking. This
> essentially means a socket or pipe FD.
> 
> Here enters the iohelper - we give QEMU a pipe whose other end is the
> iohelper. The iohelper suffers from blocking on read/write but that
> doesn't matter, because QEMU is isolated from this via the pipe.


I am still puzzled by this, when we migrate to a file via virsh save in qemu_saveimage.c ,
we suspend the guest anyway right?

But maybe there is some other problem that triggers?

In the Restore code, ie qemuSaveImageOpen(), we say:

    if (bypass_cache &&
        !(*wrapperFd = virFileWrapperFdNew(&fd, path,
                                           VIR_FILE_WRAPPER_BYPASS_CACHE)))
        return -1;

why don't we make the wrapper conditional on bypass_cache in the Save code too, in qemuSaveImageCreate?

I ask because I tried this change:

commit ae7dff45f10be78d1555e3f302f337e72afa300c
Author: Claudio Fontana <cfontana@suse.de>
Date:   Sun Apr 10 12:33:37 2022 -0600

    only use wrapper if you want to skip the filesystem cache
    
    Signed-off-by: Claudio Fontana <cfontana@suse.de>

diff --git a/src/qemu/qemu_saveimage.c b/src/qemu/qemu_saveimage.c
index 4fd4c5cfcd..5ea1b2fbcc 100644
--- a/src/qemu/qemu_saveimage.c
+++ b/src/qemu/qemu_saveimage.c
@@ -289,8 +289,10 @@ qemuSaveImageCreate(virQEMUDriver *driver,
     if (qemuSecuritySetImageFDLabel(driver->securityManager, vm->def, fd) < 0)
         goto cleanup;
 
-    if (!(wrapperFd = virFileWrapperFdNew(&fd, path, wrapperFlags)))
-        goto cleanup;
+    if ((flags & VIR_DOMAIN_SAVE_BYPASS_CACHE)) {
+        if (!(wrapperFd = virFileWrapperFdNew(&fd, path, wrapperFlags)))
+            goto cleanup;
+    }
 
     if (virQEMUSaveDataWrite(data, fd, path) < 0)
         goto cleanup;



and I got a pretty good performance improvement, where it would be better in my use case not to use O_DIRECT anymore,
and nothing prohibits to still use O_DIRECT if desired.

I get these results with a 90 G VM with this patch applied:

# echo 3 > /proc/sys/vm/drop_caches
# time virsh save centos7 /vm_images/claudio/savevm --bypass-cache
Domain 'centos7' saved to /vm_images/claudio/savevm
real	2m9.368s

# echo 3 > /proc/sys/vm/drop_caches
# time virsh save centos7 /vm_images/claudio/savevm
Domain 'centos7' saved to /vm_images/claudio/savevm
real	0m42.155s

and now without this patch applied:

# echo 3 > /proc/sys/vm/drop_caches
# time virsh save centos7 /vm_images/claudio/savevm --bypass-cache
Domain 'centos7' saved to /vm_images/claudio/savevm
real	2m10.468s

# echo 3 > /proc/sys/vm/drop_caches
# time virsh save centos7 /vm_images/claudio/savevm
Domain 'centos7' saved to /vm_images/claudio/savevm
real	2m6.142s


I'll rerun the numbers again next week on a machine with better cpu if possible.

Thanks,

Claudio

> 
> In theory we could just spawn a thread inside libvirtd todo the same
> as the iohelper, but using a separate helper process is more robust
> 
> If not using libvirt, you would use QEMU's 'exec:' migration protocol
> with 'dd' or 'cat' for the same reasons. Libvirt provides the iohelper
> so we don't have to deal with portibility questions around 'dd' syntax
> and can add features like O_DIRECT that cat lacks.
> 
>> 2) Was Jiri's comment about the missing linux implementation of POSIX_FADV_NOREUSE?
>>
>> 3) if using O_DIRECT is the only reason for iohelper to exist (...?), would replacing it with posix_fadvise remove the need for iohelper?
> 
> We can't remove the iohelper for the reason above.
> 
>> 4) What has stopped Andreas' or another POSIX_FADV_NOREUSE implementation in the kernel?
> 
> With regards,
> Daniel
> 


