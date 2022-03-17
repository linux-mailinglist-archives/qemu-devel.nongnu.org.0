Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE484DC415
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:37:38 +0100 (CET)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnVh-0004GX-IB
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:37:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnOA-0007aI-JC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:52 -0400
Received: from [2a00:1450:4864:20::12b] (port=42803
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnO0-0007CX-Hd
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:43 -0400
Received: by mail-lf1-x12b.google.com with SMTP id w12so8200317lfr.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=cVHD0gqrlf2lZCOhSj5xk1xvq55hJsAYKHZSnWl8hCTPmIuou59G5q3MyJGPw7OBpd
 BvIkeqSWagz+poxPVbM24Sq4Xc6LkSWuM6Wp5dNA+fVKJeCUYathjUxPwpum5f2BfkhV
 yJCDlcl7RJaugn7iNcrNg9fkWduMH4F3dsDcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=Qg1R+0kvCjv/TnrXrvZchH9Xvf70pYAaoEoQMWFlPY8o3oeNJ0NdX6aJeNYgQpjSdX
 zoe++U/0FqlF764P9G3tKougiTBf2l76uTvYlPOnvx4W90fWuTrzXGdUSBBXhAwX210x
 A9aGTHDp9emdhUMu5R8rDZo61+0RXFqSrh5wg9U5Hw0DsWIHvJ2Bn64xIONg9gRkLHc4
 0bl5bQQLBYkTjqhLa/CjIx+qpMGwT59CSjuS0J4SXgrP3ycuwscpHyWvHvQpL3rvRbxL
 Y1O52j8ntYIlff5Wz+PSqXUVZVSuOuRykHmXfOKMdSGYLvtzEEHHrn1s/v9iNgafqUM/
 M4NA==
X-Gm-Message-State: AOAM530SmSMJiWZGGtjEqi65mgmxJ3iutXpWYVCYrgR6Z330mrFsgtMF
 e995MWlkcZVS/Gwr+eDEf3439I3jqwoZDPA1
X-Google-Smtp-Source: ABdhPJxIPlo/8kyAX5Ry1QdW3h+k2GN2gKYpPcymnudDiKUyycql8wJsCvJFGz2LOQtWaMEk1Y9hTQ==
X-Received: by 2002:a05:6512:683:b0:448:6a0b:da42 with SMTP id
 t3-20020a056512068300b004486a0bda42mr2372266lfe.223.1647512975056; 
 Thu, 17 Mar 2022 03:29:35 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a197115000000b0044895f0608asm413437lfc.37.2022.03.17.03.29.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:29:34 -0700 (PDT)
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
Subject: [PATCH v21 7/7] net/vmnet: update hmp-commands.hx
Date: Thu, 17 Mar 2022 13:28:33 +0300
Message-Id: <20220317102833.20775-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12b.google.com
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


