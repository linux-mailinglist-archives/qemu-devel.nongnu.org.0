Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C94D07A9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:26:57 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ0S-00032j-BN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:26:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq9-0006fj-Ul; Mon, 07 Mar 2022 14:16:17 -0500
Received: from [2607:f8b0:4864:20::c34] (port=45588
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq7-0005xP-Hg; Mon, 07 Mar 2022 14:16:17 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so5743269oof.12; 
 Mon, 07 Mar 2022 11:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFhJX6sPwAsLk3zIu0zGlVQywYX19KE2BjcgVmZ5HXg=;
 b=oeVvooZAz1avhbRwqnVM0v5P8MEPzniaPADRugOdEbye2FzIEnRA5+qRL0IPc81v/G
 drZbdDY6PY1K2bt418juw+7Gsn0OQ5M18ZsZJxTZyh2Zqy0EdXNKOEhvgGNMwC8H6di6
 2RSnpp9AY9L+13XhubmxANslvD8rhMeUGgwERPFQ0NKHwaF9BR/VTd7qNqZxdpAruj5X
 WtsxVqvjUqOxom4elIXOynNAnOGg7Kt3WE7fogBIjh0/tlXvg+BqzdwT6lUCHfER+Gw/
 W923GtFXhAE4o8A+Fm2WkybePOuaZJjl8RgYnIBVDpr54i/BFDdunlu0TIpB9rQ1I/AF
 R6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFhJX6sPwAsLk3zIu0zGlVQywYX19KE2BjcgVmZ5HXg=;
 b=L54csg489eInJjU1C1e4TIKGNfcmYls3WHZb2q+K6ZLSOLupSMRydgEOW4lJdPdhti
 C1xJt/c/LTQPqFpZ/IYPg2TjGfOcdmRbCUpmD5fgCzpH849F+UBG//cnmEhu0fQjxMwy
 Qb+FqvS95Mn+sE3A4aDc1JYMjMl9tIWHVIvqtZxewY50uCQJDIGivC7sxpvPVUHBlam1
 GN+bDifuCKO23JqgYSNvoS2hId7KPhc3rGeuoL+kFk7Z0LUWFCJK4Vu51x6oqp+omOnx
 35XlHBdAg8prxdryOX95IbKr/Q+WLH70R14XMYjeKbM1e37Zhoq1f1wejLzbHACUWNdK
 0Jcw==
X-Gm-Message-State: AOAM5316zfhF4RzXtHSzXIGbO8DfDqokkeVRL6pfPJ5m8WScxAskMhh3
 GkDXCMya2Xh8JNfnY+9hCmHImrzlVK0=
X-Google-Smtp-Source: ABdhPJzBDZ3ncQIA7S6tcCTkpfAvf+/DSeuHPgTnmOfjroVBKXs4e3HRN/UGbp+1z6M7ROn3zDgtrg==
X-Received: by 2002:a05:6870:e243:b0:d9:aa9e:d6ee with SMTP id
 d3-20020a056870e24300b000d9aa9ed6eemr273300oac.43.1646680574140; 
 Mon, 07 Mar 2022 11:16:14 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/ppc/spapr_hcall.c: log H_GET_EM_PARMS as unsupported
Date: Mon,  7 Mar 2022 16:15:49 -0300
Message-Id: <20220307191553.429236-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
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

This hcall is part of the Partition Energy Management (PEM) option,
described in PAPR+ V2.89 section 14.14.2. We do not support any form of
energy management in QEMU, so instead of logging this hcall as
unimplemented let's log it as unsupported.

This hcall is popular with AIX 7.2. The terminal gets quite
busy with these debug messages using -d unsupp:

Unsupported SPAPR hcall 0x00000000000002b8 (H_GET_EM_PARMS)

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7cfb17689b..b572ef50bb 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1549,6 +1549,21 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
+static target_ulong h_get_em_parms(PowerPCCPU *cpu,
+                                   SpaprMachineState *spapr,
+                                   target_ulong opcode,
+                                   target_ulong *args)
+{
+    /*
+     * This HCALL returns energy management parameters as part of
+     * the PEM (Partition Energy Management) option. We do not
+     * support it.
+     */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_GET_EM_PARMS)");
+    return H_FUNCTION;
+}
+
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1887,6 +1902,8 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
     spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
     spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+
+    spapr_register_hypercall(H_GET_EM_PARMS, h_get_em_parms);
 }
 
 type_init(hypercall_register_types)
-- 
2.35.1


