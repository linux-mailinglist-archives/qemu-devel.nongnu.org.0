Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A234155A3FE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:54:51 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rGM-00031u-I8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9E-0002iJ-5r
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:28 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9C-0007Uu-9Q
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:27 -0400
Received: by mail-io1-xd29.google.com with SMTP id y18so4035469iof.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8IKafcPetXhYaW8vSA9hmiAtlGDDQQOeGPD01WxZFo=;
 b=rgq6VLDJEvLmSwrURs0fTSHV+cKPsl2pkhSbrrQodbAkqu0Borq2j6sNglfmWM5YTo
 vJXH4wJnv5SsH1YzP3n4QYuUuyDGT2026x5FwZ3OSa/AwTllbVRFJwgomyvQsRBfdF1o
 QyrrRvw7ZGlzhLdRCk5vIgXG5XkmgU5Mm2RLJm/BAbIF4PC2cyJIxfKqkksKSodKeDik
 z6ZdChwfoRBU+v4l/ySYrsCZuvizpMrXWVwNqOLtfeda2SWfBreXq7WeOc7MnERW6LbM
 Ft5WIX6MvfTP2wN4/aeqw0ddR5ide+aXqfIY6WdUkEe0iFWQbNYf17Ejw++bbBD57T5F
 8C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8IKafcPetXhYaW8vSA9hmiAtlGDDQQOeGPD01WxZFo=;
 b=JLbA7xs9jgcUwpAcKUzNj9mxj26CQS1B12kdzgfsD8XQ3BXSEXDYJV302MwNva64p4
 dJofONRCKYGRqRoI3+UiB6ijtsS0ylTQHTAZCW7RnMrvMKU50XE5inkAt1koW3mcD+7E
 aypcIatsXxWwT2LB9xkLv24+VTFTq+hYrCgTAD/2fmXlvq5FRCDf69xnHMDo0FvQvpmG
 EIcqhTaSUac6Nl6qFrBbWNXFoA1WW3PHSEdrjWKyKfBPk7j/+q6T+8kvQNcf9KDZDcw2
 g8OFQgNjY+rY2MarucSt/1QmbX1VwnvCNXWcqDWPAo4NBbdZe+zsbHNd2Zf+mQCvNXO8
 MR+g==
X-Gm-Message-State: AJIora9K5tJ/YXk8PCazk3b9d+hGDcek28hp7zytj0eM5VzhGvLMtKSf
 V3cz0idq+2OY00xgMRLXedJwXry6bSRnHQ==
X-Google-Smtp-Source: AGRyM1viFQxfP2FMkZfxKa9YjfdapqI9jYJ3/9fsO946dAjr3bEQpmC/ZVVKZ/mm9HyKcaQB0tiBmA==
X-Received: by 2002:a05:6638:16c2:b0:332:3901:d8b7 with SMTP id
 g2-20020a05663816c200b003323901d8b7mr748617jat.73.1656107245420; 
 Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/11] bsd-user: Implement chroot and flock
Date: Fri, 24 Jun 2022 15:47:38 -0600
Message-Id: <20220624214742.89229-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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


