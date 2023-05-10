Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E56FE19B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlo9-0007BX-DM; Wed, 10 May 2023 11:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlo6-0007AV-I2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlnu-0000Tf-NU
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so4776485e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683732752; x=1686324752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mT8b3wI1jOAZ42ahPsG1g/N0fgPfBNbODwJvXFdJVsI=;
 b=sadZ0WKFIdP5qPernAUs+u4AbU37o7RUhZDRQ7lazCBzLAj+nFzJW/ecpslhDzAzIp
 efukamcHGAb8C2oEQXkYsUqk3tTL7suGho6TEi4yJlxoqtZcWs018iel0+0/xpgBQ+eQ
 rNPOs6rNt/08NaHLETViQckonwx2FgXsHqdzKt3K/kU/+5cPCVe/8BnGcTUlTVXQr3A7
 h/M1ridl00skD7o3DekdT8zipvjwcp1l7hDFs7TBEM2r2PgX3N9C7hWBVYEOVNOU6sTb
 d+2gWtjQvrBgDDzMyVBz9RGTNc3ARZd3UKtIGEkJfL96fnh0wzoX48w/LCjbYlhWltIM
 NLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683732752; x=1686324752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mT8b3wI1jOAZ42ahPsG1g/N0fgPfBNbODwJvXFdJVsI=;
 b=HYcFRp6bFu5n/9tPYLSeXEDGHmK18rMeQKhHKr/ZJgTKBSJffXIGWkgCDccb5N5h44
 Pm9jcrnmOYzjVwncP9MbG5z9/2LZZfd8WhCPgWdLJGBM2vLQKsY1ap6t7JpuvJmK9TuK
 lekj4Y1ElxCveYH/1PRsM6UyJ3sJByTEQD11xnf4mWKkW4EaJVjqr8vUl6VZVKIxyGF3
 UexU8YVu3Eh0wpj/DcDUDH8gPVgaQhHUr1hH0rAuQdlvr40cwnw8oRX7zzLHppHdQG82
 3pGiwSqHw/FR3tf7J2EUkik8a64oyaitiYhkMHsjfpMxHCQMLLryCJNHiUNnrdfZs81b
 aEnw==
X-Gm-Message-State: AC+VfDxH4gjczoWBSopF7U3ptUCs1HyPn+TWl813zhBtiuO5QWT3Mr6g
 fC2ewLxfbsiE6TJCQrjtQVcAMDLAg9E=
X-Google-Smtp-Source: ACHHUZ4gEex/3qjAqFij+6fraDFKcmCxIv/usHWf97ewgWqsqfPIkJyjDgfv04rDB9tNCNcllzni4g==
X-Received: by 2002:a7b:c419:0:b0:3f4:a09f:1877 with SMTP id
 k25-20020a7bc419000000b003f4a09f1877mr1716451wmi.23.1683732752052; 
 Wed, 10 May 2023 08:32:32 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 j18-20020adfff92000000b00307bc4e39e5sm1621411wrr.117.2023.05.10.08.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:32:31 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 0/3] OpenRISC updates for user space FPU
Date: Wed, 10 May 2023 16:32:25 +0100
Message-Id: <20230510153228.264954-1-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Since v1:
 - Fixups suggested by Richard Henderson

This series adds support for the FPU related architecture changes defined in
architecture spec revision v1.4.

 - https://openrisc.io/revisions/r1.4

In summary the architecture changes are:

 - Change FPCSR SPR permissions to allow for reading and writing from user
   space.
 - Clarify that FPU underflow detection is done by detecting tininess before
   rounding.

Previous to this series FPCSR reads and writes from user-mode in QEMU would
throw an illegal argument exception.  The proper behavior should have been to
treat these operations as no-ops as the cpu implementations do.  As mentioned
series changes FPCSR read/write to follow the spec.

The series has been tested with the FPU support added in glibc test suite and
all math tests are passing.

Stafford Horne (3):
  target/openrisc: Allow fpcsr access in user mode
  target/openrisc: Set PC to cpu state on FPU exception
  target/openrisc: Setup FPU for detecting tininess before rounding

 target/openrisc/cpu.c        |  4 ++
 target/openrisc/fpu_helper.c | 13 ++++++-
 target/openrisc/sys_helper.c | 45 +++++++++++++++++-----
 target/openrisc/translate.c  | 72 ++++++++++++++++--------------------
 4 files changed, 82 insertions(+), 52 deletions(-)

-- 
2.39.1


