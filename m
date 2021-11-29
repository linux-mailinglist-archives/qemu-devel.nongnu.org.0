Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E44616F7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:47:28 +0100 (CET)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh0B-0003Ja-80
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:47:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mrgqd-0007K4-Bg
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:37:36 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mrgqb-0000ks-4Q
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:37:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FE6D212CB;
 Mon, 29 Nov 2021 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638193050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxFFSInpBiQTrbuTvEdXQnA0RWzVo480lEjOkvDFuG4=;
 b=Xrz2K1AGqO/Wuh8AJcCCOoBQbBAKSBMwsu/1wqffGXVdHjh/E852TQEFIT8MpzixoDSdMf
 G9Ik9jX19uIvwHFvCLHbwXv+dmbo/lvQ9WsHBQl5AICgWtgmVDfwohhL421wLXeTCRjE21
 2I1ObV4Bd0WUFg8TCTpXbnjdKHq/MX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638193050;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxFFSInpBiQTrbuTvEdXQnA0RWzVo480lEjOkvDFuG4=;
 b=PKsyaIod57wyJVfhzvpozvteofDvxrl+MmuPwhUYyB33IkzWydEYM8J3Zegk6R3W7VgkxB
 9miODmyL+PfQnBCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CCF413AA5;
 Mon, 29 Nov 2021 13:37:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W92yBZrXpGGRZQAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 29 Nov 2021 13:37:30 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <YaECIGJAPAtB+n8/@redhat.com>
 <YaS3aKW6AWH4JAeR@work-vm>
From: Li Zhang <lizhang@suse.de>
Message-ID: <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
Date: Mon, 29 Nov 2021 14:37:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YaS3aKW6AWH4JAeR@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/29/21 12:20 PM, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
>>> When doing live migration with multifd channels 8, 16 or larger number,
>>> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>>>
>>> At sender's side:
>>> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
>>> is called because one thread fails on qio_channel_write_all when
>>> the network problem happens and other send threads are blocked on sendmsg.
>>> They could not be terminated. So the main thread is blocked on qemu_thread_join
>>> to wait for the threads terminated.
>> Isn't the right answer here to ensure we've called 'shutdown' on
>> all the FDs, so that the threads get kicked out of sendmsg, before
>> trying to join the thread ?
> I agree a timeout is wrong here; there is no way to get a good timeout
> value.
> However, I'm a bit confused - we should be able to try a shutdown on the
> receive side using the 'yank' command. - that's what it's there for; Li
> does this solve your problem?

No, I tried to register 'yank' on the receive side, the receive threads 
are still waiting there.

It seems that on send side, 'yank' doesn't work either when the send 
threads are blocked.

This may be not the case to call yank. I am not quite sure about it.

>
> multifd_load_cleanup already kicks sem_sync before trying to do a
> thread_join - so have we managed to trigger that on the receive side?

There is no problem with sem_sync in function multifd_load_cleanup.

But it is not called in my case, because no errors are detected on the 
receive side.

The problem is here:

void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
{
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
     bool start_migration;

    ...

     if (!mis->from_src_file) {

     ...

      } else {
         /* Multiple connections */
         assert(migrate_use_multifd());
         start_migration = multifd_recv_new_channel(ioc, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
     }
    if (start_migration) {
         migration_incoming_process();
     }
}

start_migration is always 0, and migration is not started because some 
receive threads are not created.

No errors are detected here and the main process works well but receive 
threads are all waiting for semaphore.

It's hard to know if the receive threads are not created. If we can find 
a way to check if any receive threads

are not created, we can kick the sem_sync and do cleanup.

 From the source code, the thread will be created when QIO channel 
detects something by GIO watch if I understand correctly.

If nothing is detected, socket_accept_icoming_migration won't be called, 
the thread will not be created.

socket_start_incoming_migration_internal ->

     qio_net_listener_set_client_func_full(listener,
socket_accept_incoming_migration,
                                           NULL, NULL,
g_main_context_get_thread_default());

    qio_net_listener_set_client_func_full ->

                qio_channel_add_watch_source(
                 QIO_CHANNEL(listener->sioc[i]), G_IO_IN,
                 qio_net_listener_channel_func,
                 listener, (GDestroyNotify)object_unref, context);

   socket_accept_incoming_migration ->

        migration_channel_process_incoming ->

                migration_ioc_process_incoming ->

                      multifd_recv_new_channel ->

                             qemu_thread_create(&p->thread, p->name, 
multifd_recv_thread, p,
QEMU_THREAD_JOINABLE);

>
> Dave
>
>> Regards,
>> Daniel
>> -- 
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>>

