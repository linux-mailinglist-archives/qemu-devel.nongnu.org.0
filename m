Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DC611342
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:43:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPan-0008Jp-Dn; Fri, 28 Oct 2022 09:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPaj-0008GB-88
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:09 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPah-0007qI-Es
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so6662734wrq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=anZ6XgTCsYFhcjKR6p7zTuJM8BS5HaFnxnQljkHKXPk=;
 b=HdyWnEZ3nTbUyP5T8MW7Hz8YL1xvmuzNG7CbGGtaVp14CGNTZRxKs+rQvp2mmE0b3V
 FWidBHxBKKZ/K1ako1oqRR+X+zKQllBmnLU15F8Sgn2AwQmhgV9Wx9N8O5iXK+OeDpd1
 OWJlxljpNpQti8FA0JRZQ6bARfvBeutgil9NbNtUjSlAZP4Ao62QG2LxQU6+ko1ibnnh
 +jYZL8nme9VT9QQ23TopCWK8LFQ01JutF6eU4FzoKXKxXrRU7emMdqOKbwi8InSyWel5
 9pYi7aI/lpEK73ON3O3BDgGVEO6X7d85GjDxYILSNgAFj1EfDFpkRZ+Jd7/X2fbdy//Y
 Fyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=anZ6XgTCsYFhcjKR6p7zTuJM8BS5HaFnxnQljkHKXPk=;
 b=s2BD7nDnx/OeFo8zMHJ/7cm1Z8bXfiFAt+7ECSfhiE2T3SpKuBaUFXoaJ2UUxd7Vja
 mvaRVondNeqOS3+sVMYAY2cu5/WPTvkUDVaNslvyJ+kG83Hebox+PG+hsiQSDvpyts5t
 WFD5naX6t4uWfuBeZPCW6vyHkXHe4DFotdnBQ0RcbvwD85WaIfKGwwfN2SPR9vkLB4/m
 CK3IfC6Lgq2KFaXw/dIOls1z1HpkQJm3PtZIBW+UXEGvXp9mDX1s7csj0DrDxZ8bCTgc
 krekLOkTNN0D0OL1QZ+rCEyIK0yMXfalt3BjbcLze3blAJX5uyyPjb130HGtIhzU8DK5
 Q2kA==
X-Gm-Message-State: ACrzQf2PdjeNNnD3RZ6lmxr7bJ39yoJfXT4ciODg+l5VZj70Xjde1f/c
 vRNinGFMzXb6b3Efrp5j/eYP/Q==
X-Google-Smtp-Source: AMsMyM45ecBB3Q+KwvWQbFQZw486y9yfdoWEs4VvRSS7sr7ZfAEWx8eokCVhsw7b62bX2gJqAV5Z7w==
X-Received: by 2002:a05:6000:504:b0:236:5fe9:883e with SMTP id
 a4-20020a056000050400b002365fe9883emr21965476wrf.65.1666964405310; 
 Fri, 28 Oct 2022 06:40:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: Implement FEAT_EVT
Date: Fri, 28 Oct 2022 14:39:55 +0100
Message-Id: <20221028134002.730598-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The architectural feature FEAT_EVT adds adds five new bits to the
HCR_EL2 register: TTLBIS, TTLBOS, TICAB, TOCU and TID4.  These allow
the guest to enable trapping of various EL1 instructions to EL2.
This patch series implements the feature and turns it on for
the 'max' CPU.

Patch 1 is a bug fix where we forgot one of the existing
trap bits when we added the new TLB maintenance operations
for FEAT_TLBIOS and FEAT_TLBRANGE.

thanks
-- PMM

Peter Maydell (7):
  target/arm: Make TLBIOS and TLBIRANGE ops trap on HCR_EL2.TTLB
  target/arm: Allow relevant HCR bits to be written for FEAT_EVT
  target/arm: Implement HCR_EL2.TTLBIS traps
  target/arm: Implement HCR_EL2.TTLBOS traps
  target/arm: Implement HCR_EL2.TICAB,TOCU traps
  target/arm: Implement HCR_EL2.TID4 traps
  target/arm: Report FEAT_EVT for TCG '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  30 +++++++
 target/arm/cpu64.c            |   1 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/helper.c           | 144 ++++++++++++++++++++++------------
 5 files changed, 126 insertions(+), 51 deletions(-)

-- 
2.25.1


