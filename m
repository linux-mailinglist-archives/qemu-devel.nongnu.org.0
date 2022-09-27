Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A35EC101
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:21:11 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8eE-00006e-Fa
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qj-0002gf-Ai
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qh-0004sD-Nb
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id u69so9109250pgd.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cirh3Kjj/nxbkwXCG/8RgduffnSu2srYvVt4uLgnRrE=;
 b=mdFXY5X7i/+JwRyJR39fsLhQmWKhET0cgh++DL+0IWLoQaCX2TzEMQZWAg5ezhvRbI
 m3INbKwLYZanw59MMsqV10AsusoOH4hM7ue+abxQL3zYgYWl6ORgsqiTWOCqwG6K6zbr
 d2B1GrzAwDulcBeb4zYOl/jSEopCiuCWcnIYA2o6X2qc62JSXKLeKFqG30Y6eeqydq5V
 C4qabhC+3rOCl4T1YYdd+eMbexr5EZeax1FfzIs2Ft6Id8s65ks3ECzIxTDK3uIdTKu6
 njwx5EnWteeJx8M5P9xNXSrIdK/WwFeQOzbziO/XzNh78IthUvG3beSF5w6eYTSPlndg
 0MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cirh3Kjj/nxbkwXCG/8RgduffnSu2srYvVt4uLgnRrE=;
 b=Tv5/0Vr+uAIvNpuOJyEye0FLSllE8iTobuP7fedgYpyYSfpzXAi/HlYFvlCSxGDlmo
 cilAi2OimwCR/qfraYReN58u61LGVDB82o9QrF7Ew/734wVYliMKsIAWUlPye27br9Y5
 ZR/35YeYvYZsHgNlnWKTlc1Cw6AF3Gj8srRSHeEq2+6paYAWcT9Cd504OgJwGOfNVL/n
 brTk4RcdIe+nmml1VB4BZjTkCGIcBccU3AOaDsChw8npx6hxiAPZCMS62eX0p0kHe/jN
 MNYxCnmMFtG+vEg6+EOXUwHQIs7OQ+vh/NsNYXNwWfhZnpB4XRyJi51RKFQCDIdNfeFA
 Vl9w==
X-Gm-Message-State: ACrzQf2gtqtTI7oWtYayVDLMxRTAcLXgZOq7COVMghB9zX9FDqutNyMq
 vNi+8g2t4iI4rzipI8accRNlSrt8WAM=
X-Google-Smtp-Source: AMsMyM6N6Fcp0G3O/x4bKG4DVLEMSvwWTkmk6XEYF78UsrnX99amI2Asr/MJcJj+w1oI4vF7+loHSg==
X-Received: by 2002:a05:6a00:1ad3:b0:548:962b:4c53 with SMTP id
 f19-20020a056a001ad300b00548962b4c53mr28358782pfv.59.1664276830147; 
 Tue, 27 Sep 2022 04:07:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v4 10/54] tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:48 +0800
Message-Id: <20220927110632.1973965-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 0775e6702b..a825b78c14 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
 } generic_fuzz_config;
 
 static inline gchar *generic_fuzzer_virtio_9p_args(void){
-    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
-    g_assert_nonnull(g_mkdtemp(tmpdir));
+    g_autofree char *tmpdir = g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL);
+    g_assert_nonnull(tmpdir);
 
     return g_strdup_printf("-machine q35 -nodefaults "
     "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
-- 
2.34.1


