Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C024A3F26
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:22:12 +0100 (CET)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESt1-0002UQ-R6
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1nESoT-00008i-95
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1nESoQ-0005mS-I4
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x30y8StUyvm45mUxRz1TxlxqP7xKIlhJd9usrp4+b5w=;
 b=b1VqLRosP1M1TNdvMMfkOj/cLo2IzHVUIGvcPj+nikRroQ987XaFSxkaYE7MieCHYid9PT
 fpWfL7fkPDuMOituZQQ/fhNV6nFl2/Ad31HK5Y2+4pdCKrUJsmSP18OAcwmJoIE9rWEmm2
 uk1vJuwErbtQc8k1nSr/mE8tSlTwFVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-IObFs2DAMEmSgsrOFCwTTw-1; Mon, 31 Jan 2022 04:17:22 -0500
X-MC-Unique: IObFs2DAMEmSgsrOFCwTTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A5B41091DA1;
 Mon, 31 Jan 2022 09:17:21 +0000 (UTC)
Received: from t590.rezanina.moe.com (unknown [10.40.195.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BCE34F867;
 Mon, 31 Jan 2022 09:17:19 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Use long endian options for ppc64
Date: Mon, 31 Jan 2022 10:17:14 +0100
Message-Id: <20220131091714.4825-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Miroslav Rezanina <mrezanin@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GCC options pairs -mlittle/-mlittle-endian and -mbig/-mbig-endian are
equivalent on ppc64 architecture. However, Clang supports only long
version of the options.

Use longer form in configure to properly support both GCC and Clang
compiler. In addition, fix this issue in tcg test configure.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>

---
This is v2 of configure: Use -mlittle-endian instead of -mlittle for ppc64.

v2:
 - handle both -mlittle and -mbig usage
 - fix tests/tcg/configure.sh
---
 configure              | 4 ++--
 tests/tcg/configure.sh | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index e6cfc0e4be..066fa29b70 100755
--- a/configure
+++ b/configure
@@ -655,10 +655,10 @@ case "$cpu" in
   ppc)
     CPU_CFLAGS="-m32" ;;
   ppc64)
-    CPU_CFLAGS="-m64 -mbig" ;;
+    CPU_CFLAGS="-m64 -mbig-endian" ;;
   ppc64le)
     cpu="ppc64"
-    CPU_CFLAGS="-m64 -mlittle" ;;
+    CPU_CFLAGS="-m64 -mlittle-endian" ;;
 
   s390)
     CPU_CFLAGS="-m31" ;;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 309335a2bd..21959e1fde 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -64,9 +64,9 @@ fi
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
-: ${cross_cc_cflags_ppc64="-m64 -mbig"}
+: ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
 : ${cross_cc_ppc64le="$cross_cc_ppc64"}
-: ${cross_cc_cflags_ppc64le="-m64 -mlittle"}
+: ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-- 
2.34.1


