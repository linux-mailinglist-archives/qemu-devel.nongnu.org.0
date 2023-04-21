Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951546EAF64
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqd-0004xc-Br; Fri, 21 Apr 2023 12:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqa-0004xH-T4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:42:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqZ-00036J-9Z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:42:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f18123d9f6so13869055e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095373; x=1684687373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp4j69SMZPwsWvT5LUaznCtmcmVnsoJ2lq/e90PdDrU=;
 b=X1YeQAOGbh27CHtKhvZYqR6AoYqysj1BSxHwQcMXaXCsexcGzHOElH/XZ/DAOG2V+p
 UfSoPa74+5EcEScFxxQP0G36expmA40H5nXOrUaLm6I0zGZMo6fUG2teokfz4BdQHmOx
 cWrRrbq77AX30IGPrNf7NySV/xwfCWRnFkvCsGkQffiK7eTj2jE2ymQtEZfLdroYRAV/
 4abOIg+sADfk2jm7qAXjNMnIvmIr/U5cU7xAh4piZ3URIaNhRRRQgth/wq43bfvnsUss
 MvungWs14jbYkOo3zkALHsOP5U3FR2N6qns6PyD49Z3/U+3mHQ5/sPnBIFx0xpSawW/G
 L7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095373; x=1684687373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp4j69SMZPwsWvT5LUaznCtmcmVnsoJ2lq/e90PdDrU=;
 b=iVPkKB+p8PtNIT62AlbvP0m6ADkjtuSqFhqiXaIag02MQ+WYVgIM4GsoJCtKw+mxE+
 YHZdmOuzEA2HClEjYDVBiklm4qQ6KYEh8F78dlHDY8nvh7qTYYsalrv2f99ASb3ji3M0
 LkUkvgW3zumkuY+0bAWsD6VHsyn/q1GiZQtC7Km1+8XbKoX2tnJBa4+H1Gnyjvi0cs4P
 nDBW91vQDLOkl+MpY/rvOPA3NK3uclCotqHFyPoZU1DVqwkr9n13znMIKbn0k1gb/T+Y
 hfWzA1wkX1EHCaG4K1y65T3HjLyIpDOyAlkin+qzhy+mHTeguewqkH/ELs3p705goR5t
 Z89Q==
X-Gm-Message-State: AAQBX9dtJXMO/osxilfdMRR/29O8b3PW6106OD7gi/WZgy49ypsgz5d4
 UMUMQ6/t02Nnle+seEXKaWnux7BAqFU=
X-Google-Smtp-Source: AKy350Zts3U7tNk7Rv4ocHVySqegiiwC/W1KfLYWoLBmHC9w2Ipk3WnTRn85LpYR2iCfdxO+qdSkng==
X-Received: by 2002:a1c:7211:0:b0:3f1:82d8:8fde with SMTP id
 n17-20020a1c7211000000b003f182d88fdemr2236708wmc.24.1682095373308; 
 Fri, 21 Apr 2023 09:42:53 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:42:52 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:50 +0200
Message-Id: <20230421164200.2913-2-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

Intialize guest_base in bsd-user/main.c.

Allow guest_base to be initialized on 64-bit hosts, the initial value is used by g2h_untagged function defined in include/exec/cpu_ldst.h

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/main.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index babc3b009b..afdc1b5f3c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,8 +50,22 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-uintptr_t guest_base;
+
+/*
+ * Going hand in hand with the va space needed (see below), we need
+ * to find a host address to map the guest to. Assume that qemu
+ * itself doesn't need memory above 32GB (or that we don't collide
+ * with anything interesting). This is selected rather arbitrarily,
+ * but seems to produce good results in tests to date.
+ */
+# if HOST_LONG_BITS >= 64
+uintptr_t guest_base = 0x800000000ul;    /* at 32GB */
+bool have_guest_base = true;
+#else
+uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole */
 bool have_guest_base;
+#endif
+
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
-- 
2.40.0


