Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1E2FEFCC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:08:27 +0100 (CET)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cVW-0005io-8E
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2cSj-0003E9-IB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2cSh-00079c-Jy
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7sHcYJWAuwxKKB5ZBc2tCcPKZrODA/OFK772/5ZYrs=;
 b=NLBbduGOgV4BJO1tYQ9P65bD7KEG9NYz1UWge53H0++w+ueR3UDvAw7P0kjIBWOgySAYEH
 vDkO3l3q6LkEsRPOTJVM6sWbyJglwxEKtj4/vR6obn3qUgxy0fBgHv6VU1iztNXMLECXCb
 8w7YP8hYMrSS60alu/OGwAl5d/ueYsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-QIIK9m2ENB-javMOnvLfkQ-1; Thu, 21 Jan 2021 11:05:27 -0500
X-MC-Unique: QIIK9m2ENB-javMOnvLfkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A46EA0CAB
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 16:05:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-169.ams2.redhat.com
 [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DD296EF50;
 Thu, 21 Jan 2021 16:05:18 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <823a843f-af47-f091-1bd1-e33487524eb9@redhat.com>
 <eb4fb436-e7d7-2f5c-c1a4-9f5e57804e54@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <47c2c4de-7f8e-e64b-452e-e7b0f3e9d48d@redhat.com>
Date: Thu, 21 Jan 2021 17:05:17 +0100
MIME-Version: 1.0
In-Reply-To: <eb4fb436-e7d7-2f5c-c1a4-9f5e57804e54@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/21/21 16:42, Max Reitz wrote:

> Perhaps we have the policy of “If another process can send signals, then
> we consider it to have full control over qemu, like a debugger.”

That's what I had more or less in mind, yes; see e.g.

https://man7.org/linux/man-pages/man2/ptrace.2.html

       EPERM  The specified process cannot be traced.  This could be
              because the tracer has insufficient privileges (the
              required capability is CAP_SYS_PTRACE); unprivileged
              processes cannot trace processes that they cannot send
              signals to or those running set-user-ID/set-group-ID
              programs, for obvious reasons.  Alternatively, the process
              may already be being traced, or (on kernels before 2.6.26)
              be init(1) (PID 1).

Which seems to imply that, if you can send a signal, you can ptrace()
the signalee as well.

(I realize that what I'm saying does not follow from *pure logic*, as
the manual is stating !sendsig -> !trace, hence trace -> sendsig.
Whereas we're discussing the opposite direction: sendsig -> trace.
*But*, IMO, that direction is *suggested* by the manual.)

Anyway, this is kind of moot; I'm OK with the mutex too. :)

Thanks
Laszlo


