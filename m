Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EC4D07C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:33:37 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ6u-0003CJ-Qd
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqH-00076L-40; Mon, 07 Mar 2022 14:16:25 -0500
Received: from [2607:f8b0:4864:20::22e] (port=42920
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqF-0005yZ-J1; Mon, 07 Mar 2022 14:16:24 -0500
Received: by mail-oi1-x22e.google.com with SMTP id q189so670040oia.9;
 Mon, 07 Mar 2022 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksVu9IpA+ghWKaCiI8cvIiyWjIJRCNBiEozz6JbHPWs=;
 b=X2ihgi9heGxnhmM5wQ2rNtX+S2aQGQbfeEfbeWD8iUaydaD115zMeL6a23BYbjvKBY
 pfFvqvK/YwDf9j4+w7JrND9q6OnoKTaoIbgzMsVZg+RBm6LYpav+OGLk0L82QCLLcb+Z
 t6dDOJu3Wls9JZHoheetikusueTiJ3WnOUwtBUZy5qUjqAQ5PNP/oxR9R0d/EeiSxdsu
 WMPw44r1yZHSvucKtquzYgaxY3BjxqO+eKHaLsLmwSTPVMa/iMyu/NqLTBY1HGacpU9n
 XFfoFVLbfuXt5Pl5JOKcvBlsiCHVwfsYHii0YpLdQPdEtz5p0A/UQ//IezUb+yK9RJi7
 Afzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksVu9IpA+ghWKaCiI8cvIiyWjIJRCNBiEozz6JbHPWs=;
 b=sKcumWkUfuYQYA/Djnf9OBFfqJ7iFio3ErAt/cXFK863QbCHnLr6X6AZCznwiTJbCc
 pgN2Z/W3B74vl+1FuwB6LqEWhePH2fBDa7zDsTvd2dP43kOMvwCnmeHYaeAshkyPkwfM
 ZbqpGk2rauqTX8huHQAOrk9qpXqmEtRhYTVJBd0HWLzpxtf/hKs3xcBy1+su3PCorgCp
 CXqGF7ukNpTDA6KAf9XPTU+AEt7fCIcOmtWHd4gmlJrJKyKJPZkcAofAkLVZqEk2nL1Q
 xkPfTMGGMBDp8hqPvkcl/N3GlNV1DeURWy9wCCu79LOlBug1BGDqgFOedQwD9BXnki9/
 zn5g==
X-Gm-Message-State: AOAM532DeezFY3wOi2d2LQ6qnZn474towHUM9X2KeKP2xq4PrC9AeJuS
 sqFNMKwXr8joq1dlzc3c7REPNYOVzrk=
X-Google-Smtp-Source: ABdhPJyag3Q0edWJNG8j483kQEmrycrQ5gsYIsyiAtH++nxFCB5ughd8GmZ6aUEE++eJfUy8Dbtvlw==
X-Received: by 2002:a05:6808:23c1:b0:2d7:390e:5c2a with SMTP id
 bq1-20020a05680823c100b002d7390e5c2amr331987oib.108.1646680582168; 
 Mon, 07 Mar 2022 11:16:22 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:21 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/ppc/spapr_hcall.c: log H_VIOCTL as unsupported
Date: Mon,  7 Mar 2022 16:15:53 -0300
Message-Id: <20220307191553.429236-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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

H_VIOCTL is one of many VIO (Virtualized I/O) hcalls that we do not
support in QEMU. An AIX 7.2 guest will attempt to execute this hcall a
couple of times during boot, receiving H_FUNCTION replies every time,
and eventually give it up.

There are many VIO hcalls and we don't support none. H_VIOCTL seems to
be the one that convinces the guest that we don't have VIO support in
the platform, so let's add this one as unsupported in our model.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 14 ++++++++++++++
 include/hw/ppc/spapr.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f7240fbd41..ddaeea84fc 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1618,6 +1618,17 @@ static target_ulong h_query_vas_capabilities(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
+static target_ulong h_vioctl(PowerPCCPU *cpu,
+                             SpaprMachineState *spapr,
+                             target_ulong opcode,
+                             target_ulong *args)
+{
+    /* We do not support any VIO (Virtualized I/O) HCALL */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_VIOCTL)");
+    return H_FUNCTION;
+}
+
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1965,6 +1976,9 @@ static void hypercall_register_types(void)
     /* Unsupported VAS h-calls */
     spapr_register_hypercall(H_QUERY_VAS_CAPABILITIES,
                              h_query_vas_capabilities);
+
+    /* Unsupported Virtualized I/O (VIO) h-calls */
+    spapr_register_hypercall(H_VIOCTL, h_vioctl);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 10df519b0a..232ac7650d 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -530,6 +530,7 @@ struct SpaprMachineState {
 #define H_DEL_CONN              0x288
 #define H_JOIN                  0x298
 #define H_VASI_STATE            0x2A4
+#define H_VIOCTL                0x2A8
 #define H_ENABLE_CRQ            0x2B0
 #define H_GET_EM_PARMS          0x2B8
 #define H_SET_MPP               0x2D0
-- 
2.35.1


