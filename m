Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CE5EC1CF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:47:26 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od93d-0006aW-Ot
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qg-0002ZK-9A; Tue, 27 Sep 2022 07:07:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qe-0004qi-Jm; Tue, 27 Sep 2022 07:07:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 3so9115020pga.1;
 Tue, 27 Sep 2022 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DDfvonev3t2AiyDX5B9LyzyUqH7SwQcTwUB4VoIT05s=;
 b=Q5VYaqW5NSqPWE457QCR7hHozqPWjsKjCEhJ36Mxvbn3oZLNsaexYY6zq+tmwfxLUP
 sa0gdTkNI8WoEHb6FpCHWavRK75IfoZ68xsWX2isCfOBNVZRZePEbk/jF6TrF7OfvHUw
 g4uRu6LL6TXvD6qeC0PqlI3Wht410p4m0MWPOadjJ8Qy+tK+RZSB2Qx0GJR7PenY0CML
 fA8eG6BZL5PMyMo48NF2t69+QS1X9fEVhti7WWGAQQR0TOg2iGDzhJwLIxAwlaFoqztZ
 bAnEmvo05v+i27vrELZtnBq7LiUQA6S+C4a6tOoDiBp7YqNP4Z5oH+cub4eftKE7KzY4
 lAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DDfvonev3t2AiyDX5B9LyzyUqH7SwQcTwUB4VoIT05s=;
 b=4lBAJH0LQNO4QCRZXjdMhivoBq031G2V57EyOU/TRc+uB7ZdPI6T2CVsGo/US+g8bU
 lx/D/umrpWn2Yv/tAHQTp30tOZtaSTNOwnf8Fqr4BEunF4YT3zUNcnEjAqbDtmnXKUI2
 2+50JIWyClyf9QOa0Q6FRXQyVOpPJB/pNnhoY2ig9qOnCZMNTHlVxmrSUNF5O5W9fkgl
 UmvXuzUVzcbXLejA05KYGZ1/Xzl14Z34RC/pVIggoTmBIUnfH914Ls/gGxBSTaFcGOxq
 ZaPTyZgNRR3LEk7JsVnCZkwrH8uCExeXBwt8pQt9AoypnT8/lsuiyxKSEnBCZzeishRg
 Qm5A==
X-Gm-Message-State: ACrzQf3+vSEHyyyJ1BB1z7N8ntE/yNEOJLi005gexF++wgMP9cWcxABr
 UgJ7fCtx1oqIdQ1avDt8fK3SoRhtEY4=
X-Google-Smtp-Source: AMsMyM7hl09IOpc6CpDqMs6Uq0BaYfbnUorj9ZeEeSy5dC1UW+PgDthyTm55BLWWYAubmUr1zVrUIw==
X-Received: by 2002:a63:5511:0:b0:439:12f6:fb9a with SMTP id
 j17-20020a635511000000b0043912f6fb9amr25031540pgb.197.1664276826819; 
 Tue, 27 Sep 2022 04:07:06 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 09/54] tests/qtest: fdc-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:47 +0800
Message-Id: <20220927110632.1973965-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
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
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/qtest/fdc-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 52ade90a7d..1f9b99ad6d 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -68,7 +68,7 @@ enum {
     DSKCHG  = 0x80,
 };
 
-static char test_image[] = "/tmp/qtest.XXXXXX";
+static char *test_image;
 
 #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
 #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
@@ -608,7 +608,7 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create a temporary raw image */
-    fd = mkstemp(test_image);
+    fd = g_file_open_tmp("qtest.XXXXXX", &test_image, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -640,6 +640,7 @@ int main(int argc, char **argv)
     /* Cleanup */
     qtest_end();
     unlink(test_image);
+    g_free(test_image);
 
     return ret;
 }
-- 
2.34.1


