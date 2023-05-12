Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FA700D94
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:03:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWA7-0001BU-Dj; Fri, 12 May 2023 13:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA2-0001Ah-Ai
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxW9z-0002Ae-S0
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4ec041fc3so15021775e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ueubw5KltBE4os4M396AgVu2SZrzzzKu8HwoAbgmG8=;
 b=VtFxRWMMcMbOXISdPXE2AaBLVOECIuycxFVlHdHFmXK18FcpqZlLFS2nuZArsLsn3U
 QYZoWTJ26PJlMnllfvkghcZv+TsPwqIzFnIfCscq0D9oCjmFRCT8yvds989422bIdGiW
 CS8CbhY8WG5f7SU80QlQDmv5dV6aqcHKHzIwjRACEvAuzk7dWwSMVi4+G0GJBPiQHQCD
 6CFiKuN+xuQ+nLDXnpRRi46N4tIqGmJp/uHyfgtYO7awWd9h5uyMpcPRRBkzsWcu1cBB
 nRZeNnXzHM463+T2dd/2NVCKCokd0TUyijXc5eOaW55U63DnbI1kIzYWoRTkgqbExIzM
 uVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ueubw5KltBE4os4M396AgVu2SZrzzzKu8HwoAbgmG8=;
 b=A0R31uG3CBD3ysXUSg8wtffph4tIgb9831b5FSxsl23ut8YqqVLhV2mJfi7ZABPmNY
 1WrbJzHS/qQ4op1K8HugMb20mKk/XJT4R7LX/ADfHSEgRFxdNWpaQFlJTmXNADT90nkp
 r6eRllHl3QH6IP1Aq2Pf01yuC7bN5stXPtYE/cGvHMj2m+WYaNuBUwhrHAAO4Rqb5n27
 lxTon/z52bgAtdtTzGNrQaDavGtCVtsT+4pI0hkzWX23lg+eqqBEf2KXeAi4xUnTRy5K
 d4CMVbZhMkuxxeowJtfM/TJUWfX2/NzTTeSH1rcjhuuHwTKa5Pf3MCAGXIjpfv8DfYVQ
 PZ8w==
X-Gm-Message-State: AC+VfDxOgjMdoKTeJtpm5JBdh32JgpO6RnN2nCfQa47zD2slfBOKdYtV
 zdzh2dbACwXof20zMkWglRR+/ojl78qU7DnqhOI=
X-Google-Smtp-Source: ACHHUZ5u3YZaOhUe3D6ss2NoLEAgDuU8pegYwEZ/lTeuVIY9g03/uhWSI4rt2QcxhLpVF0OgJSqZAQ==
X-Received: by 2002:a7b:c4c3:0:b0:3f1:8085:910e with SMTP id
 g3-20020a7bc4c3000000b003f18085910emr17481472wmk.9.1683910945214; 
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm3521004wmg.20.2023.05.12.10.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:02:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] arm: Fix two minor coverity issues
Date: Fri, 12 May 2023 18:02:21 +0100
Message-Id: <20230512170223.3801643-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset fixes two minor Coverity issues which are
entirely unrelated apart from both being in arm target code.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Saturate L2CTLR_EL1 core count field rather than
    overflowing
  hw/arm/vexpress: Avoid trivial memory leak of 'flashalias'

 hw/arm/vexpress.c        | 40 ++++++++++++++++++++--------------------
 target/arm/cortex-regs.c | 11 +++++++++--
 2 files changed, 29 insertions(+), 22 deletions(-)

-- 
2.34.1


