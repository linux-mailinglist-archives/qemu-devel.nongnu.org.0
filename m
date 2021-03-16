Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5933D4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:15:01 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9XI-0000rS-KN
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9WI-0000Kq-RM
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:13:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9WH-0001bh-5T
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:13:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so1430669wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70yTRYA7D/lEWfDwZ5uBcO2qIKIsAHfOHZkX9gFY1TA=;
 b=U0urDhskgTvJjiAv+8IcslB8HCgZYz7GY35OVAyZLXgAeOTlv5m27ghs7YihZfD158
 gZ4/dgam+DsfnKtwywxqvk38n3O7i/dajoiUjK/W9yn3N94zFyXMWAfycF0BFkbcVAyf
 anReVop5jLCy9WXzW1D+ShmtDa7VzGBLmWs4caCGF49qQarnIYXz2M1j7P0YzRP9+j1+
 iLvQ5ZBkiGyg7EcmbJhqswB+Aa8w0/uZqpR3N9ii0QgHwPTxhSz7f0OjIbK4faCfZz2e
 LzBUl5NTzK5+mDvFmjUpCYR0drGTbvOL1xaISMOFqagFmzCcq0gjoE9E/YSKzmGZTkW9
 HhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70yTRYA7D/lEWfDwZ5uBcO2qIKIsAHfOHZkX9gFY1TA=;
 b=Pc2IfKE+s/jiONP9c9jSImR1WI70r0eS4ONEaLEbJwKNznL9CM6PYcwDPLJPb/BOsa
 PPtZEhojZf4Id9v3SrCIMAj1RhfjjDZAWQ+M5extRrNIxcTbIm67QJ1RMUt9hiFEg1Fl
 vt89EfcqPW/gHBGBVNgyXkDYoDk4kJ+gdN/3AGtPnEw5UjZ2/fFPw82OFNrNWolQzWwb
 mCYHAMZ5U81TgVr3m08zfGEjj2h1HLeJpSOmsmDrgDVBh9UTxpQrynUezL9H1CCZFbmV
 Aj1XEMq6x4AT88x4km4Jat1mPTRvMP8B0Aq+vXxZZSQLtw2C+xyKW++Aw0mrF4/lwijp
 Ip5Q==
X-Gm-Message-State: AOAM530dXR3ySyx/kmr6jI5eElSWVErYAutUSf6V4+MlTmkQ5Sq6No6Z
 6oqgcg/uMPzOxWsg4aI7ZVDp4gaWBbhbfhui
X-Google-Smtp-Source: ABdhPJxUmjw4vnhVFMlgqJ/Up8ZyZ6XZ6Xzc9vvh1EV4A7pNjh0JoUXv1RgNhmrOlFNJrL1l8j2pYw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr4828745wmf.47.1615900435655; 
 Tue, 16 Mar 2021 06:13:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v13sm25629186wrt.45.2021.03.16.06.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 06:13:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips/mxu_translate.c: Fix array overrun for
 D16MIN/D16MAX
Date: Tue, 16 Mar 2021 13:13:53 +0000
Message-Id: <20210316131353.4533-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reported (CID 1450831) an array overrun in
gen_mxu_D16MAX_D16MIN():

  1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
  ....
  1112         if (opc == OPC_MXU_D16MAX) {
  1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
  1114         } else {
  1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
  1116         }

>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
    index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
    (which evaluates to 4294967295).

This happens because the code is confused about which of XRa, XRb and
XRc is the output, and which are the inputs.  XRa is the output, but
most of the conditions separating out different special cases are
written as if XRc is the output, with the result that we can end up
in the code path that assumes XRa is non-0 even when it is zero.

Fix the erroneous code, bringing it in to line with the structure
used in functions like gen_mxu_S32MAX_S32MIN() and
gen_mxu_Q8MAX_Q8MIN().

Fixes: CID 1450831
Fixes: bb84cbf38505bd1d8
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested with 'make check' and 'make check-acceptance' only, which
almost certainly don't exercise this code path.

 target/mips/mxu_translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/mxu_translate.c b/target/mips/mxu_translate.c
index afc008eeeef..fb0a811af6c 100644
--- a/target/mips/mxu_translate.c
+++ b/target/mips/mxu_translate.c
@@ -1095,12 +1095,12 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
 
     if (unlikely(pad != 0)) {
         /* opcode padding incorrect -> do nothing */
-    } else if (unlikely(XRc == 0)) {
+    } else if (unlikely(XRa == 0)) {
         /* destination is zero register -> do nothing */
-    } else if (unlikely((XRb == 0) && (XRa == 0))) {
+    } else if (unlikely((XRb == 0) && (XRc == 0))) {
         /* both operands zero registers -> just set destination to zero */
-        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
-    } else if (unlikely((XRb == 0) || (XRa == 0))) {
+        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
+    } else if (unlikely((XRb == 0) || (XRc == 0))) {
         /* exactly one operand is zero register - find which one is not...*/
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do half-word-wise max/min with one operand 0 */
-- 
2.20.1


