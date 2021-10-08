Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768D42741C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:20:39 +0200 (CEST)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzAM-0008RH-7B
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5M-00004r-Ei
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:28 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5K-0006jP-Q8
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:28 -0400
Received: by mail-io1-xd2e.google.com with SMTP id i189so4699644ioa.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSuGwz93zTnJPuHkeKfY3uCmx4ow+sgYGpnTK4hqzWc=;
 b=uH5RmUPm7FgLWZfCSymdX07jjMKjXXqioft9yX3VkDHa8hvdYvVgO/+5skSJHFTygZ
 +r/LWaVaHktM4vLFi+Bxcjg3tqndbQIweNrL6KAQU8kSCEMaI1lvEmi3SBCogVOPuqV3
 LYRfFwdN54I1xTu4mur+CMwgztAVJhHCeUTVhxlNAAHbQqvC7Jb5cnyj1ch99if+Nvnb
 Qfmd+/9QcP8Rwp+bK6ldtqZ4kTUyWEslbXCGgdPDOwlkag8GupaTsus4XYGO6VwhLCPL
 H9nEX7RBPj19Lp6ARm6hCNeBPPJD+yNNtUPv0dqK7LX9mg4CzFbm5vpV+AVOalTJnHwt
 K3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSuGwz93zTnJPuHkeKfY3uCmx4ow+sgYGpnTK4hqzWc=;
 b=ZS33PJTC32Cw1oNzFsN0u9s3aMxJUZ0iTcd4JKPTFIy11fj+60oeY14x7GTeaL2PGp
 zPyd4p7QxBDMeSidOtysK46QFjbApOmE4U46dlsGHHU9EJDOWyWXPH/H54ear4Dxdd3u
 12ibichCkd0wdrdwhtNtAOikiJNaV620hUvDlFNxvuOKeN3SvF3SHFAKxRG1C/RXFOR5
 Jo8Tr+jaiDg8xe0S5v4O9n8wDqVGL1E9W4xhG12R8azuRoForVhGHwnUbaOrhc9vnlw5
 QRNTOrPNDpiqBL12FY0Oo2W+M00P7G+sRi+ljTvgo4UQS9oYnq0qB4wkubh7wPEW71An
 NZrw==
X-Gm-Message-State: AOAM530jbYCtwwGBt+DxmbI7y9v9SrqtBbK0emp+Ccp4Vkg9qnoXhlFw
 +M4aRxSvh7QiQRoyrAL9jtPK2M7fpI1mXA==
X-Google-Smtp-Source: ABdhPJwcv3c6utH5KWheqfUt3Etop/1MmYUq6/pBTcYNJKGL6/4JQvgqRwvkY8/Aosf9mdADDo/ccw==
X-Received: by 2002:a6b:cd87:: with SMTP id d129mr9096114iog.28.1633734925347; 
 Fri, 08 Oct 2021 16:15:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] bsd-user/errno_defs.h: Add internal error numbers
Date: Fri,  8 Oct 2021 17:14:57 -0600
Message-Id: <20211008231506.17471-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
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
Cc: Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stacey Son <sson@FreeBSD.org>

To emulate signals and interrupted system calls, we need to have the
same mechanisms we have in the kernel, including these errno values.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 1efa502a12..b538dd93da 100644
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
@@ -147,3 +147,11 @@
 #define TARGET_EIDRM            89              /* Identifier removed */
 #define TARGET_ENOMSG           90              /* No message of desired type */
 #define TARGET_ELAST            90              /* Must be equal largest errno */
+
+/* Internal errors: */
+#define TARGET_EJUSTRETURN      254             /* Just return without
+                                                   modifing regs */
+#define TARGET_ERESTART         255             /* Restart syscall */
+#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+
+#endif /* !  _ERRNO_DEFS_H_ */
-- 
2.32.0


