Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A75508FC2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:49:12 +0200 (CEST)
Received: from localhost ([::1]:51720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFO3-0001gk-BF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjD-0006Zu-K6
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjC-0001Nn-1l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id s17so2504089plg.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tZ+1vNgSHfNmZ/UL/tApzON6GzdUJtNXO8p7nkeNuLQ=;
 b=jGCsMRja5Gwp//whq4PO3YeQQLG5uByk77rEj5xA90IexEj9/4//4lh3/yUVBR2j/E
 +tYCSb2wmgV4kjWy5rL6uvqHXiTfeMSKktc8ajmuULJW0BCbsvgZufNC7ZeV0kFoHxc9
 cv9JYMef4Iup6kd1Bc2m7xz2g7IZ9gvyvp7e+62YQM9juWRTFUT+ilvplUdRhlzCPFOw
 D/2PEe+P7ArSsgoTCwVj0zAnuP3H3I5BbXiYgvX6dqL3SLAR/UUNAC7JnXumNq5j+TiR
 hI9Gbcrptw4asYFoumpjd3TWDdjR59R5vIHuid3D7trc6T5Ana617WRHPLdeNDg1rUMf
 UF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tZ+1vNgSHfNmZ/UL/tApzON6GzdUJtNXO8p7nkeNuLQ=;
 b=JltSBxCfwSbibpiGTaFKuwz5AdB70+Rgx45bdlYo7xA6FRA/p2h0s4jCJZN0jwJvyZ
 vONfyxbUNTFtS627kDqSdjf+P2D9Yigm/n9pqmLtxsy/j++WaKS5tOhhPAEBBF1ebmQS
 o01Getxn06G4PS9wAPol0W7BA7ThjyfEXHQKDdBY+Xf4QnhlFez3U7Jje7GVWuhrU3rg
 i/PdDHLWHElgo7C/npRRIktJl1xdrAH964Tl0iO9FVpVE72HisLqAmeAKUxy8FMqwPXc
 HpjO+Cgy9In3kCkFFyoSGixPNBbHT9Q1nxXsYDLtQu2jXY0ng5PiZgk1uX/1tm6MnTxe
 umYw==
X-Gm-Message-State: AOAM531BHPJPetioig85BRhjgUKfOZ86g7CsgabxxeShOTI2T9WgRY7D
 mng+J7D6m1qYqs5pMzxZ2njduR4FeDzqWA==
X-Google-Smtp-Source: ABdhPJyERYcffaMoR9Xeo7Nug5lB7YGZUmYFqQCUQJcFL9EyAseNnLqFihnnW1QWdaDKSAAMvB2v0w==
X-Received: by 2002:a17:90b:3b4b:b0:1d2:e3fe:e1a1 with SMTP id
 ot11-20020a17090b3b4b00b001d2e3fee1a1mr5867777pjb.239.1650478016808; 
 Wed, 20 Apr 2022 11:06:56 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/39] util/log: Combine two logfile closes
Date: Wed, 20 Apr 2022 11:06:15 -0700
Message-Id: <20220420180618.1183855-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge the close from the changed_name block with the close
from the !need_to_open_file block.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-37-richard.henderson@linaro.org>
---
 util/log.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index 631856e231..21da961d8d 100644
--- a/util/log.c
+++ b/util/log.c
@@ -157,12 +157,6 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         g_free(global_filename);
         global_filename = newname;
         filename = newname;
-
-        if (logfile) {
-            qatomic_rcu_set(&global_file, NULL);
-            call_rcu(logfile, qemu_logfile_free, rcu);
-            logfile = NULL;
-        }
     } else {
         filename = global_filename;
     }
@@ -182,11 +176,12 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     daemonized = is_daemonized();
     need_to_open_file = log_flags && (!daemonized || filename);
 
-    if (logfile && !need_to_open_file) {
+    if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
-        return true;
+        logfile = NULL;
     }
+
     if (!logfile && need_to_open_file) {
         FILE *fd;
 
-- 
2.34.1


