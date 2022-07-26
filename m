Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090D581658
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:24:34 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMQD-0003dP-Cv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMF-0006OO-RH
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMD-00063G-69
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id n185so8952791wmn.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=onmBEojmdX59I7Osh+OHhyJMsX/Lk+u4yvlTQZ7RGfE=;
 b=V4KOAQEkjr9b907Afki63iSTKg5sSu7Qkc6Qeb41qx+LToQr339wnDO0ZNySLtg5po
 0d3Fw/0cfsttNqZN55NnhaD20ivP3Voi3EMZ3dmCB9UKfTYN/lopnYQ+kDc5qK2qz3YP
 jmlGOSyg6r26Se7zGSOtRsjXjLR2MMxhKQ8RFglns1eWZpYYaKnQhT5FxugISnr2UThW
 8zXA5HEnIRp/HAthmKK+RfSz3wdFBFupuJvLWG+2f9KEYrSxOqIPYvNqsaQ/KrlvAmU2
 2a7Ckep3yFYDpmIrsRX/IWMK04GwcqrhpDclUOKK+HHRJfJUckEYZvgjPIS1Ar6LxGh4
 GswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onmBEojmdX59I7Osh+OHhyJMsX/Lk+u4yvlTQZ7RGfE=;
 b=M8+5fRcDDWFaMBVcMXEhwMhv3IKRKRt8C9XGi8OM9kjbCrAGSysnPSPnoLPzI21Ut+
 ur4FUrRXSQRWn7aTNwfmCVJPw9WEhWl+q4/relYrqznWIOK1+nEotuKxYHDV4elPMv0Y
 J/5qHE4J9FfYHq5byYHnifToB4zyAXZFxj68daMnRRdyBV0KV0p0CCIdT93PSSpZOTwx
 ujh4N4Y/TY3xhXsHtp9cosk/+4BHI64+aumUHSFtPWDJzyNYJz/ZafNO1ntkFv0kr6nD
 HGndDOTWQqA30t+s2014+nLWCmVZa/PoTsJY/D5N4lXkEUfg5H+WN+zdd28dg5OwQF9o
 T7Tg==
X-Gm-Message-State: AJIora86toK+z+AtOSAnIXvoY5k1UsEXYxU7HLYmkh1kP4PO5kgc9f+K
 jw0Ll1I+2aOHEzVxx2aP+N4izVobqFDlzg==
X-Google-Smtp-Source: AGRyM1sMlOEsqpoQuvMqdhq0KJf8Dc7ODdGDYE4UzXBpddlMVp9bdXDwtmcmZlp47nBjKX8dqvFSvw==
X-Received: by 2002:a1c:cc1a:0:b0:3a0:39b1:3408 with SMTP id
 h26-20020a1ccc1a000000b003a039b13408mr12406395wmb.157.1658848822040; 
 Tue, 26 Jul 2022 08:20:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] configure: Drop dead code attempting to use -msmall-data
 on alpha hosts
Date: Tue, 26 Jul 2022 16:20:10 +0100
Message-Id: <20220726152012.1631158-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In commit 823eb013452e93d we moved the setting of ARCH from configure
to meson.build, but we accidentally left behind one attempt to use
$ARCH in configure, which was trying to add -msmall-data to the
compiler flags on Alpha hosts.  Since ARCH is now never set, the test
always fails and we never add the flag.

There isn't actually any need to use this compiler flag on Alpha:
the original intent was that it would allow us to simplify our TCG
codegen on that platform, but we never actually made the TCG changes
that would rely on -msmall-data.

Drop the effectively-dead code from configure, as we don't need it.

This was spotted by shellcheck:

In ./configure line 2254:
case "$ARCH" in
      ^---^ SC2153: Possible misspelling: ARCH may not be assigned, but arch is.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20220720152631.450903-5-peter.maydell@linaro.org
---
 configure | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/configure b/configure
index c05205b6085..d0e9a51462e 100755
--- a/configure
+++ b/configure
@@ -2251,13 +2251,6 @@ if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
 fi
 
-case "$ARCH" in
-alpha)
-  # Ensure there's only a single GP
-  QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
-;;
-esac
-
 if test "$have_asan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
   QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
-- 
2.25.1


