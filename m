Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84755EBFED
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:39:55 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od80I-0002Ky-NX
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a9-0000tM-FQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a7-0002VZ-OP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bk15so6461238wrb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mdbZvGlemRTML0U9/q6dutguZkYkpzqfdzZefPdbkXA=;
 b=CmPqP9vbY+PGpz+U22K2Ul/camvnXkDS+a1pak+dmDNnSZBe+WyD047bdwQ51PDnGe
 eCuJOyQtIzS75Si8r+aP3krDTDBBeeBUT27Hvn4b9s80qDalbkZroeov5WUW6kfXzEpn
 YVYAL1xThHWODyay4szCmdncz/qjPMCI27CJBBuZWxbIk8KZBh4xk0m0uB+5wDYQ3bBp
 FVFjGBwtSkGrryTjPRNrMMgshjbHH8h30YKFOTbyEgPaKkeDjzi+22C4sfIypz+OVAQX
 fMRPLR/HwghA2y30kzPT23L72d6MRBQ8p147loX8/5AuUCyIo3Kif5qCRU7AOc2wWBo6
 LQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mdbZvGlemRTML0U9/q6dutguZkYkpzqfdzZefPdbkXA=;
 b=0ksajEp3R8JXHXYtubsH429bFa02Bd56tZz1SvU/MaMCi1NYpiSD/q7EU1G+Vm7yKe
 VEigN9HN2UqCf8BmZvpsuGio1rQqgtXGGLZzfVF5Djuygx8NBpllaTW+wSsY5CJcUkEW
 VENOze3DmvMz7UIeVuKaVyUMatrcIQi1elXF+m3sQn1sXJwa9GOAU1hO/DeGjfEW+rZf
 XmnpgBki6f7WfBadYczZqUeEflN878BVnyMrpHKh+Dt63omtwWnUscuifB3tA2Xp9yjA
 uSv7fxrqLpbcyvQYTxMtVuCF/J+TSNRfa/LF47jSQjfICr0uJb4h470qpOScuz8ma7+S
 ZUwg==
X-Gm-Message-State: ACrzQf2LGf76eTtEnZ+vihmBUuuI5ST1KIG6g8PWQSZRujP8i6FoMUvU
 flPQxpMqSQmMdBU2c2hjVLcjDA==
X-Google-Smtp-Source: AMsMyM4O5PGYXwodTBFW9v+AB9itS5ndh8TR1Y8iuInWpmRs3KBqR9p4qj/RzthJEkJYx8vHOQp3qg==
X-Received: by 2002:a5d:49ca:0:b0:22c:bc93:a9b6 with SMTP id
 t10-20020a5d49ca000000b0022cbc93a9b6mr1643313wrs.10.1664273568980; 
 Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the gpio-key
 node
Date: Tue, 27 Sep 2022 11:03:45 +0100
Message-Id: <20220927100347.176606-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The node name of the gpio-key devicetree node should be "key-poweroff":

  gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8605f5058a..6805c57530 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -932,12 +932,12 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
 
-    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_add_subnode(fdt, "/gpio-keys/key-poweroff");
+    qemu_fdt_setprop_string(fdt, "/gpio-keys/key-poweroff",
                             "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys/key-poweroff", "linux,code",
                           KEY_POWER);
-    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_setprop_cells(fdt, "/gpio-keys/key-poweroff",
                            "gpios", phandle, 3, 0);
 }
 
-- 
2.37.3


