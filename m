Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B42EF662
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:21:44 +0100 (CET)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvSI-00045j-3k
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJC-0000WK-Uj
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:18 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJB-0004rT-1J
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id y23so9034318wmi.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELWB5I437Lt+RN3OsjruedXng+ShUYLzX1lgRYEiJwA=;
 b=hNOrYCsNkR5uwPzgakfRbuSfqT6G7UPC/wE2pw1bvJW5cHj3BpjgpbTKdSoSdyLwT9
 +mwAenNhHLeU0LaihmKVP4CpplxrAqbAl190DhPHWTPy85+ynyu51oiqHGEtM1CYQahW
 zmZAXg1QDKtyhUOXA0rpLulmNsxaGCiXhLgmYEDCrtqLUOO0eT3QOdSQiY3WTloyNOJi
 ZbOuvXi/cFmBCyfBGKsZuVZv0Ycz8JixlOICOWTsPmCQHDDD2ihC9L9YotYzQnhHb+FG
 nELKp6gVFyd/2xPRoWFSxLG/1g2olNQROXJHpn7BghxWcPKTgFRIrD4Wa0pZYDA5ivWF
 rC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELWB5I437Lt+RN3OsjruedXng+ShUYLzX1lgRYEiJwA=;
 b=JHCDUFXXBmVdYYYd6kujDmCA74V3PjSITvyqrDZPBfZdj3Z/zLl/bkWalnXhL8Oqnv
 D1nSvxzq6sjPWf9qMtF5T2mZqZMkj7GCZB3A1YErB5p2+wIeLt6bzNSfCMdAyTE4L2dB
 dfNyHfKgZ7RN/Krr97xOmVilrKBA8DSkFZ5cDaGXJztFMh7sZUVlyP5faQgUrx9qBl6D
 knahAHgJl2TUR+UAn2/WPLi1BE/Fm8qNxmyuqswYX12K9aXwJtCZ0TeQeUmhhSznKaRK
 uP6l2YCKydWtlNVvhJlb4uLHQnlYOpOiawyo6WXvPMe6ThoB9hWNKs9iClKJYFXHURRY
 V3Tw==
X-Gm-Message-State: AOAM532AmYnxvsV4VGFIhltGPi2nWXzioX8C7dqkcm2DHJ3bZf+dEwVF
 5ZPj43bif65NWNomjxTKgYiBDETcQ9PhsA==
X-Google-Smtp-Source: ABdhPJxPNVqRLjYE2asofRt+lraJHcEK5Dhi3wKn3fAezBZgxrDVHAEEi1Hn2LnAeLqhSWImbbzj3w==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr3992680wmj.115.1610125934950; 
 Fri, 08 Jan 2021 09:12:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v1sm13540456wrr.48.2021.01.08.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 09:12:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/ppc: Convert UIC device to QOM
Date: Fri,  8 Jan 2021 17:12:08 +0000
Message-Id: <20210108171212.16500-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries converts the PPC UIC "Universal Interrupt
Controller" to a QOM device.  My main reason for doing it is that
this fixes a couple of long-standing trivial Coverity issues -- the
current ppcuic_init() function allocates an array of qemu_irqs which
the callers then leak.  (The leak is trivial because it happens once
when QEMU starts.)

The first half of v1 is in master now, so this is just a
respin of the last four patches.

Changes v1->v2:
 * fixed the bug in the sam460ex conversion handling of CINT
   (tested that this now boots AROS OK to a desktop)
 * other minor code style tweaks to patch 1 as per review

thanks
-- PMM

Peter Maydell (4):
  hw/ppc/sam460ex: Drop use of ppcuic_init()
  hw/ppc: Delete unused ppc405cr_init() code
  hw/ppc/ppc405_uc: Drop use of ppcuic_init()
  hw/ppc: Remove unused ppcuic_init()

 hw/ppc/ppc405.h           |   8 +-
 include/hw/intc/ppc-uic.h |   7 +
 include/hw/ppc/ppc4xx.h   |   9 -
 hw/ppc/ppc405_boards.c    |   8 +-
 hw/ppc/ppc405_uc.c        | 415 ++++----------------------------------
 hw/ppc/ppc4xx_devs.c      |  38 ----
 hw/ppc/sam460ex.c         |  69 +++++--
 7 files changed, 107 insertions(+), 447 deletions(-)

-- 
2.20.1


