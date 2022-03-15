Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62374DA61A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:40 +0100 (CET)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUGLI-0003m1-10
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 19:12:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGGw-000471-AU
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:08:10 -0400
Received: from [2a00:1450:4864:20::32f] (port=42880
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGGu-0005An-Sk
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:08:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso468229wmr.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 16:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=em+TXJHfI6oM1QGVO+hqJFzDNT1lVDSz6l+s674OEE95a9Ik+0RK5znSRLZ1E15XhD
 CeHlGoJU22ZSnM2UpxXijRApVXN85pcjjvGjJsyFY5KOSAFQ5l198wGsSI29RN3oxl1m
 ldNMrn/HEiUvFG1vspTNkPdfKko8cQQ3S7+Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=1Vd+6+jQdYWPSPWA2IjzPsTCVRzdYRLriIzD7hHanHbwHlFCiGH+qvZMEAHNSOuBN1
 p7v+ACVcaUl755P2F2cEO+ZAyTcgUGRgqM3noS5D7zjeyrOxu5N2D9v1meak95b66MZR
 hAaTntf2RXlx2C47H8V3cmBEAgGbaiwiBqBT6LKMP/usSDYJwUiFjWyZtnopGGvNmRVj
 eg221k2cHgB7K6bcqCcejmCkCBHXkCJ2URfZ3d8zka/DA6/dK7fq7xdpFxu4vgcIgDk9
 CfWzBhO+XOYje1tM5QGsJbL9OwpVuK6YsxFsL7Bail62eu5Q9RqJSkhOY9+Wh6lNYduu
 rJKA==
X-Gm-Message-State: AOAM5302+zrT8t+T1QQl51m9UHSDsQ1Vk6PNE5Ylo5l9szGsrPwRyDmD
 VdViBhu6yE1pWD5y/FINcFcEV7GDqO4wdyzj
X-Google-Smtp-Source: ABdhPJxjwsjqTiiQl1UcHuOJGmMoOyYM9zfrdWRWAjwD4gGqo4M7PAGiuTdXqEuwI53TUR5hcm8/fw==
X-Received: by 2002:a05:600c:1c09:b0:389:d0a8:d3b7 with SMTP id
 j9-20020a05600c1c0900b00389d0a8d3b7mr5055357wms.92.1647385687323; 
 Tue, 15 Mar 2022 16:08:07 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d584f000000b00203ded4f92esm221195wrf.18.2022.03.15.16.08.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 16:08:06 -0700 (PDT)
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
Subject: [PATCH v20 7/7] net/vmnet: update hmp-commands.hx
Date: Wed, 16 Mar 2022 02:07:41 +0300
Message-Id: <20220315230741.21578-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wm1-x32f.google.com
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


