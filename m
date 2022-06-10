Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10943545BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:29:28 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzXD5-00010H-53
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWyA-0003WX-Ln
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:14:02 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy8-0007eQ-BG
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:14:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id x4so14333466pfj.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWKC5tQ4tBOQrwb28nnVJfZM/pEKDjOk1JeW0xU9EVY=;
 b=PZHIxRFSL5e4IHr1Cc0whdh4DWBE8z1JgRTKIthoJNmcqIARJY6qJpjewp3saye6pj
 gDvM+LdBDhCohkmO3bJH/gwjQ9k457K5UxTReovL6E1V3hASAwzI3+sYiFRbNpYrLk++
 QC1n4EdVhs4T8gZfKRGkgHwt4en6RSgXU0DK1sH/RlThf1e3eZ2GF6KV/hb3mYxkUZNQ
 qvkHK+7kU/VyH/F/aFkT1/W95/4IoCBHIV6fI+ijwjOBcqvj7SIFkObVS7Fz3RuAMi2r
 tp6ZrOkqVirDDDchZlACUFKX9oiQJ1WuCVpgvS+S91dGiJWUbrLRwNg+CpjqOfMDVV5N
 6dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWKC5tQ4tBOQrwb28nnVJfZM/pEKDjOk1JeW0xU9EVY=;
 b=iXT+u/5WD9KurJSwoIQx2wkwIujJmlFXav0AC6ze1eXG7D/TyPqKkJXGVVQocprwO5
 xtCuXj2xdcD/aq7CT82edBZyyzT6uvcWOzePb+M7SOzDPgvUIbvYlNies/NMdzk+ti/z
 0CS3jjnXI9nUfLB1S4GTFNWrPQkthnepO5I7v+H/OV3DKOw63DnshX1w16hsElzAiUpP
 PCma7aXSrAqtbCIlxqz/J50rFrtn3kKEJkQl+IUleo1sL9w6XgIMjh06dYgiDH+XL3vH
 6ssqmZtnmo9lqHwfG10RgvzO0bIQhQePQh3vHd+igsX0qth00F+FAa8ed/XuMoTBCZCH
 W9kQ==
X-Gm-Message-State: AOAM531FDtEsNE2Cvz2s5Dg2NLdRHwBnOMr7inF4OVSu0yHpLWBQpzkQ
 DPQzDR+vs8oaXdYjrGnQ+Is/WZaRQ0PoHQ==
X-Google-Smtp-Source: ABdhPJzL+dNA/gWLHqCQGBElv8AYfnMlHoSUzwz+9Ku9Z3pJqW5u/s+7uADA93W1W/BJaxGYDXekpw==
X-Received: by 2002:a63:1543:0:b0:3fa:8e73:d7a5 with SMTP id
 3-20020a631543000000b003fa8e73d7a5mr37776119pgv.160.1654838038072; 
 Thu, 09 Jun 2022 22:13:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 8/9] target/riscv: debug: Return 0 if previous value written
 to tselect >= number of triggers
Date: Fri, 10 Jun 2022 13:13:25 +0800
Message-Id: <20220610051328.7078-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

If the value written to tselect is greater than or equal to the number
of supported triggers, then the following reads of tselect would return
value 0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h   | 1 +
 target/riscv/debug.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bac5f00722..c7ee3f80e6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -289,6 +289,7 @@ struct CPUArchState {
 
     /* trigger module */
     target_ulong trigger_cur;
+    target_ulong trigger_prev;
     target_ulong tdata1[RV_MAX_TRIGGERS];
     target_ulong tdata2[RV_MAX_TRIGGERS];
     target_ulong tdata3[RV_MAX_TRIGGERS];
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index ce9ff15d75..83b72fa1b9 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -158,6 +158,10 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
 
 target_ulong tselect_csr_read(CPURISCVState *env)
 {
+    if (env->trigger_prev >= RV_MAX_TRIGGERS) {
+        return 0;
+    }
+
     return env->trigger_cur;
 }
 
@@ -166,6 +170,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val)
     if (val < RV_MAX_TRIGGERS) {
         env->trigger_cur = val;
     }
+
+    env->trigger_prev = val;
 }
 
 static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
-- 
2.36.1


