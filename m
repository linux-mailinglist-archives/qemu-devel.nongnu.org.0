Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D258532A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:06:38 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSVZ-0001mT-H4
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHSOo-0005I1-Rj
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:59:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHSOm-0001S6-OT
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:59:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so4335669wmb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=XrT6CJtYpDChJQmlrXKLKRnBd08Xi8ZOtp9m/6/Dbzk=;
 b=d2QCH4/9fRdEZML3u2VPmUbEcer1Kt1jzOaWdt2d+96yweR2HwudHG5Q8MsurYjZZD
 wbud8ztkhbZm/P/OfUb9zeweF4iz0bjPfdCFWXYpmk7gous0EXxvBgNtV3Vmzv/5WhJT
 ognmDrloMUzwR47J27zx8EwICAogTuI/F/1yUIJj5JX6D/hCoDl7GQ9rbPSJ51yJ/WFe
 Tzkdpg9mB5IH8AKZjQw3iLRqyc700KrHA/Jj3c4YlxcDJCWJPFAnJZSajTWVbdkVVIHh
 opgwYMSPLwUHcE9TKjwPOlFYLUP935qb5ZAgBuSJgaVsVgUtFvisxZc79hH3v2NbTcz0
 m5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=XrT6CJtYpDChJQmlrXKLKRnBd08Xi8ZOtp9m/6/Dbzk=;
 b=MeYotG636GdFTowo0qX0JVtw2ye0xKUijn4MpCEhn34gFtMs4KyNTuwcBNAvIhB9w9
 cUI9w5M0dHh7E/EYHB7Y2OWyAi3Itn9xM4+Mkn6BAldizyuwD7FhBBhKQ+yjuaUZgMOs
 ytJP8ZVAz9bkQeOAVwK2rjeCfmmUf7+1zAfk0F3mkCkUu+wYwaiMjlgeFpQEZz3NWlMC
 Y+ZRasVXrAx0qxGC7I4feir4zATQlX4kPOjCNbZF103wJ3Smc/TpV0KOgb3MPgEb2k3N
 NMLDiX+IwUFJmXmJoyteHn+a2I120HQZ/h/0PnzQtDcajl6E4p2iz2MPypVUobYVJAaI
 vASw==
X-Gm-Message-State: AJIora8m0UZ8P9A6FU5reDhOkNj49d4uA4H0AjoK5GHgu1oRBNWPr1h6
 hoCnaS6+vFRKKFuKKjc4xL0Z4F5/32nH7Q==
X-Google-Smtp-Source: AGRyM1vbDlCuptc/57/XascOh8jxPyLGwXu6ZwcUO6U82TIXCak095q6cY3RjF4GdxGEECVIiS6mbg==
X-Received: by 2002:a05:600c:2854:b0:3a3:1551:d7d with SMTP id
 r20-20020a05600c285400b003a315510d7dmr2854471wmb.174.1659110374868; 
 Fri, 29 Jul 2022 08:59:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a5d620e000000b0021db7b0162esm4143699wru.105.2022.07.29.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:59:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiri Pirko <jiri@resnulli.us>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/rocker: Avoid undefined shifts with more than 31 ports
Date: Fri, 29 Jul 2022 16:59:32 +0100
Message-Id: <20220729155932.2477385-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rocker_port_phys_link_status() and rocker_port_phys_enable_read()
we construct a 64-bit value with one bit per front-panel port.
However we accidentally do the shift as 32-bit arithmetic, which
means that if there are more than 31 front-panel ports this is
undefined behaviour.

Fix the problem by ensuring we use 64-bit arithmetic for the whole
calculation. (We won't ever shift off the 64-bit value because
ROCKER_FP_PORTS_MAX is 62.)

Resolves: Coverity CID 1487121, 1487160
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/rocker/rocker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 31f2340fb91..d8f3f16fe87 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1010,7 +1010,7 @@ static uint64_t rocker_port_phys_link_status(Rocker *r)
         FpPort *port = r->fp_port[i];
 
         if (fp_port_get_link_up(port)) {
-            status |= 1 << (i + 1);
+            status |= 1ULL << (i + 1);
         }
     }
     return status;
@@ -1025,7 +1025,7 @@ static uint64_t rocker_port_phys_enable_read(Rocker *r)
         FpPort *port = r->fp_port[i];
 
         if (fp_port_enabled(port)) {
-            ret |= 1 << (i + 1);
+            ret |= 1ULL << (i + 1);
         }
     }
     return ret;
-- 
2.25.1


