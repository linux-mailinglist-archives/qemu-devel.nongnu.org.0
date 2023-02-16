Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85169A26B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlP-00006h-85; Thu, 16 Feb 2023 18:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlN-00005s-Pg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:05 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlL-0008Qw-Fa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:05 -0500
Received: by mail-il1-x12d.google.com with SMTP id g14so1412724ild.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhVzycqE0CnkRK/EllKXUUS5z7C/peztHUJhIU/Hd5o=;
 b=TyOZIoQ2Be03RZeOpwiC72Vso0MZ85tBYyYbewXtKz0yk+4UX4RhCU/YY2McmVlMNX
 hR7SqcrD8lI9ZujLiUJyrvxUHxM91gULiJcM6cHgbKCN3o7btaAcp+HSwoZAdHvlTutd
 1SrZaISyI0ZwxRy5f51/vHREUEjaVjWyiRgvEz5rvnvx4G0FCxFlKOCNkxnjskuusqDx
 50MksYSDquUVnP6YPJYLrQBRVfLS8f8ZUiHHK4twX6StTysZOZWCnEK9+eZAM75YypY8
 655q9yaajhPwFLVkQU1RBdiBAg+MJD3Kx1fmZYDAPplxI8FxPcvsl7rIZ/++p7u1lnZU
 Rhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhVzycqE0CnkRK/EllKXUUS5z7C/peztHUJhIU/Hd5o=;
 b=Ic2d3X0DotGIDGtZ+gA7TYt2/qA6aEuMNX/0Z5i6JYTMt4hZZJbZoo/W8+FohNPoo5
 QLrz9g26He4RtMrOyahMGUJPWagwUBlfL+6XJvLlc8UIKCck+eMEdYuvDBnM4QAZDi6Y
 z+DMBLb92ErQ8LVqZ48UmVqb4ZrkdXDru7dgMKgaLw7EJd9BKz9SvaqxAqi4QIEUiMp0
 SvVWYw7E/XUl8v1/83cH5VDVRrzLQ5Yk22yxtZ4aUDIg5ZT/b4AHFL4XwVHWc344QZp8
 qEe+OaY6pWl8sx7SToPBATs30OHPw/7wbFKb+3ZTiNTjAFQT4/N1HbJPvFj5cxBHVCC0
 VsaQ==
X-Gm-Message-State: AO0yUKUiOLpurzgg09eXoLjscTtfwjGvR7xKWH4cHWzIwCmHbWSJv5C2
 kuU5/zNwYVH1yg2Yud+bB4E+TWiAI7FAQoU9
X-Google-Smtp-Source: AK7set8r4KOVpwfVLZgDbZfEDee+iOP/zcw+jEthp5xqTxbujf6PPFHAWNjRJ629LmLyKoaV/REzQw==
X-Received: by 2002:a05:6e02:1525:b0:315:851c:279 with SMTP id
 i5-20020a056e02152500b00315851c0279mr3095212ilu.1.1676590441833; 
 Thu, 16 Feb 2023 15:34:01 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH v3 07/11] bsd-user: sysctl helper funtions: sysctl_name2oid
 and sysctl_oidfmt
Date: Thu, 16 Feb 2023 16:33:49 -0700
Message-Id: <20230216233353.13944-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 77c2b157c61..dee8c92309b 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -231,6 +231,24 @@ static void G_GNUC_UNUSED h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t
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


