Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF5433CB4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:48:38 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsI0-00038x-WD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEi-0008Kt-N5
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:12 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEe-0000BX-Tg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:12 -0400
Received: by mail-io1-xd2f.google.com with SMTP id n7so21192981iod.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0UUskACfV2zCuBONtYOvwkg8JEg6xz8QNgav6wf0dw=;
 b=pjl7hvfSTkv+8GXaH66+yD6m0n8QUBIJTiOBJORyk1Gf0UpDkF6s5nxPjp9TvOn3gx
 MxYNjurTEe+WxiHuNLTkiW9MAAhNlYL+XG6OeZegQdFYoBwPUjQzDOvc+CCiveB3FO00
 w0Ni+Nyi8IwJU3ibRNuxp+2Zk/3D29FIdmDhMuSBdDTfkPaQ4/mbvyrjhaA1JVaPN2Mi
 whvLcYb+gBRJNSgudNuFK0QrGWT69mbsgwHCBULrdAaifSy6J5rcvUbncuynKfvu+oGY
 z4U0zQ4HA5P/Te/EH3Hoh5aZVYc62E0z9NRDwlvEBH8VVJzvWgWNE8g95W+ujzPqwg7x
 r27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0UUskACfV2zCuBONtYOvwkg8JEg6xz8QNgav6wf0dw=;
 b=k/YIWwBpacUaVs8GWdpAkQB7eAxh9GS2lmUTw4oN1ndIErlgZDFF+7u1JJh5lr5EQn
 SjcRhsrg7U+5+jav2nJHB+eBOQHbKLnFF6CETaoxNwawi9WMFsw47/1CEJKnd+DGhwph
 EZKGdwlBIedPtHxQfNT5oVptVqkNE7EDPwwwYxCUwsQyijw4DjUkeQ5zYThIZUS4/+Tc
 KOqv8T77ScRzvJUFhtUF+DhtRfcxHDwTX3oE8FEnwgrQUZsZwEZxRXXu3XUEEU7Cn3S9
 fTSfvpnhKkIyHRQUPjb9yy/Zs6rqblOXM1kBxnZ9uRqt6YZ11/8imyfAGzUqBr21/eya
 GyLg==
X-Gm-Message-State: AOAM532O0eV1A/AG6F+CzO2Dz3kjwLs4TAiVqEHG/tAPbcr1F3E3d9b5
 dglztw3lOL0/wZ3gAmB7PJTzcBJug3hBRQ==
X-Google-Smtp-Source: ABdhPJxiaPB2ipe9zaj3AnJTZEEqgn01+1unrEyCAIfW141UjqXUCZNEhfQADCfBqgWAD5PjAdVAzg==
X-Received: by 2002:a05:6602:1514:: with SMTP id
 g20mr20084425iow.9.1634661906534; 
 Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/24] bsd-user/arm/target_syscall.h: Add copyright and update
 name
Date: Tue, 19 Oct 2021 10:44:25 -0600
Message-Id: <20211019164447.16359-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred name for the 32-bit arm is now armv7. Update the name to
reflect that. In addition, add Stacey's copyright to this file and
update the include guards to the new convention.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_syscall.h | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
index ef4b37f017..a5f2bb4e01 100644
--- a/bsd-user/arm/target_syscall.h
+++ b/bsd-user/arm/target_syscall.h
@@ -1,5 +1,24 @@
-#ifndef BSD_USER_ARCH_SYSCALL_H_
-#define BSD_USER_ARCH_SYSCALL_H_
+/*
+ *  arm cpu system call stubs
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_SYSCALL_H_
+#define _TARGET_ARCH_SYSCALL_H_
 
 struct target_pt_regs {
     abi_long uregs[17];
@@ -31,6 +50,6 @@ struct target_pt_regs {
 #define TARGET_FREEBSD_ARM_GET_TP       3
 
 #define TARGET_HW_MACHINE       "arm"
-#define TARGET_HW_MACHINE_ARCH  "armv6"
+#define TARGET_HW_MACHINE_ARCH  "armv7"
 
-#endif /* !BSD_USER_ARCH_SYSCALL_H_ */
+#endif /* !_TARGET_ARCH_SYSCALL_H_ */
-- 
2.32.0


