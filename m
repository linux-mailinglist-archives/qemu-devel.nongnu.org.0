Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39842742A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:25:53 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzFQ-0002Jn-PX
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5R-0000FZ-Vj
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:34 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5P-0006p8-Si
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:33 -0400
Received: by mail-il1-x129.google.com with SMTP id w10so11478468ilc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1dDLXIS3VU8edOJUSfrWs60E6rqxuCQQWruLcK+nTs=;
 b=f4RT7OZCqRmIDuvfQY54SMImALD6uFvqodReJ2EV6V2ZEvwpOMBMoeXHz/bvauIena
 uuPLmhtoX8XvgbhxdBm8cq4XxCPLb13XnMowrcKdt+4SgBKKlYuHiT6PQ8CBXlp37WE+
 97j72nR8GEWm00vWpwpp2/el5cDuNCRlwdCrYCgvEoA8SvpbA+Ee3fPuH3LH+LBjLV6b
 PoyqiJvmdcaIAzSzXB8LrwX+5bZ9IG9BeGKcbJ3hb5cGvgsfvN5PdbuczSJM/C6ZDiGn
 xVJWhKE5l13AzrR4nY84nH5GANDMd+LwJ1m4Ob7O06rczWdrHzv4hWm14++G8H0Z2Em8
 ehow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1dDLXIS3VU8edOJUSfrWs60E6rqxuCQQWruLcK+nTs=;
 b=DnCJQlE+3haXiclptg6PwtDYb5rPPwdPY17foviQFVmZw2Eig/bQ0tW+joHAUMyPcF
 x/KBhTz5Sm5J0lv5CyidezGh9NeQgwDN32Fy8p6CC4hqyCcVMMBpinD+XDZFxKQRPob/
 vtFb/joDZCqMkPLPfBtn84Cx6RmzudMSCWPmwgeRRUHov4pa/zgIVc7yn2BLHg0sbHJo
 W2E1t3W6SWA8bAcSOrygII9iFnHeQZ6IAkg/+Us99Wxl55qoUTlsHMknPnt8WM/hebOO
 tL1SdtwOAB+Xyp/8ziNGMkZ8HownFvdDzbDLtNZTg5yxJKtpTDz667gKUqelqHqYHZSJ
 XONA==
X-Gm-Message-State: AOAM530EpgXGXI6H8bs9/bqwyYxrUbh+J+k4+RFJ6m+i1g91Syo1ZJcU
 Ywbw0b30dxF+m4bmpbkiNugEKIGKrRjxKA==
X-Google-Smtp-Source: ABdhPJx8uhFQ4eP4CzUFnH+qX3AcFU1E0U5/+4JBDzPEN0evhprEqIztRZwybnYsSzjorGdAG+QOFg==
X-Received: by 2002:a92:c56e:: with SMTP id b14mr9719641ilj.71.1633734930531; 
 Fri, 08 Oct 2021 16:15:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] bsd-user/sysarch: Move to using
 do_freebsd_arch_sysarch interface
Date: Fri,  8 Oct 2021 17:15:03 -0600
Message-Id: <20211008231506.17471-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_freebsd_arch_sysarch() exists in $ARCH/target_arch_sysarch.h for x86.
Call it from do_freebsd_sysarch() and remove the mostly duplicate
version in syscall.c. Future changes will move it to os-sys.c and
support other architectures.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/syscall.c | 45 +--------------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 2fd2ba8330..d3b9f431e2 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -91,50 +91,7 @@ static abi_long do_obreak(abi_ulong new_brk)
 #if defined(TARGET_I386)
 static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
 {
-    abi_long ret = 0;
-    abi_ulong val;
-    int idx;
-
-    switch (op) {
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_SET_GSBASE:
-    case TARGET_FREEBSD_I386_SET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_SET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_SET_GSBASE:
-    case TARGET_FREEBSD_AMD64_SET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        if (get_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        cpu_x86_load_seg(env, idx, 0);
-        env->segs[idx].base = val;
-        break;
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_GET_GSBASE:
-    case TARGET_FREEBSD_I386_GET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_GET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_GET_GSBASE:
-    case TARGET_FREEBSD_AMD64_GET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        val = env->segs[idx].base;
-        if (put_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        break;
-    /* XXX handle the others... */
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-    return ret;
+    do_freebsd_arch_sysarch(env, op, parms);
 }
 #endif
 
-- 
2.32.0


