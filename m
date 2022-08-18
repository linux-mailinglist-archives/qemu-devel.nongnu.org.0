Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7235984FA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:57:24 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOg1S-0000EJ-Ps
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfyf-0004Z3-6O
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfyd-0002QG-In
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id h24so1818859wrb.8
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=wRTxE6MuxLI/KHlNC6OSJm0BM6h434gUZAQdLkYitXg=;
 b=rap3yZiBGXTbeTL4tJOLy2uowsTVFYrxWVfRsHPRnRxGcY9LYKYMguhnnBaxfaGz85
 YwF2gkQ+gdB/CQw2G7ICKGvY9OTP3EDadOa2AGlPcGcdauTCv0V2lz8TQKDBtRUtsr0W
 vMY7JSBcQdgfjKI/aMicFQDji3nwMvhAHiNxlxpbGQxL4ZpaZR5E34nlMWwe/nd1g46I
 IZX3uNTaVsvxN404Agw/g240fzZacqKHVDX5UyIccn9FNWF078m+m0ZAibrK0rPdyUvm
 5Z0vK1r5UA/UFzIrtLYmv6t1n3xgZGCvPIWGuByHckiMy1uRSC+FLaC+mE5OF4G5pARV
 CtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=wRTxE6MuxLI/KHlNC6OSJm0BM6h434gUZAQdLkYitXg=;
 b=DECmW0OGYbHNtmWHMSBbQbh197fIcJKKLeLDAy9a3FmgBrECTUKEyuYteccyB1n2mo
 tTuDZpab91OyQfi9jSewV9SgKW7k6emflmq13a7SH7PBFZpIZH2AiEZktAQznSyWPiHL
 mbF5Vr6rsstOCdbPRl2/gFKlGwQw/VnvYVKP7enqN/lnW+GjTBcKzVKVKrx3HV+bmFvb
 cDqv6I2S2e0EKhOmpbKwBe5yplbtk0+Qsnw6ZhrH3P99BQV2oBMhe/t8fUz2bTCUzPGn
 Xj2iaK8ku6AkEng+R4z/+Chyr3pYpLJnmTbqZI8iLmcetq62msLgH3gJZ79drQYS8t3v
 DxFw==
X-Gm-Message-State: ACgBeo3cbkjKnhYO9cdfYpapCCSiJm18lesVZ4tpmxRnzED9MAYlVHFQ
 X5Eq7nSYDg7B/8r0bU1Ni7w8EKsqERULkw==
X-Google-Smtp-Source: AA6agR4YFDjknoasQJJbT6hzfwj//UzjPkGO4iVVoJ5Rw6wJV4ZF95MWvZhkab6MdsmMmjUGEFghRA==
X-Received: by 2002:a5d:60d0:0:b0:220:4e23:9934 with SMTP id
 x16-20020a5d60d0000000b002204e239934mr1707872wrt.474.1660830866163; 
 Thu, 18 Aug 2022 06:54:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0021ea1bcc300sm1624410wrb.56.2022.08.18.06.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:54:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 for-7.2 0/2] pci *_by_mask() coverity fix
Date: Thu, 18 Aug 2022 14:54:19 +0100
Message-Id: <20220818135421.2515257-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

This patchset fixes a Coverity nit relating to the
pci_set_*_by_mask() helper functions, where we might shift off the
end of a variable if the caller passes in a bogus mask argument.
Patch 2 is the coverity fix (adding an assert() to help Coverity
out a bit and to catch potential future actual bugs). Patch 1
removes the _get_ versions of the functions, because they've been
in the tree for a decade and never had any callers at any point
in those 10 years :-)

This is only de-confusing Coverity, so this is definitely
7.2 material at this point.

All patches already have a reviewed-by tag; only change
v1->v2 is removing a couple of unnecessary mask operations
in patch 2.

thanks
-- PMM

Peter Maydell (2):
  pci: Remove unused pci_get_*_by_mask() functions
  pci: Sanity check mask argument to pci_set_*_by_mask()

 include/hw/pci/pci.h | 48 +++++++++++++++-----------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

-- 
2.25.1


