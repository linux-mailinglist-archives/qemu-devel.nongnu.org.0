Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16FC4ADE36
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:22:45 +0100 (CET)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTGO-000736-O0
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLN-00012R-Ux
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:50 -0500
Received: from [2607:f8b0:4864:20::42e] (port=35531
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSL7-0000LJ-0X
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:49 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z35so2352095pfw.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtxe9Y93qIuCM0racMwgqtnjaGKZPQJYzdIVlLbol78=;
 b=I8rNZr/9zcEK+Vq/KyM8CrsHYJMYKxV2eLmey/ZoaC06+wA7Fa+skLS9ZF7rOm3kkk
 FR2pIbgZT1cl1DiysM2hMTs2Pu6jqDGKlpAWNFrTGyoJtGGmZls0jECOKP8dEQN4wuNL
 zUslzLKb6mc/vxj5DaAGsw5zaduYDPfGQFktvhXZml/vX75pndwONzoSMwLzNKkjPGld
 hIh2/bTiQLTv2cfoJT2o42s4TVndsp5sCVyv23UQIriFBAarHBO6KiB4YmQLik7HcDvj
 ttXbgJIr5L9aZfNgVoHsQOnAGm+ocNC0TWnjfD+16+RhxTXSox+2XrcDBjkP3BqJk9G3
 t4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rtxe9Y93qIuCM0racMwgqtnjaGKZPQJYzdIVlLbol78=;
 b=Wf67a6MWnXTcfWF8T7roKHWifJem6jVBRPhh70KalZ2ONFeRtIeitLg+1d/zWSIwXT
 ymJ2vM5XiqTcIW73j0hsr/hqalPSxHv7n843BvQbJhsUOSrVh9SRT/gHZr+WkFSO89DE
 rhx9foCHVvdMO5x4qATSJzTpSoZRHNDQtaXhEohCQ5q983CIdbog3ntkPpajg4b7Ut/e
 BA9KNJiaOII6MibYvnx1C6uj+xi5n9AZn3phMnQyTVHcTOEk7HCDNtDrjfSI/fpGDEep
 hlSgc8i6p2zWYR8tUStfvewyUueIgug8YgKluwCuO7Meuxsts7P/CZfn8HhapgXG1Kww
 tBOQ==
X-Gm-Message-State: AOAM532RLZ5sKCCEBU4iOE0AH/DvWQQN5yyDJCc0bGfSnR2kUW3n8d+x
 fofhRuabvBk1u8+unBRTPI4PHjFQzo8=
X-Google-Smtp-Source: ABdhPJxC6bnKdN3J4b5gFVHI70nrLu4iso9aeYErA97WnAMmEVQ39umtEibZRuepMxYyq9FfrQgujw==
X-Received: by 2002:a63:e70b:: with SMTP id b11mr3868540pgi.161.1644333810059; 
 Tue, 08 Feb 2022 07:23:30 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm16838889pfi.124.2022.02.08.07.23.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 05/13] target/i386/tcg/sysemu: Include missing
 'exec/exec-all.h' header
Date: Tue,  8 Feb 2022 16:22:35 +0100
Message-Id: <20220208152243.16452-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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


