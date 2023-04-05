Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0E6D89B2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoD-0005JR-LF; Wed, 05 Apr 2023 17:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnx-0005Hs-Gt
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:34 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnv-0005af-V8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:33 -0400
Received: by mail-il1-x12d.google.com with SMTP id n1so18792419ili.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BJY2q4N9OTbwCSs0lpKm2HeXuDh951JsDQY9hlEtgM=;
 b=nRGU74Kq2K72WplUgDfkKvK6qcCcdu0fcCpvRASMGoNz7ANU/WbY+wluJIQ705l1Aa
 S6Dq4NVioyKBA+6Bg8pv2OkRqPw8GBWE6z+ZHq3CiX0m2OtlsGKh+H8WTZShz5EDM10t
 4+1QLN+3T1XQ5tPhqL76xbsmf4oVJXKZIKzG21orAezJnT2An61GFw6k+KBBw3p9zScx
 mD18ZkmsV9yoQ0ypxTNYiEZbkFB0XulmvD6qe3bEc3JsxV1Le01PpVPAr/nLqF4SThdC
 dfwXoWIPSjdPDReuTZCa/IB38ktfM34eOUJGYHpiQAFDwKGTy3ifHT044q4wenpc/6N+
 BjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BJY2q4N9OTbwCSs0lpKm2HeXuDh951JsDQY9hlEtgM=;
 b=mmbQdbXJIcllULWdA87214ToVwgcFF0csFfR8/+KHqCa517bKH75wxw4G5sIIr+j0u
 wL5QRTvCkbIYZWdhQa1TIAhLqancHCzUgjS9d2D0cKyp3Q+bmadUHqXa1MaFkZPwhQrG
 ajWbru9G7talNS0WqsBxRYmH9bEvZpl/h6JP2ahiJnE3D1kjbshdyCrUrp+yAKWq1E4+
 UgmdOPu5HVJrrjC2wWQU5WCQ1rao29fvutUtH2sxpBneAAeyl+bPbw5P1CFiFPzU1/0y
 t6UDLrVYL2hf8jRDJQ8y6FmzLWe8xbJJD8n4E4cDMUOiShS11WetZkTgqY/2iJX5dgL/
 Sy5Q==
X-Gm-Message-State: AAQBX9dxS9zc7f191tBoqa7BAuZerq53TEaZgkETj4QgYxzQZ+TO963S
 qp7qcyTjNICZlHKgKuz8HHWs26NYAbV+eN2O/+Q=
X-Google-Smtp-Source: AKy350ZdnEvDGSzOs7CiJ1Z1UxYrXp/W9H+v2b9OZcFXtzaTK63plkfBF47xDqEoWlou8qHJL3axOg==
X-Received: by 2002:a92:cc02:0:b0:326:54d0:38b3 with SMTP id
 s2-20020a92cc02000000b0032654d038b3mr4672471ilp.16.1680730590726; 
 Wed, 05 Apr 2023 14:36:30 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 05/16] bsd-user: Remove NetBSD specific syscall printing
Date: Wed,  5 Apr 2023 15:36:01 -0600
Message-Id: <20230405213612.15942-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
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

Nothing calls these routines now. In the bsd-user fork, though, they've
moved to netbsd/os-syscall.c, but those aren't ready for upstreaming.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


