Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373675F2FF0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 13:58:48 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofK5v-0002Y0-Ag
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 07:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJvG-0000zO-1j
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJvE-0005mj-DY
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:45 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z20so2922300plb.10
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CpL67v/QuEdwqwhAKdFo9b4ObOFi1m7vj+5ABrNK4JQ=;
 b=WNTfpj/HbTU1mAHzij/nYf/IdhxtqkrSw3fRe4u7JMduAHE8xgzTWs0wqBTk7OWH9t
 w4w4NHttg6A+JiXxk0jwCbkInfRreCYcRHDtihbR3Wiq6VrsPo1QyUQTNs1MHL6Rr3P+
 Y6wtnaQVF+sU2SrPejAkhsQa5JRU9W6yZ3e3V0DAFldJLfh+K6RgnDdi8OiSwUtRJUKS
 tsyM9ZzdSukZJSgGg3notANEu5L+g42yLY2ExaGmWKq5ID7OU9NpFfu5co9e2xL0YmX7
 OYSWH/oVGl5rZH7T7y9zmBoFcnzrtHt7KJr8/GEJeNMZaGYrgKwU+KBGKEX9nATpzcie
 VhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CpL67v/QuEdwqwhAKdFo9b4ObOFi1m7vj+5ABrNK4JQ=;
 b=71cJXctSquT0n9Jr0SXWGLfle3egMPYpc9NTxDYbnHhRdwgv/RZQD1RR5q8+rh5ejF
 i2NeCZjPRyJM+DyCXS7b2WchOocjHZIELPb8EwNvS+kTHNbk1MTZgPxGNsEODZFFoXfk
 0KsrIFV3mkCjPWwfXDMSO4XbQdp+iHTSOGMt4TdSUm0IYK7ZZB98Vs7AyyY/Xe4n64N0
 hXYCWHao3shhdixSbk9gVuhOqPf2BPmsaWX6x7h8EcUOSEvZg5PbmklMXfV6d63DJXIT
 U1kRXwuxMPrS5KSvQ3Z3YuEVikLhtJ2iYaw3+RS4jY5x1Cw9ySQYNFtGUoDwDlI95DAT
 TmXQ==
X-Gm-Message-State: ACrzQf3z3QxXEL9JoLD1X/WNf4EKMMvgF9pO76+X1M2Rd4u5yOzKUtq6
 VbN4yv6sAp2YDA9JhvQ0Oq5WfRj3TkR69Q==
X-Google-Smtp-Source: AMsMyM5ZanqgqDvTot1W93uxoQW/DrgCfBHb+8imHKmCyhHgB22sMb6muFDdQUc5j+wSSNPeC13mbg==
X-Received: by 2002:a17:90b:3811:b0:202:9e26:bc00 with SMTP id
 mq17-20020a17090b381100b002029e26bc00mr11987659pjb.223.1664797663323; 
 Mon, 03 Oct 2022 04:47:43 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ix17-20020a170902f81100b001789b724712sm6979753plb.232.2022.10.03.04.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 04:47:42 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v10 5/5] target/riscv: smstateen knobs
Date: Mon,  3 Oct 2022 17:17:18 +0530
Message-Id: <20221003114718.30659-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003114718.30659-1-mchitale@ventanamicro.com>
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b29c88b9f0..6f065f4e5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -102,6 +102,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1012,6 +1013,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


