Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BE701530
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 10:07:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxkGD-0000ge-Ck; Sat, 13 May 2023 04:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkG9-0000bQ-Rp
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkG6-00056i-Js
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3075e802738so9823946f8f.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683965140; x=1686557140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lfvYyVVR3Ayk5rmxcI/YxouXgG1x9TjBvpbPT5wlWGc=;
 b=BJBOFu2fh18xxk7fINVxXkaILEeHzyTlDXJyarpMC2JHeMqcsamxVdOkMj5bKzZQbh
 69p+mGNrlrlT2LQ8/q7RYCzh0n5viRmrkQ3PIK030spYgTnri5Uv5rzwskVuktIb3sfE
 7Fu+eZOCLH6RFT6oGdppDPnKfGTxv36o627oMilqMssxxs+5EQUhte9APecCDSewB1E8
 LMtR6WcC1Aio3W2nEBUlosYhSol7m8+UwK1SMyQAi+CqYqjRauzkUjBdm8NXdEkP0wYu
 JJzq0uGZK90PQifl0jzz89Xcp7R9TzYTTJDFtFjUEh/W/IPkP33PDi3HHBL3t1lzGieG
 G12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683965140; x=1686557140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lfvYyVVR3Ayk5rmxcI/YxouXgG1x9TjBvpbPT5wlWGc=;
 b=l/zgaddNntt7K+1YCo2kUOJlVwmgkkzbREhJPogGRp3J4UYj5J5sjNWUqURElPlSfa
 d0rh+N6RUjqXPqN4UpX3mbcF9uB8WTtpGTcN4QfjcVDO1sloPKvF5gR4p+y0EZUMPcqS
 ADL2eZDGAnzY4IiNq1JACsfFBpSM+3YFkPn7yLc2bBAE1T65twRGz2EWx14mbnijYmNk
 NwDCHXgzifoUHqqPxMnGejPjHAOyOa/NeIx6V0DAJgMTpKnuQkISMK8pjvnGgyMcsYjt
 JkqBCrIq1w7HvpabI01RJGvy/zGAyFTyhwZc+PTuF3GYLxTMS8FzixpvqVYkFmz1SRjf
 v5cQ==
X-Gm-Message-State: AC+VfDxnRwPzZYWaXwDFuLU9IwqC0b0ux7r0NtnFfqgJ+Z+2Hl9Eodd5
 IStjXqS1mXvOPZ02N/oS/ZJ2Z58FBhQ=
X-Google-Smtp-Source: ACHHUZ6LQpza0JguEuafYE0+ErSGOfed2wl5iK8yfyLg0b81fcIBpSYYigW23RJsOlGWtGXp3hiXHw==
X-Received: by 2002:a5d:6683:0:b0:301:2452:e4d with SMTP id
 l3-20020a5d6683000000b0030124520e4dmr19396510wru.46.1683965139897; 
 Sat, 13 May 2023 01:05:39 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d428f000000b003062d815fa6sm25573208wrq.85.2023.05.13.01.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 01:05:39 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Stafford Horne <shorne@gmail.com>
Subject: [PULL 0/3] OpenRISC FPU Updates for 8.1
Date: Sat, 13 May 2023 09:05:31 +0100
Message-Id: <20230513080534.580800-1-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42c.google.com
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

The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:

  Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)

are available in the Git repository at:

  https://github.com/stffrdhrn/qemu.git tags/or1k-pull-request-20230513

for you to fetch changes up to 874c52991e1fbe020812b4b15440b6875369aacf:

  target/openrisc: Setup FPU for detecting tininess before rounding (2023-05-11 15:40:28 +0100)

----------------------------------------------------------------
OpenRISC FPU Updates for 8.1

A few fixes and updates to bring OpenRISC inline with the latest
architecture spec updates:

 - Allow FPCSR to be accessed in user mode
 - Select tininess detection before rounding
 - Fix FPE Exception PC value

----------------------------------------------------------------
Stafford Horne (3):
      target/openrisc: Allow fpcsr access in user mode
      target/openrisc: Set PC to cpu state on FPU exception
      target/openrisc: Setup FPU for detecting tininess before rounding

 target/openrisc/cpu.c        |  4 +++
 target/openrisc/fpu_helper.c | 13 ++++++--
 target/openrisc/sys_helper.c | 45 ++++++++++++++++++++-------
 target/openrisc/translate.c  | 72 ++++++++++++++++++++------------------------
 4 files changed, 81 insertions(+), 53 deletions(-)

