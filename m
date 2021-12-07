Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464646BF67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:34:06 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucTl-0002z4-3c
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:34:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mucSV-0001S6-Qs
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:32:48 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:44876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mucST-0008BC-4P
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:32:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C5981FD56;
 Tue,  7 Dec 2021 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638891157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bF6LpV4RMpz+IqBYISVtZmtVihKiYRifmwn/vnKfTOQ=;
 b=ZbLJMaIH2ds5JQcqXNazYiFjgfcTsEZchEbW9CawnWRw87r0vJrwWa239wqIdMKUCcDT8I
 2zL46Qkac163pbXskRh79mQcAzAoomDX2qimvKHs2jLWbZ8lmyZ8clyvbcZFndmb49gymk
 lxMmzZpkMt/4WQnuHhnodYMmmfHDzRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638891157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bF6LpV4RMpz+IqBYISVtZmtVihKiYRifmwn/vnKfTOQ=;
 b=2/TmCCp0bAO0WQgmyvplTje7EeHfZD7tw3zpYPk0qVUMa7JvIfvIamnshycpKEgr+efn09
 APFN1Z0H9y/dX4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B91F13A92;
 Tue,  7 Dec 2021 15:32:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PX79AJV+r2EmCwAAMHmgww
 (envelope-from <lizhang@suse.de>); Tue, 07 Dec 2021 15:32:37 +0000
Subject: Re: [PATCH v2 0/1] migration: multifd live migration improvement
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211203115533.31534-1-lizhang@suse.de>
 <Ya5qgYpDrN79A+jl@work-vm> <e55634a9-bb30-de28-9dec-2dee15d9cb41@suse.de>
 <Ya9sx9AMwQ2Kwooj@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <3be2bdc7-d7c2-2a8a-66e1-d889f5bca5c2@suse.de>
Date: Tue, 7 Dec 2021 16:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Ya9sx9AMwQ2Kwooj@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
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
Cc: cfontana@suse.de, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/7/21 3:16 PM, Daniel P. Berrangé wrote:
> On Tue, Dec 07, 2021 at 02:45:10PM +0100, Li Zhang wrote:
>> On 12/6/21 8:54 PM, Dr. David Alan Gilbert wrote:
>>> * Li Zhang (lizhang@suse.de) wrote:
>>>> When testing live migration with multifd channels (8, 16, or a bigger number)
>>>> and using qemu -incoming (without "defer"), if a network error occurs
>>>> (for example, triggering the kernel SYN flooding detection),
>>>> the migration fails and the guest hangs forever.
>>>>
>>>> The test environment and the command line is as the following:
>>>>
>>>> QEMU verions: QEMU emulator version 6.2.91 (v6.2.0-rc1-47-gc5fbdd60cf)
>>>> Host OS: SLE 15  with kernel: 5.14.5-1-default
>>>> Network Card: mlx5 100Gbps
>>>> Network card: Intel Corporation I350 Gigabit (1Gbps)
>>>>
>>>> Source:
>>>> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>>>>           -serial telnet:10.156.208.153:4321,server,nowait \
>>>>           -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>>>>           -monitor stdio
>>>> Dest:
>>>> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>>>>           -serial telnet:10.156.208.154:4321,server,nowait \
>>>>           -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>>>>           -monitor stdio \
>>>>           -incoming tcp:1.0.8.154:4000
>>>>
>>>> (qemu) migrate_set_parameter max-bandwidth 100G
>>>> (qemu) migrate_set_capability multifd on
>>>> (qemu) migrate_set_parameter multifd-channels 16
>>>>
>>>> The guest hangs when executing the command: migrate -d tcp:1.0.8.154:4000.
>>>>
>>>> If a network problem happens, TCP ACK is not received by destination
>>>> and the destination resets the connection with RST.
>>>>
>>>> No.     Time    Source  Destination     Protocol        Length  Info
>>>> 119     1.021169        1.0.8.153       1.0.8.154       TCP     1410    60166 → 4000 [PSH, ACK] Seq=65 Ack=1 Win=62720 Len=1344 TSval=1338662881 TSecr=1399531897
>>>> No.     Time    Source  Destination     Protocol        Length  Info
>>>> 125     1.021181        1.0.8.154       1.0.8.153       TCP     54      4000 → 60166 [RST] Seq=1 Win=0 Len=0
>>>>
>>>> kernel log:
>>>> [334520.229445] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>>> [334562.994919] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>>> [334695.519927] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>>> [334734.689511] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>>> [335687.740415] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>>> [335730.013598] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
>>> Should we document somewhere how to avoid that?  Is there something we
>>> should be doing in the connection code to avoid it?
>> We should use the command line -incoming defer in QEMU command line instead
>> of -incoming ip:port.
>>
>> And the backlog of the socket will be set as the same as  multifd channels,
>> this problem doesn't happen as far as I test.
>>
>> If we use --incoming ip:port in the QEMU command line, the backlog of the
>> socket is always 1, it will cause the SYN flooding.
> Do we send migration parameters from the src to the dst QEMU ?

No, I don't think we send migration parameters from the src to the dest 
QEMU.

I set migration parameters on both sides from qemu monitor seperately.

> There are a bunch of things that we need to set to the same
> value on the src and dst. If we sent any relevant MigrationParameters
> fields to the dst, when the first/main migration chanel is opened, it
> could validate that it is configured in a way that is compatible with
> the src. If it isn't, it can drop the main channel immediately. This
> would trigger the src to fail the migration and we couldn't get stuck
> setting up the secondary data channels for multifd.

OK,  currently, we have same parameters on both sides if we set them the 
same parameters.

If we use -incoming tcp:ip:port because the multifd is disabled by 
default and backlog is 1 when the socket is created.

Here is the function which set the backlog:

static void
socket_start_incoming_migration_internal(SocketAddress *saddr,
                                          Error **errp)
{
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
     size_t i;
     int num = 1;

     qio_net_listener_set_name(listener, "migration-socket-listener");

     if (migrate_use_multifd()) {
         num = migrate_multifd_channels();
     }
   ...

}

The process  with -incoming tcp:ip:port is as the following:

1.   Create qemu process with command line -incoming tcp:ip:port

2.   socket_start_incoming_migration_internal  is called and backlog is: 
num=1, multifd is disabled, num = migrate_multifd_channels() is not called

3.   Enable multifd and set multifd parameters, but the backlog is still 
1, because the it couldn't be changed anymore.

4.   Run migration

The process with -incoming defer is as the following:

1. Create qemu process with command line -incoming defer

2. Enable multifd and set multifd parameters

3. Execute the command (qemu) migrate_incoming tcp:ip:port

4. Call socket_start_incoming_migration_internal then the backlog is 
set: num = migrate_multifd_channels();

5. Run migration

>
> Regards,
> Daniel

