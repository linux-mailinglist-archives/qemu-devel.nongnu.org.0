Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8887F425CB5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:57:27 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZWA-00038A-AK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTo-0000Ff-Mz
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTn-00071L-0e
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6063625pjb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NpI6K5prWpNnI/FpBx8xU2+HZDAG7wDrtXBDXtrdrNg=;
 b=A9MUBCB/EQkeuLww549tN4p8KYcbMPZqi94Pz5bHMFLLucd1hWQfJiN/iNXkPNbtR+
 H7m7lndl1rb+6ylKEB/6RypPtJ7ZGeeCijLic2SMXhEF41pAUfrH6+FEzpHvUIIwMSJ9
 CFdU7FUBOYmOIKOESloE/WxGGDRztBjT8DKdZvv9o8dKfof2E7XLMfM8hBsvU7Czd73d
 ueNCKBSGFJg9+diBzKaHCM/QXmNUJB+FdL9HC0eAYqnPfOfFd1WlsOEt1JQ7U/1F7orW
 e2oad4AjUV+URIVAaOA3avMnCOw+9UMtrkruNvMa/575l1Y89AhZ8giuA/xQ9BCbIA8e
 w2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NpI6K5prWpNnI/FpBx8xU2+HZDAG7wDrtXBDXtrdrNg=;
 b=76ocpDQMYb3FdwKq3u7DDWWkYD4lHXsieNhzquUdZGykF7wvOkSHujUHSMtfncKpCs
 0AcvR0na2Spo9Z1MMV4dJZQIeEjIa+v1lL9l3ErGhUAByKOJdruW4xPIZ2beZvSkEv0V
 Cs5IBTSJ086GKju5cgo6rkSgeNG5cei27pEliwUA8w15Ui4lga4gqu6AEHgNwmilfRHM
 bAWwKaKXgMvD93Z5FN977A3OQ/2irQkrNw9eosPIoe+GVOs8yogxAJLGL/qxlQ0jlzeI
 YvB99DAAeAg5XxBPdTxLwwgEf8D8M322SKYSxPSHXRpXV6kGhdYddfL/kOCn27TXFda8
 NELw==
X-Gm-Message-State: AOAM531lsz6bfLXE5FRthbrNFESbNzhdvg4lXaHYJdyQ8QSQkxpWY7Fy
 0InszDhrYlsavLP4dRq/qcGwq9LMmRItFQ==
X-Google-Smtp-Source: ABdhPJyFEfqM/6Zn0ZvPxLD5OcNc3r8QIorJo+9KIzmd/+SptI7LchmNO3ssJkcF+iOCst2kKedTVw==
X-Received: by 2002:a17:90a:9306:: with SMTP id
 p6mr7616997pjo.119.1633636497322; 
 Thu, 07 Oct 2021 12:54:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.54.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:54:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/48] tcg: optimize redundant sign extensions
Date: Thu,  7 Oct 2021 12:54:08 -0700
Message-Id: <20211007195456.1168070-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we have support for optimizing redundant zero extensions,
which I think was done with x86 and aarch64 in mind, which zero-extend
all 32-bit operations into the 64-bit register.

But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
The last 5 patches address this.

But before that, split the quite massive tcg_optimize function.

Changes for v2:
  * Rebase, adjusting MemOpIdx renaming.
  * Apply r-b and some feedback (f4bug).


r~


Richard Henderson (48):
  tcg/optimize: Rename "mask" to "z_mask"
  tcg/optimize: Split out OptContext
  tcg/optimize: Remove do_default label
  tcg/optimize: Change tcg_opt_gen_{mov,movi} interface
  tcg/optimize: Move prev_mb into OptContext
  tcg/optimize: Split out init_arguments
  tcg/optimize: Split out copy_propagate
  tcg/optimize: Split out fold_call
  tcg/optimize: Drop nb_oargs, nb_iargs locals
  tcg/optimize: Change fail return for do_constant_folding_cond*
  tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
  tcg/optimize: Split out finish_folding
  tcg/optimize: Use a boolean to avoid a mass of continues
  tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
  tcg/optimize: Split out fold_const{1,2}
  tcg/optimize: Split out fold_setcond2
  tcg/optimize: Split out fold_brcond2
  tcg/optimize: Split out fold_brcond
  tcg/optimize: Split out fold_setcond
  tcg/optimize: Split out fold_mulu2_i32
  tcg/optimize: Split out fold_addsub2_i32
  tcg/optimize: Split out fold_movcond
  tcg/optimize: Split out fold_extract2
  tcg/optimize: Split out fold_extract, fold_sextract
  tcg/optimize: Split out fold_deposit
  tcg/optimize: Split out fold_count_zeros
  tcg/optimize: Split out fold_bswap
  tcg/optimize: Split out fold_dup, fold_dup2
  tcg/optimize: Split out fold_mov
  tcg/optimize: Split out fold_xx_to_i
  tcg/optimize: Split out fold_xx_to_x
  tcg/optimize: Split out fold_xi_to_i
  tcg/optimize: Add type to OptContext
  tcg/optimize: Split out fold_to_not
  tcg/optimize: Split out fold_sub_to_neg
  tcg/optimize: Split out fold_xi_to_x
  tcg/optimize: Split out fold_ix_to_i
  tcg/optimize: Split out fold_masks
  tcg/optimize: Expand fold_mulu2_i32 to all 4-arg multiplies
  tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
  tcg/optimize: Sink commutative operand swapping into fold functions
  tcg/optimize: Add more simplifications for orc
  tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
  tcg/optimize: Optimize sign extensions
  tcg/optimize: Propagate sign info for logical operations
  tcg/optimize: Propagate sign info for setcond
  tcg/optimize: Propagate sign info for bit counting
  tcg/optimize: Propagate sign info for shifting

 tcg/optimize.c | 2602 +++++++++++++++++++++++++++++-------------------
 1 file changed, 1585 insertions(+), 1017 deletions(-)

-- 
2.25.1


