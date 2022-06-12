Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BC547C1E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:57:43 +0200 (CEST)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UeU-0006q4-Vb
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVv-0005l6-5V
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:51 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVt-000088-Hh
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:50 -0400
Received: by mail-io1-xd2b.google.com with SMTP id p128so4323870iof.1
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEvM8YBA1yOsYQh81fSc7NKkcngxX4Ycc/p+xHYctVs=;
 b=Fe7YDJ98HX2g9VuSkhW3zKESlEiBQSGs80ve1eZ+gFeroLuWhyqfYSM5sHCPO+2TLP
 wmMAc9to3vZbwvpJPdFHNfZhZDmo6mtHdvNaI/B1KSPJAmSs7YmhJmrEigg3pMHJ5fEl
 KDVOI4tv5QOjHSVJXqAUePB+Dw+9BBU3oYhCzmg2BMyeXJH3+7FjrVcz5KHXq2FU42IO
 48UJMrwq5O3+TmVytNgPt/XTJfea6FMID/RzgI4ISa20CGSSaCHhc4r/dFcZTfWwE5uv
 UmKzN2jGRUmltC83Ahog+oJwzg12/XDSMLnjyR/yeg98XWOr61rWMCf0vBVBTmoQuJd6
 6o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEvM8YBA1yOsYQh81fSc7NKkcngxX4Ycc/p+xHYctVs=;
 b=GEQ/Rj02oZ+QT8sbnL7ra5QvLVM0nQ/9OSVAazBtPkxBUqkQNWW+C7raJqENYnHUVS
 ggjzcTiDrVPPAul+w+SRepyhUdiJNNSbLQe6aD4E5Z+4Z79IFYFiJkUF9CCRCLgwyCl3
 ZL0Hl3in4Nb/WkkilI8nQexiR590YTqBq+MClI/VBJAYvElKLrrULU7EaJ7HgQNvlj1+
 XZ1M38eJorKyojnMYrqTAkz1hRCq4BzPRKp1AMbo6G/GFGnEI/dWm3qTHPHFB3H87htB
 N9lYwbcn0MQkBLGGV8yzle6g1nOrfb/aj+LrFlH8bWtysPIXcd9ImH10qn6xfhrvcz2n
 iNBQ==
X-Gm-Message-State: AOAM533dZSYKZhEEoeDVeyI9971g+FaDUCr9yOR3vt4rOVKt08zKbQ58
 SWGuwdA+AE90rwm2kbgdLa6EhAK401d/3g==
X-Google-Smtp-Source: ABdhPJwVLxfn+k89dZQioLQMKh2kso0YhnBdtIf9gtxOFvxIQ6NeUJd3iw7kwxCOhWlgsQpCiIekIA==
X-Received: by 2002:a05:6602:2a42:b0:65a:eb90:2a12 with SMTP id
 k2-20020a0566022a4200b0065aeb902a12mr26465204iov.73.1655066928158; 
 Sun, 12 Jun 2022 13:48:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 10/11] bsd-user: Implement trunctate and ftruncate
Date: Sun, 12 Jun 2022 14:48:50 -0600
Message-Id: <20220612204851.19914-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
---
 bsd-user/bsd-file.h           | 30 ++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 73263ba482f..ccfa65ec5e9 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -505,4 +505,34 @@ static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
     return get_errno(dup2(arg1, arg2));
 }
 
+/* truncate(2) */
+static abi_long do_bsd_truncate(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg2 = arg3;
+        arg3 = arg4;
+    }
+    ret = get_errno(truncate(p, target_arg64(arg2, arg3)));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* ftruncate(2) */
+static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4)
+{
+
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg2 = arg3;
+        arg3 = arg4;
+    }
+    return get_errno(ftruncate(arg1, target_arg64(arg2, arg3)));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d9ebb9d50d6..3c8f6cad0e8 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -357,6 +357,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_dup2(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_truncate: /* truncate(2) */
+        ret = do_bsd_truncate(cpu_env, arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_ftruncate: /* ftruncate(2) */
+        ret = do_bsd_ftruncate(cpu_env, arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


