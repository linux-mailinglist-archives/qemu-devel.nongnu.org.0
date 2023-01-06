Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A2660756
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDseB-0005gg-QA; Fri, 06 Jan 2023 14:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse8-0005gN-Ld
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:56 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse6-0001ag-VQ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o21so2517960pjw.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W12YtWqdEbMdRqFQXwJwxPYsU4QkPqBhgrstRSwXPCM=;
 b=NT1OxOtNCyV7iLjQEgYzS5lQdNAJpmEgt8PlfYSiMzP1n+r+UNYIYO3RhRiqtkm/rD
 KHAWhwId8/7re/uLVYl7Y2XfKrgxIjpY03U2T9rmJmSKilgagwW3MHKzaOW8VFpo8+8L
 bqeaJSNzLCO2++8Va9i/s79hyFtypXsTuc5hrx7jv2G0AUYNLlJw9fjPcDEra0LUmurD
 jeL7Negk9mbwbQlpXaeRwE+yc+2vwI4DnQeatlVuFvZjeHv8+iOSfgVY38ZXAnOVyUTY
 BwIixCJORll8alJa/fP4SxhNe40FjcbAwqa2AnLSN++1juzHYYl/QTua8aB6Lao31mOk
 pSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W12YtWqdEbMdRqFQXwJwxPYsU4QkPqBhgrstRSwXPCM=;
 b=8SF2W9Anmc0orsFxb6a2QtHth42fJqUaZe/ZgqQuyuzBnBs+O5tFXOq3uGQ3rnNDOy
 gAIKe26E32UDdL8OjsVDrqoCrdtL2n7VsqJhQR/9HWx/ehFgECajLyqUFloDc+kiHu4N
 /xm/DiMm0pDHm7J5Xvve1kxRTThRRQ7qooI4SrJRixMreyKnBCBkm7ZyrjMHx8qhmiJ7
 P3l5rgLZtKE89PjDAaHt1z4FWw2FEu/bdRxjUJ54+/6ldYhxjehYTP4UzciqYawIgu4t
 ggmHDpYaHFejVwY1e5Gu6y2lvasT+bHqacwM3BRVWY1RbVG9o5cNmxL3/4BGxBzFzuel
 LCnw==
X-Gm-Message-State: AFqh2kpSuzmubeLytRNHcUseeHSVcwlQmqJbWjyEfaHpMNsq8I7+X4WQ
 J1MYdtzQRiqw9eVA1p7o69VWVpcOqHBO5PW0
X-Google-Smtp-Source: AMrXdXuFunsnHo/0kxR28pIUgGWAEA8HEzep+pq8y7wfiT3pZafdaB3zYC/e02POZgjkYnibAs+Y0Q==
X-Received: by 2002:a17:902:7584:b0:191:35c9:db30 with SMTP id
 j4-20020a170902758400b0019135c9db30mr53748370pll.5.1673034293084; 
 Fri, 06 Jan 2023 11:44:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b001867fdec154sm1277441plh.224.2023.01.06.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 11:44:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
Date: Fri,  6 Jan 2023 11:44:49 -0800
Message-Id: <20230106194451.1213153-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Here's a short-to-medium term alternative to moving all of the ARMCPU
cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
dangling pointers to freed objects encoded in the compiled
TranslationBlocks.  (I still think we ought to do less work at
object_{init,realize}, but that may be a much longer term project.)

Instead of giving the helper a direct pointer, pass the cpreg hash key,
which will be constant across cpus.  Perform this lookup in the existing
helper_access_check_cp_reg (which had a return value going spare), or a
new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
because they still get a pointer.

This ought to be enough to re-instate Alex's linux-user patch
to free the cpu object after thread termination.


r~


Richard Henderson (2):
  target/arm: Reorg do_coproc_insn
  target/arm: Look up ARMCPRegInfo at runtime

 target/arm/helper.h        |  11 +-
 target/arm/translate.h     |   7 +
 target/arm/op_helper.c     |  27 ++-
 target/arm/translate-a64.c |  49 +++--
 target/arm/translate.c     | 430 +++++++++++++++++++------------------
 5 files changed, 285 insertions(+), 239 deletions(-)

-- 
2.34.1


