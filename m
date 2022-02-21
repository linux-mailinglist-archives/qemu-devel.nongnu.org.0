Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8D4BDA1C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:14:37 +0100 (CET)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9SV-0002DP-NS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM9M5-0002jk-Kz
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:07:57 -0500
Received: from [2a00:1450:4864:20::42b] (port=43894
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM9M2-0007AX-Vs
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:07:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s1so867940wrg.10
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkWx7QGGS8WiDESf3HzDhqm0HFpYN0QbjJr4eJ5EUck=;
 b=MA+iHguQp6cxeUPl//YOmWMzt0KxwHN8hYOJlUrPiqGGfdfB5/YDsu2UPElvri19C/
 SodtW2Es+gQrDKmWR5up+mN7lY2rBxeb24qKh7YC+g+8alZ6+bF7jzFPtPzd8TfIszWC
 M8WtZ7V45C1wrtNv3n6ibg/Urcq6wQBXYny6Nm5EdELac1jtjG0SSXWMCyw91hpcBrT+
 Tqt8vpl0YqSodqMLgacelOX2j7etLniTyPz+sO4aCySVePEq5LvOMzmSWD0pkFFQC32o
 y4n27sD3+/qRlBkKSolJzTFyi8+tWZwvZr4VpQK9QtqKbaGkmW39QDKhCo7WCner+eZ4
 bJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkWx7QGGS8WiDESf3HzDhqm0HFpYN0QbjJr4eJ5EUck=;
 b=ZwiUZKO4B7Vhbu4pibTT8QTRKpjbgBmZ/3/QW1Zly6GKJHs7iKg6mMe7ubqw7BmUog
 ZPRWgbNhP5pn044HOUIQw8QUc7KD0Z2xfETMc5CKMFcfitQdOg2QUDA8jlWagivkj66f
 rvTeLwNdhwcFVmtvB1+9Gi3YH3J51L6v20y8ojHHo808Rjz9oQlCs8K9SXoW90L4OIkE
 12JY68N/AJBQjJa8VUF0/7S7yn0j61qiUyKISbIRk0OmvBt41gougfln+7cjVGU5bhOY
 SJzYAJoJeYXknhg0oShaYWO+hlOfYP81jWOoaVLkTQRkUQ3qBGWapoyyR0pdMMRjdFwk
 ZuYQ==
X-Gm-Message-State: AOAM530HT78Sn1be1O+X36ACgVYBAhByF2wAAFrTu1/eV006DKtsLL4j
 xkpgXvQ1geUc/koZlS7jqWv+PQ==
X-Google-Smtp-Source: ABdhPJxzu+n9BY+sqAMyjY9D+uYDZf81o0DKihDZTRbeKdhaN8WGwE2wEoNzagoz1ruBtnvazB4DcQ==
X-Received: by 2002:a05:6000:23b:b0:1e4:a4d1:a9f3 with SMTP id
 l27-20020a056000023b00b001e4a4d1a9f3mr16143296wrz.278.1645452473046; 
 Mon, 21 Feb 2022 06:07:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id x10sm14024253wre.110.2022.02.21.06.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 06:07:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/input/tsc210x: Don't abort on bad SPI word widths
Date: Mon, 21 Feb 2022 14:07:50 +0000
Message-Id: <20220221140750.514557-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tsc210x doesn't support anything other than 16-bit reads on the
SPI bus, but the guest can program the SPI controller to attempt
them anyway. If this happens, don't abort QEMU, just log this as
a guest error.

This fixes our machine_arm_n8x0.py:N8x0Machine.test_n800
acceptance test, which hits this assertion.

The reason we hit the assertion is because the guest kernel thinks
there is a TSC2005 on this SPI bus address, not a TSC210x.  (The n810
*does* have a TSC2005 at this address.) The TSC2005 supports the
24-bit accesses which the guest driver makes, and the TSC210x does
not (that is, our TSC210x emulation is not missing support for a word
width the hardware can handle).  It's not clear whether the problem
here is that the guest kernel incorrectly thinks the n800 has the
same device at this SPI bus address as the n810, or that QEMU's n810
board model doesn't get the SPI devices right.  At this late date
there no longer appears to be any reliable information on the web
about the hardware behaviour, but I am inclined to think this is a
guest kernel bug.  In any case, we prefer not to abort QEMU for
guest-triggerable conditions, so logging the error is the right thing
to do.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/736
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/tsc210x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 182d3725fc9..e0362d71719 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -23,6 +23,7 @@
 #include "hw/hw.h"
 #include "audio/audio.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "sysemu/reset.h"
 #include "ui/console.h"
 #include "hw/arm/omap.h"            /* For I2SCodec */
@@ -909,8 +910,11 @@ uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len)
     TSC210xState *s = opaque;
     uint32_t ret = 0;
 
-    if (len != 16)
-        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);
+    if (len != 16) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad SPI word width %i\n", __func__, len);
+        return 0;
+    }
 
     /* TODO: sequential reads etc - how do we make sure the host doesn't
      * unintentionally read out a conversion result from a register while
-- 
2.25.1


