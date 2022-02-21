Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E44BDA46
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:36:19 +0100 (CET)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9nW-00006K-5l
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:36:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9gz-0004gH-RH
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9gt-0003Q9-8Q
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645453755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4i3LbdeAVpr3I0CMEFt2oe0BK3gIPaMJpEUWT0hEP+4=;
 b=XPL/WHiL8sBWaA0ozJQS4HMyr3RbTZoVaF1DGhfQgfy5yYmCOwLsVl4VVaNyplwzShuFAF
 MNr2kMEF2r/nw/B5ktfP0VQDGawIYDT4EwFUNO69O0z5oN0bOcCPT4nSNU7e7xsXEW9LyD
 bzpHDduClpTfaW5RH8pI8B3JgwDm5Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-wUk_33sAMB2X7KnxVexZkQ-1; Mon, 21 Feb 2022 09:29:12 -0500
X-MC-Unique: wUk_33sAMB2X7KnxVexZkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06536801ADA;
 Mon, 21 Feb 2022 14:29:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21D0B74EB9;
 Mon, 21 Feb 2022 14:29:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] tls: add macros for coroutine-safe TLS variables
Date: Mon, 21 Feb 2022 14:29:03 +0000
Message-Id: <20220221142907.346035-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4:=0D
- Dropped '[RFC]'.=0D
- Dropped inline asm for now. -fPIC versions of the code are missing and I=
=0D
  hit several issues including a clang LTO bug where thread local variables=
 are=0D
  incorrectly discarded because inline asm is not analyzed to find symbol=
=0D
  dependencies (Serge Guelton is aware).=0D
- Fixed CI failures.=0D
v3:=0D
- Added __attribute__((weak)) to get_ptr_*() [Florian]=0D
- Replace rdfsbase with mov %%fs:0,%0 [Florian]=0D
=0D
This patch series solves the coroutines TLS problem. Coroutines re-entered =
from=0D
another thread sometimes see stale TLS values. This happens because compile=
rs=0D
may cache values across yield points, so a value from the previous thread w=
ill=0D
be used when the coroutine is re-entered in another thread.=0D
=0D
Serge Guelton developed a portable technique, see the first patch for detai=
ls.=0D
=0D
I have audited all __thread variables in QEMU and converted those that can =
be=0D
used from coroutines. Most actually look safe to me.=0D
=0D
Stefan Hajnoczi (4):=0D
  tls: add macros for coroutine-safe TLS variables=0D
  util/async: replace __thread with QEMU TLS macros=0D
  rcu: use coroutine TLS macros=0D
  cpus: use coroutine TLS macros for iothread_locked=0D
=0D
 include/qemu/coroutine-tls.h | 159 +++++++++++++++++++++++++++++++++++=0D
 include/qemu/rcu.h           |   7 +-=0D
 softmmu/cpus.c               |   8 +-=0D
 tests/unit/rcutorture.c      |  10 +--=0D
 tests/unit/test-rcu-list.c   |   4 +-=0D
 util/async.c                 |  12 +--=0D
 util/rcu.c                   |  10 +--=0D
 7 files changed, 186 insertions(+), 24 deletions(-)=0D
 create mode 100644 include/qemu/coroutine-tls.h=0D
=0D
--=20=0D
2.34.1=0D
=0D


