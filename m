Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D418F6A7366
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7g-0005U7-IF; Wed, 01 Mar 2023 13:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7e-0005SK-Ex
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:14 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7c-0006ns-SQ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:14 -0500
Received: by mail-io1-xd2e.google.com with SMTP id y140so5745692iof.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxoN5n4N6BYnJr2Y6dOT8glUld4sqkDOsis39Qr8eQk=;
 b=1dHAgrzMGWyS6kF1nnIW9sTYbdsVnu4uUGZhl1p8t8Fh8oV78qk41eUe4Mj6C53MPA
 E+HEKNq7x8NPawGUfqXaiMFMys11EHxRUrWVa9I4PCfabW3rghZ3wcAJ5vdEx+vQNyfG
 aJYUaHpEIkgkaTsZCZisg9AMXYM1I079NMdBA6N58fJqKR6YO8O624fqpu0Z3OzKnygG
 v4701ebawGtHXZCqWzQsaLqeozd5PoWP2E25NaEbpcouslgX5HloYyhV9B+S2f8q3kGG
 YMahN8BVZ9Q3WOEaVrXPxbScIl4tmrd/muFei6FNBHJCXrQraP3UQEz/J5rvdWMyB+hK
 tt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxoN5n4N6BYnJr2Y6dOT8glUld4sqkDOsis39Qr8eQk=;
 b=znF3ufJJz5z6N1XNoUBRDoUhPM0BQ+VDMcBtTlxYudso0dCTMs2ifgqONbx3/2TfYo
 nKedS99hR5OO2spAs+emGuCTX1HdAaweFdpkuxizEzSzadsll4L3x1ODV/EQR87JjIjk
 aNtSz366MGAf5L6K0oTzS18JjfashkKTwy4NyAAOPqTOwZNNAgVwxTuUh63pWmEL2Krl
 BQoFQo8/Kup2k2B9+Qc/cbaw1JXzWFfCnMwohyHXW6ria91pYNnKfZDO7LXG7uylHjUH
 Xuq5gYXdh4qT7TcS90bLM/TwACKNx68HDPQw72xLnxle8fALgPISD+VxnXFmbHz7Ev3p
 o91w==
X-Gm-Message-State: AO0yUKXcLXdpdq1yKInK3bYo+PFPm/uYpTw0owTRcHHOUv/ubHUuRNV8
 lAjT7VcsreGG2C5JSDKEUUEXIAq0uYe84csw
X-Google-Smtp-Source: AK7set+vv0PtGi5diedFrG7OqojgOUzZBPq2hRyd0sRwFOrAIJ2SO5JZ4xGM2Gsl1RB4ni4SXnwQrQ==
X-Received: by 2002:a6b:7c4c:0:b0:74c:8cec:548e with SMTP id
 b12-20020a6b7c4c000000b0074c8cec548emr4630005ioq.4.1677695051752; 
 Wed, 01 Mar 2023 10:24:11 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:11 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PULL 06/10] bsd-user: sysctl helper funtions: sysctl_name2oid and
 sysctl_oidfmt
Date: Wed,  1 Mar 2023 11:23:49 -0700
Message-Id: <20230301182353.21559-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
index 2e0a6c058d6..8bd1db69410 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -230,6 +230,24 @@ static void G_GNUC_UNUSED h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t
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


