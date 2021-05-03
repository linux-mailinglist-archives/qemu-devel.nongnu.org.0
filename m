Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D84371FD3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:42:31 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddWY-0004zh-2V
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQC-0005kp-KH
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:56 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ6-0008EE-Cc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id e15so4807828pfv.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWirBU951icnBToYLTgM8x5DVO8SXcJ5qKHlqx8jJPY=;
 b=FtauXo2NTB3I6TOBoBKaGBNjKKQG/6iVqNdF7Q7yKq1iq/xmO4Pf4Wz0feg9Br+CNm
 EV7/M1ynugaOR6fv97DeFE0HlGYQpOGlD6ydZhUHZAK3BKh9SF5gkn76cd1g3SEcES2b
 0SXcbu9lfKtSc9CqkjPYB5/kL07mu+neHr98bkRd2EdjnjEHVXY47aqymAaA23RiqFF8
 cEalQ9DzmP1vSjM3JQDp1cPfsNsSnhbBkLX6HfY3hJTxCClufk54FDesMs9pFmtJm8Ga
 AnazuFN0m9Z/Zv5Fik8c6F56F0SRehzFlMUUOpAvYmTJY22WkcfothLGWsN/Lv7kRwNF
 Vc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWirBU951icnBToYLTgM8x5DVO8SXcJ5qKHlqx8jJPY=;
 b=Ztv+HEg6BmHDAnFWCLPWwunCRnv0OBBFa5hNih+FjG4zXwjpo/8OA1Y7nXekDvx8Pp
 OQ2TFhby/8LK1zY5hM+yj9nS0/cuJDs7IvryB8XcMUayh0LO7Ze/hqVTiy3LSXHLn1Wn
 iwyilUFsR+GM1dpAGHGs1osrikk1IVozYWT9HCzx4djWRouaCHqGBpc8AAXQgIyer4bP
 O5GrfbjAmBMy4SbJfT97NYIcPi2Zef/eaVfQJbcz41AGZ0hVXZwVWjLwosSS8D3fJwIn
 fPfpOGvmHUvsmAz8qqbrPwLFXIwI2oJLR1YXl51JhLQADxBX8va9nALGWBKfD/AS3QNI
 jTnw==
X-Gm-Message-State: AOAM53358/TzvWpjY02fVGpvC2Ppt83CRTAsEg4Y9eTjuD27wMV9Msy0
 zUa58pn3Oq2srwzW/98GROvQvSU750KqKg==
X-Google-Smtp-Source: ABdhPJw99V+c/oxRkt7xHQ1uZFuU1kS+jopaF/LKvi7hZI/kd/sXnyCalG/VhOO7PCyMGX0eIiaRZQ==
X-Received: by 2002:a17:90a:d085:: with SMTP id
 k5mr328796pju.221.1620066942590; 
 Mon, 03 May 2021 11:35:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/16] tcg/s390x: host vector support
Date: Mon,  3 May 2021 11:35:25 -0700
Message-Id: <20210503183541.2014496-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v3:
  * Rebase on master.
Changes for v2:
  * Rebase on master, now that all prereq are upstream.


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
 tcg/{s390 => s390x}/tcg-target.c.inc     | 920 +++++++++++++++++++++--
 7 files changed, 977 insertions(+), 95 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
 rename tcg/{s390 => s390x}/tcg-target.h (66%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

-- 
2.25.1


