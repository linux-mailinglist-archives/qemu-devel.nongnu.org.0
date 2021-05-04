Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECED3729E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 14:14:46 +0200 (CEST)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldtwr-0007B8-5n
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 08:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtrc-0005f0-W9
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:09:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtra-0007a9-Vk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:09:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l2so9130218wrm.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7SCknxDIsIgXSgxxIm1m30T9zFqtpsRmbUjjDi3Dris=;
 b=gcD3Mvg6gy7ZJEXMv9/bjUMOSiJz1ClZyc7wW9d88EWgpHc6nQW5W9TCevfsgQD6o8
 mMC18j3YIJx6zlrlDoG2SQ2bGdKZmgVdDVEtB22/WlEBL7W2QpNbz8CM8L0ExsC0sokH
 zVqHM7MkVNmfJ87NcbqOry8pXY3J2McFtedSIiTAt3O/OFGTH+pOM2cQfdg4HZBkLt/G
 sjAZp+jLdrxHnpDVA4ogWJB27JIASBRKyhhU7Vb7zFy3btNm5RHuE22aLJRPxsauHQac
 5Uevzvv2pkJ183NZfUPyIKc7dpMTnRWlkheZu7Yq4t5ap4QDV062CjQGdwOEDcXCLhsB
 8z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7SCknxDIsIgXSgxxIm1m30T9zFqtpsRmbUjjDi3Dris=;
 b=EQYiimA3NpquUofotcl2/dPrDCIl/0kDrWX+BxzB0utoCqHUN4C9CVg85cC9hXUhTr
 +91Wg3d89fVP4Fl1nPm3uXZKpTXBsS+Lnr7Bh7y7sFJOvuuKcOEtBuhskzvs6kNtkvzN
 h5m0NGkugwS4pS84LZkzD0yE0NZBACX66OWSJx2i3OrYWnR05x2ke9M6TtW3u5gxMCSv
 UVeGcI6YzE3o70srwCzv7HJWOlgLAi+m1oVj3ZrhhlPadhSPRMip4auunUKkkRh0OPZh
 U7OjyRr8dmvN0pOe45Dfcn01d9Bn91NKPDIao0/QcIDtUzly1jsz6tFUccYzKyQfxZQH
 reLQ==
X-Gm-Message-State: AOAM533U+tYDbtl+JTaYQSUOqzuyvdwF2N/ReH6cnzNAO04g4uON/qGY
 tn2BMYiKpHvRNyxxjrr2DVKqiA==
X-Google-Smtp-Source: ABdhPJyANAt/+y4hPiKD7zys6xtmtJoXT9E0q7Pn/fh8HyYoh5siJcxKP/oTHUqWJ/K7/fSzsAcmVg==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr9621877wrb.298.1620130154927;
 Tue, 04 May 2021 05:09:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g12sm2331937wmh.24.2021.05.04.05.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:09:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] mps3-an524: support memory remapping
Date: Tue,  4 May 2021 13:09:09 +0100
Message-Id: <20210504120912.23094-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 FPGA image supports two memory maps, which differ
in where the QSPI and BRAM are. In the default map, the BRAM
is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
map, they are the other way around.

In hardware, the initial mapping can be selected by the user
by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
in the board configuration file. The guest can also dynamically
change the mapping via the SCC CFG_REG0 register.

This patchset adds support for the feature to QEMU's model;
the user-sets-the-initial-mapping part is a new machine property
which can be set with "-M remap=QSPI".

This is needed for some guest images -- for instance the
Arm TF-M binaries -- which assume they have the QSPI layout.

Changes v1->v2: all in patch 3
 * tweaked commit message to clarify that the MCC is external
 * use memory_region_transaction_begin/commit
 * make remap be bool rather than int

(All patches are reviewed, I'm just posting v2 because it
has changes made in response to the v1 review.)

thanks
-- PMM

Peter Maydell (3):
  hw/misc/mps2-scc: Add "QEMU interface" comment
  hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
  hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

 docs/system/arm/mps2.rst   |  10 ++++
 include/hw/misc/mps2-scc.h |  21 ++++++++
 hw/arm/mps2-tz.c           | 108 ++++++++++++++++++++++++++++++++++++-
 hw/misc/mps2-scc.c         |  13 +++--
 4 files changed, 148 insertions(+), 4 deletions(-)

-- 
2.20.1


