Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62584B85DA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:35:40 +0100 (CET)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHeu-00051v-0z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:35:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVc-0000UP-G7; Wed, 16 Feb 2022 05:26:04 -0500
Received: from [2607:f8b0:4864:20::634] (port=41743
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVb-0005Ge-1X; Wed, 16 Feb 2022 05:26:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id j4so1653295plj.8;
 Wed, 16 Feb 2022 02:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9mQ/2h1sAV4w5NAp70GeeP6yXNCUSlLbw3pISuDBLw=;
 b=Z3e6T+ZXARNAyb0nCPZhGkAp2fZkQ9OnRLJ8EYn6dfwXizthH4K1wbjopYadU7j/XV
 WU5CuGAHKEXXMws5JjdtcuEF4vU4YwLgV3xgPeIo7v6dp3afvWpP9+jzS6tBH/zMjDRG
 ncmzrJGpIWu7dJef7nqQAXEjFFI6zoPq1Zx4p3p8MJkAQbus6gq0Mpn0wECCh6YAM7AO
 3yM/omBs5bkh5IstPZGg+k82HTeJOe70undMDD1sSYaohNxZK2m3HZxtke4ns+0fg7dU
 tuGpn5uFHspZJxUlDIFjkRJGpun8AOTO1zrBu0HTLAt7INbpgReEWxDqe5ASsfdAlG1F
 ea9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9mQ/2h1sAV4w5NAp70GeeP6yXNCUSlLbw3pISuDBLw=;
 b=Yfl9UuwQoJpvlcM03VAMAnt6p5W24qb3V1ZoplZvTHjLr2h0JaQpfTsbThNRH71l2j
 l/30YG+fCxqB2nDPYbT/jS2D0ndpj4S3qSnUsnYvicxJxy/KmfA7momP+j1sFZ0ZBfXZ
 zZxw91mnPb7i5wiNMdju0/efCRYnZbMxBWgKmaGzQiLOVj9WmhK4/8cA3vNw431zWf1L
 44ZXozLoJYGr4WwLvrAhVZJMtj9zARJok6cSfnpWGKiPFafZuiW6VamqBv79jCu9P421
 O+I7weu/MCiw/ZNCIskAklb126R+jXUZjFSJSVJTkZYGi+23a+r/9375qcOdf/Z1l0XG
 GmTA==
X-Gm-Message-State: AOAM530tC4QsH1aplc3bPUmAWzS4zG9z9oZr4MDY2cznqUVegGFix6Kr
 JzBgV4jYrhK2vAY7E/3+JJhQ9K8PjUc=
X-Google-Smtp-Source: ABdhPJwwwBJA/628QLTXc+MqpQXGDDBQ9Fcawe8bNRAVVOXgmO2BNXd/XjDQifgwLhZEtmAOlCGBBg==
X-Received: by 2002:a17:90a:a385:b0:1b9:cfb8:de07 with SMTP id
 x5-20020a17090aa38500b001b9cfb8de07mr909090pjp.162.1645007161358; 
 Wed, 16 Feb 2022 02:26:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 1/9] target/ppc: raise HV interrupts for partition table
 entry problems
Date: Wed, 16 Feb 2022 20:25:37 +1000
Message-Id: <20220216102545.1808018-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Invalid or missing partition table entry exceptions should cause HV
interrupts. HDSISR is set to bad MMU config, which is consistent with
the ISA and experimentally matches what POWER9 generates.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mmu-radix64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index d4e16bd7db..df2fec80ce 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -556,13 +556,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
-- 
2.23.0


