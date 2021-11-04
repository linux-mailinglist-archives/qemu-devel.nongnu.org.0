Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B3C44548A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:08:41 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midQ1-0001CO-17
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNe-0006OL-0W
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNa-0000wh-SE
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:13 -0400
Received: by mail-io1-xd32.google.com with SMTP id e144so7021335iof.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=iYbZOCjmBOTRuGfgtTMGw/lFkauFMLI5K9hxVRuShg+0GWVWfOTThjGc3ErYiQBkGd
 KrfreuickrMOz7O+FpyvKJRX8Q1SQ2s0Mk4JmWTSaQYgsK5CAQ+Pxy9GCLjpOnGQKEU+
 EvBF2jHpDeIuEvhwV/ITqguGog/gBspwrvgQzpwvpqMNIJELeGrn7giWnnb6pnLKlMpW
 30NCP5o7EeTkxvHizqmi0/ZBaF2lXRGxnO/fserypFc9L9HzdoJgvNwOTS51amLoMKA+
 eRRHiKT9BR1vp6vRRsPTuMKW+s3Y2JNLSHLKv5zIgfUzZP/1nEPK6fsGFs4pA4rtLxBA
 rMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=Fn2CAA+FD++Iou6A1KBAbIaYtpefv+YEhnOoKCATZCr0mVLRSxAEivKfn8vvyaco3J
 TwJbFMs9g/QxpRnew2WnJWZgK2j5SeVfphBKNtMBtkpVdTSnSSgIXx61aD+roQ/FvZhY
 mdy/leKfhUwzb1QBsc9ShLsPrapc3JcON3hf/DRlgrqbL7ZCIXw+Nwc1peo0Kw+bL13e
 IcL60r5tdSSaJ+ERazlnf9Y3whY9+dkSNFUYSVOyue85CpXf1WkS0HoiGeDhH7PYVabM
 x+QXBh+ppHxTFcCW5uktM9O353X15IycHO9GyQ/hEMI+I+9VdD+TUEL5+7YtT9wEkfZ6
 5cQw==
X-Gm-Message-State: AOAM533nI2uxlOdJsnFQ3wT3Sgassi9kgks8r85lpZBnx4QIg91WYNqj
 8vbtXQEOlyvNfK1Ug/5aIQXLc8fpSKZF7g==
X-Google-Smtp-Source: ABdhPJwkHDUTeoAPsl4X9WDCaqzyJntBiJl0Ik+bI9N9uJ9R4RIkE32rLjNqOmGXpISRHWsKUa/bJg==
X-Received: by 2002:a05:6602:2352:: with SMTP id
 r18mr399455iot.180.1636034769667; 
 Thu, 04 Nov 2021 07:06:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/29] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Thu,  4 Nov 2021 08:05:10 -0600
Message-Id: <20211104140536.42573-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Target specific TLS routines to get and set the TLS values.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
 bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c

diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
new file mode 100644
index 0000000000..93cfaea098
--- /dev/null
+++ b/bsd-user/arm/target_arch.h
@@ -0,0 +1,28 @@
+/*
+ * ARM 32-bit specific prototypes for bsd-user
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
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+#include "qemu.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
+target_ulong target_cpu_get_tls(CPUARMState *env);
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
new file mode 100644
index 0000000000..02bf9149d5
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -0,0 +1,39 @@
+/*
+ *  arm cpu related code
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
+#include "target_arch.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
+{
+    if (access_secure_reg(env)) {
+        env->cp15.tpidrurw_s = newtls;
+        env->cp15.tpidruro_s = newtls;
+        return;
+    }
+
+    env->cp15.tpidr_el[0] = newtls;
+    env->cp15.tpidrro_el[0] = newtls;
+}
+
+target_ulong target_cpu_get_tls(CPUARMState *env)
+{
+    if (access_secure_reg(env)) {
+        return env->cp15.tpidruro_s;
+    }
+    return env->cp15.tpidrro_el[0];
+}
-- 
2.33.0


