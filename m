Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094045F325
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 18:45:48 +0100 (CET)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqfIA-0008Tp-So
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 12:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqfGs-0007mY-CY
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:44:26 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqfGq-0004ER-Sj
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:44:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CECA1F770;
 Fri, 26 Nov 2021 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637948662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDz0DTnK358DRfOZGEcmnMQuo57yYqp9b8JyYr7fLoU=;
 b=IUVcZWEaMFHjGUYB8vwZwBHDVjBt1PTIONC/OTXEvcJRYgI2wrFPOauKXzbR9/Ko77chQd
 1iX2R4XfqOZvUhRyWMCgr6BSDIOI676DYtGd7mkptSqV5HCl8Y7syDJWXy2AbtKwP/TN6J
 E+yRTLlaUCM1qUA7zPq08+y4ryvE8HQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637948662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDz0DTnK358DRfOZGEcmnMQuo57yYqp9b8JyYr7fLoU=;
 b=BJlvG1lruonpEEVRxtuTOgjOUL/rnlpqiARYwY0mAsGMfalhVjqLsjHUzEhTK/IHLTB1VB
 dH7LofFqaaOshpDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BAFC13C65;
 Fri, 26 Nov 2021 17:44:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2r6JAPYcoWEeIgAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 26 Nov 2021 17:44:21 +0000
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de> <YaECIGJAPAtB+n8/@redhat.com>
 <1dc6d75c-022d-6900-c556-79929b13eada@suse.de> <YaEQiiplMQqL/ur5@redhat.com>
 <3a976c2c-3f0e-9be7-b845-77144ce8c275@suse.de> <YaEVuHJuWcwXISTI@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <3e726683-b91a-263e-a8c2-2a43a776748c@suse.de>
Date: Fri, 26 Nov 2021 18:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YaEVuHJuWcwXISTI@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
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
Cc: cfontana@suse.de, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/26/21 6:13 PM, Daniel P. Berrangé wrote:
> On Fri, Nov 26, 2021 at 06:00:24PM +0100, Li Zhang wrote:
>> On 11/26/21 5:51 PM, Daniel P. Berrangé wrote:
>>> On Fri, Nov 26, 2021 at 05:44:04PM +0100, Li Zhang wrote:
>>>> On 11/26/21 4:49 PM, Daniel P. Berrangé wrote:
>>>>> On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
>>>>>> When doing live migration with multifd channels 8, 16 or larger number,
>>>>>> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>>>>>>
>>>>>> At sender's side:
>>>>>> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
>>>>>> is called because one thread fails on qio_channel_write_all when
>>>>>> the network problem happens and other send threads are blocked on sendmsg.
>>>>>> They could not be terminated. So the main thread is blocked on qemu_thread_join
>>>>>> to wait for the threads terminated.
>>>>> Isn't the right answer here to ensure we've called 'shutdown' on
>>>>> all the FDs, so that the threads get kicked out of sendmsg, before
>>>>> trying to join the thread ?
>>>> If we shutdown the channels at sender's side, it could terminate send
>>>> threads. The receive threads are still waiting there.
>>>>
>>>>   From receiver's side, if wait semaphore is timeout, the channels can be
>>>> terminated at last. And the sender threads also be terminated at last.
>>> If something goes wrong on the sender side, the mgmt app should be
>>> tearing down the destination QEMU entirely, so I'm not sure we need
>>> to do anything special to deal with received threads.
>>>
>>> Using semtimedwait just feels risky because it will introduce false
>>> failures if the system/network is under high load such that the
>>> connections don't all establish within 1 second.
>> You are right. This may be a risk. I am not sure if the interval is proper,
>> we can set longer.
> I don't think any kind of timeout is right in this context. There should
> be a sem_post() invoked in every scenario where we want to tear down the
> recv thread. That should only be the case when we see the other end of
> the connection close IMHO.

OK,  I need to consider about that. It may be better to shutdown the 
channels from sender's side.


Thanks

Li

>
> Regards,
> Daniel

