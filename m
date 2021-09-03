Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B734001DD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:17:37 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAwh-0007L1-Ra
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtt-0004WA-Qm
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAts-0007MF-3H
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id g135so3727411wme.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNVl8iiNlCNeGCuJYW7m8f9UnEn5fikesGzDd84SfDo=;
 b=nO64PCeZ3skusGzs9PWaCrm8BsaINYdQCc7zH9jIM/d8P3YOl6Lk7zm3vAKfTpGIWK
 8tmOMrhuEEgF55iY0MeyV1OVVsBf6P9mw+wcGP4JqwqS0JG/Xgu2kN+lOL2ErwbaiH0n
 IQ0/NW5oN3aYbDjkrXXmazLfR8U8+OLhzUj+w022O9V8Av5OIDNj8unQe2QMhxPw8Vpf
 0YiDelKG4JPJOfC1BEgIyVxI/0jc5dSe+i+wEgRSSlEyqT6nPvtX3UhnpGO+tF4lkBRY
 3DdxTZ1C3+McRO250HYuYMr47KuP00rHyY6laFudgexv9d7etWDD/MucXrY1qCRzG3la
 OEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNVl8iiNlCNeGCuJYW7m8f9UnEn5fikesGzDd84SfDo=;
 b=m7D+EKLP+SGlTTigNMto+qWPXc/0S5er/1k/dhjgaheIYh29t0xJTOCCLd+1Ci9aFG
 VXnUvmwepKnnIrHyQxyH0AY3VHqq5RD3oLuhc5atrlcYDCtpPODNTuBmh7aBn1n+pRch
 91/SEr11WACaLq0nJhZLT0GZm7YRFk/7sUGBPR6WErGSSqjXrZz3O2GBV+GohRc3l11Y
 /oTCM5XSz3TwYa8w4v3MIOnqRmp32es7ikDPKJYDp166bIS23XoQtnJrpJk0vdUC6Rfr
 CI7FyBJH05x99VbLch9DAH0ylQ1H+6XvEt4jLSwbDWGsr5aodUV6ZAVBP+4zQ3vtwdon
 bclw==
X-Gm-Message-State: AOAM533JHC3FYwQR2wolUFF+I0G9os0E5lAxAvRZtR6x7UZ3Ilug+Zzt
 f/oYI9HSly4TP2TIsJrMc0yJ8A==
X-Google-Smtp-Source: ABdhPJx39hXLaUnnyabklWDHJy6G9Tc0Or1fx7SU6IUgeI6/Hd6UUbDfXoScb5lJpNNzKLxfM5MfLQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr942289wmp.52.1630682078207; 
 Fri, 03 Sep 2021 08:14:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] Support marking individual qbus buses as 'full'
Date: Fri,  3 Sep 2021 16:14:31 +0100
Message-Id: <20210903151435.22379-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, QEMU will allow devices to be plugged into a bus up to
the bus class's device count limit.  If the user creates a device on
the command line or via the monitor and doesn't explicitly specify
the bus to plug it in, QEMU will plug it into the first non-full bus
that it finds.

This is fine in most cases, but some machines have multiple buses of
a given type, some of which are dedicated to on-board devices and
some of which have an externally exposed connector for user-pluggable
devices.

In particular, the various MPS2 and MPS3 boards have multiple
I2C buses. Some of these are used purely for on-board devices like
the touchscreen controller or the DDR4 EEPROM, and some are routed
to the "shield" expansion connector. Currently if the user creates
an I2C device (eg with "-device tmp105") it gets plugged into whatever
the search happens to find first, which for some of these boards
is one of the internal-devices-only buses.

The first patch in this series adds a new function qbus_mark_full()
which marks an individual qbus as full, and makes the "find an
available bus" search code honour that. The intention is that the
board code can handle internal-devices-only buses like
 * create the bus controller
 * create all the internal devices, and plug them into that bus
 * call qbus_mark_full() on the bus

Patches 2-4 use this to mark the internal-only i2c buses on
the various mps2/mps3 machines as 'full'. (As it happens, we
don't model any of the internal i2c devices on these boards
yet, so the 'full' buses won't have any devices on them.) 

This is a minor behaviour change for existing command-lines
for these boards, since an i2c device will now get plugged in
in a different place; but none of these boards are versioned
and very few people will be manually creating i2c devices anyway.

thanks
-- PMM

Peter Maydell (4):
  qdev: Support marking individual buses as 'full'
  hw/arm/mps2-tz.c: Add extra data parameter to MakeDevFn
  hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
  hw/arm/mps2.c: Mark internal-only I2C buses as 'full'

 include/hw/qdev-core.h | 24 +++++++++++
 hw/arm/mps2-tz.c       | 92 +++++++++++++++++++++++++++++-------------
 hw/arm/mps2.c          | 12 +++++-
 softmmu/qdev-monitor.c |  7 +++-
 4 files changed, 106 insertions(+), 29 deletions(-)

-- 
2.20.1


