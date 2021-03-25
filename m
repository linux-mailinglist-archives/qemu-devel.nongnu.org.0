Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9D3495BD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:36:42 +0100 (CET)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS2L-00073V-37
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz6-0005Di-LT
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz0-00054V-S8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id j7so2749956wrd.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxDNo1Allqz7OOOia7vB67LRCL15GAaiRHjRAX0Tx7I=;
 b=HuWgQT4dZMTapAWP00yWoc7NuPdw86WlZEU22A0VzI2aNpbTv9CoTM0zgyYvNsj4RE
 57he1t63r5RsNPu+LC9ojZyrAjZhyj8qIIfX2vA+1ae2GM2fxtPoDJ6Nf/MqqjEpRQbN
 2XyW3LBWKW3xlF08TG9XqqOa/1vNLl7UEiKHAXlSAx9jtd79TfLCzwclMCF10izhr+/j
 DEEtD2JPiy+uNCHNaJu8By+OKoaJU9GFvkN5BHkv2C+IrlhnNbh7JGm3sN98JnuoZurv
 w/ESQZAKFC8a1kyiM24xSYpY5sAepV7ez119ILf8sAcI5qlgL/VX/pKc2UalX308nyB7
 mBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxDNo1Allqz7OOOia7vB67LRCL15GAaiRHjRAX0Tx7I=;
 b=k1NhIgCvQ6EpdHWAoUwrzL51/SSxA6cTTMi95US2izPj+bTAr9O9oUPwTtT5/lSSCW
 iUpOTWskV7osdcXdDGz0yntIusvrUOmwsqLItWqfV4EC3w52IbSrcUqic33G5nXnsKSR
 bLc2bx0ut0WipklHFrtlaD1LOsS1blLSYB0PyDyDx06lAhuc3Atdem4e95j2T2xroBEB
 rh7Seaw+wS+bA/jLCD2/qU1lsOEFewCMQNWR+vsu/Y/xB2JtTTZ1DLtxqCQpLWKwvvj7
 mbf63SX3AeweNYnUMn2ICoDAGCIem5RtvWp3Bm/ljl6TFYgMcFQaqyPoNwlJRWV9qN3/
 933A==
X-Gm-Message-State: AOAM532Jy7z8zaA0O78QI6QfsaCTdsi9wveR3kQcxtvMdNwRY56eHNPf
 e7fwXcVezKLk3KZiKPyHoR9LSw==
X-Google-Smtp-Source: ABdhPJwaLI/3hilcJkPpfWshRYFNu2V5wae3ytGFNZGbfj1sPWmK379JK1p5MTP8eoAzRjnitGewAg==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr9652377wrc.271.1616686393076; 
 Thu, 25 Mar 2021 08:33:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
Date: Thu, 25 Mar 2021 15:33:06 +0000
Message-Id: <20210325153310.9131-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the two machines which have the "platform bus" (ppc e500 and arm
virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
hotpluggable in the device callbacks, and try to plug those devices
into the platform bus.  This is far too broad, because only a handful
of devices are actually valid to plug into the platform bus. 
Moreover, if a device which is pluggable for some other reason (like
a PCI device) happens to use a sysbus device internally as part of
its implementation, the hotplug callback will incorrectly grab that
sysbus device, probably resulting in an assertion failure.

Mostly PCI devices don't use sysbus devices internally, so the only
case we've encountered so far is the not-valid-anyway
 qemu-system-ppc64 -M ppce500 -device macio-oldworld
but we might create more in future.

This series restricts hotpluggability of sysbus devices on these
platforms to those devices which are on the dynamic sysbus whitelist
(which we were maintaining anyway).  With it, the above ppc
commandline stops asserting and instead fails cleanly with
  qemu-system-ppc64: Device heathrow is not supported by this machine yet.

Patch 1 is an API doc improvement while I was in the header file
anyway.

thanks
-- PMM

Peter Maydell (4):
  include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
  machine: Provide a function to check the dynamic sysbus whitelist
  hw/arm/virt: Only try to add valid dynamic sysbus devices to platform
    bus
  hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to
    platform bus

 include/hw/boards.h | 38 ++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c       |  8 ++++++--
 hw/core/machine.c   | 21 ++++++++++++++++-----
 hw/ppc/e500plat.c   |  8 ++++++--
 4 files changed, 66 insertions(+), 9 deletions(-)

-- 
2.20.1


