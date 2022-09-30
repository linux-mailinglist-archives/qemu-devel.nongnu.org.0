Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A315F15C5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 00:07:26 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeOAH-0006iu-0G
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 18:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6L-0001ez-EY
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:21 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6I-0002Xu-Nq
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:21 -0400
Received: by mail-qk1-x736.google.com with SMTP id i3so3670681qkl.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=abtjv10XQbaXWqEoZM2H4srv4G5QffJXMQGHpMDHE7g=;
 b=gu9bl8dXALWqiTrVQ42iP4UaZ95j3ue5V9Mq1hb5MTjK7+f3XWxQdyu3MIuVs/541W
 G0fpCaJIt3V+c+V05RDd/rMqtE7c+WMQvXDq4O9AiJltKqJUapJVc2FH9Vy5BinKzO67
 HIOzCZRlTpq3T5UrdlB+Tg6XjSEbf9MXtH5U/Fi+/EavvWp44Yteo6tajzlIj4YmYvOc
 XYIhydR/VRUa6TlDiTKCeLm5LiZXrJ6IJwsdPUibNxhdmQHFyi5jxCBqAMlUHZh6Q130
 RzVq7zaKlapbxFLHM5h/YcIvlwUWyfmqKhXF67eIPngHmM36XNWBpjdPU7NKUlkTM19O
 ILFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=abtjv10XQbaXWqEoZM2H4srv4G5QffJXMQGHpMDHE7g=;
 b=eZYk4E6rJ+jCWMEzzJJfIGeSjl512dnx2RTS9qaNF8mb4da+kNDUj2REeBGDXtFXi5
 OAZcAUv9W55Gwwx0N3A7klYyYYKetNXdO3ObO0oE3eoa6Necbb/s8SnkmHHkjezeQhVD
 XFYVfW0kc8T4uyoxP9qx8kwtgB55U778RptSrkkp1ZllLRS8lFt7t5ExwhEb0UcSbe2P
 qJPAoMN6kNJheU7tPmKJpQ5ppc33CpFyI2tWw1z1XMT2GlzVQNz3esoYjCl0ZCKaE4PZ
 gtK0qKxmxkqd0hU9TOxXfcBB3l1VuhSNSLUq/EeN1ewkW8qsMUCbkGu+0Cbk58NWpgXH
 1Kjg==
X-Gm-Message-State: ACrzQf0kE6j47PGiBNRqtYoLmh9QtHi3T+tSBcyGEZ6PCnmS0rq3bLmq
 cgseni1AjRbfLzzW8M6grQ3Yk3lVU4huPw==
X-Google-Smtp-Source: AMsMyM79xFcNK1bKNKUMGruJjC3kjOf1z4ioMp/aVM26PknrslBY7Y+ZyS/PNIzP0PKTPg0wNedtPw==
X-Received: by 2002:a05:620a:404f:b0:6ce:8c88:406d with SMTP id
 i15-20020a05620a404f00b006ce8c88406dmr7678455qko.358.1664575397085; 
 Fri, 30 Sep 2022 15:03:17 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 0/9] target/arm: pc-relative translation blocks
Date: Fri, 30 Sep 2022 15:03:03 -0700
Message-Id: <20220930220312.135327-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v5:
  * Minor updates for patch review, mostly using target_long
    for pc displacements.


r~

Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")

Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Remove gen_exception_internal_insn pc argument
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   1 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  35 ++++-
 target/arm/cpu.c              |  23 ++--
 target/arm/translate-a64.c    | 174 +++++++++++++++----------
 target/arm/translate-m-nocp.c |   6 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 235 +++++++++++++++++++++-------------
 9 files changed, 303 insertions(+), 185 deletions(-)

-- 
2.34.1


