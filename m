Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08558166A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:30:24 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMVr-0004P9-Es
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMF-0006PO-O3
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMD-00063T-6l
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so11544509wmb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0ZhXnkNY51Ak8uQsgToIykxdNgR1qaaFhrhnxOotnMI=;
 b=rlKTRKlLGVsfdBXWgsR/5GtJeUTDisi72aya2fNJ8tgPWRzxVvuCewl1dguEjHMrN7
 chjVcTfB94EWhHRbi0aHVKrNMRf1+9HoWXKPwoe9mD6G42dpR5O7prgwaSucfqivkCMx
 48fUQuZ6VO/yf68iYzUfRCGOm6XBsN3lTopzG6PPDZY3lPloySQS9592JZ9eLGNz1/52
 vVkBelkH+itmNIWwtZ3hglwi8u3hfZj9IgLWK6PpWz9Wvv7qPK0I+UhXlgFYOlLwx2wE
 wC20s9/OpEON6zw04f1MCVwmp2sGnsAgYVJnhIOLD4blq1d64B1KcxEaa1AhgaJ7eCVX
 usiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ZhXnkNY51Ak8uQsgToIykxdNgR1qaaFhrhnxOotnMI=;
 b=0xAKQzGevzyEzGyWf+KgjpVBhiIAXjoseGVMm7CuIxY9HTeWG/llyXPo1q9HT8JBmm
 usuec1RCjPPLYEcxjkMm1ESRmd9IeJhj3j56ZqPj9uiv9sSPf5nS9ed0xw/gBh/KPOtv
 47vV8ZkoUhQ6YHqr4gjPCpNCz1Et2Btr6JsP5C1PGKDGsppZ7dutbFZaciPeWX0WVkJg
 DH77UICv5AjY+ugvSvjm/9wKKWIfxS1k+GymjhV6mO88GVM0z1E4tzgJ621kQ1IVf7kL
 Zw3J912ldACDyWnFPoFEdtxSw8ot/7lnGRKC1Q75AMkl1TfvD1tWMC/n5XYA3TelvqJ4
 24zw==
X-Gm-Message-State: AJIora83lpPhIovOvAC/lrx/qW9+uM6idtm2oHINvW+LXNNxMq9AXvKc
 ujN7fF44KCjN0mnVfUcB71g/Ru/7G8RnRA==
X-Google-Smtp-Source: AGRyM1vvu4t/+eiz5bosZ/tKtcJ0J+cVfjeZu7wO2rp8XOkVGlV1tLvLUroCnYBnbV6wAaPBHF9F2A==
X-Received: by 2002:a7b:ce8a:0:b0:3a3:1181:20ae with SMTP id
 q10-20020a7bce8a000000b003a3118120aemr12119396wmj.96.1658848822869; 
 Tue, 26 Jul 2022 08:20:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] configure: Avoid '==' bashism
Date: Tue, 26 Jul 2022 16:20:11 +0100
Message-Id: <20220726152012.1631158-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The '==' operator to test is a bashism; the standard way to copmare
strings is '='. This causes dash to complain:

../../configure: 681: test: linux: unexpected operator

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20220720152631.450903-6-peter.maydell@linaro.org
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d0e9a51462e..2c19329d58c 100755
--- a/configure
+++ b/configure
@@ -678,7 +678,7 @@ werror=""
 
 meson_option_build_array() {
   printf '['
-  (if test "$targetos" == windows; then
+  (if test "$targetos" = windows; then
     IFS=\;
   else
     IFS=:
-- 
2.25.1


