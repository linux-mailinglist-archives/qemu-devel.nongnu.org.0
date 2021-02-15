Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2C31B745
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:38:19 +0100 (CET)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbGk-00020M-VD
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0004JO-UW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAx-0001gT-6B
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id v1so8243335wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+iy8xHCSQpgWfxPW8C578vD665e8MF/3+qtPx7S9FY=;
 b=YOQNBcH0sebvMbrbIVjWnmzMVLrJkW5gPskNsRg0zg/qNNG2V4btGIzBQ7ZoIMuD5+
 h6RYi/Ddon2ymQXRiRLZKK1VfDj6AsAtBt1yezOLoDO9q33+b++0BDw2JOKGzh2xZjNO
 l9ZHtOfTCcdbb/BiGrPQSIvPNGDNwxundKTC0PmevyZhHu8dwvhDjKeO0xXf+VvAKYRz
 Sx46OfXUztafDb7iRRxV+9c15sMvXZT+tiBmYRGI8PTHKFXExSP16K69ohtsWfK5lKFA
 9eHMS12xQaClqmYnh57WwtJ7MbZ0osT+2VQQVRgdEBT6ORSwxVVWdbKRSGv/mJgWK7E3
 G65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+iy8xHCSQpgWfxPW8C578vD665e8MF/3+qtPx7S9FY=;
 b=mJgHuAfF8WdwHKoT/Ee8KZ8w4UTWDQWeHN1QgUCuBiWbdtfpaZJiVh/2FrKeRyWlOu
 h0xWPaZvsrwtYp3bgo8gqDKmsSrJrEzYPnBabHcU5Xp9QRMIyNN5SOnUgZWRIEtW9S1V
 GCEbG0folSr944l2PWq9kLr8m32KGcGLUZxkQtXK7BEMecPwFLXTE+5L1MO5/ZYmpI1E
 4NgAP+GaOV10pQolHuP2Gn7q3uv2eW7fykNMGgzxwR+WKKuOdbNBl7H3y4QKUGoVoKTG
 srUr/pK+waaP81HrJzel7Mboam3nXPjZHrGzg7ugc44xXEMzU9D/AzouB+bdoNwv8oiU
 EktQ==
X-Gm-Message-State: AOAM532++58Ln155bIGIIcBwTXrxnOk2algFDwn49QRBQRrCEbPHhL/8
 nGZoMFWb31pi/t1kvsEfo5jt3Q==
X-Google-Smtp-Source: ABdhPJwaiUS2VTJMoPdYpQUV0k6pZ4Aft+ttDHGXmINStWZHjJzVUmUDr1Niyik8vfDIyWNJBDhP1A==
X-Received: by 2002:adf:f089:: with SMTP id n9mr18457716wro.98.1613385137921; 
 Mon, 15 Feb 2021 02:32:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] arm: drop dead code for non-32-bit-RGB surfaces
Date: Mon, 15 Feb 2021 10:32:06 +0000
Message-Id: <20210215103215.4944-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset removes dead code (including a couple of 'template'
headers) for handling UI surfaces that are formats other than
32-bit RGB for the musicpal, tc6393xb and omap_lcdc display devices.

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB, so the legacy code in these
devices which was handling the possibility that the console surface
was some other format can all be deleted.

Notes:
 (1) the patch "hw/display/omap_lcdc: Drop broken bigendian ifdef"
     fixes a bug introduced in commit ea644cf343129 in 2016 in a
     previous partial start on this cleanup
 (2) the omap_lcdc changes are tested only with 'make check' as I
     don't have any test images for the OMAP1.

With these plus the other on-list patches, the only remaining
'template' header files in hw/display are pl110 (which needs it to
handle the different guest-side pixel formats) and the
milkymist-vgafb device.  Milkymist is in the 'deprecated and will be
deleted in a few releases' bucket so it's not worth doing this
cleanup for it, since it's not blocking any API transition.
(I'll take this task off the BiteSizedTasks list shortly.)

After the musicpal cleanup and the tcx patch I just posted, there
will be no more users of is_surface_bgr(), so that could then be
deleted.

thanks
-- PMM

Peter Maydell (9):
  hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces
  hw/display/tc6393xb: Remove dead code for handling non-32bpp surfaces
  hw/display/tc6393xb: Expand out macros in template header
  hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at its callsite
  hw/display/omap_lcdc: Expand out macros in template header
  hw/display/omap_lcdc: Drop broken bigendian ifdef
  hw/display/omap_lcdc: Fix coding style issues in template header
  hw/display/omap_lcdc: Inline template header into C file
  hw/display/omap_lcdc: Delete unnecessary macro

 hw/display/omap_lcd_template.h | 169 ---------------------------------
 hw/display/tc6393xb_template.h |  72 --------------
 include/ui/console.h           |  10 --
 hw/arm/musicpal.c              |  64 +++++--------
 hw/display/omap_lcdc.c         | 129 ++++++++++++++++++++++++-
 hw/display/tc6393xb.c          |  48 ++++------
 6 files changed, 165 insertions(+), 327 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h
 delete mode 100644 hw/display/tc6393xb_template.h

-- 
2.20.1


