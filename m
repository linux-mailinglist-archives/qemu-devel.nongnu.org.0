Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71069C798
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Fc-0005fl-5a; Mon, 20 Feb 2023 04:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FP-0005Xi-Rk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FL-0003ja-NR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id bg28so401451wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbq7Yid+DCc0hkC10nW8TDlz85UdxpCIIBbqcQwiV2Q=;
 b=WyFW55FBx+SX8Sfu9PUlqVniIPHXR4bFEAKvxqiyXg5bbhj14tXeRvguO3HNwrERsi
 C48k05vsddw/0PNtFfSih+OjUqy7rX0yfXsLrasMrbKzU4l7VIPkJPiP7nQGRe8gu10X
 umJsRUtK0zd/A3J1GdClHcjeHirMzykf48gui0h+PNt9qFiilo/+uNtVEejiDBwHhqtQ
 V9uYhuxGPFK0k3OSVy+WnipyWXbDzZYTYR3y/5tsmwC9xf06OsedLvJLrzPUTFQ72Yna
 CC4VArW3RBB5+QU/ToN4Zi6xbPByAy3TK3xV7NfVCk+m9tVUrT0U0OvPqnKON55Su9o7
 w/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbq7Yid+DCc0hkC10nW8TDlz85UdxpCIIBbqcQwiV2Q=;
 b=hpAXV5MGsIvYxye2GN+obaf/nRg19mg77nBD/wMK1E2Ft9d/i3ZFI8X9UaNfhNLjff
 8C7zuMt9nSjvGLjqciSm4+pyyqLLAxTgW0IiLt208qE0zNHjkD4YRQBKGoVtQ6E348eZ
 afHdinK2vEYIL1E/qgt7CFluYkePqYSgLXoXvRaJhZ5IWEW1Me5c4MeZx38sSV+eFH+/
 /AJv/bQdGZYc93GavE3igCbBsVFAX1Dn6IxImgHjxQpc5uOieYEODU4qhjSjMn37fnze
 GqY3H337kf5sErCh6OVRzh4N8l+gJh9dHwELapwgWjy+DV93SNV0c3xyWoROmHjYiJEg
 KfxA==
X-Gm-Message-State: AO0yUKXEBcvQXHuEiWg1NAGCXr6DF1NToAp9HCcs8WUoHidn5Ax0POqj
 3DNLvpgG6K28CLeO0OBteGCurvTpE6mmpeVU
X-Google-Smtp-Source: AK7set+ttxMO8CM69nAYXXOVx/A4xcnaQbgnUl2oWnaNoITFoBw+2NIP/RoGkKo/FECmgO8G2vJFlA==
X-Received: by 2002:a05:600c:1d0b:b0:3d2:2d2a:d581 with SMTP id
 l11-20020a05600c1d0b00b003d22d2ad581mr245290wms.30.1676884445575; 
 Mon, 20 Feb 2023 01:14:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b13-20020adff90d000000b002c3f50228afsm2765498wrr.3.2023.02.20.01.14.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/24] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Mon, 20 Feb 2023 10:13:35 +0100
Message-Id: <20230220091358.17038-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: John Snow <jsnow@redhat.com>

I have not been able to give these devices the love they need for a
while now. Update the maintainers file to reflect the truth of the
matter.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..0612fff63b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1791,7 +1791,7 @@ F: hw/misc/edu.c
 IDE
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: include/hw/ide.h
 F: include/hw/ide/
 F: hw/ide/
@@ -1816,7 +1816,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
 Floppy
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/block/fdc.c
 F: hw/block/fdc-internal.h
 F: hw/block/fdc-isa.c
-- 
2.38.1


