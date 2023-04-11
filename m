Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3326DE206
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW3-0003sH-Ty; Tue, 11 Apr 2023 13:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVo-0003ps-TC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:33 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVm-00067z-Kr
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:32 -0400
Received: by mail-il1-x133.google.com with SMTP id t5so16356144ilu.5
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWf8Mdc3sABcKlVmtCGZhLXeGei83PoA0g+BtXKSJpY=;
 b=rrtvlqSRVA6eZFL/+s46HqIfpEiTMs6vbmcTkJTiJhMUVp+y1DKb9E7qfbVPYBzoTh
 a1eHUMizmLLwSsGdWCtaMyHv8B2lfZZcc6FOGmYQ8hCSi7v350mQuH2DtEeM7LQCfol3
 UI8KoBU3noX5fa7HCPdfhTQWCbHBV1vniqqBEW6bBVwEk2KXPa7JgjI9sQ/usOK7RTYh
 Lgl9CYguq/D4owJulGOV55hOMrliK0CE8JD5AmrsNWAILP87G7pnmClaGVi/FpLV5rg4
 KGVIZwszNYySv91MAPWb42DxQc9x79mVf7VZ6DwNwfPylHJ5lbDs+bDZ6TS1vEbufleU
 naFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWf8Mdc3sABcKlVmtCGZhLXeGei83PoA0g+BtXKSJpY=;
 b=xEObS/k/Vh8oKBtjli0SnYvZWevLUsW6J6sVLQj2/W86jmMvpFSCMpU2JLAYxZK4Kn
 es+Q0Ervbm2YbPdG1utb492EiUHTOPWlHbyGfRyUqw367L8ThDab4BqEfwg97qh/xWRd
 qkXLFUGyDygI2fYM+5uxZPvsMkppAqpfTHonjjnlHhuVvrl0wCneD7D2MZ/BNirGLLHb
 k2y6xspjmuBRp1+QfDDbBK2brjF5scglzZKN1sEkHJfII2qbEs9hh0f8EideiX128DOM
 /9VznQKZVsaV5SW9Uq7oGBO8ycpqlQEFPFpYyRXxjdQ5mJl5oLG0Bs02UCHVlqXfStGV
 P72w==
X-Gm-Message-State: AAQBX9dfWipn+hH9I99EkOzzjAbp00rJaQq95UOEPp/ogsb/KKhTSa8r
 wLXHDhqjObSblRPeHW+H2bW8By/nmhW7xSWJD2w=
X-Google-Smtp-Source: AKy350ZpAsbsLu7BE+T8LpFhxI6lhz786aeHKsLFzXrF/6Aj57nbsG9rlJhIfoq7VDiO1TaT4rCvoA==
X-Received: by 2002:a92:b05:0:b0:325:bab7:cb17 with SMTP id
 b5-20020a920b05000000b00325bab7cb17mr2149088ilf.24.1681233027557; 
 Tue, 11 Apr 2023 10:10:27 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:26 -0700 (PDT)
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
Subject: [PATCH v3 05/20] bsd-user: Remove NetBSD specific syscall printing
Date: Tue, 11 Apr 2023 11:09:40 -0600
Message-Id: <20230411170955.17358-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
moved to netbsd/os-syscall.c, but those aren't ready for upstreaming.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  5 -----
 bsd-user/strace.c | 17 -----------------
 2 files changed, 22 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c5240938da7..cee02d2a0ea 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_netbsd_syscall(int num,
-                     abi_long arg1, abi_long arg2, abi_long arg3,
-                     abi_long arg4, abi_long arg5, abi_long arg6);
-void print_netbsd_syscall_ret(int num, abi_long ret);
 void
 print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 7d0117fd3cf..8e76caa3c3f 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -146,9 +146,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
  * An array of all of the syscalls we know about
  */
 
-static const struct syscallname netbsd_scnames[] = {
-#include "netbsd/strace.list"
-};
 static const struct syscallname openbsd_scnames[] = {
 #include "openbsd/strace.list"
 };
@@ -209,20 +206,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
 /*
  * The public interface to this module.
  */
-void print_netbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, netbsd_scnames, ARRAY_SIZE(netbsd_scnames),
-                  arg1, arg2, arg3, arg4, arg5, arg6);
-}
-
-void print_netbsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, netbsd_scnames, ARRAY_SIZE(netbsd_scnames));
-}
-
 void print_openbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
         abi_long arg4, abi_long arg5, abi_long arg6)
 {
-- 
2.40.0


