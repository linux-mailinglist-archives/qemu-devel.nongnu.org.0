Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA31F1F1D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 20:39:43 +0200 (CEST)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiMgQ-0000ZM-G4
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 14:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiMdm-0007Sx-Ad
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 14:36:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiMdl-0001Ul-4n
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 14:36:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id jz3so204764pjb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PsXx3/KCASLAE2IdAmAblN3JlprO8g3ECsrbI4mrRyc=;
 b=v4y+Sd/IfEDVaBah+AyVqMSZt2OWpVErNEleV+WBcNHaWit9OOPOQAUADgUQ+gKo/A
 mpL/e2pErdiVMKKNyIYChmUGh1hpoXDJz1s+UAYnBtphQ//RFyUruN8iyQ68s0pmtY6K
 A4E7WZ3405m85ZEkwKHr+7ZH3uIEbC/ZbaCO4lL+6zyJywNGlGGaj+J1O2AYU8VIs97V
 eMEYIkFj1uyX2SiJNKGhbMP22ywpVdRiwlzDrSloF4sKJJ9KivYZ36HsbnEYQxdMEXFM
 YTPoKIczdjHMCXq8NcEwxsd3e/sq8w5jXcLzkKc+T9vqE/AcjjDvS/cBrCW/k5jtKE3Z
 E+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PsXx3/KCASLAE2IdAmAblN3JlprO8g3ECsrbI4mrRyc=;
 b=ixTbyPguXlTabvJrrhbkWM24UpYKQPnid7ozVsDDPgFK9Ju0ZfPLQz+4UDRx4CBgzp
 Rf/RJvKNn5wuCAejLxlauqgXirtKqekXBZMzKsz+yqykVGi78flANMrOLdl/1z6alrv3
 RairGVZPEi+oT2HbcMy5R1Rj2kFPKNIrcGiu5WzZqN2y4EfEak7uwoC1ClApTboC8qmT
 EGsT5bBBNqp+y6VDwvNaEIeu0jGXNOpCNXuivEraEk2GdEw605VLWsgtKP0BX/bq8CDB
 IEdOobDHJkDobfDKPZ7umnWezksmMla1leG5FlfAy/uMShBQ+5tH6bXkbaxvxYveauWD
 /ibw==
X-Gm-Message-State: AOAM532bgT5IIseu2DIR0MgOOQSdLq6tKRP4D8YJXI1EBC2AYuDhFd/R
 XTM0gGW6bdcuiwphJCBm01OZ0WdWrxs=
X-Google-Smtp-Source: ABdhPJwhIRk7PpcjXNH9RLfVVSdlkgcNQ1nkS+zjtSeiL3qhRCGqAI7Sd3jxYiVn/5sE3d05Q3ilNg==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr106995pls.313.1591641414824; 
 Mon, 08 Jun 2020 11:36:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i22sm7854235pfo.92.2020.06.08.11.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 11:36:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] decodetree: Add non-overlapping groups
Date: Mon,  8 Jun 2020 11:36:43 -0700
Message-Id: <20200608183652.661386-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a feature that Peter requested for completing the
neon decodetree conversion.

Changes for v3:
  - Remove check for less than 2 patterns in a group.

Changes for v2:
  - Rebase on master, which includes some generic python cleanups.
  - Indentation error message restored.
  - 4 new testcases

Peter, do you want me to include the final patch in any
decodetree pull request, or shall I leave that for you
to pick up through the target-arm.next tree?


r~


Richard Henderson (9):
  decodetree: Tidy error_with_file
  decodetree: Rename MultiPattern to IncMultiPattern
  decodetree: Split out MultiPattern from IncMultiPattern
  decodetree: Allow group covering the entire insn space
  decodetree: Move semantic propagation into classes
  decodetree: Implement non-overlapping groups
  tests/decode: Test non-overlapping groups
  decodetree: Drop check for less than 2 patterns in a group
  target/arm: Use a non-overlapping group for misc control

 target/arm/t32.decode                        |   4 +-
 tests/decode/err_pattern_group_nest1.decode  |  11 +-
 tests/decode/err_pattern_group_nest2.decode  |   6 +
 tests/decode/err_pattern_group_nest3.decode  |  14 +
 tests/decode/succ_pattern_group_nest2.decode |  13 +
 tests/decode/succ_pattern_group_nest3.decode |  11 +
 tests/decode/succ_pattern_group_nest4.decode |  13 +
 scripts/decodetree.py                        | 513 +++++++++++--------
 8 files changed, 360 insertions(+), 225 deletions(-)
 create mode 100644 tests/decode/err_pattern_group_nest2.decode
 create mode 100644 tests/decode/err_pattern_group_nest3.decode
 create mode 100644 tests/decode/succ_pattern_group_nest2.decode
 create mode 100644 tests/decode/succ_pattern_group_nest3.decode
 create mode 100644 tests/decode/succ_pattern_group_nest4.decode

-- 
2.25.1


