Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAFA6AF771
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekk-0001Xr-Ih; Tue, 07 Mar 2023 16:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeki-0001Sv-76
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekg-000816-E0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so8336wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J32+kSfJwQwIWqiTJw+9OTa+IL/9v7+mOufRanr43cY=;
 b=XnCfOlvYXliZ+4SUCyEO+u+CFZXUjss6gwJBVtY9UgzQ7F4O06f5uzb4tCV1ySvOIL
 WP7CJZ9CFAj7Wwf+S4WLhcIDqokfZqJ7LzvGJbRZBEPx5st8WzOul/abpT35an9dHtS4
 DvIu1zrCZmIyifq5CS4u9e66pPv3XV2KyW+cuN1WrhcAACgFvsAIfgCwV3Uz6UqmReGy
 4Ftw3UVS+BYQ3Sx0ylQfDZEq9iMg2kl7a5Mm2Onac3ReA830W/yvyBquYzLpx7sfEnpA
 qt2nw3yAW0prxVSK3HmWHPIaSfeQi9jCH2+I9B9D47PshNKnvMAXu1cMrAR4awNPqBYZ
 WUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J32+kSfJwQwIWqiTJw+9OTa+IL/9v7+mOufRanr43cY=;
 b=iBhHHATkmZPiAK4HhhKebFoOWlEjb/8ZRs4oENH1s7DsqMDTOSalyxnlusk7W4drtg
 YMyR1LpJpUOzOuFZpVVA2wNbLbHUqvyb92Q13Qhy4RmV0REV72H9Vpa8ytT0Bf/4gEvT
 YZyZcHfDfcibH3ISoBkBmSEge6MNyTGmeEdwtf7z0qo6a75TnNLLV+VV2AY/eG5kQZRB
 DVxd740R7vnsb+4rMpt9mf6Hpw7vGFMBVC9ShmLncWKMwKd6LPw8dKNV3MS0MELzGnDH
 vLbd9VMA009tNkkEQeipL0qxhXGL8nj6jJQgjyFKzFW3B1IjQtjhjreupO18dQlA3ZIP
 cobQ==
X-Gm-Message-State: AO0yUKW03NM0Kwi6DewBvpDZILKhUO0X3jc1ABttWDRTEKVT9cLzi0Iw
 1MbVMZ2sBBW4jn0r/efTfB93Iw==
X-Google-Smtp-Source: AK7set8VUPgjXsUoZ5mHO7A6A3nOz34j+2Z04ONnLRGhEyUFnk6ZtGclls9wpoOFPlA8iDXffBecuQ==
X-Received: by 2002:a05:600c:450b:b0:3ea:ea8a:a94a with SMTP id
 t11-20020a05600c450b00b003eaea8aa94amr14626890wmo.27.1678224100109; 
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm20687040wms.19.2023.03.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 517851FFB8;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/30] gdbstub/internals.h: clean up include guard
Date: Tue,  7 Mar 2023 21:21:10 +0000
Message-Id: <20230307212139.883112-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

Use something more specific to avoid name clashes.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-2-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-2-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b23999f951..7df0e11c47 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 #include "exec/cpu-common.h"
 
@@ -16,4 +16,4 @@ int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.39.2


