Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A7619CD2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzM8-0006r1-I6; Fri, 04 Nov 2022 12:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLn-0006Of-69
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLi-0000ey-QB
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so7756720wrw.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H9hwAA0DcxOYZoJyqoZ1ozIGEqWmFdqQjoUlMglPP7E=;
 b=NZZYVQ2dDrw2Vs9agDigkkpKHdMad07r+c/c+q+589OubuGsPBwh28jnfjjwPis6zS
 Hdfv4ppIT8F2xPvylW3/pB9m0x5N5vWBlIDtrhiGF1By2hh0V8/8CPOzbg8apIe7ZcCQ
 HR4cDRFGS1qBWRmrg61cf21fijIjIG8a/6/g3a57r72PMRwtM1IQWpLMYI28ob4LCERL
 +GJDHXVoB5JJo8q8/HhH+BTp29+PlcnjXsYcrKFfaM8wchPxglT4vLnp9ITCAymjYVhi
 ABMT+Fl9co5jCCejWs9bsBavPRERttPlI5uX2iXk9sevE49swYba3Dg67VU2qAPTG7BU
 ok+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H9hwAA0DcxOYZoJyqoZ1ozIGEqWmFdqQjoUlMglPP7E=;
 b=AftF1TK4nFHFx1NU8ibBzoUXw6y/7mUoQT2wXgVlX4wTI1I1u47bZXrjuFu+sZj+kE
 U3gITWJnp8sWF/D28pyfjV9ydWB3Zbavd+j9je8CX1jxaCaoJD2DG5UHWsMsKRp1Aq7N
 4bjYp8MQmW81IkQuyD8o7GMYl4VFY/ciZfzTpznYTkZiCq/6Hwy8I8j7L506Nf4YPPfi
 OXbm4/JWbRU/jmJ4xehVMSklAi32ox7i6suMryGX+05Kp7IQhlsgeC9YJgkF1mUBYozQ
 kxoWhu5KEWuaRQe8LSkkAihoJv7KvjJJfcLo9qrcpZSAhFMockNjuOfw4ek71mfJKVXd
 04tg==
X-Gm-Message-State: ACrzQf0bx2I6kg0q7leu68iuhXBLrUQIis1qNUUwN+BP/9kHtMA2JMlz
 A1RGbNT7Zou/1FyKAEvdE2hSQbjYmSgw5A==
X-Google-Smtp-Source: AMsMyM4owx1KqXDgTHAHmF2kuapX8ziCR+ECdFmfo3A4DVRRWOAghpvsjodUEeWvBooZnF0oM5Sk/A==
X-Received: by 2002:adf:fe01:0:b0:22c:de9a:9896 with SMTP id
 n1-20020adffe01000000b0022cde9a9896mr259812wrr.27.1667578516125; 
 Fri, 04 Nov 2022 09:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 0/9] reset: Remove some deprecated APIs
Date: Fri,  4 Nov 2022 16:15:04 +0000
Message-Id: <20221104161513.2455862-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset removes the remaining uses of some deprecated
reset-related APIs:
 * device_legacy_reset() -- replaced with device_cold_reset()
   (conversions require some thought)
 * qdev_reset_all() -- replaced with device_cold_reset()
   (mechanical no-behaviour-change conversion)
 * qbus_reset_all() -- replaced with bus_cold_reset()
   (mechanical no-behaviour-change conversion)

The first four patches have been on the list already; the
first three have been reviewed.

Mostly just tested with 'make check' and 'make check-avocado'.

This is of course all for-8.0 material, but I figured I
might as well push it out on list for review, especially
since I have some followup stuff that depends on this.

thanks
-- PMM

Peter Maydell (9):
  hw/s390x/s390-pci-inst.c: Use device_cold_reset() to reset PCI devices
  hw/audio/intel-hda: don't reset codecs twice
  hw/audio/intel-hda: Drop unnecessary prototype
  hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()
  pci: Use device_cold_reset() and bus_cold_reset()
  hw/hyperv/vmbus: Use device_cold_reset() and bus_cold_reset()
  Replace use of qdev_reset_all() with device_cold_reset()
  qdev: Remove qdev_reset_all() and qbus_reset_all()
  hw: Remove device_legacy_reset()

 include/hw/qdev-core.h     | 35 ---------------------
 hw/audio/intel-hda.c       |  6 +---
 hw/core/qdev.c             | 64 --------------------------------------
 hw/hyperv/vmbus.c          |  4 +--
 hw/i386/xen/xen_platform.c |  2 +-
 hw/input/adb.c             |  2 +-
 hw/pci/pci.c               |  6 ++--
 hw/pci/pci_bridge.c        |  2 +-
 hw/remote/vfio-user-obj.c  |  2 +-
 hw/s390x/s390-pci-inst.c   |  2 +-
 hw/s390x/s390-virtio-ccw.c |  2 +-
 hw/usb/dev-uas.c           |  2 +-
 hw/usb/hcd-xhci-pci.c      |  2 +-
 hw/usb/hcd-xhci-sysbus.c   |  2 +-
 hw/core/trace-events       |  4 ---
 15 files changed, 15 insertions(+), 122 deletions(-)

-- 
2.25.1


