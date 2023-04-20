Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9E6E98F2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf6-0000Ah-1K; Thu, 20 Apr 2023 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf3-0000AG-9i
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf1-0007uH-Jp
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso3317115wmb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hii62K2Wc7QFsLVVFypLkGk3bZXI6Fmh1Q2b0Ws3wdo=;
 b=fnNdLtGNgHdbnZp298veUMGtIEH+ervXxQrKnl4gkb/brtA0YLsUAsQxCsK1y7VNi6
 BTd8fK0Ir5HN+95CfoiI/uQazRJ3/w4n8OBCyOaQ/h1V3fNwRjWXCMPyc0/FObYy1Y5S
 HjtKESMvTqCZpRb57gj9S5Y4AcfCoyBd7PiSnwJLiJLzzQM513HAb3+v2TiD2vsFil8i
 d6JuQhFAV8gfbXGAIu3exmCtZg+G6kLomfBPoOEjdGamAxLwSrmgdR5jk1WgVIonKc0Q
 v/JIkQwFtgQwEZtZNIqUYuJojZpxMZBz5KGy9KFYjnZqtR97ML4x5JtKzMOCYNmootLW
 vwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hii62K2Wc7QFsLVVFypLkGk3bZXI6Fmh1Q2b0Ws3wdo=;
 b=h0M9jBcw8jdIpXfibUZUOC2vu8GPMjm3Rn/kuj/KwFeSyzoYDi4Yx3sr3bcoZlccdQ
 XLesF5xMOMTlnh11x2hrSatNL1y56PeAeLSjL9zMKwPjVZaIL8Uwhjy5ilzFkaFcrjCr
 AlezfzFSp/OzJoMM5ICqZGkdlVLpncxVTjAbWmSpwTXdAhVhWBb6UR44NPo9y8a5iVl5
 mIa/tQ1OBWPxdvvgJ1J2KaI7tmixccVWGfFUcJoGtVPdmu1w2z/37etkGRAbkNSy0wLJ
 qPpubj1WqAYrJOor8/zLUlPO83xH8SR1UbJu50e17EuUxkeAqE/+OU2RzmwXVIVonlYu
 F8Uw==
X-Gm-Message-State: AAQBX9dXyi7H5128oB4X4D8nxUWr4AjDVHPu73an83YpnwpuIX68fWuO
 JjBIF98XVbSrTEDftlHLL6xRzQ==
X-Google-Smtp-Source: AKy350Zp+keAZCk2qd9Yo6GpN8Fz6U7j6XDz8Hpgq/MkHkY71qRH+0ZV8pWG66iP7sH62Visp7GftA==
X-Received: by 2002:a7b:cc85:0:b0:3dc:5b88:e6dd with SMTP id
 p5-20020a7bcc85000000b003dc5b88e6ddmr1786798wma.10.1682006246346; 
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a5d6e01000000b002fa834e1c69sm2263428wrz.52.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E21F51FFBC;
 Thu, 20 Apr 2023 16:57:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 4/9] docs/cxl: Fix sentence
Date: Thu, 20 Apr 2023 16:57:18 +0100
Message-Id: <20230420155723.1711048-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Stefan Weil via <qemu-devel@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230409201828.1159568-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/devices/cxl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..4c38223069 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -111,7 +111,7 @@ Interfaces provided include:
 
 CXL Root Ports (CXL RP)
 ~~~~~~~~~~~~~~~~~~~~~~~
-A CXL Root Port servers te same purpose as a PCIe Root Port.
+A CXL Root Port serves the same purpose as a PCIe Root Port.
 There are a number of CXL specific Designated Vendor Specific
 Extended Capabilities (DVSEC) in PCIe Configuration Space
 and associated component register access via PCI bars.
-- 
2.39.2


