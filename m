Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2703B6AD7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:10:28 +0200 (CEST)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzSU-0003dq-NX
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQN-00010j-ES
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:17 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQL-0006Fo-8O
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id m17so9746653plx.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHYS+DaPZN1zmtTmpkqAPqjeJf+Qe6pkEHpUiufhBck=;
 b=cqDbrYOdtIU4H9mZR/uq7j3eCB7CbdbbsyVRRSbLzkytOf/ojHgKr9zcl1H8g38ZiE
 hGN3/0Wo9g61FqCYVYdroiUgdD/Poa93xaZa693g3sc+JAnB9tBywDjUSE7ct7cVMz6f
 d9kupbFfOcIOURH0Fcggo30n/BnN4ljrSoJz1+1A/fZdFJdyQsGJ4ur8wN9bLd+FWI5f
 NwPo3E5cUpv6rvAQyox48+dJTtS4f+gQwY3y/OCVwhg7+oQPh5Kpi3qilVWoPtEd3T5r
 V/BgsVlODfDHXrlSNVV15735rV8I1JZydkwCr57jhS4v5o0SkLr+++decgwsMt8d8w5q
 VgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHYS+DaPZN1zmtTmpkqAPqjeJf+Qe6pkEHpUiufhBck=;
 b=gNQMBm6qWlKjIgdW/Cm90PjEGAKSlOgKWmFDiwBaweeJGchJXdhvA1el64LrYKjTwq
 Lv/cMja54JTjYiB5d9Pe6ysLvETU2seOHI6ZYIAc7JCSIfDta9kgwqrkucF3+HwuYtu7
 U1d0MPfLJWD37QGjHJoQFewWaB9o8CRfltOgeY54895j4HxITItveHVnJZhDWnY4Vr/O
 irXky7n24lbXgiHL0wqRXENkliJ6FtntRIoSDdgtNatRGGuFyWc6XNHWfAhyDy9mOuGr
 IvGHEZLjLqg6gEclY3O8bPEt+UbZleuLoAjELWU+BCtBBSAk84KrF3wd/mlJkR0RRHPQ
 WalQ==
X-Gm-Message-State: AOAM531LQLAMGMtqFl/tJbumGwQdbS1ZYRSn2+cJuRWL90Qq4hHxh7xc
 Nr8EUqztrhVyuESRKnvdQ3tKh3kff7Sagw==
X-Google-Smtp-Source: ABdhPJxrEMNRypFjMwzyXJyvK/CEshTlHqYAhlyUHDMSt/HsJ8bLM+iP+RSv3QAxaLNmjQ9d8RYFyA==
X-Received: by 2002:a17:90a:4b88:: with SMTP id
 i8mr27343857pjh.99.1624918091361; 
 Mon, 28 Jun 2021 15:08:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] target/nios2: Convert to TranslatorOps
Date: Mon, 28 Jun 2021 15:08:01 -0700
Message-Id: <20210628220810.2919600-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that, plus some other obvious cleanups.

Changes for v3:
  * Improve the commentary on patch 4 (pmm).
  * Inline handle_instruction.
  * Use pc_next for pc+4 (pmm).

Changes for v2:
  * Fix (drop) singlestep check for max_insns.
    We already do that generically.


r~


Richard Henderson (9):
  target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/nios2: Use global cpu_env
  target/nios2: Use global cpu_R
  target/nios2: Add DisasContextBase to DisasContext
  target/nios2: Convert to TranslatorOps
  target/nios2: Remove assignment to env in handle_instruction
  target/nios2: Clean up goto in handle_instruction
  target/nios2: Inline handle_instruction
  target/nios2: Use pc_next for pc + 4

 target/nios2/translate.c | 318 +++++++++++++++++++--------------------
 1 file changed, 153 insertions(+), 165 deletions(-)

-- 
2.25.1


