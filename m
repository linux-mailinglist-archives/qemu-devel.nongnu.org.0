Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F667A386
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:01:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPTE-0007Gq-R5; Tue, 24 Jan 2023 15:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSn-00077c-9I
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:00:14 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSl-0002PN-Hi
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:00:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so14977441wru.13
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ngmCKEbGmiNN84NDbW+3K0xXi/3+pWJWDAQxLO/NxY=;
 b=NJlWBaC0G+FAgj2A0r9d+GyabuR9eVx+HdvmKTdwGJLUIsec5kEnvbdgHbt5myvRPR
 juSk9PjAqGIYS/7xIZd8mWG72k8TYlM6t/6bePUUEiSZl5KnaP/ASAXxbde6aucvsd8Y
 zKGN2L35iEMpJpLU7y8yKHQByPbRlTAw9s98wX4NZUJLiBg89xUwn00SjlICVP0kQ911
 /GWpbSfkAtJPJBnsBC2eAeN6cDY2GbKT2rhmqd+1Kd1fD3Rj6FSKSk7ymNNovozk9AhC
 D0d2bZzOPCyAt9tM0kwnCLYxZohvHke2Tg3fRK3XvRUBtl4jnUfDYayqsy/OGsqACvOK
 Rj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ngmCKEbGmiNN84NDbW+3K0xXi/3+pWJWDAQxLO/NxY=;
 b=flf0lLWIRXoh67nMyp4bBq9dzEX29IyjKmsuRfdesPbm1hHbikJYQKEct257H6YyCa
 xl4ZXs7/EtrFS4j11Jw6L9FeG5oesMXyAIrLSv58HRKlVlmY/uy7Nzju5J9eDLC8jfJV
 ZkDbvxpRQZRhiKesMwo0ylfQb4VUCQFf4f8FwS7wwi8vEeFXq9W8krFxt2kqejpOD6gb
 D+ZembYKWIIHfU34v6D7kN5Pg0uUlmhwJV4qI0LMo66dNXkokrnsdKIyrCkoeGtRTJ3B
 pJLbDER1nWXtIJNE6LQA/4nqwXsGRc+aHXtgDWNzxexxEohB9h5Rh3KQI7uONmcQh8iI
 v8eQ==
X-Gm-Message-State: AFqh2ko0sJ7AzrlHEZ3uLBcM3hE1EGkbHphE7kzdA3nPgRxKHuLltXAd
 ut4EYesqjlhxoRYHF2nXk6QoNQ==
X-Google-Smtp-Source: AMrXdXvZPZhJCjuvPq+ScUra0tIKOLDe6fZgjNhJFf6lUKAx0A5uNzDgP/3fIfE+opLwjAJ/+WQ0eA==
X-Received: by 2002:adf:dc41:0:b0:2be:5c3b:9d28 with SMTP id
 m1-20020adfdc41000000b002be5c3b9d28mr15336959wrj.67.1674590410853; 
 Tue, 24 Jan 2023 12:00:10 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:10 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 14/14] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Tue, 24 Jan 2023 20:59:45 +0100
Message-Id: <20230124195945.181842-15-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
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
index 6982be48c6..f16916fd07 100644
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
2.39.0


