Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935734305D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 01:19:59 +0100 (CET)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNlp0-0006wT-2J
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 20:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNlmS-0006Ki-6R
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 20:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNlmP-0000YO-6q
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 20:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616285835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aYPwvSgnhWAsxh3hJG6v5tYsgoqFzU/vN+37ZxzRNf0=;
 b=FVNTDF2d2ntSN1hm2PGxs74UauK5AMEc5ibXnGkqlgqr5A5oxif+tsYChiO4FUcgohAC4E
 RBCkJKcnwK07uTLueqcvs5ae2L/fv/axpX7yMF+PxuwZ8KRXbGwvkmzYirOOmzl2MeIymG
 6RL13jk1gFWMTUuxgMB/riLAT/koss0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-I2ZzHqLfNrWX-1jwRf5ATQ-1; Sat, 20 Mar 2021 20:17:14 -0400
X-MC-Unique: I2ZzHqLfNrWX-1jwRf5ATQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F5081425A;
 Sun, 21 Mar 2021 00:17:12 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28F775D9F2;
 Sun, 21 Mar 2021 00:17:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: Improve alias attribute check
Date: Sun, 21 Mar 2021 08:17:03 +0800
Message-Id: <20210321001703.81812-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's still possible that the wrong value is returned from the alias
of variable even if the program can be compiled without issue. This
improves the check by executing the binary to check the result.

If alias attribute can't be working properly, the @target_page in
exec-vary.c will always return zeroes when we have the following gcc
version and the combination of options "-O2 -flto=auto".

  # gcc --version
  gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)

This abstracts the code from exec-vary.c and use it as indicator to
enable gcc alias attribute or not. The gcc alias attribute is disabled
for the cross-compiling case as the compiled binary isn't executable.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v2: Disable gcc alias attribute for cross-compiling case.
    Return 0 on success from test program.
    Wrap lines of test program and improved commit log.
---
 configure | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..77d7110e5c 100755
--- a/configure
+++ b/configure
@@ -75,6 +75,7 @@ fi
 
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
+TMPC_B="${TMPDIR1}/${TMPB}_b.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
@@ -4878,13 +4879,27 @@ fi
 
 attralias=no
 cat > $TMPC << EOF
-int x = 1;
+static int x;
 extern const int y __attribute__((alias("x")));
-int main(void) { return 0; }
+extern int read_y(void);
+void write_x(int val);
+
+void write_x(int val) { x = val; }
+int main(void) { return (read_y() == 1) ? 0 : 1; }
 EOF
-if compile_prog "" "" ; then
-    attralias=yes
+cat > $TMPC_B << EOF
+extern const int y;
+extern void write_x(int val);
+int read_y(void);
+
+int read_y(void) { write_x(1); return y;}
+EOF
+
+TMPC+=" ${TMPC_B}"
+if compile_prog "" "" && $TMPE >/dev/null 2>/dev/null; then
+   attralias=yes
 fi
+TMPC="${TMPDIR1}/${TMPB}.c"
 
 ########################################
 # check if getauxval is available.
-- 
2.23.0


