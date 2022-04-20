Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA65092D5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:30:05 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIpn-0000qr-7m
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdm-0008Nc-Ab; Wed, 20 Apr 2022 18:17:38 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdk-00066b-NW; Wed, 20 Apr 2022 18:17:38 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3520816fac.4; 
 Wed, 20 Apr 2022 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CP4atOT2Hjcn7eQA7df4fCZBK7rSDi+ffALBgdLljTA=;
 b=LTycMdGDJ2S8HIOO3jtK5v7RoA8cA+Dccj7u4GVvQSX/923L6qJjRuTfXv07K7TWRj
 LBcEGWP0nKZin2xD+UcqoFsVbr9DmI42l8Ls4wduAn2yk1mC6wC5Q0PIUqxB0VBWzHx/
 eeN9OdCiAAGYgaT4R8uBOWPbYRbB0HPnQhBZgBW/tqb+2U8bxB0G4nnAWJZw3AboYCar
 3xD8xj88jT9eP1igTikLBldOEPzijlRXqq79jbGYvWIDpeIehr9ex8M71HCYI+wsruST
 QBluxXlV4VhDc5QY0xv6L0s9mg+nuOsV/2Hx9IkjSB4v/IPOVHYj23n04rx7ogXAVgCH
 sSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CP4atOT2Hjcn7eQA7df4fCZBK7rSDi+ffALBgdLljTA=;
 b=RA22PH3z0PDOBY/6b1epiU2SB7IfzZPnN6nZTybUb4eM7YHJ2fgRYHSN/jeAVvRFdU
 FMIBF1d9wg/0cWappnlhikxaPxIjFHwitpnLv1eehyL6D3IqvGtEMN2pN9CuqjIJvWPF
 Dcv5SHtmxJ6DFIYf4oOkSNqC8TZDN7ssb79+8/vOsWJjYgit3q8jwfTfCv1BBvBGDXWS
 hSEbY0JTDtTnm2M9TDeN1NDmg336ruK53f4MMBAlJ7xXZHXWxR+/La65SGlQ71yXH9bm
 NKx5HQQK4XostAg1FsoA7H2c8lnJ7kknq4E0DNPeCzmYWxGR3cSitzJqtSdHU/4QdxFY
 wufQ==
X-Gm-Message-State: AOAM530r5NixFa5ooGbyTr3tawHmJdsF9HP+32hzmJ/vtPf9z0UgQ3Ue
 u8hCOQwN6KzcScM1ke6Q9Ap5tUdUpek=
X-Google-Smtp-Source: ABdhPJycoI76Ta9dVn87KDgDxxvQRsB1kskOmoFGyIgrcsTxd2yyOSuJJH6kc6XSudAAtIaCxlz9Ww==
X-Received: by 2002:a05:6870:51cd:b0:e6:589e:1ec6 with SMTP id
 b13-20020a05687051cd00b000e6589e1ec6mr1430425oaj.207.1650493055222; 
 Wed, 20 Apr 2022 15:17:35 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] target/ppc: Improve KVM hypercall trace
Date: Wed, 20 Apr 2022 19:13:16 -0300
Message-Id: <20220420221329.169755-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Before:

  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall

After:

  kvm_handle_papr_hcall 0x3a8
  kvm_handle_papr_hcall 0x3ac
  kvm_handle_papr_hcall 0x108
  kvm_handle_papr_hcall 0x104
  kvm_handle_papr_hcall 0x104
  kvm_handle_papr_hcall 0x108

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220325223316.276494-1-farosas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c        | 2 +-
 target/ppc/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index f905a2af17..a3c31b4e48 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1680,7 +1680,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         break;
 #if defined(TARGET_PPC64)
     case KVM_EXIT_PAPR_HCALL:
-        trace_kvm_handle_papr_hcall();
+        trace_kvm_handle_papr_hcall(run->papr_hcall.nr);
         run->papr_hcall.ret = spapr_hypercall(cpu,
                                               run->papr_hcall.nr,
                                               run->papr_hcall.args);
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 53b107f56e..a79f1b4370 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -23,7 +23,7 @@ kvm_failed_get_vpa(void) "Warning: Unable to get VPA information from KVM"
 kvm_handle_dcr_write(void) "handle dcr write"
 kvm_handle_dcr_read(void) "handle dcr read"
 kvm_handle_halt(void) "handle halt"
-kvm_handle_papr_hcall(void) "handle PAPR hypercall"
+kvm_handle_papr_hcall(uint64_t hcall) "0x%" PRIx64
 kvm_handle_epr(void) "handle epr"
 kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
 kvm_handle_debug_exception(void) "handle debug exception"
-- 
2.35.1


