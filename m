Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BDE43275B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:14:57 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY64-0003hI-OH
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtX-0008Mc-Ee
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:01 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:43730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtV-0001rb-Ir
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:59 -0400
Received: by mail-il1-x129.google.com with SMTP id a8so15941508ilj.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBuwZiJ9BJDMY4BHAGpRW/Ll8SJFKvYBNDg389aCn34=;
 b=eoi3R+RuM77VhxdANFk7Uv7rRU6+OhXQfHo/VMLpBVJCCRuXtc9rq3Qjeo45tHp47I
 50a8hWy8eebvgVA51kmS4OiLsVbKX1wJvGva6uKOSqxCtY/em9IoQDgsP5VVvJqHkYJ+
 jnUx2g1gsvwWIgyJgwBomggGqxKxx44qyfzSkJu3CuwFxrrfMGWgPvZvXYHrEGvQT8rf
 cf9dKkZXR9URjwnmrOwIw+GW83p3/e4YmWliHwl6CcM6hZCLj7gwdyGL4X1vN7P7tHEj
 HcnsXQIJrPmjUBoRl2eZMDPVDdqy3nDKMI9jVde37V99dPR++OHIr4L0vY/QuIhr+wwJ
 2dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBuwZiJ9BJDMY4BHAGpRW/Ll8SJFKvYBNDg389aCn34=;
 b=owfduA9MjpOL3Nspd9iKSH/Eu8xXUlrD5b+ZmgmH0lpHP9lOtetdYom/1avkgsOlF2
 v47ZVrd8zhp3cZ8aJLWDmWABkZtXP+abJtkNxe6rnEcH9N9GtN/VzoHEO0y47tC7hvEQ
 0K8tuzgZMsfb4rGyVqYGS37TpzPzSbjQ5NqtFJBtRkywEOIL1+uJqpwgR6ctagHWHRbF
 cOKAuxc1WqI56WFwJACeZjvJHLg3x81fMSsQKy7P/cIKG8wNlHnanURFiQ2rDDnInkhc
 ZOyel/vIEOeFpTzyQuD7ZwX69sUFkgCeMVuqanTzPbJfg+Avl8I4LJiVs05h9S5oJ1Om
 gDQw==
X-Gm-Message-State: AOAM533ju4JufprZVfWk4QGSnDgYSEOMLskI7g2Yn2mk7ajYbp3d9+RG
 16asYxDB6BDntI7OCNOZb1LpToctY8N9Qw==
X-Google-Smtp-Source: ABdhPJwVFP+0l1r0qNje/Vv4aZQmgLh8b23Aq1v0JQixRSPkSdosceSO6PET6pieN6+mLG6TPEzXSw==
X-Received: by 2002:a92:6902:: with SMTP id e2mr8172908ilc.199.1634583716126; 
 Mon, 18 Oct 2021 12:01:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:54 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/23] bsd-user/errno_defs.h: Add internal error numbers
Date: Mon, 18 Oct 2021 13:01:07 -0600
Message-Id: <20211018190115.5365-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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


