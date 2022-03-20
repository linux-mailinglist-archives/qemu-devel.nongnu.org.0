Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5424E1D1D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:27:11 +0100 (CET)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzKg-0003Bb-Ut
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:27:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5x-0008W3-Cj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: from [2607:f8b0:4864:20::631] (port=42807
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0003TA-4U
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:56 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so10876604plo.9
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91XMdGfqxA7BvJwgW6QHFNJ0sL3SZqCOihIKSdvbIRg=;
 b=GFmnPbA+Foj745z27nMHc1bIyzNzpu+5gAxboDYLKfD2eWqq8t2ejszgpHHjphuQIp
 85UFuXLN1vISyAGUn3HbTI8efQqqLgNekyzN2PnjSZeF6TEtJK0xqRTo7WdhxKL3uuxO
 Fue7osoDJ7qsSqNRYWKtKadAVJcqg9l+Rg2TYg2Fj78cEuj6EGZDTXjuyN2Iog+TwOQM
 ozVwlttJZdqsCscF4SS85pACcdsOtz5Bzf9R84i1rLftxWgj24R4OXMnkdyUq6iD6/tJ
 POxaGytPu0fw/heJAgVG92+GiPl9QkY3VwsZ61VfB/B8lZgXugeLe43e0kTeqGZ3Dika
 5vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=91XMdGfqxA7BvJwgW6QHFNJ0sL3SZqCOihIKSdvbIRg=;
 b=kJWsixn5Eiemvc1IDjpS9uBaHHtPTmlnfUZAFqXhz7L0th41IbNPD/evstr0vZJSlb
 egvxHJjR0EU7anyy6CuuNWj6o3PhWVvElYhlkcrM+27k8fjakMA274+KxeO8XieErupt
 2i/X1NTfl6kCi9TWyj16FxcihNHjvi/XznBxNYY4UT4hW5znVg5gSD0XoIfEIZ2ihrvA
 B220Rt/kB90DMCYnUoJlT2fqXKF++xIEWEPmEY0xDFxR33JQr7eM5LMyk6QODrMV+1SJ
 6t23Xy64mByqlaS6wEEMZ14XiU14EJCWdwmMV34Knb8HhWNrVMFM+5X8rTQGZ4w6caSE
 FcOg==
X-Gm-Message-State: AOAM531uYZNzzk9IQpb7/T3ZDggSyYylWl8fJaaw+pM+TdV76EI5/1Uo
 0FXMaYfPGyzhwq9RW/uEx9cooNiSEaLkoQ==
X-Google-Smtp-Source: ABdhPJzBLjPtrYu+VNI+QvmgW1JHEOiDHhBy5MOZ/tmAkIK+1/8aOll0MZub32KydghYGQJWZ8/bsA==
X-Received: by 2002:a17:90a:1b65:b0:1c6:5bc5:99b4 with SMTP id
 q92-20020a17090a1b6500b001c65bc599b4mr25072202pjq.177.1647796313112; 
 Sun, 20 Mar 2022 10:11:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 18/36] bsd-user: Expand log_page_dump inline
Date: Sun, 20 Mar 2022 10:11:17 -0700
Message-Id: <20220320171135.2704502-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have extra stuff to log at the same time.
Hoist the qemu_log_lock/unlock to the caller and use fprintf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0c8aa1ae90..d25d1c6015 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -503,20 +503,25 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_lock();
 
-        qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-        qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
-        qemu_log("start_code  0x" TARGET_ABI_FMT_lx "\n",
+        fprintf(f, "guest_base  %p\n", (void *)guest_base);
+        fprintf(f, "page layout changed following binary load\n");
+        page_dump(f);
+
+        fprintf(f, "start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
+        fprintf(f, "end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
+        fprintf(f, "start_code  0x" TARGET_ABI_FMT_lx "\n",
                  info->start_code);
-        qemu_log("start_data  0x" TARGET_ABI_FMT_lx "\n",
+        fprintf(f, "start_data  0x" TARGET_ABI_FMT_lx "\n",
                  info->start_data);
-        qemu_log("end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
-        qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n",
+        fprintf(f, "end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
+        fprintf(f, "start_stack 0x" TARGET_ABI_FMT_lx "\n",
                  info->start_stack);
-        qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
-        qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+        fprintf(f, "brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
+        fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+
+        qemu_log_unlock(f);
     }
 
     /* build Task State */
-- 
2.25.1


