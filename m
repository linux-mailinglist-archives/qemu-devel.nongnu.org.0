Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B421B5ADA25
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:26:29 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIfs-00049Q-6X
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcc-00073Q-3P
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcZ-0004Wo-6O
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w5so12599752wrn.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eoRH/oMXskc9uVLihLPCU4BVLnfjM0NMaLk7vE7BhNg=;
 b=YkT42yzU2Vj7MBwlqZA4h9gw8jT3ixkJzpKqtTkINdo6Zk65E07X5VOc96fDqP8AbN
 pZdTmuNhyYyIFIRrzbxP0ZP0YuiQextAVduj0YCPdn9PSGKJPogqFJwdrwKh0U8oGqdn
 himJGWLEvJOUBW9Y0QJk0yhhGkJAXrXjQciEk6Go9RTZh9UZOAMDeVN+nWyuZ/aQQVzN
 yFT+kISPuS4xIqdgAUS5Tv37jb1FKhPPG3127dFkQ49xctGQazQkDRJN+Z6PCuoYfvx2
 YD6ho2VEhHOjS8gwZwhtuee3KdCFQ1x4+Y2d0pIRaYnZEKelE0W3yuYV/PAgWy5h0ew3
 L2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eoRH/oMXskc9uVLihLPCU4BVLnfjM0NMaLk7vE7BhNg=;
 b=6rcmVpbVL56yqjLqvg0g4CmJvxpD/DeZoTqiKySLG2DXnJ7zAn3BQ4x9zyOdxLo224
 NlalAGdFn0+HtpwSiSdZp9+ndG+hTY8y4e5er31fK2YqAlgFnQ/81VvS6Jl4wnH/1f4a
 JZjIvrAlKZjEdN0/YI7VyjExREP121Ec+kxh9H8zPUMpQL6m7UPfvYZt0gF0o4xxvqs3
 hxYmKxXgB24z2VPeOMz9Zzt1oIPNR1DEZZELwkoXA/ZCrhV7NwJJ1JoPxDaP3F52sMJP
 wfF2ck/QZJO6LCeXVqQsTQ390CVh1XTOSJhwctxbcfH2AIgo8TRknX5rB1JC/3uYByWi
 sdFA==
X-Gm-Message-State: ACgBeo1anlKlilekR3aFuNduuk9G+4atKviIacO0PEYgOANCQ6p98e78
 qRm+/4ydbqbYGhQKgHkLJad26u8QKPX9PQyR
X-Google-Smtp-Source: AA6agR6gMt0welprHSfBi9ya9yT97FSsdtVDtm70DWC01P5LHapj2QnPc9kndlrHuOgiZ0JoBRS2/Q==
X-Received: by 2002:a5d:5232:0:b0:228:6bb8:e985 with SMTP id
 i18-20020a5d5232000000b002286bb8e985mr4565346wra.10.1662409381357; 
 Mon, 05 Sep 2022 13:23:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 0/6] tcg: Introduce CPUTLBEntryFull
Date: Mon,  5 Sep 2022 21:22:53 +0100
Message-Id: <20220905202259.189852-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This is split out of two patch sets that I have in flight
that allow atomic updates of guest page tables.

v3 fixes some trivial conflicts with the current tcg-next PR:
https://patchew.org/QEMU/20220904002317.60158-1-richard.henderson@linaro.org/


r~


Richard Henderson (6):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA

 include/exec/cpu-defs.h       |  45 +++++--
 include/exec/exec-all.h       |  33 +++++
 include/hw/core/cpu.h         |   1 -
 accel/tcg/cputlb.c            | 218 ++++++++++++++++++++--------------
 target/arm/mte_helper.c       |  14 +--
 target/arm/sve_helper.c       |   4 +-
 target/arm/translate-a64.c    |   2 +-
 target/s390x/tcg/mem_helper.c |   4 -
 8 files changed, 207 insertions(+), 114 deletions(-)

-- 
2.34.1


