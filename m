Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B75F6B38
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:07:13 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTOy-0000Qh-Kb
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf7-0003z5-3x
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:51 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf4-0005yg-Qz
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n7so2028899plp.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgL4d6VdvWsoCo8DlQTj5egD3vl1ynzfG1/OtpHXHWg=;
 b=Yvm7LVup3S11TcY3ioEeG2zBmfFyjypbz6jXagmGJJsUgCLyK5T+Lem8vNXuyVC34a
 yKSlabDg38VUVh9lcWqiaM2sXfVUmjk8cQYz9pLUX0NDNaVi6+ztjplyfJ0PHEO5juOi
 DPRS/HUbC4y+J9+3S+Sj4roN9Z3sYHt498hNm4EKPnViHVEcpiazKnTG+BWEgwJc7ypF
 FWfEIpMmxIgi6dO9UE7df30Eei4QI1FEHTtITQzmMKcG1bsC4cFfCHDLYI1FZQzKj9Zv
 2ifMZfCKJKCcVwHiCwgxNIi3pEEMjRgtQoR3DgMDI1tvfSuVUqeIX3BYWB3rhErJlgE0
 p5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgL4d6VdvWsoCo8DlQTj5egD3vl1ynzfG1/OtpHXHWg=;
 b=1fdAAvDZyRYh2iym2+g+f6hqy2Das0Bpm/bj70/205ij8S8N3dcuHK9obzww15Enqc
 o5KhfcODQ/x4AoV7UAGy+9x8T0TDNCEiMoAZzExUHfBQt8HksBLBDUA3Ha8/4x/FZefy
 Qgww33oBnyyJXmxfg6SqhJEStSBWlouI833fOcFZIdbCA/oVtzKlAtHF5wCa8JHBhlYS
 AwJn4ySMtbcShcTNxVvAbrNiffW5FUxnIHU08wWLVaWNCfhXnai8d6A0UD9yMHGdzaNo
 +XvyRM61/hfy5EUaZJu9wilbhPgtSo24y9E3WTZavIz5T6hgUEoOMswyCEQK3+d2YTTF
 BqXg==
X-Gm-Message-State: ACrzQf1bK44tBbX0P9pmC9U2ic5A9bD3HkzW9DwZnfpvEpk6r4+MtAo+
 /AxSPXoyH1koWNQ6+4i24/5lRIYJs78=
X-Google-Smtp-Source: AMsMyM4blxQXKTL/DyEmsKuQO8c/0aXkxuvBAoovcZsUftLmdb6a5bKRBAweCxBoBR32CPDZc7K84A==
X-Received: by 2002:a17:902:ce8f:b0:176:d5af:a175 with SMTP id
 f15-20020a170902ce8f00b00176d5afa175mr388822plg.123.1665069585216; 
 Thu, 06 Oct 2022 08:19:45 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 04/18] tests/qtest: migration-test: Avoid using hardcoded
 /tmp
Date: Thu,  6 Oct 2022 23:19:13 +0800
Message-Id: <20221006151927.2079583-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v5:
- Use g_autoptr(GError)

Changes in v4:
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration

Changes in v3:
- Split to a separate patch

 tests/qtest/migration-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 0d153d6b5e..ef4427ff4d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -102,7 +102,7 @@ static bool ufd_version_check(void)
 
 #endif
 
-static const char *tmpfs;
+static char *tmpfs;
 
 /* The boot file modifies memory area in [start_address, end_address)
  * repeatedly. It outputs a 'B' at a fixed rate while it's still running.
@@ -2451,10 +2451,10 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
+    g_autoptr(GError) err = NULL;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2479,9 +2479,10 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       err->message);
     }
     g_assert(tmpfs);
 
@@ -2612,6 +2613,7 @@ int main(int argc, char **argv)
         g_test_message("unable to rmdir: path (%s): %s",
                        tmpfs, strerror(errno));
     }
+    g_free(tmpfs);
 
     return ret;
 }
-- 
2.34.1


