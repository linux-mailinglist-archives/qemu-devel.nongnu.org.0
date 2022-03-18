Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E74DDB41
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:08:02 +0100 (CET)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDGr-0008I6-UO
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nVCkU-00015g-Ln
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:34:36 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:41374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nVCkS-0003r7-Od
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:34:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10923210EC;
 Fri, 18 Mar 2022 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647610470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQDri514keMR5TPJqscuOAumyYvyh0zXd90WDk86DLU=;
 b=kpWMyoH7MWYFm1aKuK8lTyOox17mKAWp5tAJZW7+EQxXVk/n+L5VSQ2w6ock/t/878lg+G
 roC5onmYbdL/hMHLNQmV/RXvC8uTpgtKepweLUy6X4jHzhVbi0KxSxT8Ut53Rs8b735F7P
 Vms4UkWvK4SGHyH9fUoEodG4K+3VYww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647610470;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQDri514keMR5TPJqscuOAumyYvyh0zXd90WDk86DLU=;
 b=kwPraFnh4d3eVZdqLVSWV9lnFYiW9J5AvCeE6ozT9j8uPNvthvMYz57qs3ZqFoUHklbyIK
 GRlp7cbOHCL8lHCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D398112FC5;
 Fri, 18 Mar 2022 13:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y1+xMWWKNGKJLQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 18 Mar 2022 13:34:29 +0000
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
References: <20220312163001.3811-1-cfontana@suse.de>
 <Yi94mQUfrxMVbiLM@redhat.com> <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com> <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de> <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de> <YjNNqzb7eBBwMFJN@work-vm>
From: Claudio Fontana <cfontana@suse.de>
To: Jiri Denemark <jdenemar@redhat.com>
Message-ID: <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
Date: Fri, 18 Mar 2022 14:34:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YjNNqzb7eBBwMFJN@work-vm>
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
> * Claudio Fontana (cfontana@suse.de) wrote:
>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
>>>>>>>>>> the first user is the qemu driver,
>>>>>>>>>>
>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
>>>>>>>>>>
>>>>>>>>>> This improves the situation by 400%.
>>>>>>>>>>
>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>>>>>>> ---
>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
>>>>>>>>>>  src/util/virfile.h        |  1 +
>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
>>>>>>>>>>
>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
>>>>>>>>>> so you can find the discussion about this in qemu-devel:
>>>>>>>>>>
>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
>>>>>>>>>>
>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
>>>>
>>>>
>>>>> Current results show these experimental averages maximum throughput
>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
>>>>> "query-migrate", tests repeated 5 times for each).
>>>>> VM Size is 60G, most of the memory effectively touched before migration,
>>>>> through user application allocating and touching all memory with
>>>>> pseudorandom data.
>>>>>
>>>>> 64K:     5200 Mbps (current situation)
>>>>> 128K:    5800 Mbps
>>>>> 256K:   20900 Mbps
>>>>> 512K:   21600 Mbps
>>>>> 1M:     22800 Mbps
>>>>> 2M:     22800 Mbps
>>>>> 4M:     22400 Mbps
>>>>> 8M:     22500 Mbps
>>>>> 16M:    22800 Mbps
>>>>> 32M:    22900 Mbps
>>>>> 64M:    22900 Mbps
>>>>> 128M:   22800 Mbps
>>>>>
>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
>>>>
>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
>>>> not try to go higher.
>>>>
>>>>> As for the theoretical limit for the libvirt architecture,
>>>>> I ran a qemu migration directly issuing the appropriate QMP
>>>>> commands, setting the same migration parameters as per libvirt,
>>>>> and then migrating to a socket netcatted to /dev/null via
>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
>>>>>
>>>>> QMP:    37000 Mbps
>>>>
>>>>> So although the Pipe size improves things (in particular the
>>>>> large jump is for the 256K size, although 1M seems a very good value),
>>>>> there is still a second bottleneck in there somewhere that
>>>>> accounts for a loss of ~14200 Mbps in throughput.
>>
>>
>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
>>
>> ~50000 mbps qemu to netcat socket to /dev/null
>> ~35500 mbps virsh save to /dev/null
>>
>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
> 
> It might be closer to RAM or cache bandwidth limited though; for an extra copy.

I was thinking about sendfile(2) in iohelper, but that probably can't work as the input fd is a socket, I am getting EINVAL.

One thing that I noticed is:

ommit afe6e58aedcd5e27ea16184fed90b338569bd042
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Mon Feb 6 14:40:48 2012 +0100

    util: Generalize virFileDirectFd
    
    virFileDirectFd was used for accessing files opened with O_DIRECT using
    libvirt_iohelper. We will want to use the helper for accessing files
    regardless on O_DIRECT and thus virFileDirectFd was generalized and
    renamed to virFileWrapperFd.


And in particular the comment in src/util/virFile.c:

    /* XXX support posix_fadvise rather than O_DIRECT, if the kernel support                                                                                                 
     * for that is decent enough. In that case, we will also need to                                                                                                         
     * explicitly support VIR_FILE_WRAPPER_NON_BLOCKING since                                                                                                                
     * VIR_FILE_WRAPPER_BYPASS_CACHE alone will no longer require spawning                                                                                                   
     * iohelper.                                                                                                                                                             
     */

by Jiri Denemark.

I have lots of questions here, and I tried to involve Jiri and Andrea Righi here, who a long time ago proposed a POSIX_FADV_NOREUSE implementation.

1) What is the reason iohelper was introduced?

2) Was Jiri's comment about the missing linux implementation of POSIX_FADV_NOREUSE?

3) if using O_DIRECT is the only reason for iohelper to exist (...?), would replacing it with posix_fadvise remove the need for iohelper?

4) What has stopped Andreas' or another POSIX_FADV_NOREUSE implementation in the kernel?

Lots of questions..

Thanks for all your insight,

Claudio

> 
> Dave
> 
>> Ciao,
>>
>> C
>>
>>>>
>>>> In the above tests with libvirt, were you using the
>>>> --bypass-cache flag or not ?
>>>
>>> No, I do not. Tests with ramdisk did not show a notable difference for me,
>>>
>>> but tests with /dev/null were not possible, since the command line is not accepted:
>>>
>>> # virsh save centos7 /dev/null
>>> Domain 'centos7' saved to /dev/null
>>> [OK]
>>>
>>> # virsh save centos7 /dev/null --bypass-cache
>>> error: Failed to save domain 'centos7' to /dev/null
>>> error: Failed to create file '/dev/null': Invalid argument
>>>
>>>
>>>>
>>>> Hopefully use of O_DIRECT doesn't make a difference for
>>>> /dev/null, since the I/O is being immediately thrown
>>>> away and so ought to never go into I/O cache. 
>>>>
>>>> In terms of the comparison, we still have libvirt iohelper
>>>> giving QEMU a pipe, while your test above gives QEMU a
>>>> UNIX socket.
>>>>
>>>> So I still wonder if the delta is caused by the pipe vs socket
>>>> difference, as opposed to netcat vs libvirt iohelper code.
>>>
>>> I'll look into this aspect, thanks!
>>


