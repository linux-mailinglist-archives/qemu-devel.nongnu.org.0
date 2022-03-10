Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253E4D5144
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:32:04 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNZx-0002be-FC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYZ-0008CX-N7; Thu, 10 Mar 2022 13:30:35 -0500
Received: from [2607:f8b0:4864:20::234] (port=42639
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYY-0006SK-9J; Thu, 10 Mar 2022 13:30:35 -0500
Received: by mail-oi1-x234.google.com with SMTP id q189so6816772oia.9;
 Thu, 10 Mar 2022 10:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDU3PKR/m7ZguVnKoBH3XivpSHR+k0Ui4MVGL8r3lCM=;
 b=TyQ9blvsQ3FLc2o0i+GurEp2yr/FlrSkF2SQF31T1WZtE8EKF6VTyQKKEYPpgbC2wV
 /JlKZu5k+xHUkFZA+c3uc5I87PDDnIMQ0dh4LmTMZdsF0G3X9GefdEMPMPrUHyIXqqYK
 oi1UJoqBPJJQgBg1Yfh0MQoPLOZqL/xJnxsKKwp43nnDxiHxos1zfTCc7xlo17H0Zwti
 kZmUY6mE8jdWAW2/1EVbLmM0ocIllWAJ3tUJrwczZFGtm7pJqgRxfHpZeEJne/cfotcJ
 ySJx8zJAENwy0PlRUoY93b7G4XfNBwhrs5qMb7Op8U23HCnXSAb280EHa73TUQSvo3kg
 qn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDU3PKR/m7ZguVnKoBH3XivpSHR+k0Ui4MVGL8r3lCM=;
 b=EYVXYihQ7Rq6mz8MCDsvY6Rie7yPr3HDEv0kqBMCz9VF8lFJdFhz4jDnWA+tILf6P8
 /buAbecBrMZqGQqDkHaMGuzYwAQ69c9AEwAarOcucW//hxA9qF/hS54LRx+midcP395R
 9wrKFPubzAkagnVlKo766t5r5SRLBLoGtltsxMM1stEEw6bU5ryc9rckzaAXi8qL0Ql1
 6uLX9tl+QAUk8pEz1HmHDdAfXLQtHtQ5pbOSdU8Clurle9k+SDhcxE/OlY/TIfXSF2dN
 tVRnujtjPvt1Xbrr0faYnZbKzVn5aL7RUCJK2kCmzYZ/hY7lySy1pdxxQgobIsZajEbV
 N1Gg==
X-Gm-Message-State: AOAM5304SHZ2Xc2yy/Kjkwb7GftSb3R99UhIya9ybSp5kdaqbO+8YHbm
 J5+9bz5veDnRTM1hc1ptOJXUYOxb68w=
X-Google-Smtp-Source: ABdhPJxCf7h3oP2y6Han23b0g2bSiGB0oJA+1Brvvp8UuOJD0cOnt7FjezZhwYMY/DeHMaHl+p7IPg==
X-Received: by 2002:a05:6808:2227:b0:2da:5a4f:95db with SMTP id
 bd39-20020a056808222700b002da5a4f95dbmr3215414oib.129.1646937032537; 
 Thu, 10 Mar 2022 10:30:32 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] avocado/ppc_405.py: check TCG accel in test_ppc_ref405ep()
Date: Thu, 10 Mar 2022 15:30:06 -0300
Message-Id: <20220310183011.110391-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running this test without TCG support in an IBM POWER server results
in the following error:

        Command: ./qemu-system-ppc -display none -vga none (...)
-machine ref405ep (...)
        Output: qemu-system-ppc: Register sync failed... If you're using
kvm-hv.ko, only "-cpu host" is possible
qemu-system-ppc: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

Although the host is running kvm_hv we don't have a way of differentiate
between kvm_hv and kvm_pr, meaning that this test would've failed in the
same way if kvm_pr was the KVM module loaded in the host.

Since we don't have a way of checking which KVM module is being loaded
when using avocado, make a TCG accel check in test_ppc_ref405ep().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_405.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/ppc_405.py b/tests/avocado/ppc_405.py
index a69b7c5e97..4e7e01aa76 100644
--- a/tests/avocado/ppc_405.py
+++ b/tests/avocado/ppc_405.py
@@ -30,5 +30,7 @@ def test_ppc_ref405ep(self):
         :avocado: tags=arch:ppc
         :avocado: tags=machine:ref405ep
         :avocado: tags=cpu:405ep
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         self.do_test_ppc405()
-- 
2.35.1


