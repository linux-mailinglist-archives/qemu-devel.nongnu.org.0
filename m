Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0954CEEB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:43:06 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1W6i-0005tQ-WA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1W2s-0002rN-M2
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:39:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1W2c-0006Nc-NE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:39:05 -0400
Received: by mail-pl1-x635.google.com with SMTP id d5so8269273plo.12
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/e8HPnW6cPZQVWMnlzZxW/trXJbieQRDGjs7G9PSIq4=;
 b=Ym6cRxW81nwSLKl6pIMtPsDIFYQrFhGlsvrMl506bX6AlrXlgo4PBUv6FUVRGqaWtH
 pGAtVHhXzMQet58If2uI01fTfr3ooflbzvHMyEpwKu49Uc4nFVXBfC0pgPg4mkdd+I3c
 zZk018rvVcRlrAnqtajZIgVcsN1yxDb5z49dcvNwVE3910flmrLQdjSfWNmi7UM5S14w
 ONcKy45Uy+6CaGpPgRLoA8JQf8CAFqIRhwxjFIsSYtpeg866Pm1tMo01Rs/SD+3sPfxk
 hFDgyr7nuBMM/v44S5wjS2Kq1T5gUJYV2TU/gK/7FeaH10BCeiIOsZ6LqozEQqi0HOfx
 DmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/e8HPnW6cPZQVWMnlzZxW/trXJbieQRDGjs7G9PSIq4=;
 b=HvshcyGcgalEKogxU7yRcOrFMh1IhDj90y0dXAr5m+QdkLQjuW45VvNDiaNmAn8Oxn
 2thE4nHIIxrdRghi1p39rU9iVaoswydYx8prUOXTZO/1U/S6z2SMMZE3TeBNo5kiHQvP
 3uyVCOUPirEwQqdFWVTIyvtUSld2HkZNfYPPrq47/w0GJ2lA/jD07qorB+GVutmTITlJ
 9Oxg/DfxTKZ15NTpMxEL+iyZ4aJx9JdUiXnF18RCGFfEm/ufX65iY697Nxdb0NnBv+It
 XLO5FmVifSXucSzzTIS3og8hC3iBPfo3CGfgIvBhXOsoPxzkNBvYlC2FbpH/i40TSnx4
 AZaA==
X-Gm-Message-State: AJIora+fP5T2xRy2mp6niEXjbEmKZUXp4tEV0mG2UFsuAhqAvSODGk0C
 gtyjtIxE0bD7iWjiUDU63+RQv0txSycpzQ==
X-Google-Smtp-Source: AGRyM1vnYOU+NGm0M0hPT5ifG1CiblkzaoMcYXnK883r+5Lvra51yRV2YJ0r7cwnz+0h4wEB555M6w==
X-Received: by 2002:a17:902:d50b:b0:165:2aa0:4b22 with SMTP id
 b11-20020a170902d50b00b001652aa04b22mr217218plg.131.1655311128811; 
 Wed, 15 Jun 2022 09:38:48 -0700 (PDT)
Received: from stoup.. ([192.77.111.2]) by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b00163f8ddf160sm9579644plj.161.2022.06.15.09.38.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:38:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
Date: Wed, 15 Jun 2022 09:38:46 -0700
Message-Id: <20220615163846.313229-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The bug is an uninitialized memory read, along the translate_fail
path, which results in garbage being read from iotlb_to_section,
which can lead to a crash in io_readx/io_writex.

The bug may be fixed by writing any value with zero
in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
the xlat'ed address returns io_mem_unassigned, as desired by the
translate_fail path.

It is most useful to record the original physical page address,
which will eventually be logged by memory_region_access_valid
when the access is rejected by unassigned_mem_accepts.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841eed0..fb0f0709b5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -681,6 +681,9 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
     AddressSpaceDispatch *d =
         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
 
+    /* Record the original phys page for use by the translate_fail path. */
+    *xlat = addr;
+
     for (;;) {
         section = address_space_translate_internal(d, addr, &addr, plen, false);
 
-- 
2.34.1


