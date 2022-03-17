Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C24DC8D3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:34:56 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrDL-0007UH-Is
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:34:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nUqtB-0001eB-B4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:14:05 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:50666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nUqt9-0006Go-AA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:14:05 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE1051F38D;
 Thu, 17 Mar 2022 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647526441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIHxEROwwurP5ZAeJjRF5ZBzVKUXPUtiShgW+pnjzzQ=;
 b=jKrytBvBhiiUjSjO2zz2Mq6Q5XGcAVAvZnbZvLb1sg+ZvIoZ+xNWib5CEBfuuwFz8ZJY7k
 MkplUv1ynvG6j2N4R4cK8mVNRFtCORya3kiY7ufZUEKkxXXmS7jwI9cEm9UoJSjmkwX2Go
 KAVFyxAoxWbPne4Nhc4VDqIP+2T7ZGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647526441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIHxEROwwurP5ZAeJjRF5ZBzVKUXPUtiShgW+pnjzzQ=;
 b=oyFdCNe58cqSlZc452J50iK5BRPuaoJXhmi2T2OCphskkRB3pdITQfLn421kds1LWbrTa5
 r6FmRCA+2i3mJHDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F52A13BA2;
 Thu, 17 Mar 2022 14:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dUiEIClCM2JuJwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 17 Mar 2022 14:14:01 +0000
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220312163001.3811-1-cfontana@suse.de>
 <Yi94mQUfrxMVbiLM@redhat.com> <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com> <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de> <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
Message-ID: <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
Date: Thu, 17 Mar 2022 15:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
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
Cc: libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 2:41 PM, Claudio Fontana wrote:
> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
>>>>>>>> the first user is the qemu driver,
>>>>>>>>
>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
>>>>>>>>
>>>>>>>> This improves the situation by 400%.
>>>>>>>>
>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
>>>>>>>> compared with direct qemu migration to a nc socket to a file.
>>>>>>>>
>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>>>>> ---
>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
>>>>>>>>  src/util/virfile.h        |  1 +
>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
>>>>>>>> so you can find the discussion about this in qemu-devel:
>>>>>>>>
>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
>>>>>>>>
>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
>>
>>
>>> Current results show these experimental averages maximum throughput
>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
>>> "query-migrate", tests repeated 5 times for each).
>>> VM Size is 60G, most of the memory effectively touched before migration,
>>> through user application allocating and touching all memory with
>>> pseudorandom data.
>>>
>>> 64K:     5200 Mbps (current situation)
>>> 128K:    5800 Mbps
>>> 256K:   20900 Mbps
>>> 512K:   21600 Mbps
>>> 1M:     22800 Mbps
>>> 2M:     22800 Mbps
>>> 4M:     22400 Mbps
>>> 8M:     22500 Mbps
>>> 16M:    22800 Mbps
>>> 32M:    22900 Mbps
>>> 64M:    22900 Mbps
>>> 128M:   22800 Mbps
>>>
>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
>>
>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
>> libvirt attempt to raise the pipe limit to 1 MB by default, but
>> not try to go higher.
>>
>>> As for the theoretical limit for the libvirt architecture,
>>> I ran a qemu migration directly issuing the appropriate QMP
>>> commands, setting the same migration parameters as per libvirt,
>>> and then migrating to a socket netcatted to /dev/null via
>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
>>>
>>> QMP:    37000 Mbps
>>
>>> So although the Pipe size improves things (in particular the
>>> large jump is for the 256K size, although 1M seems a very good value),
>>> there is still a second bottleneck in there somewhere that
>>> accounts for a loss of ~14200 Mbps in throughput.


Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.

~50000 mbps qemu to netcat socket to /dev/null
~35500 mbps virsh save to /dev/null

Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).

Ciao,

C

>>
>> In the above tests with libvirt, were you using the
>> --bypass-cache flag or not ?
> 
> No, I do not. Tests with ramdisk did not show a notable difference for me,
> 
> but tests with /dev/null were not possible, since the command line is not accepted:
> 
> # virsh save centos7 /dev/null
> Domain 'centos7' saved to /dev/null
> [OK]
> 
> # virsh save centos7 /dev/null --bypass-cache
> error: Failed to save domain 'centos7' to /dev/null
> error: Failed to create file '/dev/null': Invalid argument
> 
> 
>>
>> Hopefully use of O_DIRECT doesn't make a difference for
>> /dev/null, since the I/O is being immediately thrown
>> away and so ought to never go into I/O cache. 
>>
>> In terms of the comparison, we still have libvirt iohelper
>> giving QEMU a pipe, while your test above gives QEMU a
>> UNIX socket.
>>
>> So I still wonder if the delta is caused by the pipe vs socket
>> difference, as opposed to netcat vs libvirt iohelper code.
> 
> I'll look into this aspect, thanks!


