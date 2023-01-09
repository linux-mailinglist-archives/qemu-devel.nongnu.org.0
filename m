Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030866286E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEslQ-0001qV-4W; Mon, 09 Jan 2023 09:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsl3-0001ml-7X
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:13 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskz-00075e-Np
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ay40so6346058wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BFQYTotXMIsrw/hyKX+oi+c+rZBE8f8yezrJmKudvs=;
 b=X0Lve+yN2jV2HlrkcE0RiLBXetXm5XbVn/pIRfzyp5PEoxSgfn+Z1EJyezUwse8F2R
 zX8WgUuVM296gZSqJb3SxLK2xDjv0aQnKjm+cUXWKTgiyaTB7RDVreDMCf+iuHswCQGx
 EpKdqKzZcmglNXA0KQMXD2CXzMGOtYhsgGw68BDh2kc4ePoK5tvasKuaY6O/p1QWhS3Y
 s1Izai2Xsz8CBp9XpLvnsjqjPmiMY1b4P83BA1FJXLIX5jOwDXRAS/L+Z3djoSkLwrpY
 NeUslyD1we7hObvLTdk+yiv8Hpm8El1H7tlq8p1YVcAVZm0a2i7gYIsQYwEf3WgUT89I
 9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BFQYTotXMIsrw/hyKX+oi+c+rZBE8f8yezrJmKudvs=;
 b=LAlJk8CWQrzkYUTWL4uLA8c0ROIaZJxi2vrkiCURMsMj0RBlCsWzfwu7kmBIxQMq78
 dLmhUpn6YUaX+uveZJBwwUCABQypHPbiyhWLfObtAgSCd9+t515o7lmisP5Owf90+rx5
 kWLEEQydY8t0g+8Uue9jpOXIusgvL1oSFO3J2eVicnSEVCEQStM/rA/h9YeslkU25T5W
 47oPWWagDd0swWH42JljXKIAo4R+Io//OWcZwHmUj4XrUFOIf+6a7Oehd2AFxRLJxmPl
 itkl52jIXrMwwOHzUEUhx9t/i7vvneo01cA+kaB4pxkd92XnvbdyYLV91mMSvwyTNDJO
 K/jg==
X-Gm-Message-State: AFqh2koCdislPzMQbuJJlw4M7HUBg/i4yPV6XQaqviqIzCmH5be18J6V
 /r9PkAV6adFuGw+8srIYy5WUaVUkQR546q0M
X-Google-Smtp-Source: AMrXdXvKszs6jcVWRU/R1xY5ui4nm5WPCU4lPooCn/xcOx2UeVXag85mtjzULNuuYL1GLIyW3vo8xw==
X-Received: by 2002:a05:600c:5024:b0:3d3:55ad:a114 with SMTP id
 n36-20020a05600c502400b003d355ada114mr46999823wmr.38.1673273048229; 
 Mon, 09 Jan 2023 06:04:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm17126842wmo.24.2023.01.09.06.04.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 12/14] hw/misc/sbsa_ec: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Mon,  9 Jan 2023 15:03:04 +0100
Message-Id: <20230109140306.23161-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

This model was merged few days before the QOM cleanup from
commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
was pulled and merged. Manually adapt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/sbsa_ec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 6f19c21195..86b23a5372 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -21,8 +21,7 @@ typedef struct SECUREECState {
 } SECUREECState;
 
 #define TYPE_SBSA_SECURE_EC "sbsa-ec"
-#define SBSA_SECURE_EC(obj) \
-        OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_SECURE_EC)
+OBJECT_DECLARE_SIMPLE_TYPE(SECUREECState, SBSA_SECURE_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
-- 
2.38.1


