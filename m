Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90640599E59
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP490-0003Hs-6y
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-0005eJ-Bj
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP45x-00063Z-Qc
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id j26so2456007wms.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=6fgerLR7kL9ay9yVRQtlCYUtfQofBmEyopQK5AYsrS0=;
 b=Iq3Qm9hUSVrYnIt2WvFBn/ly+oKBRW92SOjQWnjlFswOZoo20YeErSKKZuFyFdiitU
 WJJDopJfQCjiCuYjgIlXz0/77fUrcGkWLrdkQCznCqObI+HVlltJdGGzKvs0Pm7MaxB+
 00ZKXdnWxdEW3CMiO2umECm3SICLWC3GbRwREkfYBA/ZZnSM1RoUybgNfMCGmgB5S/ep
 PXJm5qzf/OJCW5kTLSvpMdFYebY8rIULQ9ILKP2VYaRElGerTiX2vczk5nT/WxNFG2AT
 4H7GEKLPW8whPWWEZUQRPnee1touL3pBUbpQdf74F9V5i2e3vNgy23616kNET0xKhWmN
 Neyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=6fgerLR7kL9ay9yVRQtlCYUtfQofBmEyopQK5AYsrS0=;
 b=UuF0E5veDDxxQfBl2Y7GLFH/PJx9VYGDhnQorM90s8Cc0RMSvuRFvyzeifdPtSRgnB
 Fy18GG7xVgkkSK0RFcadj3jn+0fsBiwn4fJLhZZbu72Mp5B4x8j48YUyinahLzA0DPA9
 De9fCsUmW+PSY3bwzimagxfpGmMXOD3a/gtobZF0JWivNfyIyk5JKPa+uBuI0iLw0qsL
 g8WLz/hzVoPMkNusy4bNi1YmPdTPPy45mqiqkKoYuItvuIUiG/rvp2NYRuu0BDOzSuDc
 ZdUOCITLQoU5udNQOhWr6LXQfA47RJO4HNu9zlozVBQE3kulNamHWQwKg1enAUiu5I1H
 MsZw==
X-Gm-Message-State: ACgBeo2yOGxmKuwLp6AaiVAFYGQx23GpQDqUqH+rT0+7995UIIFT9LTA
 ldesOLFBMG6kYtOJkN0gVPD6MQf3rRXT2w==
X-Google-Smtp-Source: AA6agR6jWhSa1UtdkMNoJqmLMRD2QK0IXQ+qpStCAcdkjdvpdD8nZx+HdpzmY3GwNEVJWJcJZh5EBg==
X-Received: by 2002:a05:600c:4f49:b0:3a6:1cc6:afba with SMTP id
 m9-20020a05600c4f4900b003a61cc6afbamr6822716wmq.80.1660923574631; 
 Fri, 19 Aug 2022 08:39:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 00/11] misc: Remove variable-length arrays on the stack
Date: Fri, 19 Aug 2022 16:39:20 +0100
Message-Id: <20220819153931.3147384-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a resend of a subset of patches from a series that
Philippe sent out last year:
https://patchew.org/QEMU/20210505211047.1496765-1-philmd@redhat.com/

Basically I just pulled out the patches which:
 (1) trivially applied on a rebase
 (2) had got a Reviewed-by: or at least an Acked-by:

since these should be good to just apply immediately
(well, as soon as we reopen for 7.2 development).

Given they're a mixed bag, I propose to take these via
the target-arm.next tree, unless anybody specifically
wishes to grab specific patches via some other route.

I might come back and have another look at the other
left-behind patches later, but this gets rid of more
than half of the complaints that a -Wvla build reports.

thanks
-- PMM

Philippe Mathieu-Daudé (11):
  chardev/baum: Replace magic values by X_MAX / Y_MAX definitions
  chardev/baum: Use definitions to avoid dynamic stack allocation
  chardev/baum: Avoid dynamic stack allocation
  io/channel-websock: Replace strlen(const_str) by sizeof(const_str) - 1
  hw/net/e1000e_core: Use definition to avoid dynamic stack allocation
  hw/ppc/pnv: Avoid dynamic stack allocation
  hw/intc/xics: Avoid dynamic stack allocation
  hw/i386/multiboot: Avoid dynamic stack allocation
  hw/usb/hcd-ohci: Use definition to avoid dynamic stack allocation
  ui/curses: Avoid dynamic stack allocation
  tests/unit/test-vmstate: Avoid dynamic stack allocation

 chardev/baum.c             | 22 +++++++++++++---------
 hw/i386/multiboot.c        |  5 ++---
 hw/intc/xics.c             |  2 +-
 hw/net/e1000e_core.c       |  7 ++++---
 hw/ppc/pnv.c               |  4 ++--
 hw/ppc/spapr.c             |  8 ++++----
 hw/ppc/spapr_pci_nvlink2.c |  2 +-
 hw/usb/hcd-ohci.c          |  7 ++++---
 io/channel-websock.c       |  2 +-
 tests/unit/test-vmstate.c  |  7 +++----
 ui/curses.c                |  2 +-
 11 files changed, 36 insertions(+), 32 deletions(-)

-- 
2.25.1


