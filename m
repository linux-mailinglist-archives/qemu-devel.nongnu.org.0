Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E03F0C25
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:56:22 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRfh-0002gt-6t
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9h-0006d4-8b
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9f-0002e3-M6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so3069276pjb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kL7S1VIhGWd0zPGO5R9RGYtF+Izlm+bII/GL/xjRg10=;
 b=xmjXMErPkRHtOVYdoOnIUPnXyzdj5z0ssS+ziboy5OUrRgEN28TvCJH5iACG57k9+d
 QoQ3An9CYZtpSm2BboOR5/5B2TKklDKydtO6wn7mpaULxKBHQPB6CfAtA/JKmPR5CvHe
 zo3LDAFcMequwBZMb5HEiOA6nk3sHISlkOwB0hRaYe03MAca0B2UluDK6UOzXqF+pFzc
 1fmB5PaDOXe+N9kGHHTo3He+WGr8F1S2zrztQHElT/zDyPqZn7+kiUGBTOeHDetVMx+8
 ZPToDuY9ShXD+rJrRziLeV8UU2k1xvMTf+lVZGR2teQDw7hLZ6/q4hl/oxyQCZ0m8nt+
 IA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kL7S1VIhGWd0zPGO5R9RGYtF+Izlm+bII/GL/xjRg10=;
 b=cFt4cOtJ6fVgtmUG86rIrWMyTyBkUliD6EQ1nMa87/zeOa/1JtD6StD9+MkopakO8g
 r/wDTW3aZg8YYUbVZfRKGn+GkQjr/M+UG0e6yQIfjB+Z28MY1Id81/a6Rijn9lLyODDY
 oZfcRH5r06UtO92eFY9uFs4TnjNXi0RltO6/0w+OPqUmIAGcl05W9ftEGjcCqDblYJL+
 7WlRQBUPQVdwRR7AsFX6oaTLisxvkOGZob5+ap9BnJcp7eItpvDqGgMMdK4bMkWVzSYQ
 6iUbWfgeLOq9XD++kqu6GPU89fH+ss8EVnZh/Ehyldm7CjxIpMsTDltbl8JZb5FycG9O
 mTHA==
X-Gm-Message-State: AOAM530QLTOSmaKCzyOCVdotPWVFWYyOAGjdphgQ+7TPg9JZY7qiU9VS
 4GgnpnglDOaOrPvlHmRRTyCDyenFK6h4pg==
X-Google-Smtp-Source: ABdhPJx9/YCO6XMFFD/o6XRemi/7AQ6SU3jf42vEGde250YISJPzTFJ/dlhtKjVbHe5K4TjjkxMDLA==
X-Received: by 2002:a17:902:e744:b029:12d:6479:83a3 with SMTP id
 p4-20020a170902e744b029012d647983a3mr8403180plf.30.1629314594084; 
 Wed, 18 Aug 2021 12:23:14 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/66] target/sparc: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 18 Aug 2021 09:18:54 -1000
Message-Id: <20210818191920.390759-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 299fc386ea..a3e1cf9b6e 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1328,27 +1328,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
             oi = make_memop_idx(memop, idx);
             switch (size) {
             case 1:
-                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
+                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
                 break;
             case 2:
                 if (asi & 8) {
-                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 4:
                 if (asi & 8) {
-                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 8:
                 if (asi & 8) {
-                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             default:
-- 
2.25.1


