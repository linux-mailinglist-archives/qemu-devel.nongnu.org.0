Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1564DDA8D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:29:00 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCf5-0006Eb-4z
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:28:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZc-0006LV-Jf
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:20 -0400
Received: from [2a00:1450:4864:20::42d] (port=43999
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZa-0002BC-Re
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a1so10361309wrh.10
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e2Ca19v+BtrvPQ188u+XK9x8duUflsMT25zrs87XFmk=;
 b=ANIuJ6mUI/NkK5zUXOPkrNhV+Ml3iWP/A4Of6B1v5aVB8EyrfxY3VXtWzPpv7ISFEI
 XbWidJPPNt9zfaXa+ND0rkGHTZv/d5uwpUagiR4PH2eh6qo5qabTkl0uw0xk8zHLPVCA
 1jdn47Cdg88llA9X6BWmowxFeOVa9hvG0IE/XUuUcZNDukBHJKcZIlhA82wDp4xIQc6A
 O4OChg+4XnAiAWVqYrM0te+95v4mCE0Qy1K8qrTDk0Y8L2cJlfQI+kW+SUG6erVezK4a
 iTUf5Q/mSBqmObMf1l+ALVPwgfaIrkWdhri9zSRfhzZhWJn08lm631W5oacZ79SjH8q2
 juGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e2Ca19v+BtrvPQ188u+XK9x8duUflsMT25zrs87XFmk=;
 b=CraqfhdTweBQgE0sAsU58hH4BNjMhAeY/XsOjwUYIVrpzuCSYhGDDs5gj++PybFqSp
 Boq5DPMO7V9+EMtMJCj0tjFq5YCk2f5RTmjuJKiaGLfO0iw+X/fawOfjJP8x6P5bTxo7
 tedIVDNGNckwgIecrtK7PuG1BGjDDzFU+Eyt4rJfnCmAbuJeDCv1NE/QnmE32hjUccyH
 rsMlBJdzrRJrG5+e9VWnULeOdPqaK/FL+LFRORa07/t0GBTFzJ4o8oBVfrULDUGiYcZp
 jbjchFcSx83nrTMTiZMXTfov8Ni8JqGj90zbaoA+RDiz7Ik+V4eSMBba9yyWqbeqPJP+
 gkBQ==
X-Gm-Message-State: AOAM530f7Z3kuRD8NAOruIUaUyVlKt4bZ29NDTAMqjEjI+f0yF5onbm+
 rVKuHdc5NuvQ0I+YSI07Gm6MkCDCpgG19A==
X-Google-Smtp-Source: ABdhPJxZl7zhwucqxf5APr93J/d4qlFzg2enO2BEbzcAgtQlGZTSI9860iCFbRewRTbRVe4/wiQDSQ==
X-Received: by 2002:a5d:63c9:0:b0:203:e78a:248e with SMTP id
 c9-20020a5d63c9000000b00203e78a248emr7173816wrw.29.1647609797551; 
 Fri, 18 Mar 2022 06:23:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] nsis installer: Suppress "ANSI targets are deprecated"
 warning
Date: Fri, 18 Mar 2022 13:22:52 +0000
Message-Id: <20220318132306.3254960-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

When we build our Windows installer, it emits the warning:

   warning 7998: ANSI targets are deprecated

Fix this by making our installer a Unicode installer instead.  These
won't work on Win95/98/ME, but we already do not support those.

See
https://nsis.sourceforge.io/Docs/Chapter4.html#aunicodetarget
for the documentation of the Unicode directive.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-id: 20220305105743.2384766-3-peter.maydell@linaro.org
---
 qemu.nsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu.nsi b/qemu.nsi
index c3df8c9d3b0..6edd82b385d 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -35,6 +35,9 @@
 !define OUTFILE "qemu-setup.exe"
 !endif
 
+; Build a unicode installer
+Unicode true
+
 ; Use maximum compression.
 SetCompressor /SOLID lzma
 
-- 
2.25.1


