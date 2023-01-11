Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1866567D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:51:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWoj-0003FP-BT; Wed, 11 Jan 2023 03:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoP-000363-Vg
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoN-0007Ze-RB
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ay40so10585271wmb.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mT+LWt01/sleIbh0MDOTvrE02y2MJEW1VXEk+avLKDA=;
 b=x2s+qJAlrhg+yHrXRGGRBWjDq/nLh5awC5PjogaxNASQjMgZtNrCUEsl4t7lIgzF9F
 +dTEwmDS+8mrFlfuo/gDBBZ2c9jSuvyFwK1Go6G/Zck7kHq6XWuyPMYIL1lYCi7ZyfRs
 F6n9CCooSKo2uuI9WPnQOixNgDL0KDSduaRv28mlQQos2mSVv9WOkcUHL9MWQYSvbmJW
 swShtN2dDBHdDYe7EfL53SgVtALZLQKK1uidJwelI4b7fkYJFWr90J9ApbINvyD5Vds2
 IhRQSW90VQ3Go3GJWjcnM5QCZ2mXk8mGl9e1lMHXLq3ktBC+pgd3c43Xu3CxSXjz5dtR
 zbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mT+LWt01/sleIbh0MDOTvrE02y2MJEW1VXEk+avLKDA=;
 b=uiQ1o6o4WJq9QelluW1c+UuhEIhwrX4w1CcK4GNt0UvFC7jzqXrpjXdDg9++XWUPMW
 VBA1FZUOf0J1jtqad2Pm135HiffIADxJDXfc7R4Ei8TFkBsqWGq5OvfpB+7T7+LhM+7W
 63/0Av/f3Z/7vigXrVdcijlVukR79ZhudHvpFthke+hc2otDFapPAtBZNUojDHELQK4w
 /Qhs7VvQhCFlXkaMm457mYGSBjMrz8mLbhfXGalOevmdt9KG46t3Sddm/1R6eLx6vV5F
 0iWdsvpdlCVudijZrrfJxXw9hOA8OrSurtwhDMcDD6Xt6XzWrd6RXTavZ81MAG//wt2D
 qOIQ==
X-Gm-Message-State: AFqh2kp9g4/2czA86QBCWx+hnJm3WGi1k1J5MRNDb4orEN6vOflSk996
 cjR+3NiUTT2sNPRJons3Dlg3IGmP2Jbc2JUi
X-Google-Smtp-Source: AMrXdXs+oh3vX3rKv9pdXy9CMzdYw2W698GBsDzCjlq0EsVH1Q6Ia6kuB7DH13yNTT7fmxRfm50O+w==
X-Received: by 2002:a05:600c:19d1:b0:3d9:ea0a:19c5 with SMTP id
 u17-20020a05600c19d100b003d9ea0a19c5mr9697883wmq.38.1673427018104; 
 Wed, 11 Jan 2023 00:50:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm26107920wmc.0.2023.01.11.00.50.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
Date: Wed, 11 Jan 2023 09:50:11 +0100
Message-Id: <20230111085016.44551-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Series fully reviewed.

Since v2:
- Use array of const pointers to const (Richard)

Since v1:
- Fixed overwritten RECEIVING_BIT7 entry (Richard)
- Picked R-b tags

- Remove unused dummy MemoryRegion
- Convert DPRINTF() to using trace events

(series used as base for follow-up, better if merged via ARM tree)

Philippe Mathieu-Daudé (5):
  hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
  hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
  hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
    helper
  hw/i2c/bitbang_i2c: Trace state changes
  hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events

 hw/arm/musicpal.c            |  3 +-
 hw/i2c/bitbang_i2c.c         | 80 ++++++++++++++++++++++--------------
 hw/i2c/trace-events          |  7 ++++
 include/hw/i2c/bitbang_i2c.h |  2 +
 4 files changed, 61 insertions(+), 31 deletions(-)

-- 
2.38.1


