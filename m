Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0534300C0A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 20:04:23 +0100 (CET)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l31jK-0000YZ-Em
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 14:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l31hp-0008Pi-RH
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 14:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l31hl-0000kf-Ct
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 14:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611342163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5b3Nt0iYWuitlDCMFP20jT0+dERqvll0oxml35NFiU=;
 b=E5iSnvf2nOjidg5VWnaSO/n76WGoV61znnVWwJjga3mNt3qUKcxOm8AN54d4L3iU3wsSXw
 tehZvxaJjkPSXeZfznalrfAckrpZdVovh4Zg9NGexz/OC1zNLNXl5TI6fc9jz1h42OFFhX
 VD8jHxM9rdFmLeW5LumDQC0b9v9ei9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-m0QL5XOsM5WtpjiuRNx6wA-1; Fri, 22 Jan 2021 14:02:41 -0500
X-MC-Unique: m0QL5XOsM5WtpjiuRNx6wA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0EAD1005513
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 19:02:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5899E10013BD;
 Fri, 22 Jan 2021 19:02:36 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210122102041.27031-1-mreitz@redhat.com>
 <10be5fcc-5e7a-3e44-3229-8526ad3b4547@redhat.com>
 <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1865cb98-d3f5-ee48-2aca-e802857867b3@redhat.com>
Date: Fri, 22 Jan 2021 20:02:35 +0100
MIME-Version: 1.0
In-Reply-To: <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 18:58, Max Reitz wrote:
> On 22.01.21 17:38, Laszlo Ersek wrote:

>> (1) With SIGUSR2 permanently dedicated to "coroutine-sigaltstack.c", the
>> comment on the qemu_init_main_loop() declaration, in
>> "include/qemu/main-loop.h", also needs to be updated. SIGUSR2 is no
>> longer a "free for thread-internal usage" signal.
> 
> It’s possible that I haven’t understood that comment, but I haven’t
> adjusted it because I didn’t interpret it to mean that the signals
> listed there were free to use.  For example, SIGUSR1 (aliased to
> SIG_IPI) is generated by cpus_kick_thread() and caught by KVM and HVF,
> so it doesn’t seem like it would be free for thread-internal usage either.
> 
> Instead, I understood it to mean that the signals listed there do not
> have to be blocked by non-main threads, because it is OK for non-main
> threads to catch them.  I can’t think of a reason why SIGUSR2 should be
> blocked by any thread, so I decided not to change the comment.
> 
> But perhaps I just didn’t understand the whole comment.  That’s
> definitely possible, given that I don’t even see a place where non-main
> threads would block the signals not listed there.

Upon re-reading the comment, and also looking at the
qemu_init_main_loop() and qemu_signal_init() function definitions, I now
think that the

  consider these signals to be safe

language simply means that the main thread does not intend to handle the
listed signals.

Your SIG_IPI example is great, because, while SIG_IPI does not satisfy
my original characterization ("free for thread-internal usage"), it does
satisfy "not handled by the main thread".

If we accept that interpretation, then we shouldn't in fact modify the
comment on qemu_init_main_loop(). Because, our dedicating SIGUSR2 to
coroutine-sigaltstack remains consistent with the main thread not
intending to handle SIGUSR2.

Put differently, what we're doing with SIGUSR2 now -- which is on the
list in the comment -- has been done *earlier* with SIG_IPI -- SIGUSR1,
also on the list --, namely, using the signal for a particular
inter-thread, or intra-thread, purpose, while making sure the main
thread does not intend to handle the signal.

Thanks
Laszlo


