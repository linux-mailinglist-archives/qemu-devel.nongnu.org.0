Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FA5FBB61
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 21:34:18 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiL17-0005E2-B5
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 15:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKw2-0000ae-Mh
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKw1-0005tU-3b
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e18so9214681wmq.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e4q/thTgAYn2lHSPlyLmsKnMOPAVGDmLK/MULOnQ38I=;
 b=Wi2083ZghDu3ehdYO43F/XJgRujkdHzQuhb000g2VRs46swRb1Tg/aXFrsFvb+5Ouo
 MsXdF04/xALiRz1+UAg/XZe49RhcrPvgLbGNi1weWFG1xBH1mEN09ayGSIQVi+jow3Dy
 M0C/YySoZ8gEA5XX8mseUoZW8LIAMmf56+p2wNsrriqHoIGoyukBQPZbDJ+BrOOiJtSz
 yaXpx5LBpYtB4v6uKGJLUDqlUnmiEAq4xrxevYvioBszWllrTYw+xi8R5HMp0il52baC
 M1k0C5P1fUvbEOAgSAu24Bem3pY96bdR+WnHPkF66XbJPr7dag8VecCnuBWvTmFVX960
 02wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e4q/thTgAYn2lHSPlyLmsKnMOPAVGDmLK/MULOnQ38I=;
 b=PdIOKuM2FrpNDKiRk6FB7LaSOl7wji2wzG007xIVu7OTIMrHSLZ81S7hAtoNCu0LAe
 HNkFq9MqD5bXGyuNWrlXGp2EG8n70ZtkqqziRKDAUa7l/Xj+5Lbz/OpA9etLRvq/lZSx
 iShn3teApDXSMFJ3MrhAJ7zuhxhfV0fF4Gj7vwg3ILJ+3L6D5pztyadQ1ETdyNicIeXE
 u/8xwaOj6mpb7Lrl9F18GB60ozZXaeR2r6DlYjzlyV5SfEJNs1UODqZFc+DV+KHyH4dX
 ZA5EaJISvFcmGpdW3+H7YxfYTLc9uffSLj3x8eLHcTnVjQPnCJJ14JdeG+mwVX55Y6ax
 /9wQ==
X-Gm-Message-State: ACrzQf3MeSkaLLimtHoLQuM4ksN+idxcS3pmb5GDn8Pu9A/HTr+1qoWw
 QivcveNfJt6NuQlni2TRPlUpdg==
X-Google-Smtp-Source: AMsMyM7HZI+ebEz+Ysj2Lq+41lBuEfDcGMczT7ZkZaZ1VICQ4g6vzMCX9lChBLzTcfNfD5GgpCBfqQ==
X-Received: by 2002:a05:600c:4e89:b0:3b4:8648:c4e1 with SMTP id
 f9-20020a05600c4e8900b003b48648c4e1mr438780wmq.26.1665516539357; 
 Tue, 11 Oct 2022 12:28:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b0022cce7689d3sm15040830wrw.36.2022.10.11.12.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:28:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69D9E1FFB7;
 Tue, 11 Oct 2022 20:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 0/1] testing: revert pc-bios build patch
Date: Tue, 11 Oct 2022 20:28:57 +0100
Message-Id: <20221011192858.956078-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 42e1e350bffc8d4614e568a03380b2ec34a131bf:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-11 09:31:19 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-gitdm-111022-1

for you to fetch changes up to fde10960ed6a6435d89315d4fd3af9d0b51aebb6:

  Revert "configure: build ROMs with container-based cross compilers" (2022-10-11 20:26:25 +0100)

----------------------------------------------------------------
testing:

  - revert patch to stop always building pc-bios roms

----------------------------------------------------------------
Alex Bennée (1):
      Revert "configure: build ROMs with container-based cross compilers"

 configure | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

-- 
2.34.1


