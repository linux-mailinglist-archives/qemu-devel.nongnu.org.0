Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0D67C9CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Ll-0004QV-12; Thu, 26 Jan 2023 06:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0002s5-44
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LR-000494-Bd
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so968989wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1cv6Xx0tI+H6ZDHRYn5oqSD+jjjKPrUYP+aF8H3yMc=;
 b=wIcmHb/Pre2fZMYCVpl/97m6Mggm6kW7K9oiIfpicaTkETSbelDAheetXSos7LU7Oe
 klYzsm0QGQxZogT33x6pCMBuh1MXWvlFjIklEycQDuWZAo8zDKXSFLBaCe30r5Hp5pwb
 z3lWhwwYWcmtbSc4xloNeLROmKJm77v5TH0o3VVlvPpcmV5whIyU7ategceWF1snmly+
 n5bpfOJEPliL4GAYWZBBjkrqwpRQy9gun/9MPmTOThjt5Dx26HgVc9UJ/j5gdIK+xOCB
 gJd5t7vrMyu9Elprm2Di3QvmXcetKMIRPhW5VtcNj9S+aA6TqrOjf4p7WHtlw0imMwPo
 MjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1cv6Xx0tI+H6ZDHRYn5oqSD+jjjKPrUYP+aF8H3yMc=;
 b=gA4wqEzHLHNNVXj45lPQ/BdTN9io12uh/ozELOo4gSyo290w6YULBBZP9BmTT/M4cL
 2HQJF7BATgeOaNJB0aw7keNmiTOLdckNBHLGX2DnvUgWrY6R4TuZXpci8IgZGEDqJNV8
 Tvgi436KM6/VeecpfZWAIGvNKhpi8FU+tDq4hwhUaVcFL6Ctg54K5A45NGchV8Yp8Nrk
 GZXFiOBF3/GKyIGCYHRKSMtV+kGEW2HcfP5VvHTVOhgeYkIsPYYUEbruaDexFNShBayQ
 YHoyQgH40+LLZgnSwLpbV7LwaEnB2VVgyMQgo2SfEds4IcpjUUfmwRAhE79QpMLjBoq+
 dfCQ==
X-Gm-Message-State: AO0yUKW9CrhViNQ8LeYZeIId1rapud6+l2InKUD+kLjzjdQ6R/zcSfV8
 3Jad2vxU0wbwat5kVWYBOCT1+Tgi858tY7sF
X-Google-Smtp-Source: AK7set8IBxqDsD+/mywBq80GA26g8ekEtLLQaNHP7XI/Adp+Lg9mC0MCP8Lz2RpB1WofLeoqYW7/UQ==
X-Received: by 2002:adf:dec9:0:b0:2bf:b199:c7ef with SMTP id
 i9-20020adfdec9000000b002bfb199c7efmr8555545wrn.12.1674732183876; 
 Thu, 26 Jan 2023 03:23:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe4ce000000b002bfafadb22asm1147046wrm.87.2023.01.26.03.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2F7A1FFBA;
 Thu, 26 Jan 2023 11:22:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 24/35] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Thu, 26 Jan 2023 11:22:39 +0000
Message-Id: <20230126112250.2584701-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Windows open(2) implementation opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. QEMU already
knows about that flag in osdep and it is defined to 0 on non-Windows,
so we can just add it to the host_flags for better compatibility.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-25-alex.bennee@linaro.org>

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index ba28194b59..e89992cf90 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
 {
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
     char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;
 
     ret = validate_lock_user_string(&p, cs, fname, fname_len);
     if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
     } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
     } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
     }
     if (gdb_flags & GDB_O_CREAT) {
         host_flags |= O_CREAT;
-- 
2.34.1


