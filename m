Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AC6D8301
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:07:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dp-0006C3-7s; Wed, 05 Apr 2023 12:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dg-00069I-M9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dd-0007XG-Uh
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so36728800wrh.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXAiv5gPJGzakn6yAF3UQ469jIKkZR4r/iuFrCC5frw=;
 b=MK0k+l7i0JL0N5tdLRQup0z/tS+z9fsal4eicREogGdlwNf9QVbabnZfiviIAYfHBf
 JA3Z4LTUT/MZ/596XiLixMfrIvzM7ysklzUO4TTvJDt47/2W4D9/CzYhb/QcW2qM2DGh
 lV8PnFchupvt62JB8kdIM3YEQBVwi8Y5uTliYYgPdnvE4XiaGrBARmupflOVkRocZ/k8
 F0CNMkRh//wn/9/AGrldf70UiFQf2BIvuEBy7QwNDJ6vwKQhDdHoszOmXwaWZsR7hKME
 u0GX0l3gc0dvqJ6SgJT7MSeNx+4HHimdvMSdJ5XvGckOBpinv7ZG0pcUGyBpL8WdzMFG
 KJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXAiv5gPJGzakn6yAF3UQ469jIKkZR4r/iuFrCC5frw=;
 b=ohgnb9HeZfohtbGsTGV95VVDmuFA4Zocx+LP1edUzMbHk1uBfxgd5sUEKnYChQ5/FJ
 B8cpQGdM59pUE62lJkHOmibr4cvPktjjyGTQvnMLhoXeMaXtu5dOhfm1g8gNCY1+bGi5
 +qFPPUF8h3pI80RLfJxv7jTfOzvkhktIkjsl1gKGaKzJ6TJtBhSVZP7eOs9jM8DZT6cZ
 xxV28z7pYwkoZgaESQoh44GRAvebEYuO6YrhdEl639WjON+Xa6OPtYwEMusLlYT50lkW
 LXwgGVMgMFQbb4G3fu8JEL6ATNALkUjw58jNmn4pT4pPnYfmenb4MEnI+k7/CJp4gHzZ
 e/NA==
X-Gm-Message-State: AAQBX9dkRcZP1fKZIsfz1TSp4yILYDPKivMFIyuxk+VnAxPLWZpA6T1J
 xJdd5OTh+YwU35ECpSAKsWHjy0CkEjoBdzJeimg=
X-Google-Smtp-Source: AKy350aJfFZROd28tOYQVpVfLU5O7PA/1sFGTeMRr0g366fxZBdFDsolmijBgmnNZ+HUOQGRU0ODxQ==
X-Received: by 2002:a5d:52c7:0:b0:2ce:a9e9:4905 with SMTP id
 r7-20020a5d52c7000000b002cea9e94905mr4246512wrv.34.1680710732675; 
 Wed, 05 Apr 2023 09:05:32 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bce13000000b003ee1acdb036sm2606127wmc.17.2023.04.05.09.05.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 06/10] target/arm: Reduce QMP header pressure by not including
 'kvm_arm.h'
Date: Wed,  5 Apr 2023 18:04:50 +0200
Message-Id: <20230405160454.97436-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We only need "sysemu/kvm.h" for kvm_enabled() and "cpu.h"
for the QOM type definitions (TYPE_ARM_CPU). Avoid including
the heavy "kvm_arm.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c8fa524002..91eb450565 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -22,7 +22,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/boards.h"
-#include "kvm_arm.h"
+#include "sysemu/kvm.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qobject-input-visitor.h"
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
+#include "target/arm/cpu.h"
 
 static GICCapability *gic_cap_new(int version)
 {
-- 
2.38.1


