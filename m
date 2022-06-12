Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26F547C12
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:51:29 +0200 (CEST)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UYT-0008TB-1S
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVp-0005Ye-Bq
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:45 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVm-00006o-RP
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:45 -0400
Received: by mail-il1-x133.google.com with SMTP id u2so3041008iln.2
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TyQxWNnY+gK+Tsvhdhn4m8jGw7mYgUNvTO5dSaLKgco=;
 b=F7MDmknhoFllzKFfB3pevJdNNphb4EVZG0N+G9EHUkNU8T1BAba8eaT2NBvrKICUlZ
 QYZHMuqZrWS5XGEzwwzRuCsFVREo20UrTfOVS921AjtkADSd6xZ86jKZcM2kmCQMqjI1
 PIwff+YrhEusq1MYEGivwjY532npQSzsbw36ULYo3z1GzgbEphk/JQEUjfuNXAuB4f9E
 hc35Mri1/ETYk/nAPTbuoMy/ckKFcbrKhZXXpEmycY7gG4A3WDB8xk0KPEziAo4ZM10v
 oz1e2jFEW0sioBa8D9TKddgCs1W9I7gBIBqWelY2NDNvX6PSMCOr0/NWQtM+lugZCsuZ
 KiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyQxWNnY+gK+Tsvhdhn4m8jGw7mYgUNvTO5dSaLKgco=;
 b=RSt0SHhFPmBjfYIdhPJMSOEySZHO7E1mrI5aWxsHbBxQbp8Jf89bSi7l88B4KZWta4
 FeagB7ztMaCqmXkQ+v9phvw6m7AWr2MT9NhNAdWU3WRFaIHDpNvpTTgcRPJoW4cgs01p
 2KNEy+UyEG4LLKw6yBP1L+RLj9h3sy0EyHbZ0WB1uNUeUzHxWbIAK32piMNEopV+Iy6U
 6ABQdaMUDKEJ6SasSjmp9jyHz3vm8E1BvoOcQwaWNGgsxlvFQzdl9N5BGVshM38d/dvW
 wk5+Luy7OyJNMJfC1Qg5GKm8t0xpAhfECwV8OH3oh9lB5y6DqrHlbVL7F0gItH2J6Br4
 ZLZw==
X-Gm-Message-State: AOAM533WrYU0GGDlatGSDNOc88Ndt/UvUVltukcd2ky8inFq6IVw4ywk
 MCy22gx+sq8AcD3+xoZcow8Os5qutfUgRw==
X-Google-Smtp-Source: ABdhPJwXXOZCXeB+5inj4m3xWoHdf8dv+yKlt77RkyBQLyv+5tBOUDZLAcWZHUr/B0yDDDQTodZ7nA==
X-Received: by 2002:a05:6e02:178b:b0:2d3:b44f:333a with SMTP id
 y11-20020a056e02178b00b002d3b44f333amr29300450ilu.29.1655066921452; 
 Sun, 12 Jun 2022 13:48:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 03/11] bsd-user: Implement revoke, access,
 eaccess and faccessat
Date: Sun, 12 Jun 2022 14:48:43 -0600
Message-Id: <20220612204851.19914-4-imp@bsdimp.com>
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
 bsd-user/bsd-file.h           | 53 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 3e0f160e312..37b3efccd2c 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -262,4 +262,57 @@ static abi_long do_bsd_closefrom(abi_long arg1)
     return get_errno(0);
 }
 
+/* revoke(2) */
+static abi_long do_bsd_revoke(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(revoke(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* access(2) */
+static abi_long do_bsd_access(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(access(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* eaccess(2) */
+static abi_long do_bsd_eaccess(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(eaccess(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* faccessat(2) */
+static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(faccessat(arg1, p, arg3, arg4)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index f7d09909925..7b7af914e49 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -285,6 +285,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_closefrom(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_revoke: /* revoke(2) */
+        ret = do_bsd_revoke(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_access: /* access(2) */
+        ret = do_bsd_access(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_eaccess: /* eaccess(2) */
+        ret = do_bsd_eaccess(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_faccessat: /* faccessat(2) */
+        ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


