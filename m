Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B055464DB7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 13:13:32 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msOUL-00024W-KY
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 07:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1msOSF-000134-Ln
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 07:11:20 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1msOSD-0000xs-6F
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 07:11:18 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C4941FD5A;
 Wed,  1 Dec 2021 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638360674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4dBs2iyDE5/hSegdL8mc4NMoRrt0rTgjpIu3Lz2hE=;
 b=u+Sf9GgiO0TDalbN4h4Ezn12w2l6HsvGCjw+jZLalqZJPD2wyl8S5buAVd4nXhaBSDC3qh
 N3LtQEmFU/BP+BA6gooXnthjKgPj+UU3ekQ7CbuIri15hL/j5LJYtywN/ni/6/q4WFCoo+
 do10CfS5SmF95fpF4SJixGBAO7nJO30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638360674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4dBs2iyDE5/hSegdL8mc4NMoRrt0rTgjpIu3Lz2hE=;
 b=dtQ919Zxc+f5d1cb53TMK8+2VqtBt1wECxmlMjCSvN38jcNIqT1sKaZc0CfMEHN3fr41ti
 ZhhQEsdeoCzfZcBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA4951348A;
 Wed,  1 Dec 2021 12:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jqsgL2Fmp2GCGwAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 01 Dec 2021 12:11:13 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <YaECIGJAPAtB+n8/@redhat.com>
 <YaS3aKW6AWH4JAeR@work-vm> <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
 <YaTorUbhzjFhvBl5@work-vm>
From: Li Zhang <lizhang@suse.de>
Message-ID: <9b20d47c-8b4e-b1b2-c0b9-1ec82dc775ff@suse.de>
Date: Wed, 1 Dec 2021 13:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YaTorUbhzjFhvBl5@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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
Cc: quintela@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/29/21 3:50 PM, Dr. David Alan Gilbert wrote:
> * Li Zhang (lizhang@suse.de) wrote:
>> On 11/29/21 12:20 PM, Dr. David Alan Gilbert wrote:
>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>> On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
>>>>> When doing live migration with multifd channels 8, 16 or larger number,
>>>>> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>>>>>
>>>>> At sender's side:
>>>>> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
>>>>> is called because one thread fails on qio_channel_write_all when
>>>>> the network problem happens and other send threads are blocked on sendmsg.
>>>>> They could not be terminated. So the main thread is blocked on qemu_thread_join
>>>>> to wait for the threads terminated.
>>>> Isn't the right answer here to ensure we've called 'shutdown' on
>>>> all the FDs, so that the threads get kicked out of sendmsg, before
>>>> trying to join the thread ?
>>> I agree a timeout is wrong here; there is no way to get a good timeout
>>> value.
>>> However, I'm a bit confused - we should be able to try a shutdown on the
>>> receive side using the 'yank' command. - that's what it's there for; Li
>>> does this solve your problem?
>> No, I tried to register 'yank' on the receive side, the receive threads are
>> still waiting there.
>>
>> It seems that on send side, 'yank' doesn't work either when the send threads
>> are blocked.
>>
>> This may be not the case to call yank. I am not quite sure about it.
> We need to fix that; 'yank' should be able to recover from any network
> issue.  If it's not working we need to understand why.

Hi Dr. David,

On the receive side, I register 'yank' and it is called. But it is just 
to shut down the channels,

it couldn't fix the problem of the receive threads which are waiting for 
the semaphore.

So the receive threads are still waiting there.

On the send side,  the main process is blocked on qemu_thread_join(), 
when I tried the 'yank'

command with QMP,  it is not handled. So the QMP doesn't work and yank 
doesn't work.

I think it's necessary to shutdown the channels before terminating the 
threads, which can prevent the send threads

being blocked on sendmsg.

By investigating the source code of yank, it only shuts down the 
channels, the live migration may recover when

something wrong occurs because of io channels. But if the threads are 
blocked on semphores,  locks or

something else, it couldn't recover by yank command line.

>
>>> multifd_load_cleanup already kicks sem_sync before trying to do a
>>> thread_join - so have we managed to trigger that on the receive side?
>> There is no problem with sem_sync in function multifd_load_cleanup.
>>
>> But it is not called in my case, because no errors are detected on the
>> receive side.
> If you're getting TCP errors why aren't you seeing any errors on the
> receive side?

 From the kernel log,  a TCP SYN flooding is detected. This causes the 
TCP ACK

missing and the receive side just sends a RST to reset the connection 
forcely without errors.

If TCP SYN Flooding detecting is disabled, the problem can be ignored 
and it can cotinue to tranfer the data.

And live migration works, but I don't think the TCP SYNC flooding 
detecting should be disabled.

On the send side, it causes a failure when writing qio channels and 
migration_save_cleanup is called.


Thank

Li

>
>> The problem is here:
>>
>> void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>> {
>>      MigrationIncomingState *mis = migration_incoming_get_current();
>>      Error *local_err = NULL;
>>      bool start_migration;
>>
>>     ...
>>
>>      if (!mis->from_src_file) {
>>
>>      ...
>>
>>       } else {
>>          /* Multiple connections */
>>          assert(migrate_use_multifd());
>>          start_migration = multifd_recv_new_channel(ioc, &local_err);
>>          if (local_err) {
>>              error_propagate(errp, local_err);
>>              return;
>>          }
>>      }
>>     if (start_migration) {
>>          migration_incoming_process();
>>      }
>> }
>>
>> start_migration is always 0, and migration is not started because some
>> receive threads are not created.
>>
>> No errors are detected here and the main process works well but receive
>> threads are all waiting for semaphore.
>>
>> It's hard to know if the receive threads are not created. If we can find a
>> way to check if any receive threads
> So is this only a problem for network issues that happen during startup,
> before all the threads have been created?
>
> Dave
>
>> are not created, we can kick the sem_sync and do cleanup.
>>
>>  From the source code, the thread will be created when QIO channel detects
>> something by GIO watch if I understand correctly.
>>
>> If nothing is detected, socket_accept_icoming_migration won't be called, the
>> thread will not be created.
>>
>> socket_start_incoming_migration_internal ->
>>
>>      qio_net_listener_set_client_func_full(listener,
>> socket_accept_incoming_migration,
>>                                            NULL, NULL,
>> g_main_context_get_thread_default());
>>
>>     qio_net_listener_set_client_func_full ->
>>
>>                 qio_channel_add_watch_source(
>>                  QIO_CHANNEL(listener->sioc[i]), G_IO_IN,
>>                  qio_net_listener_channel_func,
>>                  listener, (GDestroyNotify)object_unref, context);
>>
>>    socket_accept_incoming_migration ->
>>
>>         migration_channel_process_incoming ->
>>
>>                 migration_ioc_process_incoming ->
>>
>>                       multifd_recv_new_channel ->
>>
>>                              qemu_thread_create(&p->thread, p->name,
>> multifd_recv_thread, p,
>> QEMU_THREAD_JOINABLE);
>>
>>> Dave
>>>
>>>> Regards,
>>>> Daniel
>>>> -- 
>>>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>>>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>>>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>>>>

