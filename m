Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E223E20CAC6
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 23:43:55 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpf5e-0000mh-8p
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 17:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4P-0008Dl-A7
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 17:42:37 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4N-00072O-1v
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 17:42:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so14639250wrs.11
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0L5wQryvAxZg2uQOIJc+wY6esS/MPxiWmAjOVxgL35o=;
 b=VdGIgsvZYEvdI6unwaENYbt63e2u2rDQs9AQP4C8wCtXuc9jPhE1KEidMfb7tGsJsV
 cdY6pMoU1Q1WsDyVXnJUGiuj+lRhlDUW8C/C7u7ZjiY1jez/naScgBn+gWxqYYEfOUDp
 PULu9t8zZajuRG+KMdTcyF2TW9uiKLOgOnh7RE9acXp04bcCvAB2P/UDnmziDcodMpC4
 xXsgm/WA+A1rhJKFrXzj3KqMxQ6ZChnTgycWlGQLgoA5DQG3vDFUZcWjENo2vxE0aN5I
 jHQ2cMhJAxkgD+SKEvtXIkUS5ingtloY9KfKLuwOk+919/14SRDH0loP42HCx2gcbOka
 WtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0L5wQryvAxZg2uQOIJc+wY6esS/MPxiWmAjOVxgL35o=;
 b=MMxssg3IzyTjeeq8ufophNDizVJJdQ9LQtSW+JM7mB865MS6FfCMrNnpPXkBYKA39W
 AZJftmlIKUrlkl8huWdwqMfX57oLBAm/CFXDMXgEefow6H2wjr+kD37jGq7fsIex15x6
 ipi5yjUU+RhRI1QS21x/a32WmCHWx0Sk4pj33nNQdxKZvZNg6FCDS3Rwpfvnv81/5cEs
 OaPtY1QWKC7pqydjFQiFsv0+BCisXU7zDM7TB24pnyhjQ1tCdhDRmRKhJJxpsuYy1EYw
 UCC+9cc3bsG8f5fFF7iCSWU6YrVvzjF3SSZ/gDFSj15HhLipg+5xk56mDulycq7JPsyM
 IFEQ==
X-Gm-Message-State: AOAM530CTXjJzWMst+v3rDPYAhQYRYdhLvusPrhvbHhGuKxmpb/ebPwV
 zAGAWKDKA5Qz5dyOCRcQrZ0HtQ==
X-Google-Smtp-Source: ABdhPJzfwWvfbVoTFRu3pFQ3IYLgmufinzQUeH+6fMaaL37BzU8coOu49jysJObC4Nz9PN2yfxt9Yg==
X-Received: by 2002:adf:f984:: with SMTP id f4mr14088274wrr.221.1593380552472; 
 Sun, 28 Jun 2020 14:42:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t16sm26300948wru.9.2020.06.28.14.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 14:42:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/palm.c: Fix Coverity issue CID 1421944
Date: Sun, 28 Jun 2020 22:42:28 +0100
Message-Id: <20200628214230.2592-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

As for spitz and tosa, fix the Coverity issue CID 1421944 which
points out that memory returned from qemu_allocate_irqs() is leaked
by encapsulating the GPIO handling into a simple device.
As with the other series, detabify the file first.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/palm.c: Detabify
  hw/arm/palm.c: Encapsulate misc GPIO handling in a device

 hw/arm/palm.c | 111 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 34 deletions(-)

-- 
2.20.1


