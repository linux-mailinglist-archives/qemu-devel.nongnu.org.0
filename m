Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A513A7354
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:37:28 +0200 (CEST)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy19-0005s5-3b
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxW-0008K3-6n; Mon, 14 Jun 2021 21:33:42 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxU-0002VP-GM; Mon, 14 Jun 2021 21:33:41 -0400
Received: by mail-qk1-x733.google.com with SMTP id j184so40436470qkd.6;
 Mon, 14 Jun 2021 18:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HoasKmU0HCAdf95ydCAzDe4K/CXVQEtjNSxIVUKPTWo=;
 b=MCbgDPNSSKMPnjNkWknY4imEkt+QqvUnGTYFjuMdrB43f4yCrNe3t0cymbbgfkd+Tt
 pMFdJW7jqgWsIdnfWCtDgutWOf+8zrQF8/q65k8e3MKrrIbJc1kCNiPO3155+WijE/zV
 COgfsiErArTNxnGlnMnAE55U+WOjYk2EHSTNaaXlhsR/ugVnY4Nx/GZytYsxoacMqn4l
 EMfRqd1y/6VzBHNYGnRYtFdUC41rMSK5hF6Bru7mjX+0Elpcsz+33zd26q8wDg6EDKID
 GWzRCd1tcT66YvlSYqOV5/HpnEsda0fxKr0OhokABlpk89C7gVjJbZ145xW9nDKpUyB4
 DuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HoasKmU0HCAdf95ydCAzDe4K/CXVQEtjNSxIVUKPTWo=;
 b=DLdAzKUdm5LYvOf60AY/PMPZBPbxuCAX77IBz8bwCNhXbQMHdMxbjxFPORHmGeik5c
 oc080kKk9X/U4KP5zpLIc/1/GAAcjzlfqdC0wvh3nkzZ6/hPfu6Auc1vXy2X49BBOvg1
 R9eHaUFs1DsEacT1Q1aDhm/LVSnuTdbeGaNw7jWZBYRRuw4VZFkT6dKKidw67RJZyPlN
 H66JQLUXumQsf3pLT3FFs0nZNcqUdgdh0S1FiHAz+q0gKacH1JA/Dx0+f95M73n6K4Sm
 /hwJHsxdUG7hq87qFr1erTF5b+84z20REbnQpkuWHeAf/wxpl5KAZ9h7KjFb2wFD0xWY
 dTHg==
X-Gm-Message-State: AOAM532MeGEcb04F9VNsc3Z6QO2k+BmXJWOfTDZTMyRCU5VDtNCXiQZR
 bix1ZK8rQN50KjPRxVWfm0TxYweBeANTFw==
X-Google-Smtp-Source: ABdhPJwzqdRsEjqITJObsfQ/gtdJ0Ow4+UisDlxrAmqdeB5b+mcQ1rIQmet7s0kpQmmjJvFSnPDoaA==
X-Received: by 2002:a05:620a:816:: with SMTP id
 s22mr20240097qks.222.1623720819164; 
 Mon, 14 Jun 2021 18:33:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/8] spapr_numa.c: wait for CAS before writing rtas DT
Date: Mon, 14 Jun 2021 22:33:04 -0300
Message-Id: <20210615013309.2833323-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_numa_write_rtas_dt() is called from spapr_dt_rtas(), which in
turned is called by spapr_build_fdt(). spapr_build_fdt() is called in
two places: spapr_machine_reset() and do_client_architecture_support().
When called in machine_reset() we're writing RTAS nodes with NUMA
artifacts without going through CAS first.

This is not an issue because we always write the same thing in DT, since
we support just FORM1 NUMA affinity. With the upcoming FORM2 support,
we're now reliant on guest choice to decide what to write.

Instead of taking a guess (e.g. default to FORM1, switch to FORM2 if
guest chooses it), postpone the writing of
ibm,associativity-reference-points and ibm,max-associativity-domains
until we're sure what was negotiated with the guest.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 04a86f9b5b..e1a7f80076 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -379,6 +379,10 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
  */
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
+    if (spapr_ovec_empty(spapr->ov5_cas)) {
+        return;
+    }
+
     spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
 }
 
-- 
2.31.1


