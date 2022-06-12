Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F0547C1B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:56:09 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Ucy-0002ud-Hx
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVt-0005ht-IB
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:49 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVs-000082-8c
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:49 -0400
Received: by mail-il1-x133.google.com with SMTP id z11so3031158ilq.6
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KtZlVmXRy/+cq3lWCHK1c9dFeH198343UEAdKQVSjw=;
 b=mBZLOXRMsDbOxfC1kUoWfMgPqDsBByu46kT82F4ziNevclzN5Ki2NLKCcMOwUpEfZW
 cfNH4Z0kmL46gM0z0IiJcf/kpTJLLza5lxlfdiDUGCXknN3GGLVSjfSVMI3Wi0ARYVDf
 //s1cnSJ/nJZV6aAASMF4xqb/rSBL5emE8+oJOyyqcyFDw/Od7N0EHZGIbPFTlgGOOzr
 Jiw/SmZ9UF4vJibeK9IUrK7YfzNmok4LGuN9EGyaWt/A5Y0UBCNBra5pTU7RmTMWXJuy
 AjKiGBdvtnt45pXsS88ARI+nzexnHJmQc5BJkAEs+0J5hot6EyVZuSob01LQ9IGjMXQh
 KsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KtZlVmXRy/+cq3lWCHK1c9dFeH198343UEAdKQVSjw=;
 b=cddKXRpm1z2KPANNfGmJCuvBQDa7Y+6r0nsLHwIGhrUTv02nFI6bRUjQZKOb8anObg
 JiBPT5TmgvaDhEb3uC6GjWnegyGdYlMeNTRmfvIYzimDXitEU4umK0bBTStW0bQmb8su
 1T0cPxPiNU/T+VfnyElrPzcH7U+D+gdv9lgJKP9m4cHWRrfd+2B5RupWt86ENXS0d6sm
 02lCf5Q3EWIC2Eq+JW4NRD4V5HkCHsfpd5kN6QucxLNWlIASZvCI+AI9pl7ObjMco4QC
 mAh2vJoOEb4YSqkbqewLsgwmvwjtfecAGdCw0rEDjtq2fu9+deX5CF55knrKrnlAncNY
 ubdg==
X-Gm-Message-State: AOAM532BHGCXNmzlOKaISLbpLw/z5GZIRR/WobLi6GJf3SsTS4B+qDzo
 1cDQbqPzuwdMG6EY3e3o7ndGwF6cyWP/Eg==
X-Google-Smtp-Source: ABdhPJyn+deOCvD6FpPSysLQl9isc5sfTIaCOuOKTIy5PV7P3pj+PxMi8i9YagbTdZhzOf82DyqMDA==
X-Received: by 2002:a05:6e02:152f:b0:2d4:980:a529 with SMTP id
 i15-20020a056e02152f00b002d40980a529mr26871389ilu.72.1655066927035; 
 Sun, 12 Jun 2022 13:48:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 09/11] bsd-user: Implement dup and dup2
Date: Sun, 12 Jun 2022 14:48:49 -0600
Message-Id: <20220612204851.19914-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
 bsd-user/bsd-file.h           | 14 ++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 500d6ba78b9..73263ba482f 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -491,4 +491,18 @@ static abi_long do_bsd___getcwd(abi_long arg1, abi_long arg2)
     return get_errno(ret);
 }
 
+/* dup(2) */
+static abi_long do_bsd_dup(abi_long arg1)
+{
+
+    return get_errno(dup(arg1));
+}
+
+/* dup2(2) */
+static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
+{
+
+    return get_errno(dup2(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index e28a566d6c3..d9ebb9d50d6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -349,6 +349,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd___getcwd(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_dup: /* dup(2) */
+        ret = do_bsd_dup(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_dup2: /* dup2(2) */
+        ret = do_bsd_dup2(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


