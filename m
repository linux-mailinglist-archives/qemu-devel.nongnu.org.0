Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9E4CB07E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:59:59 +0100 (CET)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW4k-0007UV-Ue
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxe-0005cl-PS
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:39 -0500
Received: from [2a00:1450:4864:20::335] (port=55192
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxc-00085Z-Nj
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id c192so1932740wma.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WQH43RYLvQDXPun3Ra4uvCKAv6ejoTJuD3KqLrDM/Eg=;
 b=E6+bFSCK6ilFW5zOkwiRCW4UFgZCaH2KczDAKlKER7Y0Y40VdmmDRrBRrxURBHeygA
 vI311t4yGiucxz4qW9VDt6a21qlIp6cluei6dhxRjtFfpEjL2Zf4fdoFCQCwSCBU9Gsb
 yTgAv4M2bGYlRVv7wyAUh4TMdwo6Q511dGGW4w/7hCl+eh6PXQ31DmQX2hvwC9T1hioU
 9umIZOIoy/ATTKshi4kBfkBxKEnWMvYvgVvXVs9NoPQtHpzGJ14kf0KsX29v11Thqr24
 5ZAfl0SdoMuSP22sHRuAddlLjKT6RW0sLfVE1Gamp62yn8w7a5Bh53wVUGKZh8u1FCpm
 BBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQH43RYLvQDXPun3Ra4uvCKAv6ejoTJuD3KqLrDM/Eg=;
 b=2sNgK4fxQ95bEcGGJF6yra4i+V82P2cgBQwwz8D+jT/8vpA6oqDsUynIPH6I4vmScD
 MJeIwdcFRBPoRU5XQjdLRBysJwD8KsDpkdKXnEQRUWKvTV9AiSmxZGlsX84N0spGSUER
 f2ztwoHQkQezr7s703Hy9daWwDZfb4FQzvoH2L9gCV6yC6EoiuOAEjjStiYL4qPl4opI
 5b58PxWxWv5766B6Y/o1O4ClmJyx4IqysT+/VBXjQTv+lg8Sx/MR8ksnE+bADQnyYhfV
 mdLfsnHF7CUUV/fyIGTjq2TL++c0p/bWz+ogPfu2RTm6Yp7VZ2M5NpjwCvGPTwle6UiW
 ScnA==
X-Gm-Message-State: AOAM5338EwX88EOCQ2xo+lgIP/aPrGfkjODrfSHVBPr1UxJXN2QM0ftA
 u63zocsv2VOAQ6cxVxUFsTpOJpwRdoaEzw==
X-Google-Smtp-Source: ABdhPJwmLGRDnFwCNvATQPzqzqhNqmJJChuyUiDXRe9Y0oGF/Rb8fl4B0Q2gXQ2VN72M+I9zO3cM5w==
X-Received: by 2002:a05:600c:4b87:b0:381:fe:3c5e with SMTP id
 e7-20020a05600c4b8700b0038100fe3c5emr1319029wmp.47.1646254355468; 
 Wed, 02 Mar 2022 12:52:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] hw/input/tsc210x: Don't abort on bad SPI word widths
Date: Wed,  2 Mar 2022 20:52:07 +0000
Message-Id: <20220302205230.2122390-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220221140750.514557-1-peter.maydell@linaro.org
---
 hw/input/tsc210x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index b0d5c2dd748..df7313db5d7 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -24,6 +24,7 @@
 #include "hw/hw.h"
 #include "audio/audio.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "sysemu/reset.h"
 #include "ui/console.h"
 #include "hw/arm/omap.h"            /* For I2SCodec */
@@ -910,8 +911,11 @@ uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len)
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


