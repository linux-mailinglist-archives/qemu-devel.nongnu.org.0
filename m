Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C620456409A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:05:19 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dkM-0001wI-TZ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcA-0006kM-KX
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:50 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc9-0000at-70
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:50 -0400
Received: by mail-io1-xd2f.google.com with SMTP id r133so4742026iod.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8IKafcPetXhYaW8vSA9hmiAtlGDDQQOeGPD01WxZFo=;
 b=7AEtCtZ9RUBuuUBz4oOZppBhV1xtBdTGDSEeAsCtYX0D2TPLvkifV0RRELWjP1MEo6
 9drJFCiX32KY9ke2ZDkZNq2Xp7W3LaonV+NLUtImqZ60zi5Ii8bUHBsn53WP9393z+sB
 hwuJqc9SaDkQmGVKq8L493A4tr7O5siSUBoCBWKQE4fRZ838+dBV/Q7tKEMTc89w8jVx
 CTtnIGklq1zmlHSoUuKwM/ghe+FJuDrozaRKa5m4Ji3XCnyWuHJ44EU2JF9XO08Z5h/b
 xwqAOfKwDZWS8jnDc/UrkYqOar/j9zYTI8g/PSZ6oXKSe2W0c4IzInPvFysofOH9dQik
 4/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8IKafcPetXhYaW8vSA9hmiAtlGDDQQOeGPD01WxZFo=;
 b=2i31XRwzF6lblVp0CadgVWikAcmwi62rQrTZqBlr2EixM9taJVY/VPGFeZqcGJeNqR
 IIyV9R8+Lm+a0caL3sDf71k+1hdApFfOqVwBIPlKzDtCadh/OozPGtCn4JRr2qsBf9fP
 tSi+UsDde4e6cC49WE5x3OflaTI9Zu010TKxG5TmqGGhiY5WBA0T33bRGW7u5iWbD8M6
 Qh/8Y1spPZTxUXs8d96FP0t9s5LvYwbS/ownj9LHMWY6NC0LMhyXBPSyoKLqO1emu2o2
 x5IknykB/JT+E4Wcklta+9Z8FCUIe851T6CiLXyKpfjs6Z5Mj4JZgJv91yYH2wUXZUcz
 G+ag==
X-Gm-Message-State: AJIora9paaqrB3exkrbi+4QgZDwHX5kollbvwzE5NlL75RAtLu1GgaQj
 +CDNKT/I72Vcv2TMnMRKhYDuA3IPm3qjZA==
X-Google-Smtp-Source: AGRyM1uDOFCk3UM8542+g38SSBBxG14bu4zFrDvZeLk7zukZmlOVdJMOiFGHzFK0haC9nRUgxRYKpA==
X-Received: by 2002:a05:6638:2605:b0:332:23c3:c4be with SMTP id
 m5-20020a056638260500b0033223c3c4bemr12483945jat.129.1656770207904; 
 Sat, 02 Jul 2022 06:56:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/11] bsd-user: Implement chroot and flock
Date: Sat,  2 Jul 2022 07:57:02 -0600
Message-Id: <20220702135706.73622-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a1c80428d98..c24054fed11 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -848,4 +848,23 @@ static abi_long do_bsd_fchflags(abi_long arg1, abi_long arg2)
     return get_errno(fchflags(arg1, arg2));
 }
 
+/* chroot(2) */
+static abi_long do_bsd_chroot(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chroot(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* flock(2) */
+static abi_long do_bsd_flock(abi_long arg1, abi_long arg2)
+{
+    return get_errno(flock(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 06bc76a326b..d252fb40737 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -459,6 +459,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchflags(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_chroot: /* chroot(2) */
+        ret = do_bsd_chroot(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_flock: /* flock(2) */
+        ret = do_bsd_flock(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


