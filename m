Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8E480EFF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:47:04 +0100 (CET)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2OzX-00051q-Dr
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnM-00044u-Lz
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:28 -0500
Received: from [2607:f8b0:4864:20::62e] (port=34350
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnL-0004ep-4y
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:28 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x15so14847324plg.1
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N03Xkux9la2UybCMyY074pwvy5+acptGJ9BHqYtpSWA=;
 b=ljjLMVnwm3sFudrKReD2vy0qXzF50cr8X15TaBAPe4hSF5z/eOgQQ6b5SkcEP4aZxN
 G1sfOPhEBAl2SHihCdHvbngVBPxPCKWjbaNuPyqxk2pp7maWAPuOuNANIBhzvOKPrFLb
 KDaWspspGNLP3v04+0W2TGMks9Z7gh9QrI3ueneSD946CK/Ovrom0s4IYIuBWitTaE6o
 EC4v3jYHeQYaLhRlsZ0+ItKac4I+BD1EXVqzT0g2mhLH+Rz94DhHY6Lp5zoZtX0Zfe09
 GqygkVtvpEfVwY14YB3rPypCVrTDuKloylOfefoDiOwOFaj+IwVwiwyvQvlTwk9YTQoG
 rjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N03Xkux9la2UybCMyY074pwvy5+acptGJ9BHqYtpSWA=;
 b=x1USyOg32kxvKkKADvXzM+t72/jF9GuC5wt2oWgmzzkCSrEZQ3GW5J2C7u4HKbmoV1
 pbXUEFjYM0/aaQGuZWoe+SpAOMlB+AtHnmGT0NOJtjfkxgP9UFfHB1WVOthLLkUS6iyh
 7/kyRO+n3X0Foy5F6kKI0lfwBPTwVJ4tTCu0dzxsS7/CxFi3e8/pVbNF+fcaP5v3uSnO
 pqZ0ldgX//OzdaisOIetl8wJgSHE+G+CtIr4ATMJSyjcQO9EIg7OeSQ2JPalKnRJ+9t1
 YtQ7usNmPt91vYtHjdsZ9EybuLBnv39MzE/PdpcI9cbg6N5tkgJiV6YgMYQukgSi9D6o
 5nBg==
X-Gm-Message-State: AOAM533I1P4ZCnkI4ZUaODmpmFdntUqbxS9RR5B1C1oB4IBow7ElcoZh
 yW+MfhletSfzT8QbpsPT8oS6QvZMskUR82QX
X-Google-Smtp-Source: ABdhPJwugzM4QBlUZalJVypEM3DgZGOTu42By2+F6AmIf9Fq3jM+vsWklqQEBwWT2us+4MBK2ZJKPg==
X-Received: by 2002:a17:90b:1956:: with SMTP id
 nk22mr29453458pjb.38.1640745265694; 
 Tue, 28 Dec 2021 18:34:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] target/riscv: rvv-1.0: Allow Zve64f extension to be
 turned on
Date: Wed, 29 Dec 2021 10:33:37 +0800
Message-Id: <20211229023348.12606-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 01239620ca..38cd11a8ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


