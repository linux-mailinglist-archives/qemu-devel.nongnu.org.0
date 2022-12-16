Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004E64EA37
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:23:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68n9-000234-Fj; Fri, 16 Dec 2022 06:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n5-00021D-DJ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:11 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n3-00067M-So
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id bx10so2225219wrb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8GNY9Dk05aam1GteIe+5IhM8+EbOG/DMvh81Ar6L7Y=;
 b=kfMFSb276+vELN6D+FKSq6d/kVhSIYYuZ+W/VRTxOqDFnzJGgmaCLcQ6tW1xLxCwO5
 ZVOvpR32NetMQlPLhsutxgdEFLjwwjorfT9gnUOMB66b54NrDe39/durdgk6xkCyx88A
 +M5dy9IBU2Tf+7JOKVIjo01+1mj3/rnK/FDAc+IDGhEQ9PjQfoxFcvhoVCteIfcjSDAw
 kRJCJ5Jov9SfZH0PddNnb8r7nUp9ZySOccYmM0dqWyqqVuLN0txMsfsF7uD2A46f7UAb
 /iORxvHqiSwqNEjEXrY4sge9uR+N+uLVSIdmn9z8xj6MAkbnT32wPVi2mSENY5OSeye3
 AHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8GNY9Dk05aam1GteIe+5IhM8+EbOG/DMvh81Ar6L7Y=;
 b=2nF0fSE9wmx4oKOib1NV/bsYk2XbW6xIcNN1Cx2DzCnLhjAwom0FRquCD5PsoxDhRN
 FDbfSDEFxHYTUiATGDV1wSgXIKAm9gWDB/3Eyh+JEHE1pdak+7nNzr+NVM59HVCgX5yv
 lOjx6D9719ih56GUZBOO5UMv1b0t5kHt/gwbQkzOtEGY4xZIFwrtuc5wCOsYzeNO7M2H
 Ns/yzYFMSTQCqEZB5Z04ClD50EnBEq6Et7XTvEtVptmbfX2j355z6l9zt478tPARTdS3
 dzjnqlDQ6MgI3FCXIYXSYFXEvzfOGzsuH/5t52sXGnPPlZqiAXoexYR/dFAUr8lxqoCA
 0XHA==
X-Gm-Message-State: ANoB5pmIYi0HG1Jw5JPxNNYXjS7J6wJUSatSrrRG0zpTyh0wUc4zQAEd
 3L8RWKqfaizFscw/nY6tB0auEA==
X-Google-Smtp-Source: AA0mqf4OujeFuM9y5HPk0N7v0ugUS6BS9b0QE2urs7IL8eeOryOE4g4P6kCpOZsOgzDcfW5kRWqM1w==
X-Received: by 2002:a05:6000:1c18:b0:242:7594:c2f7 with SMTP id
 ba24-20020a0560001c1800b002427594c2f7mr24971271wrb.64.1671189727967; 
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm2344490wrt.36.2022.12.16.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F21D71FFB8;
 Fri, 16 Dec 2022 11:22:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v1 01/10] gdbstub/internals.h: clean up include guard
Date: Fri, 16 Dec 2022 11:21:57 +0000
Message-Id: <20221216112206.3171578-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b444f24ef5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,12 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.34.1


