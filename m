Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7674C77BE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:28:52 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOklP-0005Oe-Ul
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkVH-0000tA-51
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:11 -0500
Received: from [2607:f8b0:4864:20::d34] (port=42678
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV5-0006by-AK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:10 -0500
Received: by mail-io1-xd34.google.com with SMTP id r8so2089659ioj.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjqNkZos8HcanC51tcv3i0kE1ONfZDlQEksCXgwLEAI=;
 b=28UW+7ofLUKsqtYxfpUHOs7o0ChRSa8wvGh3V8AZ8Rj79GFejKwjmGElfLQvqKI77Y
 iq/5Nn5b4czBdqStomVmNSbazeJrCR8BQuQJ1hXrbq7WAg408hs/pTkS8CIEKnJQThJ4
 c8Frm9X/6/0dkg4RB4rv6UVOFR2mH8kL8xHh9XImX6qI8nV5k4d3g+3t65FIgtpg4Idr
 D6Jdgp6vKfBGN2v//ydxlL+YiTPgVsf4G1nXzLJwJEPFhBkm4Ka1sNjT2rXLpLCjCekL
 4WMey7jHxKTt+iDHJNNHpCJCDeOd0+PR/PK5kLL9XvGK//DQ6ms9tpqBCBY3voO8GOpx
 11gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjqNkZos8HcanC51tcv3i0kE1ONfZDlQEksCXgwLEAI=;
 b=8GmlmdHwCudBTWoOOKUIiCoYDX4dy0x+zHxfN9hGv3EuShAyXiloIYak4OAY0ywWVs
 jSMjCuarNFuH27h5k/Zst3XPB4PljTn5icBV3yQCsU+zlzrGfGBinflT9HhsOmPY73Xa
 XqHEFnJx9XG1MCdch/HEXOxlFe5DuKklNa4pv0i94q2ezRmYHRD2qRgxwoF0GT4gnkVz
 PzmHsD7e4qj3CWop/qHxS5NGWp0fYOmruEyySUlpThDdo54F2n4UbeTVC9pVBUPaJgLn
 Z3QbeLRY2xY2/vgXtPUqZksDiJUHSQNTWA2Bd+fra+zGV2/U3mIorB1DSOiaBQ+pLZ9p
 YtGA==
X-Gm-Message-State: AOAM532QyEcucLNKCZcZYQ1KOUR7QRcG8zYaXuhQzLeEvksQz0O7HiXn
 qMfi051WB+hSaDscH4jl2z18DG+jUgv+8w==
X-Google-Smtp-Source: ABdhPJw28kvRSo3JdB0B+ea5eNG38Fk7InzwKWhvh4BS0RwTl9O211sARbk0dS2OrVGUfyIB/jB+yA==
X-Received: by 2002:a05:6602:124a:b0:641:2c16:32de with SMTP id
 o10-20020a056602124a00b006412c1632demr16487751iou.149.1646071917959; 
 Mon, 28 Feb 2022 10:11:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:57 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] bsd-user: Add safe system call macros
Date: Mon, 28 Feb 2022 11:12:14 -0700
Message-Id: <20220228181214.2602-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

Add a series of macros to create system call macros that go via the
safe_syscall path.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


