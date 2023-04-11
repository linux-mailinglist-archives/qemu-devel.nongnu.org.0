Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929266DD7F4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:31:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBHS-0005hw-0g; Tue, 11 Apr 2023 06:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBHL-0005fz-Ov
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:31:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBHK-00083O-1y
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:31:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a05600c354800b003ee93d2c914so5466603wmq.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209068; x=1683801068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQcPoZYF5V/WfEMLeE1eZP++W4xAxZxyW+eXvaRyFME=;
 b=ETXgwjv29GJ/if1mlpcP7ecsz3bTTJq798Nw3qNpR+TBGEnNBnIZCaH8vrZG8uuqFR
 C/ovYtLLaP0Wrshb12eICozPK+SZBKv9Dmyotg+8IpDc5RZUxF+ZtDqZaBwM4cUUcy3J
 7WTP69dm61y0JMqqDMJi1CJVMamaEdNdbgPinOWt+xR5sg43XJumz+UAaJUG2RIC9Qly
 4Y/mW/lpmvzFOwxxuZz3ia9IW9uLfaovzbiNPjGOXOgpFT3C3guPCkR1yygPO6bTbt82
 yCPLDiFJ3h85oP/8Wfe8ZgFg7qcKVssYlYXxMEkoWZeI1+vFnlILrf7JsGsHnRaxR6oa
 B7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209068; x=1683801068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQcPoZYF5V/WfEMLeE1eZP++W4xAxZxyW+eXvaRyFME=;
 b=K1QAeldhvWfm18T73eNd7v641/n9FrdL0X4Kvwhvlz2Om8hWZ95otDMLoD2d5aM0sh
 mhoqbzVSkLkp12v5H2dA9iFgmmftD08ptikF9PCG/VUJ5R8ZCENDfhewQevM2HxGpoWQ
 zpHnL9RHyHJm+i7f74i+6Q2W9FexsrUaFP9S+UqvGXidYnVXi0f2Bdh+UCUtGX3VMDzL
 tjWQiXce9BB3Dt8OgY6JW1JdSunoCC73nMm/ImWsnemzW3ItyOv+RDdbMoqRYM3cDQAv
 3NrjiKWlUxjkPZAqplK+cw5EPJqrFFh9kBdnx+M60gykykI+s0BcQahvNHW/C9dKLx/C
 RUWA==
X-Gm-Message-State: AAQBX9f/zA10ojQEWuMDYiZ4DzT6VbUPOapzCdq/nPrJCjA37nsvyd5y
 dFxpZykIb4Ac77E9YigmjdpCng==
X-Google-Smtp-Source: AKy350YM9zC86p1Un0EqZr63hcsEPeRixryXmlEllbUCY3CjmaJw92UN6ue6+NurpHkbzD9XjAgXog==
X-Received: by 2002:a1c:4b0c:0:b0:3ed:2702:feea with SMTP id
 y12-20020a1c4b0c000000b003ed2702feeamr6411343wma.41.1681209068126; 
 Tue, 11 Apr 2023 03:31:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm20568516wmq.29.2023.04.11.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:31:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qianfan Zhao <qianfanguijin@163.com>, Thomas Huth <thuth@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of TYPE_AW_I2C_SUN6I
Date: Tue, 11 Apr 2023 11:31:06 +0100
Message-Id: <20230411103106.3992862-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
minor variant of the TYPE_AW_I2C device.  However, we didn't quite
get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
use a pointer to this object via the AW_I2C() cast macro, which
insists on having something that is an instance of TYPE_AW_I2C or
some subclass of that type.

This only causes a problem if QOM cast macro debugging is enabled;
that is supposed to be on by default, but a mistake in the meson
conversion in commit c55cf6ab03f4c meant that it ended up disabled by
default, and we didn't catch this bug.

Fix the problem by arranging the classes in the same way we do for
TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
variant class be a subclass of the "normal" version of the device.

This was reported in
https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
isn't sufficient, as there is a separate cast-related issue in the
CXL code in pci_expander_bridge.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/allwinner-i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index f24c3ac6f0c..9e8efa1d63f 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -466,10 +466,8 @@ static void allwinner_i2c_sun6i_init(Object *obj)
 
 static const TypeInfo allwinner_i2c_sun6i_type_info = {
     .name = TYPE_AW_I2C_SUN6I,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AWI2CState),
+    .parent = TYPE_AW_I2C,
     .instance_init = allwinner_i2c_sun6i_init,
-    .class_init = allwinner_i2c_class_init,
 };
 
 static void allwinner_i2c_register_types(void)
-- 
2.34.1


