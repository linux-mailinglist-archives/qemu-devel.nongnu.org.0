Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02953BEA48
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:04:42 +0200 (CEST)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m196P-0003AK-OF
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194z-0000L4-83
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194x-0006Zl-Hc
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpd63PvLoqwccvwknyW++wOSUAmq/kcYqjMFvtaZ5Qc=;
 b=iRPAipiOcCt3uQBEN5pRH7oCbUKrUd2gi6xkOjftj9V+ekaO8VR58lHuLjP8naVAhmsSiW
 uciK2UO+3GiVozkBCdTvYLmd3Fun/nzvlVWQiKsAEqL1aG0ivjN5cGLRhv9z624tXnlRF8
 AqCssPCcepu/xvv3tY/N4AtDxvVz+nc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-K2jC-_djOx2K1tLLL4fXjA-1; Wed, 07 Jul 2021 11:03:08 -0400
X-MC-Unique: K2jC-_djOx2K1tLLL4fXjA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m9-20020a0560000089b02901362e1cd6a3so865179wrx.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tpd63PvLoqwccvwknyW++wOSUAmq/kcYqjMFvtaZ5Qc=;
 b=QddQF28LfdBDsSVS2mbebJEfHHTpHVvv9j0OvflbEhPU3bkDAxX3dLn9UljTuBjc4R
 u7Isv6TsmQvWpA8MVydKYYlzPSfeE8bt5HFF8dSwpOPKFXPbgUyjbnBszET4QpLvS+fV
 y+bQIZYNIQE6XuPObfNDMHUd3xs+fmrt6ZuxsqCGhKZ8qZblliJYru0aPGBmqM/K0MC5
 q5MByYLafKk0KRjZxTvclKBxR7ZUXvs/lWHwFmtiLZyYDXk1cKxm/Ltcc0hAQgZbRNcQ
 7bsDkuxa1bYHtiFq1bpWBil1WoAjgkoOCHc19r2qGm2DgdHGR8fLn2ugG4eKsEXff/5/
 4XXw==
X-Gm-Message-State: AOAM530vJmM7ueJMCoh7xjMyHcpAZWmgwOa2r63D60y7HK0TeVIRJFz8
 rNhJi5zB5loxTmJh7d9Tw4vBJZRdzKBNNNNtEoknfIV9KA1s/g1GBt9NPwbyek57zXe+Z9PFGQr
 BfZ+jRPbB8fczKAAJIYJvNvLBFbAr1B9njB7ED9VAK6nOhQKSWlvNXsOqmWY5
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr82003wmj.60.1625670186605;
 Wed, 07 Jul 2021 08:03:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Y+fayBkFoiRPjaelqhejk/9LLCyIsrDCL11/9ePdCyoyK1H2vC6jZTzp89glMt30NxuX7w==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr81973wmj.60.1625670186415;
 Wed, 07 Jul 2021 08:03:06 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id b12sm16490808wrx.60.2021.07.07.08.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:05 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] hw/pci-host/q35: Ignore write of reserved PCIEXBAR
 LENGTH field
Message-ID: <20210707150157.52328-4-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

libFuzzer triggered the following assertion:

  cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
    -nographic -monitor none -serial none \
    -qtest stdio -d guest_errors -trace pci\*
  outl 0xcf8 0xf2000060
  outl 0xcfc 0x8400056e
  EOF
  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Aborted (core dumped)

This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
(reserved value) to the PCIE XBAR register.

There is no indication on the datasheet about what occurs when
this value is written. Simply ignore it on QEMU (and report an
guest error):

  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Q35: Reserved PCIEXBAR LENGTH
  pci_cfg_read mch 00:0 @0x0 -> 0x8086
  pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
  ...

Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210526142438.281477-1-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/q35.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..0f37cf056a 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/i386/pc.h"
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
@@ -318,6 +319,8 @@ static void mch_update_pciexbar(MCHPCIState *mch)
         addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
+        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
+        return;
     default:
         abort();
     }
-- 
MST


