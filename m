Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7F550C7B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:14:26 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zRJ-000786-KE
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIZ-0000wO-Qc
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:25 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIY-0001Kk-9O
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:23 -0400
Received: by mail-io1-xd30.google.com with SMTP id n11so9137285iod.4
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDt4lR7a0j8LSpHDvGx01/LeHWwn1L1uADG9APhxRcg=;
 b=ZcAVHpa+dNpQqJXNn+jxFMHLm1E7hVhTpSvqlMsFbsJdfoEPmjWRYG/XhWJEgtA7Rp
 +0YYUJ1JNH6+WfHJ4UJgcIOSONKMsc5FDm+uTETCAGUtNVs5e5tif+m7FA0kcVPLhxqo
 Ye0vvlGW48q4dXzIrUb7/H6iaqH+ALkZ0UsxSIFL5JgLndynbLEqyCTZWY2Mvc2c7ZJq
 Du237PUgNIs2MpgLOngAwFewQ8r8DXtg97cn4CnHafiSPIY+Jeg0+VhhJORJiiX/xrLG
 rhICJoBFDzRalubLZ3KHXV/ZnLXCuCmWfWD3VpLqrNI15DfblQ7CY6/optqrdgtsCsFG
 LnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDt4lR7a0j8LSpHDvGx01/LeHWwn1L1uADG9APhxRcg=;
 b=kwSlQJSN4o4BDDbROLWHI28O03z+76xi1/UvOA0KZpBVBgO0DVuNesP//SQh8xb4At
 xSVYhSFP+aPhypLUC60GwO9NLwJaZM+qIfmRxYLYuMsphIRcvXZf4jIDzEHK0W6DybEl
 knBptSOg2519xw6P0Br+wtrOJeXcjF/IHw1+nbwaPRjhAfi1D+sDPqOSaJ86y9oXvN7I
 Dw9x6typ+2jCVVueixKvbMu+7cRzykm6aRPysf+5MlUh4gnxgrW8hhOvvRnQJs40VyLp
 qpAopygTMoXyyUWc9vIo9LRUFpXhXs6ICXUtefV8jp4iDHxFFvbYoywIKEzzfwvR6sDA
 7cyQ==
X-Gm-Message-State: AJIora9HUPfXsghGx4dgq8CjG2aK7HCrOyQM8sTLCDFQwmw642nKsePo
 /tv7YNV6VKbLHgl4MNA0sYtRbRH7vDM3kQ==
X-Google-Smtp-Source: AGRyM1te2kLF6ovll+VV/PDdZxfQ1wIhpwjAPSQF/Mn51Gy4FRiiQAKzMen085nWgs5XPHIcnYvU7Q==
X-Received: by 2002:a02:9f14:0:b0:331:9195:dd3e with SMTP id
 z20-20020a029f14000000b003319195dd3emr11154127jal.0.1655661921426; 
 Sun, 19 Jun 2022 11:05:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 07/11] bsd-user: Implement mkdir and mkdirat
Date: Sun, 19 Jun 2022 12:05:27 -0600
Message-Id: <20220619180531.9161-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
index 93e142d46e7..a4c6dd52a20 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -429,4 +429,31 @@ static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* mkdir(2) */
+static abi_long do_bsd_mkdir(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkdir(p, arg2)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkdirat(2) */
+static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkdirat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c847e4d20c6..9381ddb5be1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -333,6 +333,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_unlinkat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_mkdir: /* mkdir(2) */
+        ret = do_bsd_mkdir(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkdirat: /* mkdirat(2) */
+        ret = do_bsd_mkdirat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


