Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0846FC1E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 08:56:28 +0100 (CET)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvalX-0000h7-6z
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 02:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZn-0003Cg-KG
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:44:19 -0500
Received: from [2607:f8b0:4864:20::534] (port=43865
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZe-0007tf-EL
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:44:19 -0500
Received: by mail-pg1-x534.google.com with SMTP id q16so7333651pgq.10
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y+mqJ4xL6tI5ARhPPr8pHokzQAPeVkBysEFPtPP0KrM=;
 b=NmV8oSqGA1oZbSGp+WVuZ09bOe/m5yO+G/kseCOAreGsIO8zUm9s12f9oCooy35p7l
 a6jyZxRHrwAD+HbC0zBksvOwcYwV00dB0VRiHTyfjoBUGbiQBUBQNJdwvudgBu0jDfOA
 N82LBiqRBivMoXMn6nbMYuVfzHvfBji4eimxbV8Qdz/WxC1y4uBsHoeobEXx677CQXJo
 Hb8meQLYHmQVhr732g9YU9sy/WZBFbBGbb+01yOuYp43LgiedbkXMWaJ6LZZByDGEXWC
 +tQCM3Ao6c5OD+kWxhwqk8nLx1WrvQpys/jrnQnGD3X531TNgZN4AvHUStxaxflTaOM4
 dNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y+mqJ4xL6tI5ARhPPr8pHokzQAPeVkBysEFPtPP0KrM=;
 b=m4UgsPAkGQV1iHAVsc2PpOcIoCGNAWiYJK7oX382LKCxYbDFBgHqtImwz8BtWNnSIH
 s6ZxuZ8UTu4oDtiTlIWbyFb9DW8ov8YGgzUTxlDiSEP2Apegs25F1y2xWOZw2IvGUl++
 mMLCTabdh3ZlHSBAhqeYNC5TvkHVH95t2cXvloCZhyHaSHD6z0Qn1/51pMHjq5anth/Q
 7ONRPVQp+V+X34P51027ZsUmpM2YTv04Z8QXUQzIrcyOIEUJ15pgKk0suqVTgs7+/Aat
 NJk9aZx4LMuL5FoXPybnAFRAHl5ZmTK+yICjq/M/TpMGhIV4k419VUkqPuk2MiGmJIHE
 +YjQ==
X-Gm-Message-State: AOAM5337k1kh2OkqFLtwEZjNFy9xt13zBZMcamquv0Tw5DZyt1Rs4vru
 jb2gltkUs5TjK1s6tW5FyAq7+wzqixm5ijF5
X-Google-Smtp-Source: ABdhPJyLNeu4i5CphhcfZ8aQsixzrX4z8e8QUhT54+mLhbe+YwI2VssNfsF3dScZZHcyfx4oif7wdQ==
X-Received: by 2002:a63:42c4:: with SMTP id
 p187mr38270711pga.585.1639122249154; 
 Thu, 09 Dec 2021 23:44:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:44:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Fri, 10 Dec 2021 15:43:27 +0800
Message-Id: <20211210074329.5775-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0f808a5bee..9835829588 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,6 +630,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


