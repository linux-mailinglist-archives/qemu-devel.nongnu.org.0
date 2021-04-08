Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45D357909
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 02:26:29 +0200 (CEST)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUIVA-0000dd-HP
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 20:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPx-0005FD-Ae
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:05 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPm-0002dP-Lr
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:04 -0400
Received: by mail-io1-xd41.google.com with SMTP id x16so372111iob.1
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPTNh0965BLKGe6VCDI7MG4KhBVDWdp5v+1SoqVu6+I=;
 b=Ef7u7zSZ60VPCSWvu3JRt8fFNov7E/LWwhFJsZJPn8+Ua1LYTv3XizdhzorYrhJC9t
 JZjmE7nkY9Z/eORLyGzf9xrNsJsHXqeGmMAGG8bLTMjzDacVZJSklPgEcJKiV+Hz5lQl
 lQpQFOlw4kKT+S9Ws7wbHZcZmatohrwbxgepKVq95I7nhSBPB/ENnnzEj/oWouEQQhhA
 PNS+sxjUTs5yVfkej1kyhTSOv+Zuc3VXmjdhHC8jUFAnYVzrFdXyHH2wGztDf3j0EJJC
 Pwhz77ppyNnhn8nk2ienPF+gz5IKy257GkvqtudMdokK1p8DeVaDHHxcXVldF+3dbE76
 YAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPTNh0965BLKGe6VCDI7MG4KhBVDWdp5v+1SoqVu6+I=;
 b=M2jVmMVZcei5/N1FOxT0RflICR9uC2Gsi9lvVh6g1CXNex5WhA6zUiutQMfQuDo/gW
 khOCXE2kFkS+TzsVL70MOtQfjHWYbIOvSLuWF5/XAnjgWT5QOdWjb+2fgt6IUMgyOsK+
 gT23e0LVncyCf21e53mIOtJdCngx7/DlXluuRJJuORW7iNMn81ixycfeqZMqQw6PuT2d
 pPMXySWz+fgruU2RsJaLPdTa3SBtJ+lNjtryWDSaBvE/Hm08hIJsMgQDqakOwLxAhwfp
 WYrxYiyc0ZQcSGbctOOMpmXY4AAs+a9kWwq8J7gmB0lvoWdtSpqH+qlAtnuYEg6y+nu7
 Pe/Q==
X-Gm-Message-State: AOAM532cezdSnJNAF8fSH+P8I5t7bQ6+LkHhF5kJu1Ygp37Ry0wMdpFx
 C1g1sOyrLPjiEysTjmIAY+72gg==
X-Google-Smtp-Source: ABdhPJynXmwck3+g3l4ezA2jSJ4xjvTv9gAiFjL7x0d8xOg+K+oAelALAwA3LoXtyLCC4pKdAH9Z7Q==
X-Received: by 2002:a05:6638:1648:: with SMTP id
 a8mr6045868jat.25.1617841251630; 
 Wed, 07 Apr 2021 17:20:51 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:51 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 0/4] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Wed,  7 Apr 2021 18:20:35 -0600
Message-Id: <20210408002039.18027-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v5 to v6:

Fixed wrapping of functions in exec-all.h to avoid exceeding the
80 character limit. checkpatch.pl now passes.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 369 ++++++++++++++++++++
 5 files changed, 553 insertions(+), 3 deletions(-)

-- 
2.26.2


