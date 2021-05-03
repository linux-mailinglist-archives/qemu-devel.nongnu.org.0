Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3513717C4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:21:47 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaOI-0006G5-AE
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLY-0003Qe-Sq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:56 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLV-0000w0-3W
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so5958819wrv.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ja0oEFtNECqXeDjSy9I2GRDmRcT5HC9ycSDENZyf0qg=;
 b=Z71+HI1fsje2Me+zjEa7wiFAGRZ/0r18hJiAgvUWfQ652lDFzO/mFfab1jAC5jkKww
 k8aGENC9Se9Te3BSGxRFykSYUglR58TjsSkByF3f06Z2L5SQ4/IlnYNkQz9sLE0+c1b5
 oBtRonh7sMgej/B+HP8iWKugkLojg/Iee5ItdOT9lKuxK1yZ5hsecODPpFzhfxDbRepQ
 BnzF7mqkp8qVSAQ/iQhZLlvzHR8vnOWbBFM0aGPnX3B42wn/3hByGP6s3Flor6HUcqlm
 FaWJYTGigRidsVQHXbZLfKGLuiz8NUSyyONv0KzDxNgPhodfobdEzbHUbN+Jlu5CbQtT
 xLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ja0oEFtNECqXeDjSy9I2GRDmRcT5HC9ycSDENZyf0qg=;
 b=PxRnQsV/dlLqXjla1tDVSWouLf/J9dLyxG2XA+ucCmlrgHMsYhOAZEx+V6oHDdHdz4
 BJszaokyBll5e+Rk75JDWmcU+8yJR/jpAaPzv573Csal5xdl6FcYC2QjFjJpyjYatT3g
 XlnJzWHOKUTejoOWWBWOAX/knlfreDEoolE69IzxU0P6Cd+xzR01Nx+omt9lC4To9kHw
 skpg64oLxVCtC6n5y5oJNnVYoDk3pPu81FbzyFBK443yfJLsaDMccnYDgeoxxZpPxILt
 NzbULPXBn8Vrys67JJ3yiKGfD/E/iTRBYDZ5+euexCLvYTwlruwczsYoJKzGPBY0+UZp
 xxKg==
X-Gm-Message-State: AOAM530ras2Z/I4hEmhbXfHDwHJhs3DR/Xcq93qtNWrIlJ5IOzV4hJFy
 uYRwo3vNtzkn1uVzxotaXGlZsflg1AAY6A==
X-Google-Smtp-Source: ABdhPJzDJhTQj2V/DLHDZZnqE/T7AEiuwRLsWxDKHq59Zw2Haa8vbDmaO0kMp9e+Oz4sxUcCtXzO7g==
X-Received: by 2002:adf:de87:: with SMTP id w7mr7546044wrl.195.1620055131170; 
 Mon, 03 May 2021 08:18:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u5sm11778254wrt.38.2021.05.03.08.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:18:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] ppc: Convert (mostly) from device_legacy_reset() to
 device_cold_reset()
Date: Mon,  3 May 2021 16:18:46 +0100
Message-Id: <20210503151849.8766-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old function device_legacy_reset() (which was originally
device_reset() and got renamed when 3-phase-reset landed) is
deprecated, because it has slightly odd semantics -- it resets the
device itself, but (unlike when a device is reset as part of system
reset) not any qbus it owns (and devices attached to the qbus).  The
replacement is device_cold_reset(), which resets the device and its
bus (if any).

For a device with child bus, the two functions are identical; this
patchset changes the PPC code which uses device_legacy_reset() on
devices which have no qbus to use device_cold_reset() instead; this
should have no functionally visible difference.

There is one other use of device_legacy_reset() in PPC code which I
didn't change: in hw/ppc/spapr_pci.c:spapr_phb_children_reset().  I
couldn't figure out what the children being reset here are and if
they might own buses.  I suspect that even if they do own buses the
right thing would be to change to device_cold_reset(), but I stuck to
only the changes I felt reasonably sure were definitely
no-behaviour-change.

NB: tested with 'make check' and 'make check-acceptance' only.

thanks
-- PMM

Peter Maydell (3):
  hw/intc/spapr_xive: Use device_cold_reset() instead of
    device_legacy_reset()
  hw/ppc/spapr_vio: Reset TCE table object with device_cold_reset()
  hw/ppc/pnv_psi: Use device_cold_reset() instead of
    device_legacy_reset()

 hw/intc/spapr_xive.c | 2 +-
 hw/ppc/pnv_psi.c     | 4 ++--
 hw/ppc/spapr_vio.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.20.1


