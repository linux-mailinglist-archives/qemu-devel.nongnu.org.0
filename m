Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B20480F05
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:49:39 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2P22-0001fC-3x
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:49:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnZ-0004pO-8S
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:41 -0500
Received: from [2607:f8b0:4864:20::62d] (port=33637
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnX-0004go-If
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:40 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i6so8816519pla.0
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gVgNP+lNfNGU4BTAjk3ZtDth023tc9GvfIxx/eyTFzE=;
 b=nZflVh2aCo2WGOYt+XVZqAY+0WepX9wMMTueFs7v/3rVgtj42r3MYE64jetRPeIl6I
 fVCg1fNln/G6qZMkjj0iezCAR2EFyIpxuueThgwAxoMGtoCQGazD4rtD2zHj6QcRN1zX
 j5BH6jApuodQB3LJF+4SFLCPM3tOOGCph6nixu0JVgf4D/AyCVw0k9VDzlSzuz+yljHo
 I0sRxDRGJrr5iL/aFRgEugzMV1P0pVO2Hw60KKH/GNGKDmY2Lz1jtO/poh93OSOquFbd
 HCIRBpMf8ftZ+hlaQOELL1bLv0Jw2hHYaM/ZU+qBvXt1dcPvO0Q1BElj9nFNNyPltplN
 gXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVgNP+lNfNGU4BTAjk3ZtDth023tc9GvfIxx/eyTFzE=;
 b=uvgPjHvhGxW6HvwKAdPgcienDL2afQO8sRST842S91YTwl/zeX1WuT9t85ZIWETsGK
 wtS1k2q0WNrv/E4ueSdYxz7nkxgGHqvigk4sH47NXsS8tY/rz+MNj9jD3ITAyAK/H8um
 VpGn7us8PQB4sX7GDfUxt16FmPm5FLfRc19PbaQLYIqum56DyfphMpJsh8jzJB0Qse6F
 YzUEJwvrghlOB2RAqzz7bFg/LhUxAi9p26Vt8fk2w9+w5P+yG0GQisz/6Ev08dCjIDBe
 FaFHezqUMwRTxV9ND/0VdMc/U4OQTsQKpel/2TIYVFtqBOKS13cFyul+wNE42q4aOKj4
 6jhQ==
X-Gm-Message-State: AOAM530Ude/ODEAfVNlsXU1ogrQpQic5xvRxmH0HVwVIRitbxI5HxExS
 IlFKTVrq/g8yj4FrPm2XyXckKTYYU6GuxlZb
X-Google-Smtp-Source: ABdhPJxFD0aLKR3TpIWgC/BipOci+KruiREYpzUvL8RLegEeUGR6tx/B+wePPFlxtexpi2yP7vkHBw==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr29848427pjl.222.1640745278121; 
 Tue, 28 Dec 2021 18:34:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
Date: Wed, 29 Dec 2021 10:33:41 +0800
Message-Id: <20211229023348.12606-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1f5a75eca7..c3f4dabf36 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2974,6 +2974,7 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


