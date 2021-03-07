Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D273E32FE5C
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 02:41:29 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIiQC-0004JV-TY
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 20:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNy-0002uz-Cv
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:10 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNw-0005OL-Ug
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so1206595pjb.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 17:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMi1f8UdwY02crz7tpgFWAoMdF442cRFWG0hh30+F78=;
 b=a2+CF3chh1SyYWC60/BqVZBII+uPIUnK66+Kd+0U+tQs/sVOuSl7MLxbm4IgQt7l/l
 cYpDVWdARJz/adDBgVwFi0Uk4q7VCpYPNfav4CITdlVhZRrYYq/lVSc0s512tqWhlRwA
 FUccOik+bgpSye6xZdKu+50w77GeUcxHHtdKpDsQIOMvgkbb0Ce5k6pCOJeIjMcSvvmF
 MCCb9RbBNGERhE81HLf229Qei8Ov1V+wLFhv6ijWS0QZWYn1M6mybumXyrRDEyrsBC/d
 DmIup8sLq34983GstintDJ4lTg0/DVGyrAOiFCJjRtTEQncALlYC7Y8EM52CQHWrUlVP
 qV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMi1f8UdwY02crz7tpgFWAoMdF442cRFWG0hh30+F78=;
 b=tDteRhLemerwNJt5E7kEq+TJr6sMcHf3bVuyJ08l+WLjvAkvpvhsNH75MkzFZ5YBLL
 /osEPs3OxfWKEN3EDOUhSivx5oY/qXHTPAsGFKNtYIVXR3yIkbpnWajnc6K3AD4yewYi
 dAehOPZC/E8wb5oEpmsFmXCLrcxk/n0QgN4JpZYf+25pUOkJ0Hg+U3WdvKFZz0kO4SlU
 y7IVRMGczpRo6gWff4LfbBTqHUw+wjaHrzG4i7glSKTl28AeeyDTkSqsAfxQ6ajR1YEB
 paQxTcL6N5xunuJqQuCPV2vejv2RtX1en1Rnv8rEcxsOxbfuwmQgLK/vANvhSFqWou6a
 VgYQ==
X-Gm-Message-State: AOAM532/NPZUFqYbysbjVQzOeAY0LMKnsGyjqFb4P4q2mquZtvYDVZBe
 HlndHwbSSihb5V/WkpuOKBEx1T8mWki4dg==
X-Google-Smtp-Source: ABdhPJxhcPKkVMZMekrSVd3J7ADxm2iXZwBi4ibXEuf7xKREbSyLbNf8Kd82RDlFdKUoB1doF5Dzrg==
X-Received: by 2002:a17:902:cb0b:b029:e5:b670:d905 with SMTP id
 c11-20020a170902cb0bb02900e5b670d905mr15397326ply.18.1615081147657; 
 Sat, 06 Mar 2021 17:39:07 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v14sm6518044pju.19.2021.03.06.17.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 17:39:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] exec: Poison Hexagon target-specific definitions
Date: Sat,  6 Mar 2021 17:39:03 -0800
Message-Id: <20210307013905.115019-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307013905.115019-1-richard.henderson@linaro.org>
References: <20210307013905.115019-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 3e7a84eeccc ("Hexagon build infrastructure") added Hexagon
definitions that should be poisoned on target independent device
code, but forgot to update "exec/poison.h". Do it now.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20210219135754.1968100-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/poison.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index d7ae1f23e7..6bb86f6c2f 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -10,6 +10,7 @@
 #pragma GCC poison TARGET_ALPHA
 #pragma GCC poison TARGET_ARM
 #pragma GCC poison TARGET_CRIS
+#pragma GCC poison TARGET_HEXAGON
 #pragma GCC poison TARGET_HPPA
 #pragma GCC poison TARGET_LM32
 #pragma GCC poison TARGET_M68K
@@ -73,6 +74,7 @@
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
+#pragma GCC poison CONFIG_HEXAGON_DIS
 #pragma GCC poison CONFIG_LM32_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
-- 
2.25.1


