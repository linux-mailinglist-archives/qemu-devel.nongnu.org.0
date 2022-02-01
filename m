Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C771A4A5B49
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:36:15 +0100 (CET)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErSI-0001CD-SF
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7v-0005CA-0E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=44945
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7s-0003cz-GE
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:10 -0500
Received: by mail-io1-xd2c.google.com with SMTP id p63so19849453iod.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntv4pxDkMgVkO564UjcMuE1I6QBGZZBPyRo+XkKbtGM=;
 b=lZx0CY6D8fBmRBvdMQzwBjateIr95BARGypLzQM+UGCsNebmjvn/LvDG98Au+sXv2F
 F20d1TiD2ArddLzMOlDiVod498ofMgRLxfeSnsjZCYWUpKOCRUW+mb5b5cy0GBU1jLfr
 2Lkk48XwSgYn/m8Pf3omBVrXgA0ijZ+CcTseEOTHUD7UfM3r18qxYnWrkPZUWcdCZQtx
 ykh2d2RymeTKOmKMg8I2qXcafLPcXOYdDCiScwXUoJEDzPcvWafsU8mi1+x8GM7dZ+ue
 tgy8Wrax8KDyX9KeVzeJRdlqarEuDbc8xefA/H7NGsYjMgFoRx20/nbcRf3oeRHYiNxW
 yuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntv4pxDkMgVkO564UjcMuE1I6QBGZZBPyRo+XkKbtGM=;
 b=VAbHvTEWvaBb7syFSkHUeVUEd6W6mkF0DIopr/uai3cS/ZVVhZx29dkc7UTGuOA3T8
 d2n47qZ7KoeP/6cM/iDcl8bGRDhNZIr36LxDiPXCwmNSl1P79sJZsSncjUKbhgrxjy3J
 dKA0p5vg4XRXDpS8ekBQA6YPA6gE+/67QbW5yHZ7WcsYeUb1T1dGjWfeSQC2ZDMWZfit
 vbYlfLSj+I4ba0EKTSu88N2im4bQhHdyiMjWeq2edt5HizuosNNOoUJH6R8+oaoQQJ2K
 ekuVIue7hHGeeV9cqzVJiLNk7FtVb/SI+R8fJxcUB7fC22M30xozsi1wZG6Qu//2iX3q
 XouQ==
X-Gm-Message-State: AOAM5318+PfiRU4G6GjkBjugAENoIkkk4q3vxsrNx5n9hpQgby9+DQ3S
 RYaNLEyKnYJkHOXbyvaA1jD2FHL9hRu9Kg==
X-Google-Smtp-Source: ABdhPJws+RvRIEOE1xPe9TJoWPZJrkHatixQGM0QVXSZLs7/o4+yeWnnURkjjp+6dns9rynf9RjCEA==
X-Received: by 2002:a02:84cd:: with SMTP id f71mr13473908jai.210.1643714107417; 
 Tue, 01 Feb 2022 03:15:07 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/22] bsd-user: Add safe system call macros
Date: Tue,  1 Feb 2022 04:14:52 -0700
Message-Id: <20220201111455.52511-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Add a series of macros to create system call macros that go via the
safe_syscall path.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall_defs.h | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 62b472b990b..c3bf14f38f4 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -179,4 +179,51 @@ struct target_freebsd__wrusage {
     struct target_freebsd_rusage wru_children;
 };
 
+#define safe_syscall0(type, name) \
+type safe_##name(void) \
+{ \
+    return safe_syscall(SYS_##name); \
+}
+
+#define safe_syscall1(type, name, type1, arg1) \
+type safe_##name(type1 arg1) \
+{ \
+    return safe_syscall(SYS_##name, arg1); \
+}
+
+#define safe_syscall2(type, name, type1, arg1, type2, arg2) \
+type safe_##name(type1 arg1, type2 arg2) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2); \
+}
+
+#define safe_syscall3(type, name, type1, arg1, type2, arg2, type3, arg3) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3); \
+}
+
+#define safe_syscall4(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4); \
+}
+
+#define safe_syscall5(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4, type5, arg5) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
+    type5 arg5) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5); \
+}
+
+#define safe_syscall6(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4, type5, arg5, type6, arg6) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
+    type5 arg5, type6 arg6) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5, arg6); \
+}
+
 #endif /* ! _SYSCALL_DEFS_H_ */
-- 
2.33.1


