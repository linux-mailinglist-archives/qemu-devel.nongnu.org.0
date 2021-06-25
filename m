Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE43B3BDD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 06:58:49 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwdvT-0007St-Sx
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 00:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwdu7-0006Do-JL
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:23 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:38796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwdu5-00026n-KU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:23 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso7627936oto.5
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 21:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsINzcpOcRumgmWEJ+dFYvZrgGjS6v5OoHeTWT+jYNk=;
 b=pf8mY6/U1LFbjdvTN4R+QcF+9u2wUrsaa4O0SFLmvZ2xgjZJ1OfOVvT1WBXnUfyHfI
 Ml0/VA9OMv7FWmToqRw3srXiM4CZ9na8nT0oGf+JBOu5dma+3f2NUpUCigtiLxnL4PcH
 PtSPGUdulEk38Nk2LjBNqDe1BZ7u8Lg5UHvRIwspkfkY1QodpkO9IDHnotHtl6ilNnAl
 GdHCuoHwY3w/Bkwc2tpyTY3QZqpPkN/bfXl8ze9X85sIkQsXcdGhmkVCURHcLNz261mC
 v5T36/ih6CXdaMlYBOB8nGMfasvK7+K7aTbnZWDi2ef+s44qRd6s0Hz9bLLpxfaVgYV7
 NDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsINzcpOcRumgmWEJ+dFYvZrgGjS6v5OoHeTWT+jYNk=;
 b=bkzs6EBD/nQ2uuiGrC3Xtgkkbk6PI/GIBF0CUSjX/dYAS3oqIx9QoH+G0J0AKWhQO9
 r7Vtsr2SEVlfaF+b908mNt2iAlrzi+J6o5EdPX0GKu9759QQEh+DttG0RJPWd4rQztgO
 PQX5jYZa6AIlbF1fKSG4cZu7s01KWhoXc/10scmfdixRmOphOyXMgONyqDsWBi1Tm4YR
 FNq9nzDk8L20su5P082mlEBN0OPRyHDg3c9ve/mLBNCEN6/f/Fea+t8QOOq50EyyHe70
 OOkHwos2a+kXjSx7gKfDd3MBzWau10uEiUJLjJ1eyuCP90hM3YgI7M+vLWmvSThmFTFH
 lWCA==
X-Gm-Message-State: AOAM533QHP1PW1QCYKX+X4z0WojQ65gCs/CnCeAGcuwsqUGFJOU6Enui
 PkJ9tX3eLqIvHV5Rhxnnxf4H6AjtmLGVJQWs
X-Google-Smtp-Source: ABdhPJzGEm3dEREXwYMXhYySVu4dqIkdElDA+lYrzlheFva7QI5GWsjLZPqJ1gLmI0lSjS5MMrkVQw==
X-Received: by 2002:a05:6830:823:: with SMTP id
 t3mr5716331ots.334.1624597039540; 
 Thu, 24 Jun 2021 21:57:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p10sm1243157otf.45.2021.06.24.21.57.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Jun 2021 21:57:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Use correct trap number for *BSD
Date: Thu, 24 Jun 2021 22:57:05 -0600
Message-Id: <20210625045707.84534-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::334;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, riku.voipio@iki.fi, richard.henderson@linaro.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a resend of a patch I sent back in March that was missing the proper
includes due to a rebasing mistake.

The issue is that all the BSDs use T_PAGEFLT to signal a page fault on x86,
while linux uses 0xe. The patch harmonizes the different ways this can be
spelled, as explained in the patch itself.

Warner Losh (1):
  tcg: Use correct trap number for page faults on *BSD systems

 accel/tcg/user-exec.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.22.1


