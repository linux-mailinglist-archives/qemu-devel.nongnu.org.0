Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CC68376C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMx7g-00073L-U5; Tue, 31 Jan 2023 15:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7T-0006v9-4a
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:43 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7Q-0002vl-Vz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id bk16so15339073wrb.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 12:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=VPxikWJqZJrtBu1Pos5YXivoQ3Xgu7Re4C9is/oYEsPM/TuZz+8ousjy56t6V25hbL
 fArTHYMIbsBs7q7zBNllWB6BGu0DEf4c8FfEmEF65Rb2stOauC0i77CBLEQL91yejsBr
 +d1EYpN5k0yqFRLicyOiJMkoWMjHpNZrcPGPko3Zh8cSJHT07hn6DvV4h+z7FP7d5obn
 IfjR/hp8uudQMhdePhL9Pv4FbBwdrzz4pX9yDS8uHxIn9l1FhaGcrLSUuiPravT3jtV/
 ADSgz05fIzyr8U5a/3OZvQpHADHcU7jOdR/+xitTfQkbxQ1c+QHslvrh1Qd7KCg4yLT+
 q3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztCilUCc1TA2sITRxRLcH39NMH4uHHWLjoD1hpEHldM=;
 b=hngC19jfwhgdHSr55Od2WdMGOmU4w27xNMJpFI1w3oXw7XOb73WihMpb9RLGQWAwvB
 VVz0DS9aGSvRLA/jmZDrxJp0WE8PjOdFFw0MLWD0h9b32/qpZ9PR+XKKezxkxqUDSz6p
 mjLHfqM0S+AMYIJwW2QGmgzzluyZFLY/Uwz0ghVcK1KjjrWGzG7bOB5oBrOCugwqCM/t
 gZeHVX0gP2VP4EAG3dQF5sOFXe5BTB1fZdTy3rnKG92fYLbyK6hrmwEiScICt4bHj68y
 74LBV/1l4eYeNiBJbB/+yQ9DC16B2iL3/qS3qZrJ1QfTZjzE9nQQKSTuKcrIJbUwnkK/
 I4IA==
X-Gm-Message-State: AO0yUKWWRz4wX2H+e/3LU452jN4H5X2h/9KJ5/1JGyDF+8EVvWNDxN0z
 HhoQH3cqeeCbIPGGk0mGczueqQ==
X-Google-Smtp-Source: AK7set+a6yEvzExo1SdzDHufeAJy4by1vPJVgdgY/Fh+K5S3L2JevVysEz+HD+1iBVRBo+3OdxRGQw==
X-Received: by 2002:a5d:6501:0:b0:2c2:de2b:e7cd with SMTP id
 x1-20020a5d6501000000b002c2de2be7cdmr290196wru.50.1675196439782; 
 Tue, 31 Jan 2023 12:20:39 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:38 -0800 (PST)
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
Subject: [PATCH v5 14/14] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Tue, 31 Jan 2023 21:20:13 +0100
Message-Id: <20230131202013.2541053-15-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x436.google.com
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


