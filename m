Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72FA4E1D30
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:37:07 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzUI-0003GY-P2
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:37:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz62-0000AA-EB
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:02 -0400
Received: from [2607:f8b0:4864:20::102a] (port=33964
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz60-0003Ud-Uq
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:02 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so6075330pjo.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yC2sireZoOTYAuTYG5JxotkaWGRw4AVLDFu3n1FRWSw=;
 b=ga9KnqhL47LNO+pd9SEOECHzxpZHT8tgpKN9YEz06NgCaPr/6lCyH2omP9lCJeP+Bs
 ZzytrAcBTmIrHoZ0jvtncuzUocbLH0zX/YRB+5q344VpsHaSKgzWOvdLnock7HVlSFTr
 wqAGso3R/xHJwecSNHbqHV0SfQLFuinDvbpOlfDYGIFOC0iQGV1dQ4H4d59Z9NmDdQjh
 e8vh/y2yoOwF3FZH6qKwkoz90wy6gv3WK1h1UNed8kIfUyB89E4YGOC8wAkjo+1XOfbO
 7uKhcPXik+IShYngulX4snz13DXi3TaoLcjz1LdqFJIPXZNRVSWSGyAFpLGP9IWiF7GU
 QgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yC2sireZoOTYAuTYG5JxotkaWGRw4AVLDFu3n1FRWSw=;
 b=6DG5bP4RctCIMKbs0bRDaz1iArRq/Av73uYSO2OPSwevUq/rZ3ymmGcDQG/Cf/4vHg
 z900WAzoVq6SP5EJJ1/Fqqr/4l7ZNSvJMhECtSaGp8zwM0gv7rKuQktP5eJ8xC/SrvLX
 IlX9L/KqY6Y1DknWKgwOihRlcAiXsKz9dalPWtXCk+py+baHnwUfkRUmFEgZXneyMtDD
 n9Brz/1dKLpDuMBhk1hh7OmHZodhMLtsHQJfjazKkH5srd8QgIbV8QW2vcTOTHWlSkBw
 Gl0aD8k73IaDhCF7bp52vxrGrjFRMnK+tw5R/bzEX5pMTa0EPCQMw+oHp11WrgTEejnJ
 nqqw==
X-Gm-Message-State: AOAM533zZgWLamzFmxT6CJQH5lm1db6sE2uk4BQyERm5/5YMQilF3XFL
 P/aFbRwnQiSDgNp89KMdhoZlB3Vc/ujtPQ==
X-Google-Smtp-Source: ABdhPJwEspOaAZbJRPxxBexihn5KPrcrDQfM8LAfddURE6TDn8R6htSrkXX+fKMbcv+pxbzlQrVoew==
X-Received: by 2002:a17:90b:38c9:b0:1c7:1ffb:533b with SMTP id
 nn9-20020a17090b38c900b001c71ffb533bmr640207pjb.220.1647796319663; 
 Sun, 20 Mar 2022 10:11:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 25/36] bsd-user: Use qemu_set_log_filename_flags
Date: Sun, 20 Mar 2022 10:11:24 -0700
Message-Id: <20220320171135.2704502-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Perform all logfile setup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index d25d1c6015..2c8f8d1c19 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,16 +405,16 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_set_log_filename(log_file, &error_fatal);
-    if (log_mask) {
-        int mask;
-
-        mask = qemu_str_to_log_mask(log_mask);
-        if (!mask) {
-            qemu_print_log_usage(stdout);
-            exit(1);
+    {
+        int mask = 0;
+        if (log_mask) {
+            mask = qemu_str_to_log_mask(log_mask);
+            if (!mask) {
+                qemu_print_log_usage(stdout);
+                exit(1);
+            }
         }
-        qemu_set_log(mask, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     if (optind >= argc) {
-- 
2.25.1


