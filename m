Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106D3733D5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 05:08:34 +0200 (CEST)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le7to-0001V7-RO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 23:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qd-0008Ce-DA
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:15 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qT-00030u-GS
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:14 -0400
Received: by mail-qk1-x730.google.com with SMTP id o27so288753qkj.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 20:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmST3+WxP/thv66gQjHNnadA4mfLkZ9vI+xyDvn5FVg=;
 b=sYRW4pUk6Gz/vwwMBOo5rrnHDD2fOH59E/TkUWtcbqMtKA1aVK9aX3WgrYT3eGda4W
 fh1oNAQqqpmtc2GqOGF9bdQjv9hzvK8BmAfKIRsNKbE2dBWg2DvvLXx1DxnfF81KGZZ5
 x0w7Pnvhz1I89BmIBEDlKO3mYbdbMaa3LK260xqA5iU2Zn8HnVDqF/75berVg0HkRmjL
 brhuxks/j98da6fD7fg8k6Jnji3mNsANKu19qmLtTHLfemyQJWfAffzrecFQF6ENvAAi
 wHiLNjaxBNtPuFxpKNMNLg+MaGBc6T2Cz+fkPCyxnMsEwLln9+IXFtjruesxmEZZYAE8
 PEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmST3+WxP/thv66gQjHNnadA4mfLkZ9vI+xyDvn5FVg=;
 b=NqSYRZK3NRGcu6opPf3aBQ9cAPsc05XC/GcFkza3klQDwg72glPA1e9n3drx3txbwh
 Yaa4BOYna6h6wLu/WlssGVGtOXXQSqioNm+CdKFc+uW1wNcrJ5dgfxNZqmhkTQBjZPR3
 nZufGYLODUzR60VD7D4FZmG2EGBsa1E8GzfW5KRJ//zHdyHv2icbvZLZeA2oYkHcJEBD
 pL8JbNwB9EBbu4GQnmaNc6i+4BDY5o87wpTD1PnszGtALRv0OzHWDpiob6hY+FmO6/Fj
 YHYOZqiOI7Je0xM5vrUMUQHVxAmeiUS01wqemaORGIITJFUqsEckcGu0TJ7opH5RCavf
 TPEA==
X-Gm-Message-State: AOAM532utoZu0/W/KHUp+gZD1yho1m2Y/J16e8cxGq9m6htPm27CMaXZ
 zMSJ18GpElRfr4STpqp0j+i6YQ==
X-Google-Smtp-Source: ABdhPJyzlRoahndG2gJwBwWJJqezoMT50aKjY9PrsY6sOGId6Ihm58EdRbysQWhZPY/w4YIRRIydPg==
X-Received: by 2002:a37:a301:: with SMTP id m1mr21727377qke.491.1620183903395; 
 Tue, 04 May 2021 20:05:03 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:02 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 0/4] aarch64: add support for FEAT_TLBIRANGE and FEAT_TLBIOS
Date: Tue,  4 May 2021 21:04:39 -0600
Message-Id: <20210505030443.25310-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x730.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improved readability and fixed a bug in
tlb_flush_page_range_bits_by_mmuidx_async_0.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 128 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 371 ++++++++++++++++++++
 5 files changed, 553 insertions(+), 3 deletions(-)

-- 
2.26.2


