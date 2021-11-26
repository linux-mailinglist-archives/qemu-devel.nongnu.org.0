Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EFA45F28F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:58:43 +0100 (CET)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeYc-0003jT-2Q
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqeWW-0002Fz-EP
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:56:32 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqeWU-0006Rc-RA
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:56:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43D0D218EF;
 Fri, 26 Nov 2021 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637945789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaxa9v/o33zVCo/8AXvWA4MYaMwq1eFxYpp2iBsC6vY=;
 b=FOpE3rpQNsQkPT8NPTIShPKeqyVUusjg2mzmwdCN4uEYDrijnH3MwtVpmatAaRE5twASP6
 si85ivH1eOeHBs8zNq8ICJWDP06A84KXCHpEQnBgnDsQ1wcoAOT02XwBVrxcDnJYmpa2pG
 4bSWqoz46gsBT91hcLO41BsdQXHeprg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637945789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaxa9v/o33zVCo/8AXvWA4MYaMwq1eFxYpp2iBsC6vY=;
 b=lvZ+WG+/+tIUCzX0mDXNCZt8fZ3pJqiD/dC/Vh0e11DxY2KxGbL6sOTn6Y/oGPH3Sz8RI6
 1RFrinQ7vwUz1kBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1039C13C69;
 Fri, 26 Nov 2021 16:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PeKyAb0RoWFhEQAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 26 Nov 2021 16:56:29 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: quintela@redhat.com
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <87ee72g9l7.fsf@secure.mitica>
From: Li Zhang <lizhang@suse.de>
Message-ID: <15543216-337e-195c-2aac-b3063a90a28d@suse.de>
Date: Fri, 26 Nov 2021 17:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87ee72g9l7.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/26/21 5:33 PM, Juan Quintela wrote:
> Li Zhang <lizhang@suse.de> wrote:
>> When doing live migration with multifd channels 8, 16 or larger number,
>> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>>
>> At sender's side:
>> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
>> is called because one thread fails on qio_channel_write_all when
>> the network problem happens and other send threads are blocked on sendmsg.
>> They could not be terminated. So the main thread is blocked on qemu_thread_join
>> to wait for the threads terminated.
>>
>> (gdb) bt
>> 0  0x00007f30c8dcffc0 in __pthread_clockjoin_ex () at /lib64/libpthread.so.0
>> 1  0x000055cbb716084b in qemu_thread_join (thread=0x55cbb881f418) at ../util/qemu-thread-posix.c:627
>> 2  0x000055cbb6b54e40 in multifd_save_cleanup () at ../migration/multifd.c:542
>> 3  0x000055cbb6b4de06 in migrate_fd_cleanup (s=0x55cbb8024000) at ../migration/migration.c:1808
>> 4  0x000055cbb6b4dfb4 in migrate_fd_cleanup_bh (opaque=0x55cbb8024000) at ../migration/migration.c:1850
>> 5  0x000055cbb7173ac1 in aio_bh_call (bh=0x55cbb7eb98e0) at ../util/async.c:141
>> 6  0x000055cbb7173bcb in aio_bh_poll (ctx=0x55cbb7ebba80) at ../util/async.c:169
>> 7  0x000055cbb715ba4b in aio_dispatch (ctx=0x55cbb7ebba80) at ../util/aio-posix.c:381
>> 8  0x000055cbb7173ffe in aio_ctx_dispatch (source=0x55cbb7ebba80, callback=0x0, user_data=0x0) at ../util/async.c:311
>> 9  0x00007f30c9c8cdf4 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
>> 10 0x000055cbb71851a2 in glib_pollfds_poll () at ../util/main-loop.c:232
>> 11 0x000055cbb718521c in os_host_main_loop_wait (timeout=42251070366) at ../util/main-loop.c:255
>> 12 0x000055cbb7185321 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>> 13 0x000055cbb6e6ba27 in qemu_main_loop () at ../softmmu/runstate.c:726
>> 14 0x000055cbb6ad6fd7 in main (argc=68, argv=0x7ffc0c578888, envp=0x7ffc0c578ab0) at ../softmmu/main.c:50
>>
>> At receiver's side:
>> Several receive threads are not created successfully and the receive threads
>> which have been created are blocked on qemu_sem_wait. No semaphores are posted
>> because migration is not started if not all the receive threads are created
>> successfully and multifd_recv_sync_main is not called which posts the semaphore
>> to receive threads. So the receive threads are waiting on the semaphore and
>> never return. It shouldn't wait for the semaphore forever.
>> Use qemu_sem_timedwait to wait for a while, then return and close the channels.
>> So the guest doesn't hang anymore.
>>
>> (gdb) bt
>> 0  0x00007fd61c43f064 in do_futex_wait.constprop () at /lib64/libpthread.so.0
>> 1  0x00007fd61c43f158 in __new_sem_wait_slow.constprop.0 () at /lib64/libpthread.so.0
>> 2  0x000056075916014a in qemu_sem_wait (sem=0x56075b6515f0) at ../util/qemu-thread-posix.c:358
>> 3  0x0000560758b56643 in multifd_recv_thread (opaque=0x56075b651550) at ../migration/multifd.c:1112
>> 4  0x0000560759160598 in qemu_thread_start (args=0x56075befad00) at ../util/qemu-thread-posix.c:556
>> 5  0x00007fd61c43594a in start_thread () at /lib64/libpthread.so.0
>> 6  0x00007fd61c158d0f in clone () at /lib64/libc.so.6
>>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
>> ---
>>   migration/multifd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 7c9deb1921..656239ca2a 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -1109,7 +1109,7 @@ static void *multifd_recv_thread(void *opaque)
>>   
>>           if (flags & MULTIFD_FLAG_SYNC) {
>>               qemu_sem_post(&multifd_recv_state->sem_sync);
>> -            qemu_sem_wait(&p->sem_sync);
>> +            qemu_sem_timedwait(&p->sem_sync, 1000);
>>           }
>>       }
> Problem happens here, but I think that the solution is not worng.  We
> are returning from the semaphore without given a single error message.

Ah, okay. I can add an error message.

Thanks

Li


>
> Later, Juan.
>

