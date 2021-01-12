Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D52F3697
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:08:25 +0100 (CET)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN9b-0002bp-VS
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzY-0001RT-2M
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzW-0006ws-Ik
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 190so2526035wmz.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zq1EFVs9ZUsELBHVmtcyccZKM3D0LKUF7TXBeHh40+Y=;
 b=ANI5qk8VXfLn9JNEO1S3U7b27FDFfptBIRmdIUVb10WeJ64V4gr0RRHLFuWft7rRcc
 dvDyBj7UFbHuCc6CPQfCCsHWSnWjiLbkODuEtcQhDsUpWcMfQ2bDYxnn7Bzok29QM95N
 BEMAzGDXg+fvavvp/HVsvth3k0Zkk4Lx/HgcH03ep/3wjftgE+3e9R8bNk7ZTq3EZrCK
 9lUNVhIOFripxJOTLNcZF1rGlnvgjDNkG7utxVlzc9E3z4rdDwQTxe6odmuFnz0pWAEn
 S15LR5GGQneMjtBNHCFuSZl8ix5QOnKa+DoXyhTT7cPm7oQmJuBxDhLIRviOKA1WYyww
 Jonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zq1EFVs9ZUsELBHVmtcyccZKM3D0LKUF7TXBeHh40+Y=;
 b=Eg8BZ16GzD/O4IUEPJav8u0pS4+2Pf6+d7YZnYeuiQtxRxiNxNTh068oCcjdVkvn9f
 NpHevNPkC7c7zkwc0t6aTEaW6QEV4UqsLzyrufFCNbBMrH1b/1SliSIpRmOzIpWMzU9l
 Z8rYJrs1R4qsXHN79lqE4L0E7FdaAO+TIC9PH4pzzu6lcupbWSD8pJYHlFMsrwA3CgWj
 wKxDkgw0CZxnNzVZprag4ROrhrmlhOEFak+T4RA9Tku0YW+O9wCFb9beA3iSEgYqb7oQ
 yPO12qdnsRS+23+3sA6vk8c6MVxvfdgQXM+iYtea6AGOb/kPg9SJD88fDsfL+QBtk7Tz
 cEDg==
X-Gm-Message-State: AOAM532zlazD39RZDu6gx+IYFUfme+peLk0e69Uek0P1oIdFBgTIydP+
 KeGs/gB1sSPd2BZzGu8fWXnMpjDHQbPa0g==
X-Google-Smtp-Source: ABdhPJwZUIZFQVSFq7qOQ8WT2WSP7rbq+7/eFaodlPqvRGGfeVDMRiFJEI2fzygP1/pMAomoe1n5ww==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr154752wmb.137.1610470676909;
 Tue, 12 Jan 2021 08:57:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] target/arm: make ARMCPU.clidr 64-bit
Date: Tue, 12 Jan 2021 16:57:33 +0000
Message-Id: <20210112165750.30475-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leif Lindholm <leif@nuviainc.com>

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-id: 20210108185154.8108-3-leif@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ed3e9fe2e4e..fdbfcec2b09 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1


