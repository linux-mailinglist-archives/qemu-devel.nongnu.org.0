Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E544343C1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:14:18 +0200 (CEST)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md23V-0001yy-JZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1x5-0001dw-B3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:07:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1x1-00030d-3m
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:07:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id y7so1690697pfg.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ7ceHlIpxNMvHRzw6T15tg2TuDRPoXAXK95E1+Gc3c=;
 b=Ks2MwCc5i1q0HdGeQ/g6fhXCNMEdRwONUrAeH5LslwWoQW1Rs7DFaaVZpFm6LJT3Zt
 th2F9jT+y1b3f/V89vwrblGKyddhJ+fpkokwjuGlJzyNHGMFZFDQe4qMf8agaNH3z8oG
 VYa6DcX4buRISkPR6vgOle625ngbaMFMc0R311QYv+H76aXhE/Cwla8Bd9h82WlvUivZ
 ZK3jB2pjjC5HJqlmHRn0N4ZB3NT100DZZSdlycgR0AArfaoF8hq/Q0qngKu3SRftPgej
 qvOh6im9gmLVUqBND5REgIm+lZ07Q93hazFk2xXmyyHnKzn09Ms25re316eIDjwiWVa7
 OF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ7ceHlIpxNMvHRzw6T15tg2TuDRPoXAXK95E1+Gc3c=;
 b=1e4uatfsdmOVQNAxhxiGcs9QO+MfHyE41I0wfoi1JhtG7dOieIEgUVZRmnslS1MmBg
 CkIT+mK5bwrZ8aIuEQkGc1+ZScv2T3ACt5W4i9LJkJCIEw1FVaabOk3ZVYqrD9WxsIM9
 juWysE5S7n4vfJMsBXM48kS4EM4ILsVkfvkn2VHz0JnhP900xmmllc/O3Ypr3FXdGKZ9
 Cg1WHZpwOvNmqqx/BF8JYTqPVqDcGqZzcFxcKp5fQ/cnaA7d4l2ozT15yGNV5EH/rC5K
 d3VFstbbTmn7bxv0XG1D1KsJv8qNj+tbkyiQgLeiLXQMisCdcLgXNWcS06ih2/rWjU04
 17vQ==
X-Gm-Message-State: AOAM532OmbumGUL3cFDUepWA56JB5QcYKiUGiTDrYiHw8EDhkmFuujng
 1CAYmRFNwpIikA8gjQrRjhXsQg==
X-Google-Smtp-Source: ABdhPJzSmI4Csajy70g+eehW1iNxX3C6mtHuLcTS+VDbZXR0oGyjrd96EwIRqgeiQq+OG8fNfly2Fw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr31419323pgc.173.1634699253875; 
 Tue, 19 Oct 2021 20:07:33 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v4 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Wed, 20 Oct 2021 11:06:51 +0800
Message-Id: <20211020030653.213565-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8c579dc297b..4c0e6532164 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-- 
2.25.1


