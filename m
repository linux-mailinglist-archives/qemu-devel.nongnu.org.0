Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C251C5785B2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:44:14 +0200 (CEST)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRyn-00016A-R0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReW-0007aQ-6z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReU-00075e-Ja
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso5812880wma.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMMinSoDTI6N54r+UdMLMHmiLTlhc4umiwWaKStq1u8=;
 b=aekHxEmhXcPXhXIABCtluGUqEDba0hpqhDCRRERZnOAHucDpa3AcSRgZQBCPJcLFv7
 AwcFGdoS2gd2KKiqiwkN3F18UpBaJfFVV3YZLpB0cNtHYf+x1svE3Lkf4ndvOsVfIBAF
 1iOEm1+zP1NvtcWNrvK78Zzv8xczVqBgY47uagJ/KGR4AaurNw37iPsGNq0i5V5Tr88C
 eRU2I0pjbvYYzsw0UVYU/AXwaKUXjcrYJqiSnEPLmdUj//cLhiin0gEaqwo61Y8i4at6
 GxHSEMhrEVhVnf5Q3lew0Y86yAyioV957p4LQ3sWKiUUGwwq7kdAwk2QkAmuYMPDl7WP
 wpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMMinSoDTI6N54r+UdMLMHmiLTlhc4umiwWaKStq1u8=;
 b=VuoM1MiplvwKwg/6nbm6vxwYZrh6ZSRfcUdU1TBwOqLut0fErj3hxLcfqhxK97sfLI
 JieNs3H4Fj5O2WBjvQx+Dpi4wteSUR3Hp3MXCl1FNDoAgMGRjVnIjc0XIGCGjqZqBS7M
 NtuFAWmfcXvlYAsXB+enKIYeapcbmc77hkejfXpaYVvNiULMM9HcSLFEsHymLXsnTXaT
 2FiK6iVnuRJJCvcKYda5hhmREbvQnOMml99hSpWpBrOyr9894QWivg4n36DEUZaDPpHr
 vajvdbeteC9C+lnAGg9bhkU4zxK0enkB9vFUs/McvnWM8NhQ1q6H8QR4EtBt7liLxAPy
 TZ3w==
X-Gm-Message-State: AJIora/DWR1wVz4RGaZ6l/9aQO/gI7TJD7mIVY5QO/4/cSr/nRGlFrcd
 SIJX2N9l9ulWPYlvzDF7i9Hu5QYLgf7pNQ==
X-Google-Smtp-Source: AGRyM1t/wJoQJ6FFjeikbtOgPpBRwlpdQZmu0yLdZjHv/6qrQbD20kN1/+Li8H2lgZ344pqds+pnAA==
X-Received: by 2002:a05:600c:600b:b0:3a3:1176:222d with SMTP id
 az11-20020a05600c600b00b003a31176222dmr11867594wmb.42.1658154193366; 
 Mon, 18 Jul 2022 07:23:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b0021d6e758752sm11079694wrt.24.2022.07.18.07.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:23:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] scripts/coverity-scan/COMPONENTS.md: Add loongarch
 component
Date: Mon, 18 Jul 2022 15:23:09 +0100
Message-Id: <20220718142310.16013-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718142310.16013-1-peter.maydell@linaro.org>
References: <20220718142310.16013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Add the component regex for the new loongarch target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/coverity-scan/COMPONENTS.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index de2eb962416..a61d011d9a4 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -143,3 +143,6 @@ testlibs
 
 tests
   ~ (/qemu)?(/tests/.*)
+
+loongarch
+  ~ (/qemu)?((/include)?/hw/(loongarch/.*|.*/loongarch.*)|/target/loongarch/.*)
-- 
2.25.1


