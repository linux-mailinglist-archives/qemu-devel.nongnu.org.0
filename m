Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09735414190
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:18:01 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvZw-0004Hu-1l
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWq-0001JE-CW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:48 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWo-0007UD-SI
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:48 -0400
Received: by mail-io1-xd2b.google.com with SMTP id n71so2056347iod.0
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BV9QoUo+n57AQjEYGXu9vkmc6azqGybk3j9BhDuzsdQ=;
 b=T1ehAf+3/evmWRqM3hwWgif7dpbEDslpmnuOTqd3Bm9jIYZ+ULqsnPHQIWSJVVAQ5j
 d5ViJ8V7IXitITMp8KSvvOhzT3vYHJYGFKAzJmmjm3s//0TFdeLVAASVT+oUlVbsZKRs
 yk8JS2O65OFOr7GJgP0JyhwXd26NDxvQtXTrKgYZGguCvusGHCVQ5rhl2TBaMFSBpLGU
 ckILLXI7beBAYKkqvHPr1Lp3cao4GfP98f3hHEcrXLmqZq0iDUzNX/lAGCWjyXsT8oLm
 AmGPqHLZDUhmxPjzj9LyjxO7hO5Y1Q949+enryQlOnVkn0HIBek3n1vBMkVVy1ShI6AZ
 ZtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BV9QoUo+n57AQjEYGXu9vkmc6azqGybk3j9BhDuzsdQ=;
 b=bi+yw74e1qRk0lCy4iaFX+q+naJciGYPVm5IcmZMyRKYCvvqkHRtJGEnPkrMLtTSLw
 hHJASIEmqbDzszZSZGsBJx11A/TMOycrPUvn10UGLd27eUVvedTVB25nJcJSmEXNDt3R
 P7ugk6CZ0lK0RuxDNBYein4dh4ndot+3wkaYAZi4Wc1H4Wb/vuNxpPj4UfHg5kSVd3KY
 LnwHi25rYeTzNFw53qn9Xu1lSHvJYIBDSCWHZNj9XAEnKApY+gsL7kx4CSP6iMGTHQhU
 cqcHo090xOR8Kmq7QMCGhB/5c5rSpoxK4JFzWa7/3strNAjOWwPFEIw8NUn6SsU3V6am
 g6IQ==
X-Gm-Message-State: AOAM5301iEouznsLeNVnekhqxwCX+Jz/WRv6sptd74VY1A7HNShkoM1U
 F3zW05Kjqivrzyse5QoKA+gkxyFnawDEVunY/wc=
X-Google-Smtp-Source: ABdhPJwZJfEIAUjiyHoKUal0RWZ1Ylxg+WKTSNchShls2AeHWTkq4hAr33M3MuxDyh++XhB/2XmEGA==
X-Received: by 2002:a5e:a60e:: with SMTP id q14mr2976710ioi.55.1632291285646; 
 Tue, 21 Sep 2021 23:14:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] bsd-user/errno_defs.h: Add internal error numbers
Date: Wed, 22 Sep 2021 00:14:29 -0600
Message-Id: <20210922061438.27645-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stacey Son <sson@FreeBSD.org>

To emulate signals and interrupted system calls, we need to have the
same mechanisms we have in the kernel, including these errno values.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


