Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1446990E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:33:06 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF3B-0001Ve-7f
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExJ-0007FF-3C
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExD-0002wa-Hp
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638800814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6wqy6ZwguG5EfvKMwgNkeRXsaXQ8pK9sb30dxDc2SjQ=;
 b=Th3/F+XCuLRycKxwj4RbJv6eKZhMqiK20tepowJnzsFOmYsPyqkrwuhp+LNHYUB8AN4uEX
 uX3b43C1vgl4LNjqJ88HcR6pk3O+y5SdqJIDxy994M45bnqO2QRYgBzdgxAcn2PHhg0ikK
 2KThHWXhSuYDWxowuEYsqJXbldFhUNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-jUA6rcyEMK-_py1JylEu1Q-1; Mon, 06 Dec 2021 09:26:51 -0500
X-MC-Unique: jUA6rcyEMK-_py1JylEu1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1FF9392B;
 Mon,  6 Dec 2021 14:26:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D62B660C7F;
 Mon,  6 Dec 2021 14:26:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
Date: Mon,  6 Dec 2021 14:26:28 +0000
Message-Id: <20211206142632.116925-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Serge Guelton developed a portable technique and Richard Henderson develope=
d an=0D
inline-friendly architecture-specific technique, see the first patch for=0D
details.=0D
=0D
I have audited all __thread variables in QEMU and converted those that can =
be=0D
used from coroutines. Most actually look safe to me. This patch does not=0D
include a checkpatch.pl rule that requires coroutine-tls.h usage, but perha=
ps=0D
we should add one for block/ at least?=0D
=0D
Stefan Hajnoczi (4):=0D
  tls: add macros for coroutine-safe TLS variables=0D
  util/async: replace __thread with QEMU TLS macros=0D
  rcu: use coroutine TLS macros=0D
  cpus: use coroutine TLS macros for iothread_locked=0D
=0D
 include/qemu/coroutine-tls.h | 205 +++++++++++++++++++++++++++++++++++=0D
 include/qemu/rcu.h           |   7 +-=0D
 softmmu/cpus.c               |   8 +-=0D
 tests/unit/rcutorture.c      |  10 +-=0D
 tests/unit/test-rcu-list.c   |   4 +-=0D
 util/async.c                 |  12 +-=0D
 util/rcu.c                   |  10 +-=0D
 7 files changed, 232 insertions(+), 24 deletions(-)=0D
 create mode 100644 include/qemu/coroutine-tls.h=0D
=0D
--=20=0D
2.33.1=0D
=0D


