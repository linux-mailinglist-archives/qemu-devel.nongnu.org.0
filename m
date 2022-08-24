Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C36E59FEEA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:57:24 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQskt-0004jT-O8
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf6-00027w-8K
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf2-0002ET-I7
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so21324222wrq.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HR8iBeFG8r8rfNyNxc67KbDEH5iNA4eSJjr7tgdBtu4=;
 b=n2/D44lxhsABR8dmGzAoQrmEfOPUeBujtraAHfAxcqIFbmCsmtlJA/YFyf3irH9gMf
 +/oRcppu4syzAt0aMSCiKnOYxXQEyIcdurx9mNz+7XNw1MStHX7FxkyJI5eXr6264NNQ
 LBCJ9j4igPDnorzzQTKda4+NRvowLb5eIo2SRRzsGXWXUe3Lypdq8ILt5M7h1YDU6fqy
 1OS5aQZ8LHYCeB74PexkHGJRmvHNsM5SVapb2PzNeo8SOY3jL6MGCdoRLc158BotRuZ/
 /EaufYNkruScy6Sm+S2bE6dn3ePsGOy8VGTaZIl1vmc370MPYkg9Lp0Y8jlbZC6Dn5En
 WgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HR8iBeFG8r8rfNyNxc67KbDEH5iNA4eSJjr7tgdBtu4=;
 b=GzbxtMPj/7tdKFLSz4u0IRhNlacR0M3agM63gbyyHdDwXdsRIWU57tcxPscoxN5hhO
 OFDLSCffcANNHHcC7Rw2YVVqAaCdssotr52Ma4GULXTl80nHzlzdNQ7IU/nNRAKNBMZI
 DubV+WEr7Jm8m2Sni1c3f6HAENZ97niDdzYqFiNdkzzrGTzwxduPVp6Bd7Q71jlkqUsh
 cPJBEHAkKGEf72V1OSGXMBtXrXopg3BCfj8eb96zZ8uFQLrZkwHtiohXGZCTsZuhXDJH
 xKl6YS6td0Gxii/s03YIUejKzPSDuxQE/9flnsPHvgYTM53gMujbWdXnPcndr/x4w4TS
 IBIQ==
X-Gm-Message-State: ACgBeo3m7HLvPB2yIAHGJ2w6mV8ketNFaYSOYZ3xqRsbZ6KyxYFT04vJ
 vOFjSY0qbAYWRZZ676jKpskd5A==
X-Google-Smtp-Source: AA6agR40JvseUdIc6TQ/7HZBx5/QhWW4nxvawf2jA6i+6vXuMr4V8h/kIKPKXFAmEbbhCAHRswHRtw==
X-Received: by 2002:a5d:6dad:0:b0:225:6dc8:e453 with SMTP id
 u13-20020a5d6dad000000b002256dc8e453mr3245325wrs.64.1661356278859; 
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 01/10] hw/arm/virt: Fix devicetree warning about the root node
Date: Wed, 24 Aug 2022 16:51:05 +0100
Message-Id: <20220824155113.286730-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
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

dt-validate warns that the 'model' property is missing from the
devicetree:

  /: 'model' is a required property
  From schema: dtschema/schemas/root-node.yaml

Use the same name for model as for compatible. The devicetree
specification recommends that 'compatible' follows the format
'manufacturer,model' and 'model' follows the format
'manufacturer,model-number'. Since our 'compatible' doesn't observe
this, 'model' doesn't really need to either.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
This could be an opportunity to improve the machine print by Linux, for
example make it display "qemu,virt-7.2". I was concerned about breaking
some automated testing that may use the stable virt-x.y machines, so I
kept the same as compatible.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..abcf2716bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -252,6 +252,7 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.37.1


