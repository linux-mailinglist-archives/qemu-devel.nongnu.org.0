Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CE55A426
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:03:58 +0200 (CEST)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rPB-0005xt-Uc
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9F-0002kI-A7
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9D-0007W3-QR
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:29 -0400
Received: by mail-io1-xd34.google.com with SMTP id p69so4000306iod.10
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guUnp9hZinCJOwjoZiIYjs2izQAW1BB4o6jwqxF1ChQ=;
 b=Vh+etAdfqxjOP+GN9D5Sl9fXeS3WnfbJR2GUD0Tb2idgt+GoIoseFE89rdT+SxZiEk
 irQ35RCbxMjMNVFxfml2nk18U9hMGPiYrrf44LGYGJfs/w857LkfCc+9zp4RE0rCKggz
 Ob3tVaek0U4t+0/akaB5cjvJQOdUria0Yhmpj0m1q7GIuTHqjeL9FBXmFrnkWPcR/aGl
 naNrOFGmu/Y48bKbEfMtBSbwLUhUMs09aMPgAoKaIniYdWluobaNZjhJPwzwYfX/jTGN
 kzrFQ65ZSnOlmLuc78K2JwCpX/n7PbTjXLh80OppcmRcPL/BH75U5M2jWtmOKQvKuj4U
 9LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guUnp9hZinCJOwjoZiIYjs2izQAW1BB4o6jwqxF1ChQ=;
 b=5IQ749kfJlGp1p0UDYi0I7B37nZV1aOBWojM4Ef06W90ZKET/oHC0AOc8O2dNh/IWJ
 6VjmDYVufEtMs6g2nZ/ImtOl6lEvUg0zYJgiUjIPoci8cD84OVbrU0JdMnt1Q38OpZ4V
 Gu8HJqfXBdCa4/eqJk4QY+JxGfCS1WQdKTgR/JE9tBlF6QWP6dcGmnCKe2nX6PN5uBjB
 DT+SlJruVt3Jg7FSP6JpNGEuDjPBjXN+2Vh5kiJuu63RHANBt2rQq3HNy9CcPB9ctebX
 frQmTPV3NHBubaQi6Oc6PnS5E/d9NbFfmEGBfQs1eaWgyd3kPte2djQBrus+8ZBTsCKl
 Vy8A==
X-Gm-Message-State: AJIora9eeK/BPSK4EokIJXtNe7YtIPVHxVNGUdoAabs+T09af93pPw2q
 G79By7SrpEnbWN1ZYvGM5QwgKxCP9YNIdA==
X-Google-Smtp-Source: AGRyM1u8Ab1ntoCJBOqkmFc27uk+iTR5h2JEqso8zuzPTYmBP+CwOGP16J4rnWBjWZZjoos9eF1aEQ==
X-Received: by 2002:a02:94a2:0:b0:339:e395:764c with SMTP id
 x31-20020a0294a2000000b00339e395764cmr758033jah.230.1656107246306; 
 Fri, 24 Jun 2022 14:47:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/11] bsd-user: Implement mkfifo and mkfifoat
Date: Fri, 24 Jun 2022 15:47:39 -0600
Message-Id: <20220624214742.89229-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index c24054fed11..4b2f6dcc1dc 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -867,4 +867,31 @@ static abi_long do_bsd_flock(abi_long arg1, abi_long arg2)
     return get_errno(flock(arg1, arg2));
 }
 
+/* mkfifo(2) */
+static abi_long do_bsd_mkfifo(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkfifo(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkfifoat(2) */
+static abi_long do_bsd_mkfifoat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkfifoat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d252fb40737..be225195fbd 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -467,6 +467,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_flock(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_mkfifo: /* mkfifo(2) */
+        ret = do_bsd_mkfifo(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkfifoat: /* mkfifoat(2) */
+        ret = do_bsd_mkfifoat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


