Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3E4323C8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:24:37 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVRE-0003Ji-GR
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV93-0007kM-A4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:50 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:38473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8o-00082B-Ar
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: by mail-il1-x135.google.com with SMTP id h27so9682965ila.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBuwZiJ9BJDMY4BHAGpRW/Ll8SJFKvYBNDg389aCn34=;
 b=gFom44plfZkb4e+zWJBEB7EpZWKrpc/DGebOR7uH70gVPyNdylC0jQh1z/dohz84ZO
 ozQUwMVTy5ipuCGFQn9A0D3gF7A+mgOKWSxURRTvXBXPa4frBTJ68/1pnflAIt2jlQzM
 UFTIIst5k/pFBgBzyWtVtrcXGEjBB+8HYuQDIjwuSW69YN3exHr8WnPeGsjxASibiPBT
 mHPCoTLuId2Y5dDUv2lUHmCLDdodpSfUEI8qG6MDYFcrqmzwvt0Hi1qrjSEnZgDpKqTD
 7SVL9CYTdLBzuXTTKpOzLtn9y6ygX0MxJdbFzXI/5Dc7Okt8wOa5Xvtbno77kv7RqVHk
 7SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBuwZiJ9BJDMY4BHAGpRW/Ll8SJFKvYBNDg389aCn34=;
 b=wZlZJfFefuYQQJ1yHxZv9cAfsxdZQIabf/yU+yPcGCUPpiVcM8AN/tWiiGYpfZIAu0
 +Miwb6m/cDX9fcONV+kYtzpKLCgg86a2LrfgEpDkIJPYiVFbU40zY4Y4algcSd7JPot8
 Fb/qeOD6yNhRE+JiMUuleRb6m9+sqbaGs+6q3hg0XEiXTBkL+Znn+Csnss/1R8Blvyhf
 t9xUq/G9t8FxKpzB8OzQ36CAwSx7k9/M8TH6ftP6qT+DgDfoVXyxbNktZlu3iASmCQvp
 UvyXofGuhhZEpBElL3XeyGJv2jXhToMeMaIQl7oV+TGiF4XAsEflfIifioWoIgtWlJmm
 p2Qw==
X-Gm-Message-State: AOAM533oHSoX0X+3F2+p8/k/0EatyoSrE2bD49wTj6vYbuoaMttsf5MZ
 5BwBKHdCdA5JGXdsV3VMibj7CwHLMR7eTQ==
X-Google-Smtp-Source: ABdhPJxYBtCPZCrCpfxsh7LBNt3XhRBDL4m6dQZ+av5YEIjHEPnJ8IZSPsV5WYbUc7ixTtQeM2Y6Fw==
X-Received: by 2002:a92:c563:: with SMTP id b3mr14973064ilj.227.1634573129422; 
 Mon, 18 Oct 2021 09:05:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] bsd-user/errno_defs.h: Add internal error numbers
Date: Mon, 18 Oct 2021 10:04:50 -0600
Message-Id: <20211018160458.1976-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stacey Son <sson@FreeBSD.org>

To emulate signals and interrupted system calls, we need to have the
same mechanisms we have in the kernel, including these errno values.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/errno_defs.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 1efa502a12..832671354f 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -1,6 +1,3 @@
-/*      $OpenBSD: errno.h,v 1.20 2007/09/03 14:37:52 millert Exp $      */
-/*      $NetBSD: errno.h,v 1.10 1996/01/20 01:33:53 jtc Exp $   */
-
 /*
  * Copyright (c) 1982, 1986, 1989, 1993
  *      The Regents of the University of California.  All rights reserved.
@@ -37,6 +34,9 @@
  *      @(#)errno.h     8.5 (Berkeley) 1/21/94
  */
 
+#ifndef _ERRNO_DEFS_H_
+#define _ERRNO_DEFS_H_
+
 #define TARGET_EPERM            1               /* Operation not permitted */
 #define TARGET_ENOENT           2               /* No such file or directory */
 #define TARGET_ESRCH            3               /* No such process */
@@ -147,3 +147,10 @@
 #define TARGET_EIDRM            89              /* Identifier removed */
 #define TARGET_ENOMSG           90              /* No message of desired type */
 #define TARGET_ELAST            90              /* Must be equal largest errno */
+
+/* Internal errors: */
+#define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
+#define TARGET_ERESTART         255             /* Restart syscall */
+#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+
+#endif /* !  _ERRNO_DEFS_H_ */
-- 
2.32.0


