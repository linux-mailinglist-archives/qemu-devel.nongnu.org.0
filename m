Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3154DCC9C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:37:07 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUu3e-0006Ia-6s
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:37:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvs-0005S8-Vi
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:29:05 -0400
Received: from [2a00:1450:4864:20::429] (port=39566
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvr-0005q0-E9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:29:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id h15so8335277wrc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=Hctd6SFSyLdRJsrpNuuQ8Ts34qQZHtt3Hbg6+flmhXlCacxlVOf3SIh89uEyYq5YDr
 JVRehB4wV18ht02+TAt0yORe1QcFPC49f2pV9HI4gSn49CKxXs1bJ5aBaSb54uD4evEk
 5gqqdDVKQHY6FKsJSBXGzjOm9rUNYntiNk74U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=XeWWvNGyO+l5b09XAriROMTaht2sp5XAjyNHt3rFjYFD4y5PnOd0JT76G2ZQd92CT/
 bUffr3TyteXfFjULyu0auGKo3MfOnb4ruXKgjletoNHbZUAYfvmM9jkypV13UInINF/R
 r89WOXTuzwuADIkeg6dQ+WpDmj18B+FYUmD1Hb/J4U42R+AQWI6vZmQCSan+f4FO5iN4
 DuYflZ24pWk+LUdXn2F7i0LUCMPVxiAs/hVHUYLDrGJftK7XoZp8jbQ/wpy0K+uSxVQQ
 g6uwy+bqUHpHMN/dfSbSNTNSGKaYKHHy37MS/rHvuFPJ9YlDJTJy/UX+w6OhJfmEP7CD
 VwnQ==
X-Gm-Message-State: AOAM530mgzUQa5y+LT9O/Uy9Y1uhsGbeAi7c8WjGrlF2KShbc5X8xl7l
 YrklLktmt4QuPTTvrQNmolvgxQ9gtLeXwqwP41k=
X-Google-Smtp-Source: ABdhPJxz1FwA9zCUVxpfWogDD5zAyrpFbjO0xiGofiivsB37u7lgdCtc0Zdcj8zn4zzmRz5ujDhZBA==
X-Received: by 2002:a5d:52ca:0:b0:203:db2f:2a47 with SMTP id
 r10-20020a5d52ca000000b00203db2f2a47mr5013122wrv.580.1647538141683; 
 Thu, 17 Mar 2022 10:29:01 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm4890702wmz.43.2022.03.17.10.28.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:29:01 -0700 (PDT)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v22 7/7] net/vmnet: update hmp-commands.hx
Date: Thu, 17 Mar 2022 20:28:39 +0300
Message-Id: <20220317172839.28984-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x429.google.com
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

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 hmp-commands.hx | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..8f3d78f177 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1265,7 +1265,11 @@ ERST
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
-        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
+        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user"
+#ifdef CONFIG_VMNET
+                      "|vmnet-host|vmnet-shared|vmnet-bridged"
+#endif
+                      "],id=str[,prop=value][,...]",
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
         .command_completion = netdev_add_completion,
-- 
2.34.1.vfs.0.0


