Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCB697AB2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwb-0008Bv-0S; Wed, 15 Feb 2023 06:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwY-0008BG-Ed
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwW-0003Ou-Lu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1290313wmo.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAlRb5D5HBtC4JvtfWGwx5/vkyW1pHlcw9uhauLqWDU=;
 b=aNBUuTMAB71wuFpy7Ag0CBbC1a3ea9pqd9Mx76ae79RFCvplgkUdASnt1tyylkyMGF
 rg3uii2G85NmkLzCyxy1ud+csOlO54nhsiMKpiea3Mg30rKadIQBF15hXb/wKjR/6VVJ
 1o3RLCVWjCe0cRyEHBh/rzwKnJbcHxT9ayFaQaOZ5vZf/AFxxl1MfnUD+d/CeuKh+ri8
 fHbRVJIA7N6t93LY451aX9ST9J/SJfF+tyIINtV1FBQQ6jLLuT5JrQNWdRQ+ZI68GZ6C
 u3WHzvR60lE0SFcWs7byCSgorJatALD8N4k4qzyeeFmpFG8DMjbWlzTwszX9RykO9C1t
 2ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAlRb5D5HBtC4JvtfWGwx5/vkyW1pHlcw9uhauLqWDU=;
 b=u+totsfaGabVNwoWpq2OHEWLOULzL19x0HXG3J4XQxfwBosz/mMrlHtckBWrcuUopu
 GSiz/gZOmJcGPv/cHwFrF4b+Zbjd/Mbt3/rKShFsSulmVPbuwH7zBJTdOW72yz5fgHRK
 PXPR7/xaaYYh1Fp/MWAMfcDPAfDXPs+KTuCX9MtwgX324fp+u5JsovcCDBZeYVLP/pVM
 mPSbfF2zG5V84OCFQ2+gB9rTjzd8ewISYF9LSiZpgw7p0YTKuGCyTWUWEFN+d1cPE8Og
 bpmPvAsZe/Ns8+mYjzVAzpBxVjGx/WqaUIDKVrgmHY2+R1lklB1Yf9kIVB7jLavwYy1B
 O7Uw==
X-Gm-Message-State: AO0yUKWG1vfS9BXKcR9UruAZrVsi/93vpySEILusXXpQYC9ee2CrUdBn
 7yIhd/qCmn502uEOWF9P1U3kD6ztNxb99097
X-Google-Smtp-Source: AK7set+l95Njuf/ZzeWN/yWLhVRFQWNJyYQQKS/YAGOJ7BLy3Rrtr93I1GoJffULQXouvjvLUI/MnQ==
X-Received: by 2002:a05:600c:2a08:b0:3e1:f8af:896c with SMTP id
 w8-20020a05600c2a0800b003e1f8af896cmr1729992wme.3.1676460439252; 
 Wed, 15 Feb 2023 03:27:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b003daf6e3bc2fsm6415973wms.1.2023.02.15.03.27.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/20] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Wed, 15 Feb 2023 12:26:53 +0100
Message-Id: <20230215112712.23110-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..841aa3e021 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1792,7 +1792,7 @@ F: hw/misc/edu.c
 IDE
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: include/hw/ide.h
 F: include/hw/ide/
 F: hw/ide/
@@ -1817,7 +1817,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
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


