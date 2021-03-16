Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7E33D841
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:53:32 +0100 (CET)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC0h-0002bo-BT
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwl-0007zx-Rw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:27 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:42087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwf-0002N4-OW
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:27 -0400
Received: by mail-qk1-x733.google.com with SMTP id n24so5510633qkh.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvBFYuvOaRvinAAgfRP1olrcM4Mwc8lV5D6aXGNtK6s=;
 b=024jXR7WYGYP7PGBHgYit+7loC0NhzZ6phJnkwW/sGBDlaRtRvla3HSWffQyICLq6D
 tV/y/bIMWGaBD0MavQ+kAssR0APBp86qsMJxEy6rv5zp609POMwtxRDM7/5EbzbASpnZ
 KAnIQp4Qd50A9/acVEQ5vRu0osQxumAqblLuXBdC4VYMy7uL4doF8PvMtL4X1iwpwSRl
 GJTqenprixjIzgy9c1t4vxoOdTSvzr012F+wfz/eaL+Ug2CPGH00sANdUC3jGs9rOBcN
 09SdV6jtYm8ZuckTYmJPM1OdF52AXHthVmv0EqAVDUMed0o/WPZqUt1wjpDIR3zH/Cc5
 qlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvBFYuvOaRvinAAgfRP1olrcM4Mwc8lV5D6aXGNtK6s=;
 b=KFY3vUHWsTI5a8/QtPi5j0qRn6YRvg/1uEb3CTX03j7VA19sZ6BR0SLSK3l7OtB9UK
 ZKNY9qq2GiWvlGSw2l1af+7+0XVTdkcfWYDgVKGZ9ZpqQrx2Q0+nxACK7gsVKSAQ92wo
 KuRnix5dY+CdHr/fTW5rX94bzrVWWY163wd5DEXuMQCHOV1R4HgXAK1F7f/oTR2GLLPz
 e0jy6YJrLWODZBudueTPjjJcjEVkm28OviVw3vaHwzAvWPedrvajwgxKDCd6wHOdBFz8
 4pAnjOMEmYnsFJjmEoSN89blznZeuvKjcY3fhAEhonHa68ftMfD4/b02AhnnXot5FTtT
 DpHw==
X-Gm-Message-State: AOAM530Z/eIUDFc2Nj8wmB1e4mrbSS0Btgl4nmd5nlPLDUrz2/995vuc
 mIO69WKwctxpNxKSr1aNpvYPtA==
X-Google-Smtp-Source: ABdhPJxctresi5RBPIxvq99KdbncUpatEUcYhmg5tmXr6g+/kYkIkgRlYGv3npedsD39sCxY66b7bw==
X-Received: by 2002:a05:620a:2f8:: with SMTP id
 a24mr266310qko.124.1615909760839; 
 Tue, 16 Mar 2021 08:49:20 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id n5sm14855623qkp.133.2021.03.16.08.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:49:20 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Tue, 16 Mar 2021 09:49:07 -0600
Message-Id: <20210316154910.25804-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v3 to v4:

o Adapted code from the existing flush_page_bits_* functions to support
  flushing a range of addresses.
o Changed the API from num_pages to length.
o Removed the exception generation from tlbi_aa64_range_get_num_pages.
o The addr is no longer passed into tlbi_aa64_range_get_num_pages.
o Other changes based on feedback.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 135 +++++++
 include/exec/exec-all.h |  45 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 393 ++++++++++++++++++++
 5 files changed, 584 insertions(+)

-- 
2.26.2


