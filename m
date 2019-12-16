Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A95121003
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:49:24 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtYg-0003w6-R6
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtF2-0004rs-Pr
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtF1-0007DK-Nx
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:04 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtF1-0007Bl-Gz
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:03 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so7400379wma.1
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=tgCWtVszcmkUTZes5hNTdRfGQJONI7o50A2SQs9WeBs=;
 b=psRbTFj90D0xFF6yfGLiDV6LIbtQ89yNB8aIJ/NLNfnh84Kp0ZDF3GIKruJvO63Xrl
 +t7i95trFJHJ0R6cHLhq/RSSSGoCckhw7be40I3RjQ+1XGe0y9uXgX8nAk5I8pdjrxEr
 f1lY5DVw526wErplO5m3JQF+6iJSsCsgnmC3ls9/DA8ja+QV8cH3Olq5j+tSiniZqqJ/
 mVlHvqkaXIdfWTm2CA2oyzT9+xNXx5fuHP46R0j1bCpQ4PThOwllCzBlO1M2BG0JH7zz
 BR3qRBRJ0DXf8k9TxSWaRAqjxyh/Jy4Qc9JO1v8DDjpZsKj2SHdBQLQWtigMTOC5rxuN
 1JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=tgCWtVszcmkUTZes5hNTdRfGQJONI7o50A2SQs9WeBs=;
 b=MVLfaA2Slkjtz1BeD92xcApu/O9/K3WJkSAOV+jIaS9WcpDUVWbBJPaE73mZdTrXNq
 j4qJmul7uXYrPia7sIIaAR7gdV1/A2pcXkGmXsv6E5F/M7u5Xxsj2eGUAX2Fl+ZRCi3V
 fc8VgGflP3fWFgNqP2eKSybV0Bf4aG/Ho0DY6U0OLrhpsIXeNLsQ2CF5EpVtsn7eMUKz
 tX1BdJ0q4kdccOIcVPKIbqWpQ4C9JwsfkMA/6KzEz8mbv/GH1PmpLUV+o/HXalAJSsUx
 maaI/TNb46Iiau319dyIatqQ8wNrPBz6yVe1KOQOvMFh+8USjzm1iLdiWK1w0KyBnNJ2
 eBtw==
X-Gm-Message-State: APjAAAX/ps+fOt1duuu3WbVEO3mGj0g/T/y5SSo4eY82ofBE77OpjZQO
 UtNcuaud/ODB1WQotkurGR1lN4E2
X-Google-Smtp-Source: APXvYqwWx/TtM87dPnDtCmP+sWuQo8V+aLJKSh+Gsc0UZH+yB5MmAsYn2xgFoY6TZ+b4MBl2JmmSfg==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr31376999wmj.96.1576513742303; 
 Mon, 16 Dec 2019 08:29:02 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.29.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:29:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/62] vl: extract accelerator option processing to a separate
 function
Date: Mon, 16 Dec 2019 17:27:59 +0100
Message-Id: <1576513726-53700-16-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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

As a first step towards supporting multiple "-accel" options, push the
late processing of -icount and -accel into a new function, and use
qemu_opts_foreach to retrieve -accel options instead of stashing
them into globals.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/vl.c b/vl.c
index 60353dc..6e454a0 100644
--- a/vl.c
+++ b/vl.c
@@ -2831,6 +2831,25 @@ static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
+{
+    if (tcg_enabled()) {
+        qemu_tcg_configure(opts, &error_fatal);
+    }
+    return 0;
+}
+
+static void configure_accelerators(void)
+{
+    qemu_opts_foreach(qemu_find_opts("accel"),
+                      do_configure_accelerator, NULL, &error_fatal);
+
+    if (use_icount && !(tcg_enabled() || qtest_enabled())) {
+        error_report("-icount is not allowed with hardware virtualization");
+        exit(1);
+    }
+}
+
 int main(int argc, char **argv, char **envp)
 {
     int i;
@@ -4235,14 +4254,7 @@ int main(int argc, char **argv, char **envp)
     qemu_spice_init();
 
     cpu_ticks_init();
-    if (use_icount && !(tcg_enabled() || qtest_enabled())) {
-        error_report("-icount is not allowed with hardware virtualization");
-        exit(1);
-    }
-
-    if (tcg_enabled()) {
-        qemu_tcg_configure(accel_opts, &error_fatal);
-    }
+    configure_accelerators();
 
     if (default_net) {
         QemuOptsList *net = qemu_find_opts("net");
-- 
1.8.3.1



