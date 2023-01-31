Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564C6834B9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuzJ-0000dl-73; Tue, 31 Jan 2023 13:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxi-0007NZ-7m
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxg-0000oo-DX
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id m14so14557059wrg.13
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=HHdr0APGc0R2trybTu+MbqPOEm7cATaxupB+mYYCeERnN8vwG+36cLiLH3vaEUl0yo
 e+LzVKeXMKneJDO9SOVOOpPQ0LxxQatKGDbA6tEdmhZsq3BqYUzMRDhjMjYeCFyxLFZh
 qXf7m+pen559YpobL+BWv7Q9IOEo7anA3QNbbNWyI+23uPShoMJgHBC24rPk42W//5rb
 WeZtfNRZpkeD/TUgwNKat6sHYTx94ZBrUtf+b7m1W62vKmNmDU2ouWiylYKFqK5x6Vv1
 oimOknTJtXUSHzhaMFhfnpLgFp4q4LUDSXDy3OZ70aovqpEOAqzFG0uEUJxfKeNQije7
 VUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=wTLLh9oysEtAWAoPmRdObz6DCpy0kpdHyMRGvnYBD2hdL5gLmQKb6D9oaOPZjaBXqT
 6pN77sFtL09XVn7QaqQ1AaNdrT5AjBkmhhOaHOJLh/vO0TJIKpEgSpp0jMqypIdk3VDX
 D0sAEv9000zEeRgftShl74DWiHbhfIW5CQM2s9N8Amf3deVOmOtVHN6MQpTqepXc7cEn
 qeDlweWPCctwmf6Kp2hgLHx5NX1cU8izNx4SdrIDv8YbcX2O9S1ccVB+doaVn8m3+KKc
 S8AI8v8XlW+/k+Dk+6L3rD+FvZ0ayrcVNgk96/niFyKvRtgRFxzAxcbkPtnq7zltTEz7
 Sr/w==
X-Gm-Message-State: AO0yUKUol3Fc6HiMWKqGZ+fwxsa31p9BPz+owBAZB3thnoe9LLiLztez
 DNkJgOUHz+o6pdxM8Ev6c7hzIg==
X-Google-Smtp-Source: AK7set90iIiA5ugZDNhIb3OjOGhVl4P+xci7QPo2AnJiySpu5Ar+mRCb62IJEMYsOgdQHJWggeH+cQ==
X-Received: by 2002:adf:a2d4:0:b0:2bf:cfb4:2e1 with SMTP id
 t20-20020adfa2d4000000b002bfcfb402e1mr15232951wra.45.1675188146121; 
 Tue, 31 Jan 2023 10:02:26 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:25 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 14/14] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Tue, 31 Jan 2023 19:01:58 +0100
Message-Id: <20230131180158.2471047-15-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x433.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XThead* extensions are maintained by T-Head and VRULL.
Adding a point of contact from both companies.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..9dc0a2954e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,14 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
+RISC-V XThead* extensions
+M: Christoph Muellner <christoph.muellner@vrull.eu>
+M: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/insn_trans/trans_xthead.c.inc
+F: target/riscv/xthead*.decode
+
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
-- 
2.39.1


