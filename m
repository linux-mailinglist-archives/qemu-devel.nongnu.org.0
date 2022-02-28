Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503B4C77B2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:27:17 +0100 (CET)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkjs-0003ac-Nq
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV4-0000Ah-DR
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:58 -0500
Received: from [2607:f8b0:4864:20::132] (port=40803
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV1-0006b7-Uk
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:58 -0500
Received: by mail-il1-x132.google.com with SMTP id i1so10653387ila.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjL7Mev6xqaa0v+8+i8B7VWCn7P7IPzcwixzN9m4rZc=;
 b=YGQAX0/b0az4qwLv9k10bhyViMyWDiKT89fqINlh7UFR6ZFgPBajuXif4h6pjliwYQ
 SpwJ9fp3PBC0yKG7CA9aMsCCPukUvKiIB9Ca7cGjNItbjWQ5VWy9tcUAH0uOCg2NgSAL
 xcwu1QGsx5p1HiTNq1LAGF5eB1q+4cyx/d5w6DdL+jKPoKdajmhNEl3rxVNTxpIy7oEI
 F2GPQ329pZ/OgUFHo8d9TyoMovYxITtPSrDVgM/0wNUt//w4eYmiNMpX8J9l37wA0pwE
 cL23KUF9EGMShLQGXlsKvol2Cd2/PRJ1EZIC7rtSYLEiTG79QgXJIL/7IySenk+IiV4S
 g1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjL7Mev6xqaa0v+8+i8B7VWCn7P7IPzcwixzN9m4rZc=;
 b=3P1ipW5vI2CVuN2+wWC4Jz5uMs6DgYenwdre0bDA3inzh+UeSnXcMOqh/iKskZAhxT
 9RYuD4XRDuOnhPo2ZVk1s/9AJzaNmwLY5F+8NZsonCGx4Omxbg+GbH1ktcEIjQhXdkCH
 kvaS4qfGLMHfMspBIg3jtwDRsmb09oui7UAQfpJ6rVgGNJBIuwH1RfKOhRGKbRGCqxUk
 EEMv4YJ0XvnmP2b3kIvkLyW3CXvmm/LqU3FcyfiB9AFh+iC1UAcDogTfB+IoZ0nkiu9N
 Ml6OxXVoGxE4w6/CTli3fn2ROhSn9r+XXtTwu+gqsv0kI7CcwB+UC2f+Wmn/M5bi1o/b
 4EQQ==
X-Gm-Message-State: AOAM530ivwCJhsL8qRN0SRDLahwzP5cwH+3FqXk1v/Zy2pA2yxPy3h6x
 jjt09ZbPtfMVCzB0lB8+aHIJp0OA9o+e7g==
X-Google-Smtp-Source: ABdhPJxl3UjLErD8hVC8ymiw9FxwD/YEiG6bOq6nThDAtTIbRfner+KyEiEl7qqH1nrXLvPA/NLTUA==
X-Received: by 2002:a92:8e4a:0:b0:2bc:1a0d:ed41 with SMTP id
 k10-20020a928e4a000000b002bc1a0ded41mr20067781ilh.96.1646071913636; 
 Mon, 28 Feb 2022 10:11:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
Date: Mon, 28 Feb 2022 11:12:10 -0700
Message-Id: <20220228181214.2602-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the helper functions get_errno and host_to_target_errno. get_errno
returns either the system call results, or the -errno when system call
indicates failure by returning -1. Host_to_target_errno returns errno
(since on FreeBSD they are the same on all architectures) along with a
comment about why it's the identity.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 23 ++++++++++++++++++++++-
 bsd-user/qemu.h               |  3 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index fc57e324173..597a41c2f50 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -45,9 +45,30 @@ void target_set_brk(abi_ulong new_brk)
 {
 }
 
-bool is_error(abi_long ret)
+/*
+ * errno conversion.
+ */
+abi_long get_errno(abi_long ret)
 {
+    if (ret == -1) {
+        return -host_to_target_errno(errno);
+    } else {
+        return ret;
+    }
+}
 
+int host_to_target_errno(int err)
+{
+    /*
+     * All the BSDs have the property that the error numbers are uniform across
+     * all architectures for a given BSD, though they may vary between different
+     * BSDs.
+     */
+    return err;
+}
+
+bool is_error(abi_long ret)
+{
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e5742bd6c03..56042ddbc5d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -246,9 +246,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
-/* syscall.c */
+/* os-syscall.c */
 abi_long get_errno(abi_long ret);
 bool is_error(abi_long ret);
+int host_to_target_errno(int err);
 
 /* os-sys.c */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
-- 
2.33.1


