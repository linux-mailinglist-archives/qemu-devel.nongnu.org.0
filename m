Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D404C1F21
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:52:22 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Uf-0007Lg-Cw
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B9-0007DB-Nd
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:12 -0500
Received: from [2607:f8b0:4864:20::42c] (port=36527
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B5-0001Hk-Io
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:10 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z16so212474pfh.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
 b=NVeSSx7n9c7TYeAr0xNMSrZxIH+iXkMzh4tFFfdzOVote81ikFS6NSu1zhrfEj2MWR
 qW45y7kATahxyn7cv09cn6Z9+CQhvDeOgIo7UGiRY8T1cUG1/5pB+Iu3LCj7fJXzvDi2
 AdS+ILB/CGxaJTnwMMZD+nCzqGnLUXybvc7h9LYAz3YcSSA94mAsC7qr0E5Kz4iR7s8N
 QfGrLjcQBT6hL1BdXyLknqwbAmq7MPEx4b+JlHhXL/Bxj5tped3DHZjMx2vh41uP0oq+
 Md+3Y19yOF3EobkZq3Cu+8RSUN/QZ2mz4Ti1LrmI8cNfqBWF8NPrTH8TqvfhCregF5fC
 Cg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
 b=tBSmatJjLGJ0pt2bMSYWMCJ089ThpCHVLUrETp5pSm5/rI2tQxFZ83VhI3pA+AF0Ca
 aPGp5N5LOwtPAOrKtYrqddb+Z+n3IkHcKY8ybLR+TDNErvdgToZY1zJHI4dW35zdiFeq
 kB3IPQSNVZf5PcC4/h5ibcyuM5PA5f9XTPu44FuYyLYjU7bfFj9cEqdsqxMfSdflNS7d
 xAtcYjg9CNyDLC6i/PJoyopMnquY9dk36g8gx6OrfwuBNxgSy+CN1mIrPxD0MeWIiOAH
 dtIxIlifHeClU+09fvpSOGcKf/A3hGVIZYQiovG5dZaBzg0RkQC6TTVVJtbRPJXQA66K
 SlSA==
X-Gm-Message-State: AOAM531RR40CypDTzYsdl3TQsh030WogydHUE0orZ3W7llzAa/zM6f80
 1RpUHsZvDaHAlGvkMMWUIa0O7/eWdu7Ksw==
X-Google-Smtp-Source: ABdhPJzo92NBvI/eoVpVPvAH3E8aPZ2mHsYr7A8A2kRBfn2GYD+693QiWuuV57oPiTDhldbzGMkZsw==
X-Received: by 2002:a63:7709:0:b0:36c:8c3c:1199 with SMTP id
 s9-20020a637709000000b0036c8c3c1199mr1389383pgc.580.1645655524524; 
 Wed, 23 Feb 2022 14:32:04 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:32:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/17] target/arm: Advertise all page sizes for -cpu max
Date: Wed, 23 Feb 2022 12:31:35 -1000
Message-Id: <20220223223137.114264-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We support 16k pages, but do not advertize that in ID_AA64MMFR0.

The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
to the same support as stage1 lookups.  This setting is deprecated, so
indicate support for all stage2 page sizes directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d88662cef6..2fdc16bf18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1


