Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB958580AA8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 07:04:54 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCkX-00037H-Ku
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 01:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeS-0006FQ-He
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeP-0002bH-0c
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x1so10539128plb.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OatbDfb8OZiVS/EC6Pruvn8YMZBaDKiiOdbOgCM6y6k=;
 b=HCdqrgchgUOd3g2pbUDnDpfs2ZYFMf904EaV2rlbbNF7OOHQXcBER/snqvf8ZB2mru
 e/vwpoVMRqp5uc0z/HPogTL3D2C8/Z8XE1Os8N61sc0egVjkZ0x7VNp9nCmGrfOUCUMC
 fcoKS0nqXF0ylCrnpHjN6cjTc3aBRZ7+kqtXixx2XLHNXW+2+UqTd3qOmJvoL6WcJVmR
 HPnBxnyipp/VRtvqeGsUF8xjCtwl5p6FWLLyvfhlx8es3N/qEB332HhWMEqnSypC10JZ
 ySt65aeWkK/MPhtqRyQeXhY4PeA7Qxfnm63EuTSEmtg9YoPxMuijbwFeYEMg+2Ypo569
 tWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OatbDfb8OZiVS/EC6Pruvn8YMZBaDKiiOdbOgCM6y6k=;
 b=Kx78KM1A7Fg3D2bj47aiF4buHtG1bYpD8OPZ1bU/zy1gYoPHQdYE7g1tErxXrCM80o
 7jTx63AYItC9l3sUFgNCveAD/160CUWQQP6ZVQAoJr9Najs66g9JWvfy3omXeywa4tyd
 Q7uoNbl83UqQKYoxf+kbhyKTDg1OLVuT9OBC1w4zk2pOY8Dyms/4UQ0M2jpTI1s/4vTS
 ibWQ9VmxXnqJkyQgcRZ8vEgkbt2d4YcZR30Ep/cMevol+RHXpj2Zh8fAt++3V++ko+sx
 9jyGvIU9KmqnoUZRHC2MeBWp/yT+o+NXacZjIhFbLzxlt4YCO5r3L3+Erci2fYoP5R5j
 dpJw==
X-Gm-Message-State: AJIora/0GEDuKUL0z41ns2c7NvzECbsFBF/7cRIG6T+yam8C1fguLZxj
 f/VMu+50oAc1pAM9Ybh4+WJeJMcBgvMWag==
X-Google-Smtp-Source: AGRyM1tQ5VSOO4uZSbBklzQA7JvPvFSHEXCEBuJc+1JgLWH3PZSSK7Iae1iiiCLRaym+AimQg2fQ5w==
X-Received: by 2002:a17:90a:2f25:b0:1f2:2bbd:f1c0 with SMTP id
 s34-20020a17090a2f2500b001f22bbdf1c0mr17684430pjd.71.1658811510543; 
 Mon, 25 Jul 2022 21:58:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Fix kvm probe of ID_AA64ZFR0
Date: Mon, 25 Jul 2022 21:58:25 -0700
Message-Id: <20220726045828.53697-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our probing of this SVE register was done within an incorrect
vCPU environment, so that the id register was always RAZ.

Changes for v2:
  * Include the commit text I forgot.
  * Fix svm thinko.


r~


Richard Henderson (3):
  target/arm: Use kvm_arm_sve_supported in kvm_arm_get_host_cpu_features
  target/arm: Set KVM_ARM_VCPU_SVE while probing the host
  target/arm: Move sve probe inside kvm >= 4.15 branch

 target/arm/kvm64.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

-- 
2.34.1


