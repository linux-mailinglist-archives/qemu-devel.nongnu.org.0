Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CC45F24E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:40:49 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeHI-0004G3-Bc
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:40:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFt-0002MK-KM
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:21 -0500
Received: from [2a00:1450:4864:20::435] (port=39831
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFr-000452-BE
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id a18so19847817wrn.6
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ne0ZZY7CP8ngWRBKnIGwHYwnzIuCtxGGrO8uqvdjtxw=;
 b=eF0XzSoeavTbETYE9iCoeSz7UkGjztWGq4gF6e6hSce56oifStDRExf07oXqJtI30w
 SdnrIxptygV6D+L5CP6E/NdHa3w5x3fjNuE2R42nbXOI/DOORYANBZEsAnyayXS4VhcA
 njiincXZDOA15Q7G0j33yKKjBTHZ4Iglm21kdE8lF6PKQDQJJ4MY03kUfivtjvm3oeCD
 jQo3XySYQy32De3BWObd2YFwF1d/3P9pO6KU3FHylxal8MQMmka6y+C0qGOm7UZoNTYb
 3zXPlUgcUJMlqa2AljTBH4pnOL5Xq7Qi6MOpSlIkh2AcAslceRG8gkWOZ8qn+mqhLORR
 UpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ne0ZZY7CP8ngWRBKnIGwHYwnzIuCtxGGrO8uqvdjtxw=;
 b=f31jANDjzEzdcorkkGV8tV7hsNPaWeHaYqqsF+dme1pnwRlFxAh+nz4dFKUAQBloZi
 E5JiXzQ/j4cd1U9EBkNwuMo5ktGhmmGWA0wuyNNI57IbhMtdWxuFcfUsWlm7cOwdSwQN
 SIRqS5BY7NjOQ64BFJ0DucBFk6bBhIbghuJ9O3KvK2XDpJ+Doh/6y62SsYx2eBQNWFKW
 2u5GWYduOsX7lvVWpGSzSmlpdkAdTzG3KaRh3S/C7h4bJrRU7aa55qSRpizA2gme2v7p
 GGtJPwomxIc8OpQFAVxKAmmf1ZQuSWYZQxwQrXj1whd4/E1tlEfAnjBdBtYXxWOhmKm+
 bVTw==
X-Gm-Message-State: AOAM530wBTnxIvHRidCW+CgtJIoMhOwfPWzBRYp4GITlBSSnm6bMfVie
 KNh3iB/lkVv0UPOo/39lomT4sw==
X-Google-Smtp-Source: ABdhPJwlh4ENSg/Y7dYXg0LqmYaz/1iSUoGhic4SmfWu7Qtft0WRaUhBFLNAU5A4zamPNGOgqHQrtw==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr15105533wrb.436.1637944756975; 
 Fri, 26 Nov 2021 08:39:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:39:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2? 0/2] arm_gicv3: Fix handling of LPIs in list registers
Date: Fri, 26 Nov 2021 16:39:13 +0000
Message-Id: <20211126163915.1048353-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Marc: cc'd you on this one in case you're still using QEMU
to test KVM stuff with, in which case you might have run into
the bug this is fixing.)

It is valid for an OS to put virtual interrupt ID values into the
list registers ICH_LR<n> which are greater than 1023.  This
corresponds to (for example) KVM running as an L1 guest inside
emulated QEMU and using the in-kernel emulated ITS to give a (nested)
L2 guest an ITS.  LPIs are delivered by the L1 kernel to the L2 guest
via the list registers in the same way as non-LPI interrupts.
    
QEMU's code for handling writes to ICV_IARn (which happen when the L2
guest acknowledges an interrupt) and to ICV_EOIRn (which happen at
the end of the interrupt) did not consider LPIs, so it would
incorrectly treat interrupt IDs above 1023 as invalid, with the
effect that a read to ICV_IARn would return the correct interrupt ID
number but not actually mark the interrupt active or set the CPU
priority accordingly, and a write to ICV_EOIRn would do nothing.

This bug doesn't seem to have any visible effect on Linux L2 guests
most of the time, because the two bugs cancel each other out: we
neither mark the interrupt active nor deactivate it.  However it does
mean that the L2 vCPU priority while the LPI handler is running will
not be correct, so the interrupt handler could be unexpectedly
interrupted by a different interrupt.  (I haven't observed this; I
found the ICV_IARn bug by code inspection, and then the ICV_EOIRn bug
by figuring out why fixing ICV_IARn broke L2 guests :-))
    
This isn't a regression -- we've behaved like this since the GICv3
support for virtualization was first implemented. I'm tempted to
put it into 6.2 anyway, though.

Patch 1 abstracts out the test we were using already elsewhere
in the code into its own function, and patch 2 uses it to fix
the EOIR and IAR behaviour.

Based-on: 20211124202005.989935-1-peter.maydell@linaro.org
("[PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI state changes")

Peter Maydell (2):
  hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function
  hw/intc/arm_gicv3: fix handling of LPIs in list registers

 hw/intc/gicv3_internal.h  | 13 +++++++++++++
 hw/intc/arm_gicv3_cpuif.c |  9 ++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.25.1


