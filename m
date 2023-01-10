Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1F664709
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6a-0003Xi-Bn; Tue, 10 Jan 2023 11:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5q-00033o-IG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5n-00051w-Rp
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxoDxdJoAu7ijonzxciG985n50ebA+2y8TPA6VcbWzg=;
 b=gtF20BuC19xIGANOySDUdvOicDVMzrEbrzLWTojxxI/ad+qGgEW0c0xlbEv3gwt66p/346
 A0H63Rupx/zIw7Akujp+RM3idJg+J6NvR2yvuJ1aih/Ujg0ze0sNq1/1x12tzOeOCVx/w9
 SWCZYWGMO3oFFeNhnrGXkKtfwxYD/3E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-hgYceHObMcmVvgX5vuzPng-1; Tue, 10 Jan 2023 11:03:13 -0500
X-MC-Unique: hgYceHObMcmVvgX5vuzPng-1
Received: by mail-wr1-f70.google.com with SMTP id
 m12-20020adfa3cc000000b002b881cb0cb4so2098394wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxoDxdJoAu7ijonzxciG985n50ebA+2y8TPA6VcbWzg=;
 b=XQ6tw3iy0R/1hy8f4vG2p50rEgQnEWtPTXBfkprDkovBsmYsCtEf9gavt6Nn8w8n+B
 Cj24030KqelOWzzuULQ+SaumoHkyjfOJog7da9+0d5lq87k8M5MrnSIdr5sh/NU3U700
 Gu8vac8rHdE9888gU5/hTjFOXOfxJBCzN3dnYRZrJiYHEjwTU+EyhZO/1v+akHNalcO0
 10x4hzkckPAF9IAGEk7dSSuYUv2o1voDBLIKhvw13phhw1yqymtn01SKjEF9yLLjXowa
 acdmaht0uzoUlvkQrLLn974kv9wZDf+9IYtCQ0XjlDhifVpN2cWQOUDM5rA9ykl8ezSO
 8c9g==
X-Gm-Message-State: AFqh2krm0UXmElMBljBaLdtuJZsxjVHM+OixDNjGZYTu8H670qJG10QW
 Jz/edkNsQ28UQXPB1Md7A+kF+C0que+aEW7q0d54qwCqmXsiMoBB2Yo6JoknEb/9xrGu1Ir8asB
 Y0MChAseQAh3rJT+QReZ8BWZmXz2+UHZXa2OhIOksUrsmADBNRPDNxb1WnpB3bpE2dBo=
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr53567178wmk.23.1673366585228; 
 Tue, 10 Jan 2023 08:03:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtureUI8Cp/efs0GXqvwEMUFiExBFERQG1uFo6OuW9LgF8ByO4tftmT45A4z7gVGxw3WI/uOQ==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr53567143wmk.23.1673366584937; 
 Tue, 10 Jan 2023 08:03:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003d9f15efcd5sm6557050wmc.6.2023.01.10.08.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 11/29] tools/virtiofsd: add G_GNUC_PRINTF for logging functions
Date: Tue, 10 Jan 2023 17:02:15 +0100
Message-Id: <20230110160233.339771-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219130205.687815-4-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tools/virtiofsd/fuse_log.c       | 1 +
 tools/virtiofsd/fuse_log.h       | 6 ++++--
 tools/virtiofsd/passthrough_ll.c | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
index 745d88cd2a49..2de3f48ee7ea 100644
--- a/tools/virtiofsd/fuse_log.c
+++ b/tools/virtiofsd/fuse_log.c
@@ -12,6 +12,7 @@
 #include "fuse_log.h"
 
 
+G_GNUC_PRINTF(2, 0)
 static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
                              const char *fmt, va_list ap)
 {
diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
index 8d7091bd4d0b..e5c2967ab95a 100644
--- a/tools/virtiofsd/fuse_log.h
+++ b/tools/virtiofsd/fuse_log.h
@@ -45,7 +45,8 @@ enum fuse_log_level {
  * @param ap format string arguments
  */
 typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
-                                va_list ap);
+                                va_list ap)
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * Install a custom log handler function.
@@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
  * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
  * @param fmt sprintf-style format string including newline
  */
-void fuse_log(enum fuse_log_level level, const char *fmt, ...);
+void fuse_log(enum fuse_log_level level, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 
 #endif /* FUSE_LOG_H_ */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 20f0f41f99a5..40ea2ed27fef 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
     }
 }
 
+G_GNUC_PRINTF(2, 0)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
-- 
2.38.1


