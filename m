Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E476FF591
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:10:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7vw-00056B-JL; Thu, 11 May 2023 11:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vs-0004vj-MS
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vj-00027L-TV
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso4350209f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817804; x=1686409804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4EMMFFjBP4WjNJpcZVHV7+t+mLFPsuxrgpTIf95HUi8=;
 b=ekmzRrBhdYFdBVRnL3IYuLbPkVe+oaKTP7r6ydvN072SazyLg3VqTAAiEY/mCJsq8e
 6zRxpq6b2SIleCLKqVyokQyYR14WfO1FXxChpB+K+3X6h1d2YiqHeAr9qPmQx/mrsPAc
 joukW+1d1Wf4xHY5R4Tk7sqiEkH93OZXe8uFlhwo6Chhs77DYAuG0wCHDYihvej9fXjo
 jlL/4Frxa2QP7jnPok2Wvcgk4KsuoHz+VLr9SoqamTX6kNIfGa1sXvUX3XcDRag/iTEc
 pGu1zcOMt1DTlzdsyOeUvKHvUFVQ4dc/sC0ztRpisywF8Axq+kvIFScgSfKeTkd9PIPc
 EbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817804; x=1686409804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EMMFFjBP4WjNJpcZVHV7+t+mLFPsuxrgpTIf95HUi8=;
 b=g6ckoz70IUQ5k7ng1Pcze0vYfIGEVfOWrfO04zScc0EgZGIGERWYx5AxwETKoloNfi
 C7KNe6tIMVXMccAYO5ADhTpFr0vxFOW/zO/JT1r7w2QgCOjPbaMB4GLUZZ0R9DZO2a8M
 x0n5VADV1QGjXVes4ERg3O4VwcAB3ewA0u4yiXB80pqWMRg4VNzZGO+p1lOiWKgQvCl4
 LoJ59+4wiVov/k/nFMHkvDq3CDAs2j6eWML+E1s5LrbiAQL36/AoX4nC5LQfIu4+BiD0
 XLMLalYDZb01GMyXkovyZLE7MaBJfQnn73QCwI6EgTlRd6xuYz4NmAk7hbFLqE/vK3z4
 IQZQ==
X-Gm-Message-State: AC+VfDwBEIU9444Re2qnvLlGWOQdFY9M9fmgSJOkf6S6fZlT3+pRRcbN
 eJm0njwpVK5pFZFKkKdP3exs014mY/I=
X-Google-Smtp-Source: ACHHUZ637Cm0xG1mf+vZW+8aCeQA/XIwLe6U0Fl+tT5HWR9SETswiUXUVgVD00m8BiYcIAaqVZ/ndA==
X-Received: by 2002:a5d:5308:0:b0:306:3a47:cd78 with SMTP id
 e8-20020a5d5308000000b003063a47cd78mr14767817wrv.71.1683817803997; 
 Thu, 11 May 2023 08:10:03 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 r9-20020adfe689000000b002f6dafef040sm20721330wrm.12.2023.05.11.08.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:10:03 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 0/3] OpenRISC updates for user space FPU
Date: Thu, 11 May 2023 16:09:56 +0100
Message-Id: <20230511151000.381911-1-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hello,

Since v2:
 - Add reviewed-by's from Richard
 - Pull cpu definition out of ifdef in helper_mfspr
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
 target/openrisc/sys_helper.c | 45 ++++++++++++++++------
 target/openrisc/translate.c  | 72 ++++++++++++++++--------------------
 4 files changed, 81 insertions(+), 53 deletions(-)

-- 
2.39.1


