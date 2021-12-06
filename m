Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A96469265
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 10:30:45 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muAKZ-0007XY-L7
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 04:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muAIi-0006dG-6q
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:28:48 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:50630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muAIY-00070R-At
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:28:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A41001FD54;
 Mon,  6 Dec 2021 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638782914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzw60Z6+HZUgZ8RhSqWr0UlixvhZAZanUCBKJ1b3Aok=;
 b=brk5KCbEQRDSm4kWGzoDQiAt75UDXdcB0WnlB/btesD5rQZMxs+28AffwWHOVALbSCx+JQ
 pKJjGCMdzhk6EB6LD2+JQJtrudBGNEIFH1S8goxlXCzW58nBhMBdtOCQPwJER2i2vJubi2
 e8SEOg3L9kmXslcaIqurqwZcKM7LocI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638782914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzw60Z6+HZUgZ8RhSqWr0UlixvhZAZanUCBKJ1b3Aok=;
 b=cZS0/O04qnj81T6RYpNz/Dw05pKy+4tHHReVKsQJL9U89VbDz87QgBBhDe1J1ew1idcoJ8
 D5hYQqPxP72gieDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779A413B2C;
 Mon,  6 Dec 2021 09:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VqW8G8LXrWG4KgAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 06 Dec 2021 09:28:34 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <YaECIGJAPAtB+n8/@redhat.com>
 <YaS3aKW6AWH4JAeR@work-vm> <YaTqfO1ZqUanlA7K@redhat.com>
 <YaT2nMsL18cZxPgk@work-vm>
From: Li Zhang <lizhang@suse.de>
Message-ID: <f4a3b973-b968-a40b-0699-0c6c0f79b1a6@suse.de>
Date: Mon, 6 Dec 2021 10:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YaT2nMsL18cZxPgk@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, cfontana@suse.de, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/29/21 4:49 PM, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Mon, Nov 29, 2021 at 11:20:08AM +0000, Dr. David Alan Gilbert wrote:
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
>> Why do we even need to use 'yank' on the receive side ? Until migration
>> has switched over from src to dst, the receive side is discardable and
>> the whole process can just be teminated with kill(SIGTERM/SIGKILL).
> True, although it's nice to be able to quit cleanly.

I found that the 'yank' function has been registered on receive side 
actually.

It's different from the send side.

It's in the function:

void migration_channel_process_incoming(QIOChannel *ioc)
{
     MigrationState *s = migrate_get_current();
     Error *local_err = NULL;

     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));

     if (s->parameters.tls_creds &&
         *s->parameters.tls_creds &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
         migration_ioc_process_incoming(ioc, &local_err);
     }

     if (local_err) {
         error_report_err(local_err);
     }
}


>
>> On the source side 'yank' is needed, because the QEMU process is still
>> running the live workload and thus is precious and mustn't be killed.
> True.
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

