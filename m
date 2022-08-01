Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F4586DFD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:44:45 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXb2-0004N6-Bg
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSm-0005Ky-DX
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSk-0006gs-OK
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7611623wmb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=Ipf2GTEsKt1D5ZFSIONpxUko5GzazWg9tTGt6/Pqvzs=;
 b=WCss6kAZmxyOwNaQLQz70U5Qr6bt+RJYYHajWxqXQbeNjuKzKEUSu6EWg1STfKZcDh
 lhKmnNUK2f9jF3zjX7CgKA9Ujjs8z/3KNwbxfVJGNzMw2naWVxhuU+VBzJCsthdgTiKa
 B1IoA+d6JPhgs7b2/ymTXXZHmfyVS05kz6G9s2tGNKEhNV55yUMxSYQ1GCBJSBm+xxer
 qv5lAqtkQPyp1jijWfFHsciMWjUwJ+8c6Sw7bqnS2uzo9+ighNJ6ECyqXWTYi6Fjaeh9
 GA9EtLpKZz65KbH6/CIb5f+ZxHZxYZGOxpo6lyNH8xQHvNULwGvAv6HAWaaR7CEmP/vR
 x9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=Ipf2GTEsKt1D5ZFSIONpxUko5GzazWg9tTGt6/Pqvzs=;
 b=c2XIZWeu6BcTrucMu8oGmH1KLR6Q/D5yYbe/zkVIn2HSeKJB4ubhr93YGr79PZhWEk
 DZ0zZkjCDBFOikjsLdzmFZ54GYclX2E1dC1U251AI0XZsiKjw7xtsMA7ZmUTrNbum8pM
 /F3cNw5l6FedP2CNWA9r+JiP7/I+taLXGoqNd0i9bhCGM5G9+XtPbbGDeAQ4hdHw+KyE
 iVZiWFMFzdD/L8qmMcC1Mm5OJ/B3EbuCfVUvv0i6UlmtTaz7DdKaGtQ0KJYxjwVRDYaz
 7s2K0A6gTknTVwe7fSwxcfRjOaU+ECM20OSljat2dIdv5sdrBmkt6iycMfT2dezdWR7n
 gYlA==
X-Gm-Message-State: AJIora8Tk+SpojBUHUS/Jsty+/312X1Ym3v30GH9N6aq8FmmKHcnY+Ik
 DTJdtga/i9xH9jSW2ngcrRUkXGy5xTZpKg==
X-Google-Smtp-Source: AGRyM1tlf+UmLmfw4mBS4G3tf1cmlOOX2N9XSIMH2+rBDzyBjNQE9mk/uGModlQiuRRVX7ipwLlLFQ==
X-Received: by 2002:a05:600c:19d2:b0:3a3:3aca:a83d with SMTP id
 u18-20020a05600c19d200b003a33acaa83dmr11808295wmq.88.1659368169273; 
 Mon, 01 Aug 2022 08:36:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4bd0000000b0022059422255sm7109295wrt.69.2022.08.01.08.36.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:36:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] target/arm: Use kvm_arm_sve_supported in
 kvm_arm_get_host_cpu_features
Date: Mon,  1 Aug 2022 16:36:03 +0100
Message-Id: <20220801153605.3051778-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801153605.3051778-1-peter.maydell@linaro.org>
References: <20220801153605.3051778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Indication for support for SVE will not depend on whether we
perform the query on the main kvm_state or the temp vcpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220726045828.53697-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d16d4ea2500..bb1516b3d5a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -675,7 +675,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    sve_supported = kvm_arm_sve_supported();
 
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-- 
2.25.1


