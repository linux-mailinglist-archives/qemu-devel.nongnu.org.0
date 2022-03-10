Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4284D514C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:36:15 +0100 (CET)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNe2-0004MW-49
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYU-0007xf-GR; Thu, 10 Mar 2022 13:30:30 -0500
Received: from [2607:f8b0:4864:20::230] (port=43718
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYS-0006Rb-Up; Thu, 10 Mar 2022 13:30:30 -0500
Received: by mail-oi1-x230.google.com with SMTP id w127so6817110oig.10;
 Thu, 10 Mar 2022 10:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAZAiikDyxve7wBEmtVsELwtGoA6EcbwB2QbKMraC8c=;
 b=PaLuTSss7cS3ZSY/Te3JI25qZ5eSe9KnUt9Ri7qL5cLEcATBT0JlhFkB6X3g2wxIGU
 l7mW/3UP+PYlR/z0BGXUAvn+R9XhbD0jar0+KjydwoZy4BnZUmgAJ2ERaQh+42ckWLRn
 DODrgDgEOtQLrt2SE7LQX9yyR8GjFRORwl4gl1OSOyndgRHEN6QP9psGpRpM3Sx6tJzk
 HMZ9gdYVJuUcJCGzSlASi1Y6H7/oQQMeOgKakJLp4VwX1dFFHSmHy/a0ieMxpXduEH3p
 C74DPdrHMvcnS+6eOyeUzCHCCgTZdxkkaTpKUio7YdOtrJ4UFnGWa5mDZF9QL9+w0oPc
 9G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAZAiikDyxve7wBEmtVsELwtGoA6EcbwB2QbKMraC8c=;
 b=YIk+xkNhdEK4dm7HuVpajttU+d+YgBIU9mvlmjM8xsaTsfG6iHXnPynn/S0cZowEtE
 jga8xiR0CKhsmrOCTKzbDmF0oMeNR4KuE2Nth7sYHYrLcjMnppBD9qCmS/HdLRFs9rN7
 OXSWgkZbFpZRTB1mf9efywcSLqt2/iMN39zBg48Q522NzLgXwdwSyqv3IpQI0zHdKETa
 sYQJU0JQCrUjux5ea1R/iiQhOaBWQhGvqE+f1ybLvI1OGcLkAQtwGcF1V1j0UfPDEjOz
 KLV7TESWBpcdHmaZXfE9O1inkL6lU4YxvY5URRMCeMN7f087zCc8D5WsNns7nsV90wp1
 czUw==
X-Gm-Message-State: AOAM531Eabt96i7c3drBIotALLlDemBkRoroSkKGjrru8BA+FKh25IHJ
 8fxNfRsOb0KUiqXkGAdbdI3MyXh4jB0=
X-Google-Smtp-Source: ABdhPJxa2qP749tTrCZ37Gn4u+FrIiLz6DS8mVD/TfLTokh2EtpSFlE1fm8w/zLSP7Zv9Cr+QNiY5A==
X-Received: by 2002:a05:6808:1a19:b0:2d9:a01a:4ba1 with SMTP id
 bk25-20020a0568081a1900b002d9a01a4ba1mr4158743oib.200.1646937027173; 
 Thu, 10 Mar 2022 10:30:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] avocado/boot_linux_console.py: check TCG accel in
 test_ppc_mac99()
Date: Thu, 10 Mar 2022 15:30:04 -0300
Message-Id: <20220310183011.110391-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test breaks when run in an IBM POWER host with a QEMU compiled
with --disable-tcg and the ppc-softmmu target in a similar manner as
test_ppc_g3beige did.

There's also an observation made about kvm_pr in the error message:

Command: ./qemu-system-ppc -display none -vga none (...)
-machine mac99 (...)
        Output: ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
PPC KVM module is not loaded. Try modprobe kvm_pr.
qemu-system-ppc: failed to initialize kvm: Invalid argument

This means that, when/if we're able to detect kvm_pr support in these
avocado tests, we can revisit this test to not rely solely on TCG
availability.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/boot_linux_console.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 2f8d8e2fe6..b40a3abc81 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1228,7 +1228,13 @@ def test_ppc_mac99(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mac99
+        :avocado: tags=accel:tcg
         """
+        # TODO: mac99 works with kvm_pr but we don't have a
+        # reliable way ATM (e.g. looking at /proc/modules) to detect
+        # whether we're running kvm_hv or kvm_pr. For now let's
+        # disable this test if we don't have TCG support.
+        self.require_accelerator("tcg")
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         self.vm.add_args('-M', 'graphics=off')
         self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
-- 
2.35.1


