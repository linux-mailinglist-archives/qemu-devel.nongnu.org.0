Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781A04653BA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 18:15:32 +0100 (CET)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msTCd-0000LZ-58
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 12:15:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzV-0000jG-LA
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzQ-0001Lg-Bt
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638378111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NpyWGZdtxdc207aB8v3Oyrt9gbjXXKLr8XkCrAbvVUg=;
 b=JQK4mbKDCplV/ySw61yBQ2RMdJQXf2//C9/2Blgzbq/AS35QhqFFC78uI2wabs9oeJHLrY
 f1BePahJcPPhFmbieILcij+BGO+xeMvRZK0ga6ArHCb0vjel2/qNI8XopLMrMPSBRTv0uG
 RhCTR+tsvSboAVd2Td038IF3CrJiS0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-ezO0bCkcPB-P3zGHwVmSVw-1; Wed, 01 Dec 2021 12:01:48 -0500
X-MC-Unique: ezO0bCkcPB-P3zGHwVmSVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D2F910818B9;
 Wed,  1 Dec 2021 17:01:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26BF85D9D5;
 Wed,  1 Dec 2021 17:01:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/4] tls: add macros for coroutine-safe TLS variables
Date: Wed,  1 Dec 2021 17:01:16 +0000
Message-Id: <20211201170120.286139-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 include/qemu/coroutine-tls.h | 202 +++++++++++++++++++++++++++++++++++=0D
 include/qemu/rcu.h           |   7 +-=0D
 softmmu/cpus.c               |   8 +-=0D
 tests/unit/rcutorture.c      |  10 +-=0D
 tests/unit/test-rcu-list.c   |   4 +-=0D
 util/async.c                 |  12 ++-=0D
 util/rcu.c                   |  10 +-=0D
 7 files changed, 229 insertions(+), 24 deletions(-)=0D
 create mode 100644 include/qemu/coroutine-tls.h=0D
=0D
--=20=0D
2.33.1=0D
=0D


