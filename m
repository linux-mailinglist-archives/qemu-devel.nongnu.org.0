Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA65673552
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:18:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRou-0004ai-S0; Thu, 19 Jan 2023 05:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoN-00047h-Up
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoM-0005Iv-Bx
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:23 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b5so1363098wrn.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLwGuTl8bFyv/J/EkEe4pO8+RMjvvODUvba2H4Ltn/w=;
 b=epe6N7EKDuPqfmzoHL/51kuAnQZSSLwXtAc7yW8a4O28igvEgHUViuzZ5DvTZYYld4
 NeUkksS6L553DGeBoqLqvv9gRh5De7zXNy18tc/YWHdtwkFerkX80yuc979CB6c5GrEW
 qvl4rXFPyMeof/rb9y4St5cpiSWW1FCdJm+T2gYUzbzYybOa1xd1dR/33chXEEa87eZt
 CPZFSyKtNi42ijKA4mKYttHg5FEqFzasqV7rOIhVx2zVdKbK8bd0xTf9K/KGa3yRfre7
 eMgDKYvqRKz1TCIsONTMW7LESzDuuuWzLyByHXIc2F8ds54XhkEL9bqyGcpv9mc8lElZ
 MJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLwGuTl8bFyv/J/EkEe4pO8+RMjvvODUvba2H4Ltn/w=;
 b=oyT05RvWNz9n26zX4G7lerBKSOml+NJht5dR++oPbt04fJR5dvsr/9Mnfy+5WrsUwt
 2Db/5Tn93W0YeuzaFjGu4ySsB0Q0nj8THN5xcxXPjLOAlYpbq2RBYwLcR1ySTM6OK77s
 Xb4Kkjcp+1wytier4ztl4pIUzeDUJQ5N0NFwLSD9lDv25/JPwriHl4mUSdl2bpMyxA02
 mns9PlAsYa/5af7OCRk4Q2eXu4ju/H3NFtVmNAHqnH6wRC1Cplgi383OIFujfQgvl7iW
 MAUeccsB/f3UelTSzrldYYSZWwI51vXpz1FAKLsJwbIpqcGgIDvRoGkA6l4dXMDMXSiP
 Ywpg==
X-Gm-Message-State: AFqh2krjRMaXkkLoIZK0AbWu1UzZxqOZWbTwl+npul5+DdAA6uqcAwCK
 ldmICvqGjlzj6Hup/tfjZOrQGpnaIFWz2oKX
X-Google-Smtp-Source: AMrXdXvPuje4PxaV6Yl3w0kExms+6aUCdQGfRdAmgqzP5gVJzuiQxxxC05CNXUui+9nsUESTpkxRsQ==
X-Received: by 2002:a5d:6e42:0:b0:2bd:fcd3:44c7 with SMTP id
 j2-20020a5d6e42000000b002bdfcd344c7mr8542787wrz.29.1674122779596; 
 Thu, 19 Jan 2023 02:06:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm27608453wrv.77.2023.01.19.02.06.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] tests/qtest/migration-test: Allow running with HVF
Date: Thu, 19 Jan 2023 11:05:37 +0100
Message-Id: <20230119100537.5114-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1e7f1ea162..7a0fcfb81d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -47,6 +47,7 @@ unsigned start_address;
 unsigned end_address;
 static bool has_tcg;
 static bool has_kvm;
+static bool has_hvf;
 static bool uffd_feature_thread_id;
 
 /*
@@ -614,6 +615,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                args->use_dirty_ring
                                ? ",dirty-ring-size=4096" : "");
     }
+    if (has_hvf) {
+        g_string_append(cmd_common, "-accel hvf ");
+    }
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2472,6 +2476,7 @@ int main(int argc, char **argv)
 
     has_tcg = qtest_has_accel("tcg");
     has_kvm = qtest_has_accel("kvm");
+    has_hvf = qtest_has_accel("hvf");
 
     g_test_init(&argc, &argv, NULL);
 
-- 
2.38.1


