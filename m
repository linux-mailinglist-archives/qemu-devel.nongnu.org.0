Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06042FD4A2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:56:52 +0100 (CET)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fql-0007O2-PK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2Fnd-0005zp-UJ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2Fna-0002Q5-TS
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rheRuIdizaGwTgNR+kMCKKnTL0BzZo7qoMn184PdpU=;
 b=OPkQ6hZfQsqtqJC2E/IBJ4lD6ytq+Xy2L4Iau0tJIuY9mTNcJ7Gk0uB/BUtzExpam3dYu7
 v2IIcFyKXYW6YMluTU+JsFBxP/ZYiHGPbs/iRscE2i+F2c7ZQXNAHky3ADSquzw3nyc0a2
 /j2SIKiN5HHp/KiANRZPwq7y1PBIQpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-9n8JysO3NWKqMU9ImubffQ-1; Wed, 20 Jan 2021 10:53:32 -0500
X-MC-Unique: 9n8JysO3NWKqMU9ImubffQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF721005513;
 Wed, 20 Jan 2021 15:53:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-178.ams2.redhat.com
 [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6866560C69;
 Wed, 20 Jan 2021 15:53:28 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
 <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
 <29cccc86-a450-3326-2d70-f3022e32b5db@redhat.com>
 <ccb47c7c-051d-6df4-9a73-ace9b23b67a2@redhat.com>
 <cfe3b7dd-8a1f-7e49-e576-ebca82ee4d98@redhat.com>
 <3db87f48-b628-8000-a46a-6d07cdf1ccc3@redhat.com>
Message-ID: <8522c1f5-9476-3596-abf0-7f2d83f8844c@redhat.com>
Date: Wed, 20 Jan 2021 16:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3db87f48-b628-8000-a46a-6d07cdf1ccc3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.01.21 15:44, Max Reitz wrote:
> On 20.01.21 15:34, Max Reitz wrote:

[...]

>>  From a glance, it looks to me like two coroutines are created 
>> simultaneously in two threads, and so one thread sets up a special 
>> SIGUSR2 action, then another reverts SIGUSR2 to the default, and then 
>> the first one kills itself with SIGUSR2.
>>
>> Not sure what this has to do with backup, though it is interesting 
>> that backup_loop() runs in two threads.  So perhaps some AioContext 
>> problem.
> 
> Oh, 256 runs two backups concurrently.  So it isn’t that interesting, 
> but perhaps part of the problem still.  (I have no idea, still looking.)

So this is what I found out:

coroutine-sigaltstack, when creating a new coroutine, sets up a signal 
handler for SIGUSR2, then kills itself with SIGUSR2, then uses the 
signal handler context (with a sigaltstack) for the new coroutine, and 
then (the signal handler returns after a sigsetjmp()) the old SIGUSR2 
behavior is restored.

What I fail to understand is how this is thread-safe.  Setting up signal 
handlers is a process-wide action.  When one thread changes what SIGUSR2 
does, this will affect all threads immediately, so when two threads run 
coroutine-sigaltstack’s qemu_coroutine_new() concurrently, and one 
thread reverts to the default action before the other has SIGUSR2’ed 
itself, that later SIGUSR2 will kill the whole process.

(I suppose it gets even more interesting when one thread has set up the 
sigaltstack, then the other sets up its own sigaltstack, and then both 
kill themselves with SIGUSR2, so both coroutines get the same stack...)

I have no idea why this has never been hit before, but it makes sense 
why block-copy backup makes it apparent: It creates 64+x coroutines in a 
very short time span, and 256 makes it do so in two threads concurrently 
(thanks to launching two backups in two AioContexts in a transaction).

So...  Looks to me like a bug in coroutine-sigaltstack.  Not sure what 
to do now, though.  I don’t think we can use block-copy for backup 
before that backend is fixed.  (And that is assuming that it’s indeed 
coroutine-sigaltstack’s fault.)

I’ll try to add some locking, see what it does, and send a mail 
concerning coroutine-sigaltstack to qemu-devel.

Max


