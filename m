Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB1300EE2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:28:02 +0100 (CET)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33yL-0006Cx-Fd
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l33xK-0005kc-Bo
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l33xE-00049U-DV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611350810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ue4EQeqM5Rk0roeeS2rwwv8e+htXIHyOTeu6XmI57pc=;
 b=Cisd+Q/Dklh5aPQbe5v2+ZDnQ6ed84KLoc6c+Cys1nSlSct8n86Ia+UR9JDD7b32WRqMfC
 wFapj5jwjxDIhEhVq2evPOvbnNpKeuLY2eVTrBBZ9m/hWcrCvTktDKpjLPOQwuTgNU7Vts
 rzKQu42wd8AA+8zwsOiTE9vJvl88fiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-VBYmO4Z-MLuJVy-TqUaiEg-1; Fri, 22 Jan 2021 16:26:48 -0500
X-MC-Unique: VBYmO4Z-MLuJVy-TqUaiEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B46802B47
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 21:26:46 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2007C5D6CF;
 Fri, 22 Jan 2021 21:26:41 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
From: Laszlo Ersek <lersek@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
 <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
Message-ID: <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
Date: Fri, 22 Jan 2021 22:26:40 +0100
MIME-Version: 1.0
In-Reply-To: <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 19:29, Laszlo Ersek wrote:

> OK, I'll try my hand at it; I hope I won't be eating my words.

The more I look at it, the less comfortable I am with the existent code.

For example, I don't understand why the original commit -- 3194c8ceeba0,
"coroutine: adding sigaltstack method (.c source)", 2012-03-12 --
wrapped the sigsuspend() in a loop, dependent on the "tr_called" flag.
That looks like a platform bug workaround -- it suggests that
sigsuspend() could wake spuriously, i.e., not in response to the pending
SIGUSR2.

That seems bogus, per POSIX, given that all signals except SIGUSR2 are
included in the mask passed to sigsuspend().

https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigsuspend.html

Also, the comment says, "the signal can be delivered the first time
sigsuspend() is called", which is misleading -- the signal *IS*
delivered the first time sigsuspend() is called, given that we call
pthread_kill(pthread_self()) just before, with SIGUSR2 masked. So by the
time we reach sigsuspend(), the signal is pending.

(The synchronous nature of pthread_kill(pthread_self()) is confirmed by:

https://pubs.opengroup.org/onlinepubs/9699919799/functions/raise.html

which explains (a) the equivalence of raise() with
pthread_kill(pthread_self()), and (b) the fact that raise() does not
return until after the signal handler does, if a signal handler is
called. Given that delivery is dependent on generation, and delivery is
synchronous per description, generation *cannot* be asynchronous.)

All of this makes me super uncomfortable with the code. Either the
platform(s) where it was written & tested did not conform to POSIX, or
the original author missed something, or *I* am missing something. In
each case, I should not be modifying this code; I'm flying blind.

I'm drifting towards an overhaul of coroutine-sigaltstack, based on my
personal understanding of POSIX, but given that I can absolutely not
*test* coroutine-sigaltstack on the platforms where it actually matters,
an "overhaul" by me would be reckless.

I didn't expect these skeletons when I first read Max's "Thread safety
of coroutine-sigaltstack" email :/

Max, after having worked on top of your patch for a few hours, I
officially endorse your mutex approach. I can't encourage you or myself
to touch this code, in good conscience. It's not that it's "bad"; it's
inexplicable and (to me) untestable.

Laszlo


