Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB314518F46
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:46:01 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzPE-0003zU-TA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZf-0008Nc-H8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZd-0006LA-UW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2893488pjm.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oYsK2DCkJDRZ/LkA4A11UkQEUx69l+6MA6r9SJofgvk=;
 b=ECwc7EXty1GffriXrCRjGcaqGc0PJxHteRqPo1NXL8thlQWB+pNNIovhjxxq8muafV
 W1KLZ1OTvQsJJyRLOPL7vKNuYwTc17R9o5KJLzXxYXP5abAsd+SpcSMIqBoEkq2aniFC
 oU9/JP8c0J9k4nPIejuz4grtip3t2VqlGF/mSJLrj9LpbxpKXUWx9HrReKnAAvxRaVUj
 orm64Vj0Zdz+9Ht/8ZrayBklkmhvIoTgFLGZTaTrYlwQhlSlldyL/46I3JtmGREbSUGr
 DQ6qKY8DdrY+nJs0NTn0Mn6qWReFaVXeHN023qqOtdfgBgniPPHKIXgnCwJvnBGZkJy8
 miIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oYsK2DCkJDRZ/LkA4A11UkQEUx69l+6MA6r9SJofgvk=;
 b=ruShd73Nw9C8yxxYRmGw4x1TjyOmvjwqMOc3NO4Bt2smZaDFLDskBLLSYWJGiH3oGu
 vvtHUh+nMPhFylia4gGH+cmv4BJXbtziZG7e0bKsfyfF9z5DeMrRfhFgPrkGyyJDanC8
 YuZx55ZZMCSWbzRQXKbtezzb81qE8LS/LaMnWmzddiaEQfWQjx+NxNosgrNyIrxvviKA
 8gQC7mlMJ7WhVHhPNlaVmxJuwhW9Ju4DSNHxV6i+oaKVZepGbm+KHRokwnCZ61pkZYc4
 9dfoQorho94Sfy2fI3k2CJHtpGiS+McDzfmauxHfmMp2hSMJ9wW5a6bfHMjl4mlnMF0m
 uy9A==
X-Gm-Message-State: AOAM531wuVjVFpH0rT1jpu+qKFkTP92cIgeOkZbplFG8/AoiVLzWxBSy
 umod/61ABdp/II0DddeXW5BmXQeRdWRfMQ==
X-Google-Smtp-Source: ABdhPJwCcdrmfhrunRvbgGkufzRZxgB2BXdzTcsWe/VX/+BXC820diq/uNEjwlfyZi9JP7X/fOu+dA==
X-Received: by 2002:a17:902:a707:b0:15b:6ea2:8ea2 with SMTP id
 w7-20020a170902a70700b0015b6ea28ea2mr17924477plq.134.1651607560347; 
 Tue, 03 May 2022 12:52:40 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 55/74] target/mips: Add UHI errno values
Date: Tue,  3 May 2022 12:48:24 -0700
Message-Id: <20220503194843.1379101-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From the Unified Hosting Interface, MD01069 Reference Manual,
version 1.1.6, 06 July 2015.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ac12c802a3..2a039baf4c 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -74,6 +74,46 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
+enum UHIErrno {
+    UHI_EACCESS         = 13,
+    UHI_EAGAIN          = 11,
+    UHI_EBADF           = 9,
+    UHI_EBADMSG         = 77,
+    UHI_EBUSY           = 16,
+    UHI_ECONNRESET      = 104,
+    UHI_EEXIST          = 17,
+    UHI_EFBIG           = 27,
+    UHI_EINTR           = 4,
+    UHI_EINVAL          = 22,
+    UHI_EIO             = 5,
+    UHI_EISDIR          = 21,
+    UHI_ELOOP           = 92,
+    UHI_EMFILE          = 24,
+    UHI_EMLINK          = 31,
+    UHI_ENAMETOOLONG    = 91,
+    UHI_ENETDOWN        = 115,
+    UHI_ENETUNREACH     = 114,
+    UHI_ENFILE          = 23,
+    UHI_ENOBUFS         = 105,
+    UHI_ENOENT          = 2,
+    UHI_ENOMEM          = 12,
+    UHI_ENOSPC          = 28,
+    UHI_ENOSR           = 63,
+    UHI_ENOTCONN        = 128,
+    UHI_ENOTDIR         = 20,
+    UHI_ENXIO           = 6,
+    UHI_EOVERFLOW       = 139,
+    UHI_EPERM           = 1,
+    UHI_EPIPE           = 32,
+    UHI_ERANGE          = 34,
+    UHI_EROFS           = 30,
+    UHI_ESPIPE          = 29,
+    UHI_ETIMEDOUT       = 116,
+    UHI_ETXTBSY         = 26,
+    UHI_EWOULDBLOCK     = 11,
+    UHI_EXDEV           = 18,
+};
+
 static int errno_mips(int host_errno)
 {
     /* Errno values taken from asm-mips/errno.h */
-- 
2.34.1


