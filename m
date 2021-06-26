Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A453B4CB6
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:04:32 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0UZ-0000yz-Of
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TI-0006l1-Rq
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:12 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TF-0008Br-Ng
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:12 -0400
Received: by mail-pg1-x52d.google.com with SMTP id u14so3520254pga.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c/A2sKtULIkrmMf1HqsP1lUVYcfLgZ6bHr+698hu/+4=;
 b=PWrdUcYDz9pxFrZc0nU1xM97nSpCn02W3vwCHtPNxTE6r2SoL6rsxbJxc7kX1gCunp
 ACIsBV5xT7mcDgJOz6U0Dnnj/rzNht1GW9Ac6lcE9A9zHxVTitka75iU8rBr37/cIWt0
 1Ng7bG7yOb+yFBIx5ssV8m03qAOcibVK3oMV8rdfPGWGT3lGyLrSwAlsLCjiVU1aOtUd
 d5dbOEDK1K0Z5c0G8Nj0bh1PAmGmOjWwautBVNSb+jZmqA3+1TwbMzcCszcenLwRhcRK
 CM7Z8G9aVlQz5uV9kSrbrWkrA7yurFVASLWfOMpRI1bQGd6z1YaFNorK297trWIY0ivx
 CXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c/A2sKtULIkrmMf1HqsP1lUVYcfLgZ6bHr+698hu/+4=;
 b=LaE+dTi7kV4yDpgy/L5u1P2Dmb9ZtojGpDok56kaCenz1aBC7O3z1Z2kkDqz0tjSMx
 Q+sqKB6jZ0L8YcKjVluWaZktdEjB046fUyowZlYvm4qCu623Lnl10iKR7N63pAGBiLWY
 oou4eYG+fbUdfn7X1DnBDjUNn1E421rQX4xb7wxLITZIZ9SdZnK6lMwsRV+/zPp0G4a9
 HOVNDlzue+I99m9eLfecADizcLCbm5l7BeUgmv0ghMjl+HUp7f4XZqLY4jkAQpRGACty
 3WkmnU0pfq7tQCqw5s6ipndekrH3+bmuV4sw0cpu5KG9Xc7qR02oimrquDlY3ektwiPb
 PJpA==
X-Gm-Message-State: AOAM533PUkbMGay0omLXLgfkWS7OD44+J97rmc+zztJvf1Nc4/NMZv6b
 sJ5W6VLhWkF8HTGMbj70k+uRZ/cgugBtlw==
X-Google-Smtp-Source: ABdhPJw8wLM6oGweVWIuNgT/eGbpjSmN0Qi90S+upchGqfNQc05bTtUqUeAKW9CZwoyUZTFAhqFQgg==
X-Received: by 2002:a62:8fc8:0:b029:2ec:9b7a:f59e with SMTP id
 n191-20020a628fc80000b02902ec9b7af59emr13961427pfd.39.1624683788158; 
 Fri, 25 Jun 2021 22:03:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/16] tcg/s390x: host vector support
Date: Fri, 25 Jun 2021 22:02:51 -0700
Message-Id: <20210626050307.2408505-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Fix bug in RXB (david).

r~

Richard Henderson (16):
  tcg/s390x: Rename from tcg/s390
  tcg/s390x: Change FACILITY representation
  tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
  tcg/s390x: Add host vector framework
  tcg/s390x: Implement tcg_out_ld/st for vector types
  tcg/s390x: Implement tcg_out_mov for vector types
  tcg/s390x: Implement tcg_out_dup*_vec
  tcg/s390x: Implement minimal vector operations
  tcg/s390x: Implement andc, orc, abs, neg, not vector operations
  tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
  tcg/s390x: Implement vector shift operations
  tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
  tcg: Expand usadd/ussub with umin/umax
  tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
  tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
  tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec

 meson.build                              |   2 -
 tcg/{s390 => s390x}/tcg-target-con-set.h |   7 +
 tcg/{s390 => s390x}/tcg-target-con-str.h |   1 +
 tcg/{s390 => s390x}/tcg-target.h         |  90 ++-
 tcg/s390x/tcg-target.opc.h               |  15 +
 tcg/tcg-op-vec.c                         |  37 +-
 tcg/{s390 => s390x}/tcg-target.c.inc     | 925 +++++++++++++++++++++--
 7 files changed, 982 insertions(+), 95 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
 rename tcg/{s390 => s390x}/tcg-target.h (67%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

-- 
2.25.1


