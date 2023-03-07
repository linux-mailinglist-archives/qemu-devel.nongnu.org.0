Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE366AF783
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeks-0001kC-3Z; Tue, 07 Mar 2023 16:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekl-0001Zr-CE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeki-00081B-EW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so13509014wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1I+fpWmf74dYlSUbOj/12WA9eeGFYISQDgT7XBMlDRM=;
 b=caimSKJeL0y39/e5L7XOagDVk+HHRmM/leNb+iL9ofhZqcnNXg+Iu0Hfs24LOZXOnn
 /CU79kucCXjRhJvt/er54Xdk/TglPbXXMrKtz3As5OdczcaDunDH5EiUnUIeoYv11SsU
 MKkMuyxli4dA+pZWmP2SPwUsbjfF+3I8pkrTtebcVIe5t3QDO/87B2XtTmDTg0ZkKh3M
 lpxNPrFQ9hH1OTJD5IbMCZMXA1SZaujwMxxRahPIWXOJrp1PrkeZ4DiM5vOcmDpdvKyL
 LS80/7U+b3E67i8RgrB+Yf4OkUNaiHEntUPztAHt7DWeTcZE6lB3UJ7Ift8ekYuZFjYk
 KyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1I+fpWmf74dYlSUbOj/12WA9eeGFYISQDgT7XBMlDRM=;
 b=o7lxByjotCPjzjMAP6sVAg+GlhC4gPWjDJ/MdCfj5vTolhuOhpTCEDndObb10boVid
 tWUs5wW4LMp//R/jp7E9oQwNWbb7tw0GkGScvppWPs6KtPbWJTSTVmUgRpJVu+yt/lta
 EUGx4edkPpAiUQ455k1RQm6Lu9i1BtlzDTCJOLHoBWP0BbfMbYoDXLI1VU65t/bAlv64
 /CHZAoDLaguz158j2azxxvsuDURgPOAyd+ow6kMCp7zea1mJ5g7cQj6Fabn504XrTsyN
 8zk88mSI9/j+ncTFQjQ1wNdjBE26BZ7QCgECmTeggVCo68RHgbK1ZE0di+sjm2SMPJxU
 134A==
X-Gm-Message-State: AO0yUKX2eET+fahb92TlbCqsiv5luZa6DOeZ76j1HuDScjUWOBeOq/eJ
 heMsHomq7yqaJRxJf2xxsiOqsw==
X-Google-Smtp-Source: AK7set9du8WisjWGF08cd/sFgQAl75FvtqbKModkRWlwX3istsl0TXxujU5yZm50SQ9CsK1IViOfzg==
X-Received: by 2002:a5d:6a4c:0:b0:2c7:4865:f07e with SMTP id
 t12-20020a5d6a4c000000b002c74865f07emr9799471wrw.35.1678224100548; 
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b002c70bfe505esm13296576wru.82.2023.03.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BE7F1FFBA;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/30] gdbstub: fix-up copyright and license files
Date: Tue,  7 Mar 2023 21:21:11 +0000
Message-Id: <20230307212139.883112-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-3-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-3-richard.henderson@linaro.org>

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 129575e510..05db6f8a9f 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -4,9 +4,10 @@
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 484bd8f461..09a18fb23b 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -3,9 +3,10 @@
  *
  * We know for user-mode we are using TCG so we can call stuff directly.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.39.2


