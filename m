Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB76E689C70
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxU6-0002Ik-Tz; Fri, 03 Feb 2023 09:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU4-0002Dc-IH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU2-0005wG-Ld
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id k16so4070687wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9zIETZDw8AzAYdvOUdcE4GWKCA1zFcGWd3/PyGieuU=;
 b=pTmP2R7B+z3eAJyd3o7EP53hEHnMbEhT84NZtKZwHlAz9ttqI/z/DmEyUTgurqhh2V
 zGBMtS0GEt0auuCAQL0m8tP0Lp4Qk8+4vJzHmNwWSWWpdYqXXHZkGmXZlDvvewCzyujF
 DWUHfZ0w7ZprzF7Ux9bA9IvTR4RgYvKCl/gtJWQauqPb1d9pyWMXUIrCTOWzl4lL41RY
 wUHyyXN8DnHGFHUFOdqBEGGS3h3lbridfsAwaG3NaHzxfH0UxoagYe0o1SWznXFo2cni
 D0XXC6sSNc+zQetYEMVAFet7mzYDeJvDLt6VEH3ml3zhfvW/dFslzqE3ODRAiprAVa8k
 1XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9zIETZDw8AzAYdvOUdcE4GWKCA1zFcGWd3/PyGieuU=;
 b=Ufd3oTOVEuwYEB+oV9e/L1AiV2WXPko6chMu4fdxalgfDKMPWWmHkaDXxYaShLwZAc
 eMgCuRCp0PpCzNNPgykFvmHcI4mK2JzHUGCNlPIHEZcZFM6wpeCtbQRdXpj+wcfqr8VI
 9CcJdK+rszUc9iyXmJT93PkiL1nq87F2jec5UBXp0GLA+Nc2Sw+eIjlsyLlpjng+XA+1
 srgdRxdaxEMwI/vc8jqJjOvWGZbYGBiYaIyiJ7PdmgNItaoQN9uJvx794zi8YpqD826Q
 sS94KSD4SHXSHTksFtgkabIQWjCB7MwTRnbGrBWOLemGCq+CSqrnlMmPIUv26LhdRfLb
 kykA==
X-Gm-Message-State: AO0yUKVJ57sXemrf5PkMrXwnQwx8pIXLJGBNMgf8bju5etit3ZWDbkKD
 SqcXdWeaQWGyrvzouz/7a3fpydBRwdlXPjQ0
X-Google-Smtp-Source: AK7set/NWAfcASQblO/2Mf/pJtQFTI0hy716MZhLsa4SPlKoKs8gf/YUlwABvctia7W75oPASGA76g==
X-Received: by 2002:a05:600c:46ce:b0:3df:e1d1:e14c with SMTP id
 q14-20020a05600c46ce00b003dfe1d1e14cmr6897203wmo.20.1675436169010; 
 Fri, 03 Feb 2023 06:56:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003dc433bb5e1sm3251692wmo.9.2023.02.03.06.56.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 06/15] hw/ppc/sam460ex: Correctly set MAL properties
Date: Fri,  3 Feb 2023 15:55:27 +0100
Message-Id: <20230203145536.17585-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

MAL properties are declared as uint8_t:

  static Property ppc4xx_mal_properties[] = {
      DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
      DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
      DEFINE_PROP_END_OF_LIST(),
  };

Correct the API use by setting the property using
qdev_prop_set_uint8(). No behavioral change.

Fixes: da116a8aab ("ppc/ppc405: QOM'ify MAL")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..cf065aae0e 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -389,8 +389,8 @@ static void sam460ex_init(MachineState *machine)
 
     /* MAL */
     dev = qdev_new(TYPE_PPC4xx_MAL);
-    qdev_prop_set_uint32(dev, "txc-num", 4);
-    qdev_prop_set_uint32(dev, "rxc-num", 16);
+    qdev_prop_set_uint8(dev, "txc-num", 4);
+    qdev_prop_set_uint8(dev, "rxc-num", 16);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     sbdev = SYS_BUS_DEVICE(dev);
-- 
2.38.1


