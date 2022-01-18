Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4484913E0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:01:54 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9don-0001PB-Ru
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:01:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZi-0000nN-7g
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:23 -0500
Received: from [2607:f8b0:4864:20::633] (port=39712
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZf-0007du-OV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:17 -0500
Received: by mail-pl1-x633.google.com with SMTP id c6so14523369plh.6
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZhf6WUxiKUaxehAiUz4fIBn6ErxVvFCLfHb2BIaP+A=;
 b=gS6JR6YdwD6KfLuxojUqW7t1c7Y9Jrsrs1q6Yl512Gmd3DifQFgfx0QHjMfMuGlosb
 sNDras4pnkRGyfJiXXWmPh8Y0tE3R0m2p9D67GlXHbuTmJHAwnJq2Y9U8iUwBMRbMU9t
 /Nwxy+R/GWWVIjuw5wA1mq4YHBBatVDOrb8cRJFRDZxntXqz7gsTT2WcwBINos1hLeiW
 nISi/4FnZL88LbTYlS/KwaZEbdT8cpTlp4LqivmNQYI6+/Es769hLGRG4/zZvOUmrGXt
 nU/CBFRhPZLeGzqM1l9jF1JDT+82so2xVSAcQV5C6+7oHwSy9A5i/7TLC6JEaVDG7SoQ
 e/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZhf6WUxiKUaxehAiUz4fIBn6ErxVvFCLfHb2BIaP+A=;
 b=gCE7lRFKq7IMvT8DqM3pQ2MTAZwvQGLOJV/rbl0yEBYZ3TaxgOfTRn4wlW8O+0mAUf
 pIe04+0+7eXr+KJF+xMHAGrFxpTXOtGc28V9cfBhlq5dk4savmrN9dflu60PFhSnV1PL
 enVHe80RYOmO0CslsMVajnHiQLrSdvcoU4akIiYlm/Qd+ncYKu+s8QKKTN301kWwFBy4
 WvBf7K65zE0qMhFePcNW4H8iBWCWB6yCb2NwcJ8896xlytaBw4+YXYSGxHGU9M+mu7MX
 KiQUyuxwRVrb0/hglU2kChwdAMgyThzCz8lxX1qhCE/zRJauEyInJGQEy4u8L1jhY95r
 nmlg==
X-Gm-Message-State: AOAM531zYAJYTdHRVtRR0ru05Y+cnmIZogTppEYnoJK5D/Blz/yh0+sX
 HpaSuPjTk0FDorS4oYfUy/dVQ3GjaONZsc8o
X-Google-Smtp-Source: ABdhPJxommjD7m1NyRx/kahODzsrVkkq+ETzjK/Z28jOmdJrxlzrI3OtXDsLj2L3xP2ucW5yrzWP8Q==
X-Received: by 2002:a17:903:1c4:b0:14a:555c:adc0 with SMTP id
 e4-20020a17090301c400b0014a555cadc0mr24999641plh.101.1642470374143; 
 Mon, 17 Jan 2022 17:46:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/17] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
Date: Tue, 18 Jan 2022 09:45:17 +0800
Message-Id: <20220118014522.13613-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fe4ad5d008..b02bb555a6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2976,6 +2976,7 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


