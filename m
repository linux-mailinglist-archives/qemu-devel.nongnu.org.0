Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD9526750
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:43:54 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYOP-0002Gn-GZ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npYJF-0002WX-4O
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:38:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npYJD-00015f-Cf
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:38:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id v12so12123563wrv.10
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bB1/WMuJrvjSdc38PzEzRywr291IFLBWO0kli8cjXxY=;
 b=fzAwQ9NjSTfC/sizt1ZeKasZYl9vBJWU864x1qM158DVyn2xG71/fv+Ofp8OuFyw/T
 TfmX05H9aXdbRLggWLRnMP/uscwDYWJrqZzHSIUg5uh9bWPym3RNEbO9/ptTfE5/xkEN
 I+etu3IyZvqszI570HQJcw2LUGVkdsPnbEk6szEZQ9oAjpvETGvd0IJ0HOxYM3K89sUp
 5+cpnHfZFE+RPocJEnNKnTv1wElZyS+K2kWSOMhm779f31QH6NohEIF/di/jl3cH4Tl7
 KoJuBOejUGt7trKbjltahqzufSINRn5fVP6EWu9tBfL1DEVhk60EtdLmNGnk/gOInYOg
 pqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bB1/WMuJrvjSdc38PzEzRywr291IFLBWO0kli8cjXxY=;
 b=Rl04gJx5/LYwpoaZIflmQAfy6h2SQtlH6GJPmgDZFRILATIwBdawwV8J8HRTwMJ23k
 ahI1FqYza5Vkvl3M14yv/KEBWAJ4rJ13NppdKzKHDF+iFzqgBSkn/e1xlT0M/xlWBXAA
 ZSaF0YUBh3Ts4xjptL3nUQffP/gGdP3BeJLFL2hNcdllLNAkeXk+Od+pF91Cb3kUnCgc
 CpSEh9wXT06FO5x34RrYBg01EN4BZTbLU5xbW1GhAcKnpcIUzINILSR09+lhfSphvcY+
 ar/Q2qGxKCW+PTIFn1RUjRmBCAOSErSRXavXvVM0CgOAkeXUHnyv92m3PaS7I206CAyE
 0u1Q==
X-Gm-Message-State: AOAM530RZRWXO5lRSWRP4FlZginEXFM9UvP2yKnL078ieS0dGIpL/X7H
 ikELW6PgBtBgrJdl5nqjsdDTt0DvZZjTQA==
X-Google-Smtp-Source: ABdhPJyIQqe/H4TUiq4Jy2TnB1Pup9Zm9In2wz0ofdsYlrB94aVluDB6zX5+/87lpNRgCYH5lFFitQ==
X-Received: by 2002:a05:6000:18ac:b0:20c:ba84:1260 with SMTP id
 b12-20020a05600018ac00b0020cba841260mr4795841wri.379.1652459909851; 
 Fri, 13 May 2022 09:38:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r64-20020a1c2b43000000b003942a244edbsm3963635wmr.32.2022.05.13.09.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:38:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH] hw/tpm/tpm_tis_common.c: Assert that locty is in range
Date: Fri, 13 May 2022 17:38:27 +0100
Message-Id: <20220513163827.26281-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
tpm_tis_dump_state(), we calculate a locality index with
tpm_tis_locality_from_addr() and then use it as an index into the
s->loc[] array.  In all these cases, the array index can't overflow
because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).

Add assertions that the calculated locality index is valid, which
will help Coverity and also catch any potential future bug where
the MemoryRegion isn't sized exactly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with 'make check' only...

 hw/tpm/tpm_tis_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index e700d821816..81edae410c8 100644
--- a/hw/tpm/tpm_tis_common.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -295,6 +295,8 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
     uint8_t locty = tpm_tis_locality_from_addr(addr);
     hwaddr base = addr & ~0xfff;
 
+    assert(TPM_TIS_IS_VALID_LOCTY(locty));
+
     printf("tpm_tis: active locality      : %d\n"
            "tpm_tis: state of locality %d : %d\n"
            "tpm_tis: register dump:\n",
@@ -336,6 +338,8 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
     uint32_t avail;
     uint8_t v;
 
+    assert(TPM_TIS_IS_VALID_LOCTY(locty));
+
     if (tpm_backend_had_startup_error(s->be_driver)) {
         return 0;
     }
@@ -458,6 +462,8 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
     uint16_t len;
     uint32_t mask = (size == 1) ? 0xff : ((size == 2) ? 0xffff : ~0);
 
+    assert(TPM_TIS_IS_VALID_LOCTY(locty));
+
     trace_tpm_tis_mmio_write(size, addr, val);
 
     if (locty == 4) {
-- 
2.25.1


