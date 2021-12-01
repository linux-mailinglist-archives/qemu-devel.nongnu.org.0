Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86703464EF8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:45:38 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPvV-0000NJ-4I
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1msPs9-0004je-V4
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:42:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:48106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1msPs7-0006Fu-Ft
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:42:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4AC31FD5A;
 Wed,  1 Dec 2021 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638366125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iExzsDOub34Dzxw2CXLhoMTtMTGlCZ/xJ/3DDc73Z/Y=;
 b=1NT+rsFchDzr4SckK+b7O6b2tCLlgD8MlsMgNiGl9VchL0x91rp1Z2Rq6Knud57luBQshi
 iuNAPgGo1kQSkI9vTZk4/1CNA1Nd5PuoZZCUBNiBOgAcjMal+mimZ3ic+T1fYPvqJaMzDj
 hpmAkxf5tblLfAlvwyarBzT8SdOMy/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638366125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iExzsDOub34Dzxw2CXLhoMTtMTGlCZ/xJ/3DDc73Z/Y=;
 b=4bF7+6cfOeMHAC79j02vYGoCW91w649dLYm0fWQjdLuoqhz+c4VQ9jRvQMWPTvJX5PKXE/
 cffvOFH5FmuZ7jAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7048913CE4;
 Wed,  1 Dec 2021 13:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Am3SGa17p2GMSQAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 01 Dec 2021 13:42:05 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <YaECIGJAPAtB+n8/@redhat.com>
 <YaS3aKW6AWH4JAeR@work-vm> <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
 <YaTorUbhzjFhvBl5@work-vm> <9b20d47c-8b4e-b1b2-c0b9-1ec82dc775ff@suse.de>
 <YadpCGtNYfPOFgxO@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <f08dd91a-18e0-51dc-b48a-29473588bbce@suse.de>
Date: Wed, 1 Dec 2021 14:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YadpCGtNYfPOFgxO@redhat.com>
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
Cc: qemu-devel@nongnu.org, cfontana@suse.de,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/1/21 1:22 PM, Daniel P. Berrangé wrote:
> On Wed, Dec 01, 2021 at 01:11:13PM +0100, Li Zhang wrote:
>> On 11/29/21 3:50 PM, Dr. David Alan Gilbert wrote:
>>> * Li Zhang (lizhang@suse.de) wrote:
>>>> On 11/29/21 12:20 PM, Dr. David Alan Gilbert wrote:
>>>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>>>> On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
>>>>>>> When doing live migration with multifd channels 8, 16 or larger number,
>>>>>>> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>>>>>>>
>>>>>>> At sender's side:
>>>>>>> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
>>>>>>> is called because one thread fails on qio_channel_write_all when
>>>>>>> the network problem happens and other send threads are blocked on sendmsg.
>>>>>>> They could not be terminated. So the main thread is blocked on qemu_thread_join
>>>>>>> to wait for the threads terminated.
>>>>>> Isn't the right answer here to ensure we've called 'shutdown' on
>>>>>> all the FDs, so that the threads get kicked out of sendmsg, before
>>>>>> trying to join the thread ?
>>>>> I agree a timeout is wrong here; there is no way to get a good timeout
>>>>> value.
>>>>> However, I'm a bit confused - we should be able to try a shutdown on the
>>>>> receive side using the 'yank' command. - that's what it's there for; Li
>>>>> does this solve your problem?
>>>> No, I tried to register 'yank' on the receive side, the receive threads are
>>>> still waiting there.
>>>>
>>>> It seems that on send side, 'yank' doesn't work either when the send threads
>>>> are blocked.
>>>>
>>>> This may be not the case to call yank. I am not quite sure about it.
>>> We need to fix that; 'yank' should be able to recover from any network
>>> issue.  If it's not working we need to understand why.
>> Hi Dr. David,
>>
>> On the receive side, I register 'yank' and it is called. But it is just to
>> shut down the channels,
>>
>> it couldn't fix the problem of the receive threads which are waiting for the
>> semaphore.
>>
>> So the receive threads are still waiting there.
>>
>> On the send side,  the main process is blocked on qemu_thread_join(), when I
>> tried the 'yank'
>>
>> command with QMP,  it is not handled. So the QMP doesn't work and yank
>> doesn't work.
> IOW, there is a bug in QEMU on the send side. It should not be calling
> qemu_thread_join() from the main thread, unless it is extremely
> confident that the thread in question has already finished.
>
> You seem to be showing that the thread(s) are still running, so we
> need to understand why that is the case, and why the main thread
> still decided to try to join these threads which haven't finished.

Some threads are running. But there is one thread fails to 
qio_channel_write_all.

In migration_thread(), it detects an error here:

    thr_error = migration_detect_error(s);
         if (thr_error == MIG_THR_ERR_FATAL) {
             /* Stop migration */
             break;

It will stop migration and cleanup.

>
> Regards,
> Daniel

