Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D6E64607C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 18:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yQS-0004dO-Ky; Wed, 07 Dec 2022 12:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQQ-0004cu-6w
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:42 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQO-0001o4-GW
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:41 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so1613102wms.4
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HprJgxpG2xWV0l1kcFBdaZiE2sB4TDOLYNMLAL73SA4=;
 b=nCmn0kA4q53OJwwr/afzFMrpn4JqrHcOCXhhWEQz9tS60mFP08JAjhfQI0rUCYyq7Y
 BAn56lddQ5m4PSHbyRiN1RMkl7blEcfRYeO6jkWa+E39tQ0QOHoP++P6IIjhNHNIQitK
 rEbO8NgwUjWBvUBIorzjPFUuorswpULfJgj0/eqCJMIbElTar74bZiJZfsUulXph/YiR
 LJIlgjDKXxv2QE10F9Fap1glaajxKAhe+lCJ4hMaQ9LaSXRDxd5no5JzPpMgdcz9Pm+H
 XBEqleyu/6svC+dfh+C0cacXCCaJkNh+fYarDK1vh09VFAuwvbe24NDOWcNIxv1c3OB1
 hd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HprJgxpG2xWV0l1kcFBdaZiE2sB4TDOLYNMLAL73SA4=;
 b=XkBqYDTJvFCH9J47P5+Q4tCki6LYuM9gk8n12Y1rVfkpyeT8wsx4DmF0tT4zP6W69f
 TYAKnQFvfnf538xrX9cKTOuReJFFAej7+2/BVZv7lx7M6dZH2fkCPx55mPS2/CEMzNVU
 uDy1wZ9gUNZxiHG1CPjE6jAqcwmtJOR+hcWSx4zKCWRE45XNzIMTjw1ldfsJ2+G97pVc
 JN/iByTNWL0Y4z//XpG/jC3Gd6VSOjm2A48wejtoZ04NgL25feXt4yQGuBAx+LE5vmxa
 kjYWuCDUReKQnGgd3EMsQP8EhSPs0pNb69inRoaFlB+TxKIfFMyh9LHkpvJjKNUED/17
 stuw==
X-Gm-Message-State: ANoB5pk6kSyNHpM3NM8IdZbSRo8j7qHNIMB42RcPHBiVaqL456ddof7l
 XeSF9Oe3miamf9xKFxDxBaj4IbWDTeGgHDgs0q8=
X-Google-Smtp-Source: AA0mqf4kowpRLozhNa42OXs7AX4FjZCJgcAdfWv/dInE44Jmd1NHzMmiJ7Y2m+1wPMY4SNfLftfDoA==
X-Received: by 2002:a05:600c:1907:b0:3cf:7981:9a7 with SMTP id
 j7-20020a05600c190700b003cf798109a7mr66799556wmq.87.1670434898527; 
 Wed, 07 Dec 2022 09:41:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b003b4cba4ef71sm3063858wmp.41.2022.12.07.09.41.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Dec 2022 09:41:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH-for-8.0 1/4] cputlb: Restrict SavedIOTLB to system emulation
Date: Wed,  7 Dec 2022 18:41:26 +0100
Message-Id: <20221207174129.77593-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207174129.77593-1-philmd@linaro.org>
References: <20221207174129.77593-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
case of reset") added the SavedIOTLB structure -- which is
system emulation specific -- in the generic CPUState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c    | 4 ++--
 include/hw/core/cpu.h | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6f1c00682b..0ea96fbcdf 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1395,7 +1395,7 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
 static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
                             hwaddr mr_offset)
 {
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
     SavedIOTLB *saved = &cs->saved_iotlb;
     saved->section = section;
     saved->mr_offset = mr_offset;
@@ -1699,7 +1699,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return qemu_ram_addr_from_host_nofail(p);
 }
 
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
 /*
  * Perform a TLB lookup and populate the qemu_plugin_hwaddr structure.
  * This should be a hot path as we will have just looked this path up
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..bc3229ae13 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -222,7 +222,7 @@ struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
 /*
  * For plugins we sometime need to save the resolved iotlb data before
  * the memory regions get moved around  by io_writex.
@@ -406,9 +406,11 @@ struct CPUState {
 
 #ifdef CONFIG_PLUGIN
     GArray *plugin_mem_cbs;
+#if !defined(CONFIG_USER_ONLY)
     /* saved iotlb data from io_writex */
     SavedIOTLB saved_iotlb;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_PLUGIN */
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
-- 
2.38.1


