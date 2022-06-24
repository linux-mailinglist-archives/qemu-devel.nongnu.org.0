Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008C55A421
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:02:11 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rNR-0003gO-SF
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9G-0002nA-Gl
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:39450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9F-0007WU-29
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: by mail-io1-xd33.google.com with SMTP id z191so4008712iof.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kkD0I+Ru5IcZB0L5eyNo83IbFVlqdLSdNar/0a50Tw=;
 b=VYXiIEwc3kFfqClcSAh7tAbAKgaXi74gPq3Ws7mf0Ef1PQRgodssNDGXothrNUUmnO
 W2iz/MyRReU0AGIZ+avpVLkEb6mgkosnuy0TWYY3f1fNiDBdFTIBkBZ99plXZuBR6n2E
 0DzF5EoO+YMN4b4leQWcmIVc4uwFXW8Sndb2LLObNwAt/ZmzTY1Em4sly9ospogAyKWR
 D7gvcX1PMIRV6cvabT1/yp98yjM/UJS9299LEXop90vTOxpclAx5Zyx3gVoBp2gJ4NZo
 AaI0wSWDhX88VAkiMERmgb4EiJB3Cc2NPL89gkXmzm0JC3qiBjOqt3SR7liNGmw5GS32
 PVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kkD0I+Ru5IcZB0L5eyNo83IbFVlqdLSdNar/0a50Tw=;
 b=u4RsEJDs45hIzb2ri2QlblBA/FE+kaGZpUyDRiZq1jcxJ408geoPvNve5vntk1s87y
 t1y5hg45t5H/0ukqlPBztG7fXKqQOt5qIEKgA5KGd+OHBxmmzlBeoGrk97s8rySK0ecw
 fUJ7K5KGLxBX97uh8PXNqbxfB1nDN0LX2YueHA42ubHfNIHKLuTE8wsx2zj2F+d79sC2
 8JrZBd4ce/MVjCZs/XPxHE9YiFiGhruA8yMaEN6XcaSNgJM+wu92Glx+b+pykHR1dpZC
 HW/HrTAlv8WGsmWWaifuamKvdwmY7qsar5+wv/RdEKrjFisY+KtGr5wMT0vkZDhUcKR7
 fS9g==
X-Gm-Message-State: AJIora/Fde7Us0pbjWym+M62nl/q2gR1rgFvuax2eYgiMf8gsDfiHwyS
 y2HKITwx7cDM0fq9dVJONJ81nLRBnAQCMg==
X-Google-Smtp-Source: AGRyM1uCEuokwofGamz79ZC488/JvReNwIxj/kVMY3Sy9Jaal+ZfQDIjbs7Vc3MYJQSjdVsDWWbSkw==
X-Received: by 2002:a05:6638:1a8e:b0:339:cb8c:df22 with SMTP id
 ce14-20020a0566381a8e00b00339cb8cdf22mr746048jab.152.1656107247834; 
 Fri, 24 Jun 2022 14:47:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/11] bsd-user: Implement undelete
Date: Fri, 24 Jun 2022 15:47:41 -0600
Message-Id: <20220624214742.89229-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
 bsd-user/bsd-file.h           | 13 +++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 065f576dfe8..108a5061850 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -926,4 +926,17 @@ static abi_long do_bsd_fpathconf(abi_long arg1, abi_long arg2)
     return get_errno(fpathconf(arg1, arg2));
 }
 
+/* undelete(2) */
+static abi_long do_bsd_undelete(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(undelete(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7de4c40bb16..57996cad8ae 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -487,6 +487,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fpathconf(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_undelete: /* undelete(2) */
+        ret = do_bsd_undelete(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


