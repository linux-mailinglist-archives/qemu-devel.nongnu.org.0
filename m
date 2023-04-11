Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB56DE1FD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW9-0003u2-GT; Tue, 11 Apr 2023 13:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVs-0003qX-6B
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:37 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVm-000689-MW
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:33 -0400
Received: by mail-il1-x12c.google.com with SMTP id a4so4311751ilj.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrJ6hQ7Rt3y9iXgYz6Hn19qcli8MJnG4NqFH7qfo5u0=;
 b=iykA1KYxTfgjwewZvl0P3FRWH8diAiK/hcmhWdzCz5Rh+i+1R3Kg2kjV7ynxDFI41t
 dqZCY9rj8VeoilLTxczDZTRUH5h5gA136lsfZAaQu23bfRFHfYoLwk1rBdIEg8VoQw1F
 UPMgrJsPg2f3WqzEQ9PMccOTogqQZjxzcmaVRcjRaolNWRxB7hqf4nngrnoBQc30T05M
 0Svcot8U+3hCgrFhEcTGUM1KTXFuP00DSKl8csH2AYLQagGY1At0DV04Chw2LqqwfI87
 C4s1CAU437Tp15Sudg7kSbFI3ahwyJgsmhNv5K6+J2zMoH+lxj9eO4tEY+hxk56HMK6a
 /R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrJ6hQ7Rt3y9iXgYz6Hn19qcli8MJnG4NqFH7qfo5u0=;
 b=Kxg3GvyqlmkOGjUS2vmfb5KUv7j1X/XJIYwK4zXWkacipLXwM/yfA8VbEWKdI6rN3N
 d/NirI7qT/ynHUhBqTVg2pLMAj+3m58fkdybXFGXTGJsAEuz5UUmnaDg0GBgMT9O3Ed/
 gtWdtsbuSYeAz+tX1/xa9m3676/g6oglWQnyXM2uop7tGgnVB6yGQ669gwJMF71kRrUB
 IeO6824ezEfB1VLAgauw00iQ/NFRtDo3i0h6Gl44chZ77xNsM986fv9Larp8TAKVVPGZ
 uS69TYt2QPjrf1YWktZ8I2N2S1R38vlsEP+IQ41KhrLpvOV5M+QiLOL6Eo15xuS6DFCw
 VZaA==
X-Gm-Message-State: AAQBX9fveOyvTW04xZLkXfE0gLV2pBeUF+scLvqskJ0q6b3pS3PDVCZp
 hJMXBLJkFIdoazbvz/p5wi2xeQXqa3p09vhKgfc=
X-Google-Smtp-Source: AKy350Y6F+X8WyBACC1iMYa2bTDwFuTJLSPZncrpz9tBscyzmVT+Rj37AMLEUy6KJ9F8GVxMqF5nVQ==
X-Received: by 2002:a92:60b:0:b0:328:9a54:3bed with SMTP id
 x11-20020a92060b000000b003289a543bedmr5784535ilg.29.1681233028552; 
 Tue, 11 Apr 2023 10:10:28 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 06/20] bsd-user: Remove OpenBSD specific syscall printing
Date: Tue, 11 Apr 2023 11:09:41 -0600
Message-Id: <20230411170955.17358-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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

Nothing calls these routines now. In the bsd-user fork, though, they've
moved to openbsd/os-syscall.c, but those aren't ready for upstreaming.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  5 -----
 bsd-user/strace.c | 25 -------------------------
 2 files changed, 30 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index cee02d2a0ea..49468734d44 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_openbsd_syscall(int num,
-                      abi_long arg1, abi_long arg2, abi_long arg3,
-                      abi_long arg4, abi_long arg5, abi_long arg6);
-void print_openbsd_syscall_ret(int num, abi_long ret);
 void print_execve(const struct syscallname *name, abi_long arg1,
                   abi_long arg2, abi_long arg3, abi_long arg4,
                   abi_long arg5, abi_long arg6);
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 8e76caa3c3f..b827acb2477 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -142,14 +142,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
     }
 }
 
-/*
- * An array of all of the syscalls we know about
- */
-
-static const struct syscallname openbsd_scnames[] = {
-#include "openbsd/strace.list"
-};
-
 void print_syscall(int num, const struct syscallname *scnames,
                    unsigned int nscnames, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
@@ -203,23 +195,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
     }
 }
 
-/*
- * The public interface to this module.
- */
-void print_openbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, openbsd_scnames, ARRAY_SIZE(openbsd_scnames), arg1, arg2,
-            arg3, arg4, arg5, arg6);
-}
-
-void print_openbsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, openbsd_scnames, ARRAY_SIZE(openbsd_scnames));
-}
-
 static void
 print_signal(abi_ulong arg, int last)
 {
-- 
2.40.0


