Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7F4715AE
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:28:56 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw83C-0003CB-AC
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mj-00050W-5L
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:58 -0500
Received: from [2a00:1450:4864:20::32d] (port=33791
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7me-0006Ez-Q6
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8979159wmh.0
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/b7SIR6GyfeO3Rjl24BM+AWJSlXd6uCCkfVTpffz54=;
 b=XV3D5SLFtPCRovaseJujyrjBxNIEQNROmwdh2PDwaCLfv9yuug8va7qoIUN98c5EMo
 D102IERkyVofJzK2uFFGTniwU2CvI7abBmSJvIdAZGuNw/brbF6zOxZ7DcsCdzSHN7PG
 /yuENdUFDefspKCOO9RRbWYJ9fVRikILLT94NRs5/uAXD/zh6U614W9rCupzJheyETl1
 Q91G5NU7jocEs71q08jUsAodx4Ad4GBqfqgpEwYW79j0ZEWnTX8Kh5AOecV2hubP5TZj
 22lcHxq8q9Q2Ik/N9CwzPGo8ada7tXpepLwvBzt4curvh6G04mwHspGKIHbPhL8/S2vd
 g8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+/b7SIR6GyfeO3Rjl24BM+AWJSlXd6uCCkfVTpffz54=;
 b=X4yFjkwep6JKvyAaIE1qhSlKdtlHp0/yv1K16e/s4Hc7yD/NHlxLYYkrMqghUcbG+M
 5vzTeh91jTSr+XrBS1TpL1AzPal1g+6ebXjy61Yj47BS7gMK7XV3V+ytwIWXE/gzcUn0
 9SMRyICIVGhyr3iOIAmyYYY6d1m+/o3nLD76uDarhYq+b/+EAam4wT5kVXI1q5a+eu4u
 hB8pLZYrgnGwJ45BYQAvGc1+VZPz+97AerOT9pp00UDPueYTVBix87aomiO3UR+arsSS
 F57U9bvT1HbPKnnU+WxnQC07fcDIZnENcGr+om4HWrmlzG4kzzwf3etOuBp1ro6iLKYU
 BRIQ==
X-Gm-Message-State: AOAM530zISvFQEDOeZTTzPWJKt4SJaGV8H9YPZO27v5XjnVGwVgHmKK/
 7qBJR5bUjJIB0xZLMnP8dNqUIto0FGFXiA==
X-Google-Smtp-Source: ABdhPJwC7ZvI3h0UGwfeI8upp3qN3R9Ge3Z3nwr9qFf5ymXftbKNnU1dvgREDXUIjZboDqc5M1jzGg==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr25198845wmi.173.1639249907587; 
 Sat, 11 Dec 2021 11:11:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE RDBase
 field size
Date: Sat, 11 Dec 2021 19:11:21 +0000
Message-Id: <20211211191135.1764649-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment says that in our CTE format the RDBase field is 36 bits;
in fact for us it is only 16 bits, because we use the RDBase format
where it specifies a 16-bit CPU number. The code already uses
RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
to match it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6a3b145f377..14e8ef68e02 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -400,7 +400,7 @@ FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
- * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ * Valid = 1 bit, RDBase = 16 bits
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
 #define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
-- 
2.25.1


