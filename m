Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B886F2FC08D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:07:47 +0100 (CET)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xI2-0005X9-QF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAW-0006gf-5E
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:56 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAS-0004NY-2i
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:55 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w14so3793590pfi.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqEnJRa1E6OFrEI2f+j7kCvc33QrBkArJeX6B7dH8fg=;
 b=AfqS+ht39xzoTY4Htc8Q6YztphJ8kUethFu4wSxq60bk7xOcK5GvY642U4vBVYpu8+
 TNo6XstAc63tsur2ebRXvoo/Dxt9WSMfzOnOl4ZdAENFi0c/FpK2e1yOUX0uv931ix/v
 MaivttA/ydrcgmT56/fPchbFBBqVN+FpVG7kdbZ7/vTt68BqhVxvYL3Bd/pHvx1zhAgN
 TUdZkQ5n5zItE9/muUFDwnxhh5dNpguED2Y7GuJXDvQvpUAYFAdByWiMFlnPQJ5cOpBN
 d4GCNoMlDBZbN25sSaCJdnKE5xQGp2IFQfrIstkMsSzPfyw4//Iwe2fEh8NSCYp7HuOB
 l0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqEnJRa1E6OFrEI2f+j7kCvc33QrBkArJeX6B7dH8fg=;
 b=VOe04n5I/P8bMsuWZn8Gcn6p4bBEiFhkw2f2mZGDV+HiNPEy0sCJc/n48y+3bBvgnB
 Bui8Iq+kCGx185q7LUlOzOQk000QmuARSVICIqnqJJ8VAZdhI2JBiwuQjRxiFYZWkgLu
 VGngPrgx44QxEks91CU86Emk14ADgD2nOteRoImCVGfeJ0H5P/KXHgQdqGaPpVRlCTDD
 NKBjX7rSZkCD3O8APwhqTPre8/eqsuuZV7spmchfKtesWrI+957pHg0nRIrzAPxGc1k7
 T89R0joyHaKwhlsUGcMf2XtTcyYC+yLvxbvZo1vCs1aKDTPGK1mx6Iv1AZaN47e8jMGf
 Rx0A==
X-Gm-Message-State: AOAM533DcNG9WJmEfO8KSKxN20+nCIK6Ss3DHcQiLWkh71MOwt9xCWt2
 b6UP3HP9S8NWcgm115/6m3YWtsqhiCyN3A==
X-Google-Smtp-Source: ABdhPJwaqXSO39MwwskrITHnTV5HHUdw17BvFSdFEdtqXuAtAhFnqIUI6RD044AwF+ID1x0VD52BlQ==
X-Received: by 2002:a65:6119:: with SMTP id z25mr5670487pgu.17.1611082548456; 
 Tue, 19 Jan 2021 10:55:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b203sm3209624pfb.11.2021.01.19.10.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:55:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tcg: Optimize inline dup_const for MO_64
Date: Tue, 19 Jan 2021 08:55:42 -1000
Message-Id: <20210119185542.628456-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119185542.628456-1-richard.henderson@linaro.org>
References: <20210119185542.628456-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid the out-of-line function call for immediate MO_64.
In addition, diagnose all invalid constants at compile-time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 504c5e9bb0..c5a9d65d5f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1325,7 +1325,8 @@ uint64_t dup_const(unsigned vece, uint64_t c);
      ? (  (VECE) == MO_8  ? 0x0101010101010101ull * (uint8_t)(C)   \
         : (VECE) == MO_16 ? 0x0001000100010001ull * (uint16_t)(C)  \
         : (VECE) == MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
-        : dup_const(VECE, C))                                      \
+        : (VECE) == MO_64 ? (uint64_t)(C)                          \
+        : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
 
-- 
2.25.1


