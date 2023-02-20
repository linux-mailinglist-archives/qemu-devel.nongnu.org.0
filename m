Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C078969C787
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2HY-0008Ii-6K; Mon, 20 Feb 2023 04:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gq-00073W-Rx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Go-000491-A8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id t13so258863wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KPs6QzBVbeld/TzCnm7LDXOq9GMzfPGQoiYYFroMT8=;
 b=y40nzJTu9YqYn48V52PzwvKykjR4DTUGi4ggJGcN2sgTXDOAjXkcRKvnblnjA91Ybl
 xWqRYLABhjv34K8fIZch8l63qnDN7qnYaCKWFMkKnYfKbv2Y5+xIZEImCPBeRAAOUTQY
 TNfaRnD9uMSvtUzzKdTdPj/pKiBT1NIWPMDypUQtyhv9tioSfbeyTE5J9Qs8TbMrzrw9
 pxNByejeorB88qFLv3irmLl9QmlHrCa9RJ/xyZ6PA5zicby3nbbTPb4yNZB8/RpU1ZJ4
 yRHHlXZWCnuBpsJ6ENrqGAsFxe/ygPmSqlr0XeBCDnDi7jxB9zPQCzEcowVnFuSA5sd0
 8zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KPs6QzBVbeld/TzCnm7LDXOq9GMzfPGQoiYYFroMT8=;
 b=gVKS4j0e0aAteZ6s9dC/PIWARd+iWU3a520/JYF5mfZhEyyMHa1b6rhFdM95FLLG+T
 w+0wWASOSfFke3hp+KKtxb0cdE8ABb8+zXo8XbJSrtDnvXZg/rT4XmyNXBUHnj2C5Lj/
 3S6KT1I/+w2BDv/BMckwm5o+XaLJ8pgjUbrBFCOCNcwEvv73iWC4vaIBihJ/fQVMrDGu
 /mlVfhLN0d6/3JTE7GRUcOKY6zjWhyXsG01pp6rx3zo6wRFnbyrAmwya08TQUNfnZoyo
 WpBHq4CT8Q/3v+tDAWoWuT/TbUc2HX86IBF4SrH3E4kC89FfyviWsmULG8XWs4EMwY5p
 0Zjw==
X-Gm-Message-State: AO0yUKVBmxzY46aOIWdzVi5Snl9ASvoMt9evd0oUeq/zJW6QhDkntTDD
 XVkhyI1Ibg4c9opjOCY9BvvyXUEptgXHT6fB
X-Google-Smtp-Source: AK7set/q23fnBqPAoEBvBrMr6BpCyhTuezndWx6q9dSuC1sBrVLhdAiM6FPcGYjveZ7xv64QCsHL6A==
X-Received: by 2002:a5d:66d2:0:b0:2c5:9cb8:d314 with SMTP id
 k18-20020a5d66d2000000b002c59cb8d314mr2155152wrw.56.1676884536405; 
 Mon, 20 Feb 2023 01:15:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d6111000000b002c559def236sm4013038wrt.57.2023.02.20.01.15.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 19/24] hw/ide/ioport: Remove unnecessary includes
Date: Mon, 20 Feb 2023 10:13:53 +0100
Message-Id: <20230220091358.17038-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-17-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ioport.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index 7156c465da..d869f8018a 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,16 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
-#include "qemu/error-report.h"
-#include "qemu/timer.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-#include "hw/block/block.h"
-#include "sysemu/block-backend.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
-#include "sysemu/replay.h"
-
 #include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
-- 
2.38.1


