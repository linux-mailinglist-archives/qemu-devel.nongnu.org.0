Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB410F522
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 03:45:50 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibyCC-0003wU-Nz
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 21:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxI-0003M5-S1
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxB-0008Rw-7v
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:21 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibxxA-0008Na-OE
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:16 -0500
Received: by mail-pj1-x1042.google.com with SMTP id l4so821007pjt.5
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 18:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t0KxplJe1stLtOSq2ERXdsGF3/Ph5ETCUlajlx5MnoE=;
 b=VkYp8+LlTxZ6CrbDqi45/knG3VSX+u9/Ew2+QOFi7KHeb/NN+o/LrbT7Zv8ZlS+ib9
 OhSxo2sjeuy0HNU0cZKqthJ4n4pWPj20ryznqsXURWDqdCgOvk5FGrBVn2DwdB6yfP+n
 YeB2i6WImPisbmfQfvcbXdBuHZJtX82a5iT+dWesTJlNEimspx0z+tpSZA2Jzl5N3nEQ
 ub9L6SpPSljpaP5lbpw64LJcoX9d7nNNFaPe73w31pA+8Ufwu0CtTjjG9EMrTNRZDJqN
 bTB3Kt0y+yxAxVI8rMP/+6vOTAPs/w72VlNHGxfUj+MBDx5I+bzT5YXylh6VwY7xHV5o
 jOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t0KxplJe1stLtOSq2ERXdsGF3/Ph5ETCUlajlx5MnoE=;
 b=XRucVarOiKuNfmA/hJeHr7Y+Szws09Bu5+7EWGyUNSfO219MhchmWO3FHCnPFh1DD/
 XU9+g5PrLMulPoyHP+Jjmmn6YAJ3V/bYrGY0RMiCgTvl6CrvPZyX9vvUjnr2F+tJJwFr
 o2flLKIfF1/vBc5Z8WQpG2r2mbfD91kjqPECWeJP63WNlA+Urh1B3vPX1k5fGcU0pe8Q
 IOrJQy6dwtw4oD4rQ9Nm/sjo9/cOS6bETRdDSeSN8TbXJIwhSbUVDbibG+Qlj9nvI5Yu
 6yeW4Z0mDUZ7D0enIjolUogLMhKrx1v1yImpDOOeVJSznNvye59d+9rDCFcHpeDk8lTZ
 emCQ==
X-Gm-Message-State: APjAAAUR/c7M4AWEg/ivJeU+my9VqkXlAQTJL2+2150UqzfF/hsi7O6n
 wbQCbuHwynjB4PDazjDiF2sYxz9Bh9U=
X-Google-Smtp-Source: APXvYqzQcjdhzzGKWbDaJeRyrAN9aefSVvL0xvVIZNKjFQRAfUkhQQkF8ML5B6chYV1aXcOaqA344Q==
X-Received: by 2002:a17:90a:610:: with SMTP id
 j16mr2891477pjj.85.1575340213106; 
 Mon, 02 Dec 2019 18:30:13 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q22sm873695pfg.170.2019.12.02.18.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 18:30:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/40] target/arm: Update define_one_arm_cp_reg_with_opaque
 for VHE
Date: Mon,  2 Dec 2019 18:29:23 -0800
Message-Id: <20191203022937.1474-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203022937.1474-1-richard.henderson@linaro.org>
References: <20191203022937.1474-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For ARMv8.1, op1 == 5 is reserved for EL2 aliases of
EL1 and EL0 registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 023b8963cf..1812588fa1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7437,13 +7437,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             mask = PL0_RW;
             break;
         case 4:
+        case 5:
             /* min_EL EL2 */
             mask = PL2_RW;
             break;
-        case 5:
-            /* unallocated encoding, so not possible */
-            assert(false);
-            break;
         case 6:
             /* min_EL EL3 */
             mask = PL3_RW;
-- 
2.17.1


