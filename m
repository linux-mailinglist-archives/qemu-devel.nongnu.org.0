Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF334E8155
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:08:16 +0100 (CET)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY75T-0000ET-Bx
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:08:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qz-0007Zl-M9
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:29 -0400
Received: from [2607:f8b0:4864:20::22e] (port=45694
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qy-0005WR-4X
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:25 -0400
Received: by mail-oi1-x22e.google.com with SMTP id 12so11067460oix.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m34esa3hgxLOFhKAAREVlVqf9cUjZXCYhsy9QojcN0M=;
 b=TRHgZ/oJCFEh5u52Hgg3SbEKowSq0DISpl9ug9e7+JsZm9zSjgNeMlt4eN78uAlh92
 JWDVtXTHdxWsgxO3fpWpU9qZnB6gMFi8a+/Qp87JklqG9ovwqAYRqSYEN8n/H/g3wjGV
 vdSXA5Fvbg3G8xxadKiZNcdkbY7vaNJqhZ/9y9+XOcSEyTEMlnGtHx9ORRSBIcEaZCJ/
 PwKf3/ux0uSWhijgPQ0HXHv/B2r700gnucYfCjiuUWP+0XvU1CoMHAhJW0p1Se259IUR
 Jl4XihDi0rGOToH8lzd2LiN7KPW/xm//qq2aI0DV0Oe5gIyp+rowZwMUxTiUOm80Cnys
 c2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m34esa3hgxLOFhKAAREVlVqf9cUjZXCYhsy9QojcN0M=;
 b=E3vDnzaMj48gnaMDOBOv8RNpmuOyDcdsk55WXq0Lfgu+o37UmpF50DR3FHFZ1RF2+h
 YaXvin1wufN2Y8TjTTexzAP8KKxzMqrjeBXeVZ19c3qfsd2WvwcLtS0/5r5CXyRpB65E
 TJlwLOTwtDGSO6dZ47dWLp3hnFw63tPpHTz+aU2aiKvDV3CzjJ50FWe/n3TtFuyOwU8I
 /KhNbmyWtMuACUBs2yhEluWJ+EjR3s7IJgcp0HauDoBlOo3mA7PIljm86Yke4sDm83e9
 fx35DdPm3xef/b8de9HYrOOzWcZqz3K3fIpFe/hoKQ9d/tPZ38DT6IAFMYhGc9AMxhkG
 0GSQ==
X-Gm-Message-State: AOAM530wM6vnktPvmfG15npHd6lNTP6NgPu6PcbjQC81DyFyZzdvwBxx
 JwTC5tYnugu94yyrzWmbhMfTrrKYSY9e5Aqf
X-Google-Smtp-Source: ABdhPJzhkOgq8FTScios2a4t14dxhjb6SH3aCFVMG3T7RWplDtpQLTUaBYvP0rfWcKWFdy/bRqK26g==
X-Received: by 2002:aca:2b0b:0:b0:2da:3ed3:f862 with SMTP id
 i11-20020aca2b0b000000b002da3ed3f862mr12544027oik.65.1648301183062; 
 Sat, 26 Mar 2022 06:26:23 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/39] bsd-user: Expand log_page_dump inline
Date: Sat, 26 Mar 2022 07:25:16 -0600
Message-Id: <20220326132534.543738-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Hoist the qemu_log_trylock/unlock to the caller and use fprintf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0c8aa1ae90..ed26fc5acb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -503,20 +503,29 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_trylock();
+        if (f) {
+            fprintf(f, "guest_base  %p\n", (void *)guest_base);
+            fprintf(f, "page layout changed following binary load\n");
+            page_dump(f);
 
-        qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-        qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
-        qemu_log("start_code  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_code);
-        qemu_log("start_data  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_data);
-        qemu_log("end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
-        qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_stack);
-        qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
-        qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+            fprintf(f, "start_brk   0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_brk);
+            fprintf(f, "end_code    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_code);
+            fprintf(f, "start_code  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_code);
+            fprintf(f, "start_data  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_data);
+            fprintf(f, "end_data    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_data);
+            fprintf(f, "start_stack 0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_stack);
+            fprintf(f, "brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
+            fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+
+            qemu_log_unlock(f);
+        }
     }
 
     /* build Task State */
-- 
2.25.1


