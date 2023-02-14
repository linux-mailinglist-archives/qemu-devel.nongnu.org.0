Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA769555A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB7-0007Qz-4q; Mon, 13 Feb 2023 19:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB5-0007QY-H4
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:11 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB3-0005zu-Q0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:11 -0500
Received: by mail-il1-x12e.google.com with SMTP id h4so2408590ile.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nlarf8gbmXe3dOGgCl6RSBM/Zj3jkzTFCbZJ2mz6zDo=;
 b=U3k0fAoe+H5DZIiNpXDZDxIfN0srPytOAJgeovUFn2wuGWroCfExWXVhSr5k8iLVMR
 ColIcgbGJUdPWY1+M2ARQUB3DFqJD+Qww94K8a6Zh/gRcE2WeHSeE683MN8fLwBZzavQ
 Vtn7x4FRD1l7+lKgXGN0NZkJ8h8EPMtJ/Rcn/dJX03L112KfbRFuIQxdl7NarBzmbWFI
 YD4r4aMX0d7TnA+OpLFv3/K7HRI4a8S8qEXxKoPAStwGWv2RL3gGqxjjL2NlmEHYP61g
 InEN+cp2/UbGRAHbDW2PuYSFnIPiNn3CzCVxeuqmzM1KgK/m5jTS+s8ZM15GIWy4UKGQ
 EhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nlarf8gbmXe3dOGgCl6RSBM/Zj3jkzTFCbZJ2mz6zDo=;
 b=WvTH9t/JWUSDCMXeezTwT91BcwUd4wDaQiM5s6xbrMjm0yNrtNcLG3taK9RlJNqXCK
 G8QGufRWrSa61RVT0hjGALeIK5UDO7rJrW6xLMJ1LxgK1cClICCX1KralnstAm+JE+Ll
 8aAJ6Ty76BnLjuso6eBGh5N5N3NydG44SspRG0Oj1k+aKl5GMxUNv1Fg3jYQVyG2l1J0
 r/KKKYXA6YjiIB10BhDTkFcqJyUhjrrwam8Z9uRbZ0WdZnNcov5JpAWDulhNiB2Yk+/I
 9+qrt4sFuziUUZ8VHClJ8ZN2rw2AN9eg+GlWnwDQJkVJCYEzUYdC749xLcN+OO3LT5bY
 /BNg==
X-Gm-Message-State: AO0yUKV/O+FXwxEGlsOLzwqlsIdpQFusB8Xle1Wz0hHwhRjokT2futYW
 8fLSMTzwvXTSf9AAu3r+oFdOr6j7izofmP+L
X-Google-Smtp-Source: AK7set/mJoxLS2Op18xFrvCON9pT+JB9HbqxJ4TqElgFL+WN9HEM87bKzFZ9xaf6ka7MmsHcEzYbFg==
X-Received: by 2002:a05:6e02:1561:b0:313:df83:3bed with SMTP id
 k1-20020a056e02156100b00313df833bedmr599080ilu.26.1676334487926; 
 Mon, 13 Feb 2023 16:28:07 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH v2 07/12] bsd-user: sysctl helper funtions: sysctl_name2oid
 and sysctl_oidfmt
Date: Mon, 13 Feb 2023 17:27:52 -0700
Message-Id: <20230214002757.99240-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Juergen Lock <nox@jelal.kn-bremen.de>

Helper functions for sysctl implementations. sysctl_name2oid and
sysctl_oidfmt convert oids between host and targets

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 457e61f5b36..084d53c16f6 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -240,6 +240,24 @@ static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t
 #endif
 }
 
+/*
+ * Convert the undocmented name2oid sysctl data for the target.
+ */
+static inline void G_GNUC_UNUSED sysctl_name2oid(uint32_t *holdp, size_t holdlen)
+{
+    size_t i, num = holdlen / sizeof(uint32_t);
+
+    for (i = 0; i < num; i++) {
+        holdp[i] = tswap32(holdp[i]);
+    }
+}
+
+static inline void G_GNUC_UNUSED sysctl_oidfmt(uint32_t *holdp)
+{
+    /* byte swap the kind */
+    holdp[0] = tswap32(holdp[0]);
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


