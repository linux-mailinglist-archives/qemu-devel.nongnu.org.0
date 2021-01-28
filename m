Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAC307CE3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:46:40 +0100 (CET)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BNP-0001e0-Q9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJX-00089R-B7; Thu, 28 Jan 2021 12:42:39 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJQ-000875-G2; Thu, 28 Jan 2021 12:42:39 -0500
Received: by mail-qk1-x736.google.com with SMTP id d85so6055861qkg.5;
 Thu, 28 Jan 2021 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ATDWYb9nI+2OfgmowSKbjTerqXCLFRWBl7VnqTmmhs=;
 b=VbVomBGEJw5ZXO6BkEYrCn9/Otzn4F/iWbJlzH5jjrYOThRihj5hAN1rZ/XAiH8r8X
 SSkmXQNIZ+RIfZpTAxSg2fgB85od296rK+Dfz3RUL6Eqsvj+CwMlPA14muK/eseUDHSd
 Wt31vlfT4qp+34GGDNIPhgVkL4/v6sRGvGXlwyhd5bD4cwynCcDBvHDQkZ0vp8etTtcJ
 W3mlY/m0a6xm+vCNQMCPNgv/Nd5YeMrPfBWEmlC/3GWe1nIIZTK9XNAbQk2Hc77YaglC
 Ll7PZ1AuZaeQ4BCPpXsS1WgwkEOtp7qoYU5uSwxeAinKZRhAde3M1DgdMNsz1XRR/uhQ
 hMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ATDWYb9nI+2OfgmowSKbjTerqXCLFRWBl7VnqTmmhs=;
 b=WPuRBg7vYsJtLadxp053RunAoNsMHX+4b+2m9IxUB1+kUf3VvthGBN784RQXpWxiXd
 M2rluYn2lYs1mSF8KaV+FscD9Zw4/757YDEXOcdZj/HDh3Ra+AZw/KXoJCv8TO7VFZg8
 FdJIPRP1MZ28CDZPEz2LimI6ecgOXZyLMWbEuKOJpdqaQXyUlbubcA63+Bo+4qD+mbua
 hFZTsJoKix5eUxcGt7a5+Vr63WP1fMloZFfbgFzqryi7H8quc+crImMB1BdLNCvdinVz
 xYaGADEN2PNI5LomIs7K8lNGU/AhNuhBVQ79ZDpEkzrC2IvgWjsPkuQUDwyamgt5Mxcs
 +L1Q==
X-Gm-Message-State: AOAM530lO8i4l4xagHd3k5oTEMmVPhhs5eHCgB0xtMR3HUNpBo9MqpUG
 OHOceuU1ydPec2kqAfhkhT33crVjOng=
X-Google-Smtp-Source: ABdhPJwkZyliCU5gZllgj6BKUv4hCB1zlMlkvY89GzCvXe4oD1QZ/HKw36iEfUx+BBWYnFRay3A5ug==
X-Received: by 2002:a37:4c8:: with SMTP id 191mr292650qke.338.1611855749308;
 Thu, 28 Jan 2021 09:42:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id i8sm3804038qtr.84.2021.01.28.09.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 09:42:28 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] spapr_numa.c: fix ibm,
 max-associativity-domains calculation
Date: Thu, 28 Jan 2021 14:42:13 -0300
Message-Id: <20210128174213.1349181-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128174213.1349181-1-danielhb413@gmail.com>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current logic for calculating 'maxdomain' making it a sum of
numa_state->num_nodes with spapr->gpu_numa_id. spapr->gpu_numa_id is
used as a index to determine the next available NUMA id that a
given NVGPU can use.

The problem is that the initial value of gpu_numa_id, for any topology
that has more than one NUMA node, is equal to numa_state->num_nodes.
This means that our maxdomain will always be, at least, twice the
amount of existing NUMA nodes. This means that a guest with 4 NUMA
nodes will end up with the following max-associativity-domains:

rtas/ibm,max-associativity-domains
                 00000004 00000008 00000008 00000008 00000008

This overtuning of maxdomains doesn't go unnoticed in the guest, being
detected in SLUB during boot:

 dmesg | grep SLUB
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=8

SLUB is detecting 8 total nodes, with 4 nodes being online.

This patch fixes ibm,max-associativity-domains by considering the amount
of NVGPUs NUMA nodes presented in the guest, instead of just
spapr->gpu_numa_id.

Reported-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index a757dd88b8..779f18b994 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -311,6 +311,8 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+    uint32_t number_nvgpus_nodes = spapr->gpu_numa_id -
+                                   spapr_numa_initial_nvgpu_numa_id(ms);
     uint32_t refpoints[] = {
         cpu_to_be32(0x4),
         cpu_to_be32(0x3),
@@ -318,7 +320,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
         cpu_to_be32(0x1),
     };
     uint32_t nr_refpoints = ARRAY_SIZE(refpoints);
-    uint32_t maxdomain = ms->numa_state->num_nodes + spapr->gpu_numa_id;
+    uint32_t maxdomain = ms->numa_state->num_nodes + number_nvgpus_nodes;
     uint32_t maxdomains[] = {
         cpu_to_be32(4),
         cpu_to_be32(maxdomain),
-- 
2.26.2


