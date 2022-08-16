Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BE595BC6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:29:48 +0200 (CEST)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvhb-0000l8-E4
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveX-00055K-Uz
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:37 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveM-0001jG-11
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:37 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9294024wma.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=QgrduMlHGiXz/KQJdizjHfOEEcIHkCd/ccyCx+VT6a0=;
 b=PNNzilDHiFXdtzq83W+4+f9Q5xgunVdy11GD1R3ZgcQemCrm7arklLF5Yb8LrXD9ou
 8UM6fS8DmD7azQqheJ3G6Vqb/a4FHk8zjkKSUwf1A1+EYqiV+hi9bHVmTmf+HSVQs8fj
 +IZsCXhZJQ1y6Dextpg210f+yVZOZICdl0QAT3i3wnTY1EzVm3ahZ6TyZlTEM7sH28Dz
 ixtCakKuiALvL5FOj/a1HXKjKp+yGGfG/+XgfJ60aiNbvD9D/PS3YD6HY4BjzqM0BCKh
 DLGe9LGVPHgFiDirVkZ/gR3awgg258NC8dkUm8znfc5S83Pudzj+DMxjXAAUFn2We3yb
 U2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QgrduMlHGiXz/KQJdizjHfOEEcIHkCd/ccyCx+VT6a0=;
 b=DfLdCGdEY/lB5NYu/+zJ7hMgyJVsTg8ZkdcS6m6Hd9uIMaIao/p67TCogjXLSer8ef
 sis632fB+oo2kt8utRtvslgOlYObRhdY7takAMpvPo8cNvEmwJrAxwNe50uq2mQEwUSK
 MyYr+AM6O2vw4w10bbz+ifHGKrRGHsYf+CTjbJ9DI9XK+ylicxHtYrtuL9k7xOQG60sQ
 U/0+st9JNBUKMrXjSgXsRwXJeqVd7INgwQxyn5Zoe8N6cflTJqSmNXTuWOkQqX5xV+/P
 CCzFo9VuTqKuG7uDRoy73vA36rSp8zs3obb2ocrSkTZQN/ehuSw+IiBGl3t6jAyfwuRj
 3TNg==
X-Gm-Message-State: ACgBeo2A6+rO6H/vXnIW9mO/hmSPLz4VG1MVyGVMqTUg08Xwb/dA0JZ3
 ah/x6sjt6m2DIDeclnEct+1awg==
X-Google-Smtp-Source: AA6agR5mnCDAPb3rNUbGUFwpbciLf6DdBP7cpx47QzZMNay0IeqRwERV2DsiOG28ErPtckgcBIG2xQ==
X-Received: by 2002:a1c:ed19:0:b0:3a5:4fb5:bcd6 with SMTP id
 l25-20020a1ced19000000b003a54fb5bcd6mr18498276wmh.100.1660652783241; 
 Tue, 16 Aug 2022 05:26:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bp15-20020a5d5a8f000000b0021ee65426a2sm10287052wrb.65.2022.08.16.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 05:26:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D05F01FFB7;
 Tue, 16 Aug 2022 13:26:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL for 7.1 0/3] memory leak and testing tweaks
Date: Tue, 16 Aug 2022 13:26:18 +0100
Message-Id: <20220816122621.2066292-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d102b8162a1e5fe8288d4d5c01801ce6536ac2d1:

  Merge tag 'pull-la-20220814' of https://gitlab.com/rth7680/qemu into staging (2022-08-14 08:48:11 -0500)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-7.1-fixes-160822-1

for you to fetch changes up to 65711f9a87874a9ec61108c6009f8baec07c8b0d:

  tests/avocado: apply a band aid to aspeed-evb login (2022-08-16 09:57:12 +0100)

----------------------------------------------------------------
A few small fixes:

  - properly un-parent OBJECT(cpu) when closing -user thread
  - add missing timeout to aspeed tests
  - reduce raciness of login: prompt handling for aspeed tests

----------------------------------------------------------------
Alex Bennée (3):
      linux-user: un-parent OBJECT(cpu) when closing thread
      tests/avocado: add timeout to the aspeed tests
      tests/avocado: apply a band aid to aspeed-evb login

 linux-user/syscall.c            | 13 +++++++------
 tests/avocado/machine_aspeed.py |  4 ++++
 2 files changed, 11 insertions(+), 6 deletions(-)


-- 
2.30.2


