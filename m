Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C1255927
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 13:11:16 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBcHr-0007fT-2w
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 07:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcFx-0004hO-Dn
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcFv-0000Xt-NQ
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598612954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mb2pe8Oh1l6P9QXYaCLrdWlknUwZBcxH34qsyj6j1Sc=;
 b=HbR9XuZWpG26DnYGOGGQn9dH2ckC4Ayyxbugr/evpX1C0f1XeDNvfB2nuWVb3K579lx03c
 9dLpw6VkP+VE78r8S1EWpnN2nJOc2oPsMMftPdhAijKWUUfwMFvvZ7JUuJBCrHyoGX5VsU
 Vyhfis8rfIeKrOSzgj0MqEMI8Qrhn0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-ZjoAjTeDOzGA2xfzIkNBkA-1; Fri, 28 Aug 2020 07:09:12 -0400
X-MC-Unique: ZjoAjTeDOzGA2xfzIkNBkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C7A6873073
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:09:12 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A8E75D9F3;
 Fri, 28 Aug 2020 11:09:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/16] meson: convert atomic*-bench
Date: Fri, 28 Aug 2020 15:07:28 +0400
Message-Id: <20200828110734.1638685-11-marcandre.lureau@redhat.com>
In-Reply-To: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
References: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 02:09:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include |  5 -----
 tests/meson.build      | 10 ++++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index d4635f9b5b..30de192567 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -44,11 +44,6 @@ check-speed-$(CONFIG_BLOCK) += tests/benchmark-crypto-cipher$(EXESUF)
 
 QEMU_CFLAGS += -I$(SRC_PATH)/tests -I$(SRC_PATH)/tests/qtest
 
-# Deps that are common to various different sets of tests below
-test-util-obj-y = libqemuutil.a
-tests/atomic_add-bench$(EXESUF): tests/atomic_add-bench.o $(test-util-obj-y)
-tests/atomic64-bench$(EXESUF): tests/atomic64-bench.o $(test-util-obj-y)
-
 tests/benchmark-crypto-hash$(EXESUF): tests/benchmark-crypto-hash.o $(test-crypto-obj-y)
 tests/benchmark-crypto-hmac$(EXESUF): tests/benchmark-crypto-hmac.o $(test-crypto-obj-y)
 tests/benchmark-crypto-cipher$(EXESUF): tests/benchmark-crypto-cipher.o $(test-crypto-obj-y)
diff --git a/tests/meson.build b/tests/meson.build
index 180011445d..a2902bde45 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -4,6 +4,16 @@ qht_bench = executable('qht-bench',
                        sources: files('qht-bench.c'),
                        dependencies: [qemuutil])
 
+executable('atomic_add-bench',
+           sources: files('atomic_add-bench.c'),
+           dependencies: [qemuutil],
+           build_by_default: false)
+
+executable('atomic64-bench',
+           sources: files('atomic64-bench.c'),
+           dependencies: [qemuutil],
+           build_by_default: false)
+
 test_qapi_outputs = [
   'qapi-builtin-types.c',
   'qapi-builtin-types.h',
-- 
2.26.2


