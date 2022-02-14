Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276104B5A42
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:56:50 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgWn-0006ZX-9A
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9d-00005o-DD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:53 -0500
Received: from [2607:f8b0:4864:20::1033] (port=55223
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9b-0002dK-LD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b8so3491780pjb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEX583CN6Lejo1CTi/cSn0WJLHR6qP5OaDMjAKT4qKE=;
 b=Fhmjlz5kLJQfqu81cOzxr8vh8cKSTrQbROw+kW4v87oiWSx7b3cwnTLPiM2GSXxf0J
 +ai2r6roqlz1PPy6yOlso2pmjc/UcKR03ZOm46+hI8iuoIKa8IpgMcBt+x0WZ3QDUclH
 FwQrTov5baGstgDtFGMYr0CwZ1gNfvi77FgOEXHFQyJATBm9N30p2wyeM1YucdivFVP3
 md1XYXKfx2xhwMLfrE/n6hcYHoaaqL3fP042gxzV/vuM9uhhPKp6Bv/CbG7kDdPmnjKi
 0mYDLegxx5WORzI8zLQ4IUjJy58qgo9Ox5W95d4HRmlIKFlkOEHvQmyzzFKkSlg7K8bO
 oOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEX583CN6Lejo1CTi/cSn0WJLHR6qP5OaDMjAKT4qKE=;
 b=a1Ky0zhNCgSohsdLTQzvmBszwNNzyPTH1WIMfqnxy5jh8YEaHJDrhCyRImTf4h2wqI
 zl8ZxoJShJ6hyU5Z7coxegV5/teBMEWFpG6Hy79LuaNLXNp5Hrmn1ezBFRw1zdxYnWaB
 tPSfhhM3hUXJeaaabS+jFfICm7DPRvXaoe8MV52I1k1lz7pQZrl+eBtrL9KI681yNMcV
 dmfw2iJ9qjZLU/N87JkrYF72fAPn/Y/Lf6WdgC6k5u/7Vwwu0RuOpixslAQyDLkN2GzB
 SqjF+Vkk2Hk8S0QHx4zhgESA/+pfTbDISvEuaWA2EOcf4tVQ4CsjjJgN3m28+fvVRxvx
 iyRg==
X-Gm-Message-State: AOAM531piAqquJWLT67zFeqjq1e1x19gBzhHEpxPzicdYmM4jf5FDd3G
 0hAwFiqqUKuSeMcCZ7kIBIfl/ZhjQT4=
X-Google-Smtp-Source: ABdhPJxII5ssMQ8CukCJkTjYxLJswi71dHfONxl/kq/tx11q6s1Zl487xblVIV2Q01OBF+5cfzXOxQ==
X-Received: by 2002:a17:902:b111:: with SMTP id
 q17mr103181plr.11.1644863570321; 
 Mon, 14 Feb 2022 10:32:50 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q9sm240281pgf.73.2022.02.14.10.32.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 07/14] target/i386/tcg/sysemu: Include missing
 'exec/exec-all.h' header
Date: Mon, 14 Feb 2022 19:31:37 +0100
Message-Id: <20220214183144.27402-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

excp_helper.c requires "exec/exec-all.h" for tlb_set_page_with_attrs()
and misc_helper.c for tlb_flush().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 5ba739fbed..5627772e7c 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 int get_pg_mode(CPUX86State *env)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 9ccaa054c4..3715c1e262 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
-- 
2.34.1


