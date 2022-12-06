Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF69643C76
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlK-0003AH-R3; Mon, 05 Dec 2022 23:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlJ-00038y-Cv
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:40:57 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlH-0002zp-Sv
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:40:57 -0500
Received: by mail-oi1-x22b.google.com with SMTP id v70so7259637oie.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JzEOgD+Cp+C6p294fklDYRe+8h1pYOUBi1PzQXISUyM=;
 b=v5mRz86GkGVxto0iZExiRgKajZw7mOX0SIiJjz/jyxSWAxUvwhAZ4Ui3IytTo+jGnp
 pEu88h7q8wnEoxS7MvJEQfwmOMsityqgJmJaH+OvpziNNYk5P7WyLBhEJ2fyCtJbtUSa
 w3XgsdrNtVXOc7QHLKp61LGGHr5sEMJnZ+D0YnNSpW7AC52mT8IQcmex8Ve52mejlNcc
 mmUOeix5dzDn9/IXwvW/PGo0Cw4Jyh0ar8fBzWKXiPCR592WUe1ziKBDur4RYK3TYSTN
 JrVHtZ6XJ6pxz5yz8AVwpMrsyEXd8hk203ip4c+Vxt0wZ5A9lOL2MIJYbBB7YUPiPLSr
 ABMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JzEOgD+Cp+C6p294fklDYRe+8h1pYOUBi1PzQXISUyM=;
 b=H5GEHH0dJck+lhPeVAqviH9nLEYKUrbx6SIGpPduH48SbIYXYCFXxzpAonz+nW3t32
 pIE5HMvF8+fo4IBhHiOxIbCchH1MMdwTKILlwxbZKCRR88dzrLT7IrCellhrP6E5VY8L
 rWL7Y/ruLSwdjdI/VkrXsQWig+H2LmEDbpTPbwhzq9J2tik+pvTw4HFJGpG2FMcaCd0T
 bJk8y20SRkKGv9bTZC07ZXL2h29CO6Jxm/qeCJMKGGyTWxmGSGR4/83T2Chgz34lSAU2
 opeNOXRDgo3Xb1vAMfcLDAMRZhVTUDti6hqWGEvh9QsEFqg+s8TvpmK+WDMxuX0S2q3O
 DNyw==
X-Gm-Message-State: ANoB5pkixvLD8wvv3N0YTkXc4NWrdpNcDR5EZyXNjOW7VItEGBKK8xnx
 yuF8FRqvXZLvm4zbVVk8QgyfjN40V2fyxI8foO8=
X-Google-Smtp-Source: AA0mqf4zGsrBoBkVuLC3ZsWaIR4/WE0SL4awdLj+aQzy1AJHWLnlY0ZL3Uruhcp+PD7gNT+COY/G1A==
X-Received: by 2002:a54:448f:0:b0:35c:2027:ea01 with SMTP id
 v15-20020a54448f000000b0035c2027ea01mr4935188oiv.222.1670301654285; 
 Mon, 05 Dec 2022 20:40:54 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] tcg/loongarch64: Reorg goto_tb and cleanups
Date: Mon,  5 Dec 2022 22:40:43 -0600
Message-Id: <20221206044051.322543-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: 20221206041715.314209-1-richard.henderson@linaro.org
("[PATCH 00/22] tcg: exit_tb tidy, goto_tb reorg")

Includes:
  * Disassembler from target/loongarch/.
  * Improvements to movi by Rui Wang, with minor tweaks.
  * Improvements to setcond.
  * Implement movcond.
  * Fix the same goto_tb bug that affected some others.


r~


Richard Henderson (7):
  target/loongarch: Enable the disassembler for host tcg
  tcg/loongarch64: Update tcg-insn-defs.c.inc
  tcg/loongarch64: Introduce tcg_out_addi
  tcg/loongarch64: Improve setcond expansion
  tcg/loongarch64: Implement movcond
  tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
  tcg/loongarch64: Reorg goto_tb implementation

Rui Wang (1):
  tcg/loongarch64: Optimize immediate loading

 tcg/loongarch64/tcg-target-con-set.h |   5 +-
 tcg/loongarch64/tcg-target-con-str.h |   2 +-
 tcg/loongarch64/tcg-target.h         |  11 +-
 disas.c                              |   2 +
 target/loongarch/meson.build         |   3 +-
 tcg/loongarch64/tcg-insn-defs.c.inc  |  10 +-
 tcg/loongarch64/tcg-target.c.inc     | 359 +++++++++++++++++----------
 7 files changed, 256 insertions(+), 136 deletions(-)

-- 
2.34.1


