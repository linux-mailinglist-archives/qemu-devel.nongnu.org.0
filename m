Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F0E372B20
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:35:26 +0200 (CEST)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvCu-0007sO-Kq
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8v-0004TZ-FJ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8s-0001fS-SV
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:17 -0400
Received: by mail-ed1-x533.google.com with SMTP id c22so10444958edn.7
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=im3DHeyvXd/4uI7GUazArWR3WLnTJmDGwL/AD42S124=;
 b=O1WSHpbAuD3YiGYvi5LJkxIBIF+jsMm1pvqOHk1XboDqAm08kF7lv7z/Rz1OY/sQT3
 H7uv1e+PfYvQdBOpqsz75gymUnNv9QcQjO2DMjIXRPt0KXJWXEYKv7sSPETSobbrCeBP
 A1ixcPf2pppjK87D1evmecSDWgl3YRGMjDwbrk5D7R3hTTBYHT1Hdm1GDjVx0tqlE681
 AnSiWWrkOmHrQy1DG7ISszJ1wxW9p6SIYHSPX0KxDbSDLyQUukPfpK6A7zvTTL5gzpWS
 36Asi4nrYkOMCCNO0+rcEy7RkO6+OGZVsYI81os1YaxLOdRIJN3ZozGNASHCHg8oa34Z
 rxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=im3DHeyvXd/4uI7GUazArWR3WLnTJmDGwL/AD42S124=;
 b=BSK0WRJRWV04YNt+61RPlRNMrYC53TFQeuwwrALUERYy7AHjUyZwg6oIfoBvRiatNs
 XqdbObZCJeJi6KdcR1uEwbZ1giiwvYwW2DW3WJy9XOFjcMkleVeJvxR1aH53T8lnDN6k
 ejALOJLWBQOnolIW+dLUMdFv92EZsVEwn+7qwyr+FHuWhwKbla/K22xhboIf0x9wCMBb
 1Idm5pk9OB1uY3lwyAvf93uZ2RnsDDH+d/gaXp+7LDpuZunz9jV0/6NJuLPcnvwWs8PD
 yFGIR0FDk0NWKZSeXE+1ruBnt7r6qiFzS8hH2EMn53K3oD5snoIdo7qP4ZpfULQuH53R
 55vA==
X-Gm-Message-State: AOAM533EYADoLhlMGqrx+w8eV8R/CQdMHZBcINaR1M8tsBfWoD5En3h0
 DMK/ANWSlZqY05R6sPIgLgnhuPHTh1s=
X-Google-Smtp-Source: ABdhPJz4WfhJtwH+ZRif6Xf5pCSVDF12/vMQT6BI+dKK03WP4GZz1K+sQRLDFiC4SfJ0X6HROLJIow==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr17187667edd.321.1620135073540; 
 Tue, 04 May 2021 06:31:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y19sm6449860edc.73.2021.05.04.06.31.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:31:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/11] glib-compat: accept G_TEST_SLOW environment variable
Date: Tue,  4 May 2021 15:31:09 +0200
Message-Id: <20210504133109.508824-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504133109.508824-1-pbonzini@redhat.com>
References: <20210504133109.508824-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide an alternative way to pass the desired thoroughness of the
test.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/glib-compat.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 695a96f7ea..4542e920d5 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -100,6 +100,23 @@ g_unix_get_passwd_entry_qemu(const gchar *user_name, GError **error)
 }
 #endif /* G_OS_UNIX */
 
+static inline bool
+qemu_g_test_slow(void)
+{
+    static int cached = -1;
+    if (cached == -1) {
+        cached = g_test_slow() || getenv("G_TEST_SLOW") != NULL;
+    }
+    return cached;
+}
+
+#undef g_test_slow
+#undef g_test_thorough
+#undef g_test_quick
+#define g_test_slow() qemu_g_test_slow()
+#define g_test_thorough() qemu_g_test_slow()
+#define g_test_quick() (!qemu_g_test_slow())
+
 #pragma GCC diagnostic pop
 
 #endif
-- 
2.31.1


