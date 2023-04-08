Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1446DB878
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysN-0004BR-GV; Fri, 07 Apr 2023 23:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys9-000477-KO
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys7-0004Xc-CU
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1a2b01f5ac0so2480275ad.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mTrnnmRF46TF0Utts5Gj6LSoaUp0gjklQtGKntHQY08=;
 b=iV/uqwPyAjg8i0zJ0P5MOgM4SVHbmtSLK62/+5jCD60Y8BDj6xDc+Ub4r8R5zDsfg0
 oD+lqIxzO5JVOlGCq63a9atk/Sl0zNzHuyazeTanT+92g9f9NmBOek+KRfVViaWfGUwZ
 U9JThhc/JpZKb7hJ+oXZmwncapf66Ik5koPIsnzmbkWeKlvORgoW5TMHHlNik90yOaSG
 bwlgqUiWXYAI8QhMl8tk08cgZVpHv2WaFqx1miyCkzUvJmdx03ccbfO/yPIgDTy8op/f
 HTg6Oed68t/4qWMtIGmIAGnomR1lWF1yAq6pEP3q7bfAjqZAnkZ3xs9510+iFy8WLN7r
 VOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mTrnnmRF46TF0Utts5Gj6LSoaUp0gjklQtGKntHQY08=;
 b=GGWKfTE6r4XhtwKj4MzlQ3ayLj63ZJbXfp/QGPdf1GKIXGuscHeFR1z/ka5+anQtDo
 +MlHQQCLoaNRcsJN5GVJX64jVbe2WqDbE7gIjXj2iODDKvWrusXFDIvoreFk4tc1a+ja
 kvecOLidhe+1m/tqc8QzC/P54OOxBBx0EPKAl5vJrbAdqadbrx8FoUJCLoxpCkS6+2I8
 LEWXEtawLmgEjzixVeLZ9ZkBOhDvdU/zf+IITc0NJuCYcJq1/NOZ7hfRshiTPRzP5uQq
 y3dY84MAaxiM9Ka4RI5XK3J8PVFh9JfbOSFCYjDNye8S3oJ+amhY1t7c9bdO84ODxr67
 ipFQ==
X-Gm-Message-State: AAQBX9cTrgtzTFoZfMttxn5wYr1QLciyPCoFWr6PCQUaPKqzSaZ4mLgc
 4LcqWQ2OZVWSki+ws1Us2M94WLksd1CgX0JKXEk=
X-Google-Smtp-Source: AKy350ZXPkCSH2s/s0C/6Vn+6DZKj8HROK/I6nEQQ5iTVM5xZGbUBJG8+i/nelJBOqq0FzvI5LSkqw==
X-Received: by 2002:a62:194b:0:b0:622:bbad:a2f3 with SMTP id
 72-20020a62194b000000b00622bbada2f3mr4169171pfz.9.1680923049906; 
 Fri, 07 Apr 2023 20:04:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 11/12] tcg/mips: Use qemu_build_not_reached for LO/HI_OFF
Date: Fri,  7 Apr 2023 20:03:58 -0700
Message-Id: <20230408030359.3368868-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The new(ish) macro produces a compile-time error instead
of a link-time error.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e7930963fc..1df00bf027 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -37,11 +37,9 @@
 # define LO_OFF  (MIPS_BE * 4)
 # define HI_OFF  (4 - LO_OFF)
 #else
-/* To assert at compile-time that these values are never used
-   for TCG_TARGET_REG_BITS == 64.  */
-int link_error(void);
-# define LO_OFF  link_error()
-# define HI_OFF  link_error()
+/* Assert at compile-time that these values are never used for 64-bit. */
+# define LO_OFF  ({ qemu_build_not_reached(); 0; })
+# define HI_OFF  ({ qemu_build_not_reached(); 0; })
 #endif
 
 #ifdef CONFIG_DEBUG_TCG
-- 
2.34.1


