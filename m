Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814346BCE5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:47:30 +0100 (CET)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muaob-0001A7-0g
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muamS-0007In-7I
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:45:17 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muamQ-00064i-37
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:45:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E421212CC;
 Tue,  7 Dec 2021 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638884711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/33LR/iFTbn+ZDzy4StnhcUrewo6GggM7HcHmnY2DM=;
 b=zB2Wg1GVdwCQZlllyiLY1tkwOYXlA1lI6Y3CRtZZfGKnxQ2OEdAly22MH3/dETyqdahgGB
 W4owoU5P5nehgLAv3fVZomUgoENKs/nGx4OPA4oD/KXHEbwfX2NxZ8fZ4uwJ7Ct7UivFOE
 NiXRgwMsij+CoGCnRh6BHyGfP1xGw2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638884711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/33LR/iFTbn+ZDzy4StnhcUrewo6GggM7HcHmnY2DM=;
 b=C/B3+tbTeurI86YwrEG5P4s3jj7CgKvcgtsKrHRoYE3M5rWPijJT+L91NG6cxe0J2Vdbwd
 DF53UqDUudGMQhDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 135B913A82;
 Tue,  7 Dec 2021 13:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sMUtA2dlr2FZUwAAMHmgww
 (envelope-from <lizhang@suse.de>); Tue, 07 Dec 2021 13:45:11 +0000
Subject: Re: [PATCH v2 0/1] migration: multifd live migration improvement
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211203115533.31534-1-lizhang@suse.de> <Ya5qgYpDrN79A+jl@work-vm>
From: Li Zhang <lizhang@suse.de>
Message-ID: <e55634a9-bb30-de28-9dec-2dee15d9cb41@suse.de>
Date: Tue, 7 Dec 2021 14:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Ya5qgYpDrN79A+jl@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: quintela@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/6/21 8:54 PM, Dr. David Alan Gilbert wrote:
> * Li Zhang (lizhang@suse.de) wrote:
>> When testing live migration with multifd channels (8, 16, or a bigger number)
>> and using qemu -incoming (without "defer"), if a network error occurs
>> (for example, triggering the kernel SYN flooding detection),
>> the migration fails and the guest hangs forever.
>>
>> The test environment and the command line is as the following:
>>
>> QEMU verions: QEMU emulator version 6.2.91 (v6.2.0-rc1-47-gc5fbdd60cf)
>> Host OS: SLE 15  with kernel: 5.14.5-1-default
>> Network Card: mlx5 100Gbps
>> Network card: Intel Corporation I350 Gigabit (1Gbps)
>>
>> Source:
>> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>>          -serial telnet:10.156.208.153:4321,server,nowait \
>>          -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>>          -monitor stdio
>> Dest:
>> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>>          -serial telnet:10.156.208.154:4321,server,nowait \
>>          -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>>          -monitor stdio \
>>          -incoming tcp:1.0.8.154:4000
>>
>> (qemu) migrate_set_parameter max-bandwidth 100G
>> (qemu) migrate_set_capability multifd on
>> (qemu) migrate_set_parameter multifd-channels 16
>>
>> The guest hangs when executing the command: migrate -d tcp:1.0.8.154:4000.
>>
>> If a network problem happens, TCP ACK is not received by destination
>> and the destination resets the connection with RST.
>>
>> No.     Time    Source  Destination     Protocol        Length  Info
>> 119     1.021169        1.0.8.153       1.0.8.154       TCP     1410    60166 → 4000 [PSH, ACK] Seq=65 Ack=1 Win=62720 Len=1344 TSval=1338662881 TSecr=1399531897
>> No.     Time    Source  Destination     Protocol        Length  Info
>> 125     1.021181        1.0.8.154       1.0.8.153       TCP     54      4000 → 60166 [RST] Seq=1 Win=0 Len=0
>>
>> kernel log:
>> [334520.229445] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>> [334562.994919] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>> [334695.519927] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>> [334734.689511] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>> [335687.740415] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>> [335730.013598] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> Should we document somewhere how to avoid that?  Is there something we
> should be doing in the connection code to avoid it?

We should use the command line -incoming defer in QEMU command line 
instead of -incoming ip:port.

And the backlog of the socket will be set as the same as  multifd 
channels,  this problem doesn't happen as far as I test.

If we use --incoming ip:port in the QEMU command line, the backlog of 
the socket is always 1, it will cause the SYN flooding.


>
> Dave
>
>> There are two problems here:
>> 1. On the send side, the main thread is blocked on qemu_thread_join and
>>     send threads are blocked on sendmsg
>> 2. On receive side, the receive threads are blocked on qemu_sem_wait to
>>     wait for a semaphore.
>>
>> The patch is to fix the first problem, and the guest doesn't hang any more.
>> But there is no better solution to fix the second problem yet.
>>
>> Li Zhang (1):
>>    multifd: Shut down the QIO channels to avoid blocking the send threads
>>      when they are terminated.
>>
>>   migration/multifd.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> -- 
>> 2.31.1
>>

