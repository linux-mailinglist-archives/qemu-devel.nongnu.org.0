Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD351AAFA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:36:16 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIv9-0004SV-RJ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqU-00067j-17
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqS-0003gU-4H
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrHUqEZc+pioxw2SrMQwmx2Z83DwbbWvSVsse/scDpw=;
 b=X64naR802z3vMkk0bNCnXd/BSGLxakjcT3rPk4IztNQ4zdjR6XO45t06LmFacxdcP/o2Lb
 pqvlzW3wkYDGVNsATipdfhte1wqlA2NAG62u1M3swys2jGkE5kn5dD3DeDjsMIRf2J975k
 oC2DexUQ7Qh818D5WpK/uMys7Uhi/jI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-Nyb04l0qPxW6GUz5TZbqPQ-1; Wed, 04 May 2022 13:31:20 -0400
X-MC-Unique: Nyb04l0qPxW6GUz5TZbqPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFFF7380450B;
 Wed,  4 May 2022 17:31:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8907A1D093;
 Wed,  4 May 2022 17:30:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 04/16] compiler.h: add QEMU_{BEGIN,
 END}_IGNORE_INITIALIZER_OVERRIDES
Date: Wed,  4 May 2022 21:30:13 +0400
Message-Id: <20220504173025.650167-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

clang has this default warning which QEMU codes triggers in many
situations. However, other projects in general may not want to disable
globally the warning but only in limited specific code blocks.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index f20a76e4a286..ea0797959641 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -184,4 +184,15 @@
 #define QEMU_DISABLE_CFI
 #endif
 
+#if defined (__clang__)
+#define QEMU_BEGIN_IGNORE_INITIALIZER_OVERRIDES                     \
+    _Pragma("clang diagnostic push")                                \
+    _Pragma("clang diagnostic ignored \"-Winitializer-overrides\"")
+#define QEMU_END_IGNORE_INITIALIZER_OVERRIDES \
+    _Pragma("clang diagnostic pop")
+#else
+#define QEMU_BEGIN_IGNORE_INITIALIZER_OVERRIDES
+#define QEMU_END_IGNORE_INITIALIZER_OVERRIDES
+#endif
+
 #endif /* COMPILER_H */
-- 
2.36.0.44.g0f828332d5ac


