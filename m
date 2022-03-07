Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E62E4D0777
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:18:18 +0100 (CET)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIs5-00010B-FX
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq2-0006WS-JE; Mon, 07 Mar 2022 14:16:11 -0500
Received: from [2607:f8b0:4864:20::234] (port=39668
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq1-0005w8-AF; Mon, 07 Mar 2022 14:16:10 -0500
Received: by mail-oi1-x234.google.com with SMTP id j83so5638724oih.6;
 Mon, 07 Mar 2022 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZqC2tqWRaEws4L76k5C4aX9zCjhx7iXS9FGXRr/OCs=;
 b=G7IR0GQGsNGLj2x21XHD12uCVJArLAudFG3Qwidk565OsvTLzChHItAAKMzys/FbFM
 iQNdzWkBmCQLsoGbuHbYRqavVerodCPnpGwzveDoevI574eXf0LdWgGpma66clMARsFj
 NlRKlb7s/0zUzh6/z6hPiwn9LXWWjSH1tbktjRNnOgeYAwflObW/9bL5qVTeEIqsmMAH
 ghgsLZTH+dVDE9DyOZRo8v2yKvg0A7terAZgWvH2KH98gOY9PBmRzozKp/+vg+IFdEM8
 CoOYTghpMjgUY5W7CoCJjtnO2MFzReZ1oYwIM0HUkzXv73w8S5MFHzRko2HOiEKk0m9Y
 /v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZqC2tqWRaEws4L76k5C4aX9zCjhx7iXS9FGXRr/OCs=;
 b=RkNzi0DlztqcNqguVv+M8VCNEmw9Vh+73w7gc2T/WNSQCoXJENec86/0bNZZgJ5fVB
 Bf3rkCZvZ2V4AvW3S0T+Rz5yu4rV2r/yBnSzFHa1v47nNi32YfPQqcKThvalBwC66pY6
 qeVd8CxTPD4RJdN57FMGn4PA7jqSmr0ZzocYdDb/vA6LdjRvh5K0EiZJXU0dDCBlbNY1
 sqn6i8kVPfKwtwD7jH8ePBKKl8+yIOrt2AsRATl+rquDgu7YNnwWgSMB5A7uVQ7Nlbz2
 4NdLlLydUwU2i51Zst/WJWlAXklNoO/YagrwTVtK98NBZV6ize0B8d7b8jye0ayZSGf5
 E8vQ==
X-Gm-Message-State: AOAM532S92mRVSh3e25VJJ0rwHUUeaqJCBUeFudKqtC9OWuIs5dcVONA
 D9VGO3q+cyRA81JjzBySZ0yX2FwQzyA=
X-Google-Smtp-Source: ABdhPJxnCNsoDA4aZ8pk6cc0aIHl8Bdgq3blAsZi7R0wcNpuH08Z/ZA6hxKh4wTXO4yC9568itcCQg==
X-Received: by 2002:a05:6808:140c:b0:2cf:90b8:ad91 with SMTP id
 w12-20020a056808140c00b002cf90b8ad91mr279144oiv.33.1646680567648; 
 Mon, 07 Mar 2022 11:16:07 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/ppc/spapr_hcall.c: log h_clean_slb() as unsupported
Date: Mon,  7 Mar 2022 16:15:46 -0300
Message-Id: <20220307191553.429236-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f008290787..f6778d6857 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -865,7 +865,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
 static target_ulong h_clean_slb(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                 target_ulong opcode, target_ulong *args)
 {
-    qemu_log_mask(LOG_UNIMP, "Unimplemented SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
                   opcode, " (H_CLEAN_SLB)");
     return H_FUNCTION;
 }
-- 
2.35.1


