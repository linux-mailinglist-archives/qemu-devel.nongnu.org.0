Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8FB3D3D80
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:24:30 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xyP-0002n2-OB
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvr-0008NU-LE
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvq-0000kA-5U
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r2so3006530wrl.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3higFKBpWHoN/o0EaoEZiCD97XB+WWIsCQWkN89RI=;
 b=sYzIkFHiFA0k+1SCYscQ3bpka5ogoD4koPYecSEvQCgUwpGLmQ3vGlCS7RJYUlX2u1
 r+CkC9S2T8x6+BlB16AzLVFBoYILzf31zeoHdxC1cQyOef7nlT6IR++8zojq2efjO798
 0+LOqfNgE/yIJqBADQz9bWujb9aNZK4OuOvU+tu7MP+tqzVSDPpuMKj0tiV6LsL6X0V1
 pQA0dTm7Zcin6du9vEA2tn/0cxoA6NrWWUkHlQShYqjoklC/1CLfNN6pUWXJuFms/zew
 Rc0gkIrR8Ejg8Q0UjLa/qshYfGA+3ImaZXowyubpXt2hzS2m9zQJ98ieUi/i8MKWkacE
 kaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3higFKBpWHoN/o0EaoEZiCD97XB+WWIsCQWkN89RI=;
 b=Fs8aLqmQf0TfHICpmuTvRWEccf6Bqdrlc1OIFC+8G4mt4EnORvdJcjeUxkLa5OUaQA
 g9V98PiTHnW7KUbOfyqyvEY90PMrcTIpImIx/u2e3B3yWp7L3tMY0jymsIXZ7PXG2R5i
 AU6erk3Pxb9qJHwRDOi1UhELr79ca0s9esio5h1PhFaNpo+yT1X9xfYCpTdr2GiQz4sx
 ESKptFoTvPCkfPhO7H+SmdSgph+eh/qz1qFc2+XAsgY+8G42QdelbWBqfa63KlpxQJyf
 ELkVjEhiiXy/wzOp9kYKMNf89mdrJqZTpiZ+3dHuyCZlI1Lk3Y6bslljrT/Cn7XJ606h
 4MfQ==
X-Gm-Message-State: AOAM532lKBPRRTJ316wRLMavluLBJHInGaQ4SMRCKBhL0zx1bPD+eMnb
 oCfhtoVHFirDDROFHJuEGZjqd6QGPY9pPw==
X-Google-Smtp-Source: ABdhPJy3p1CeoJEaOh1gkaDwyFwCfb1xPXeyoXsWu2oXdHuoP8JZGNO6quny1ARwS1068V1dQ+1D2Q==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr6375067wrw.30.1627057308726;
 Fri, 23 Jul 2021 09:21:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/6] arm: Fix a handful of M-profile bugs
Date: Fri, 23 Jul 2021 17:21:40 +0100
Message-Id: <20210723162146.5167-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

This patchset fixes a handful of minor M-profile bugs:
 * The low 2 bits of SP should not be writeable (they are always 0)
 * Missing 'return' statements for some "tail chain to another
   exception after detecting an error during exception return" cases
 * Alignment faults were being incorrectly reported to the guest
   as MMU faults
 * ISCR.ISRPENDING wasn't being set if there was a pending
   but non-enabled interrupt
 * ISCR.VECTPENDING is 9 bits, not 8
 * ISCR.VECTPENDING was missing the new-for-v8.1M behaviour where
   it hides the identity of a pending Secure exception from a
   NonSecure read of the register

Nothing here is very critical, but they might as well go into
6.1 because they are bugfixes.

thanks
-- PMM

Peter Maydell (6):
  target/arm: Enforce that M-profile SP low 2 bits are always zero
  target/arm: Add missing 'return's after calling v7m_exception_taken()
  target/arm: Report M-profile alignment faults correctly to the guest
  hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pending
    interrupts
  hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
  hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions from NS

 hw/intc/armv7m_nvic.c  | 40 ++++++++++++++++++++++++++++------------
 target/arm/gdbstub.c   |  4 ++++
 target/arm/m_helper.c  | 24 ++++++++++++++++++------
 target/arm/translate.c |  3 +++
 4 files changed, 53 insertions(+), 18 deletions(-)

-- 
2.20.1


