Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B44D8C66
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:28:07 +0100 (CET)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqMQ-0002H1-AC
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:28:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqFF-0002TL-MX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:41 -0400
Received: from [2a00:1450:4864:20::22f] (port=45578
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqFD-0007el-0s
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:40 -0400
Received: by mail-lj1-x22f.google.com with SMTP id y17so6289370ljd.12
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=Tx1XktYbwU++mr0IuJlbD7kNHOPq8ljSSgm1zp7G6Od8M3le/wyOXVWuSDD3fBeoZU
 1Bgp7ywW51Wtk5ZUyu+4I3cwvxh2bcjWvt3MH1pYQxBl9m6NuSYhkS7PA1n7kRanXZ0q
 SiIwN+skz/nja4X26T8qyzp/ciVQpl/mX/r9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=hnm6+0oOwXShoZ/841pMx1bn/zT0VKn6LknSBcje+pwKQkdZiXncEJhymiVEl6a0aY
 r0pNZrC07eHL9rq3+fWdw7oO2nb0QMUQLK4X2EvBwsXGFGG8FqfCa9jTn6mBkvwgQhaw
 P5gASQw7TK4LrAkcGMVV+M7y67zKdx70dsvEvzogDgmhm2Ubc7AY2e2bzFU1kyaD7n+7
 4EcDehBwRjlhneN5PIrYu85sU1qNDcRzdtL+pQl+Izbvd1CBbRZMJ96J6+/c5xgttjDw
 qolwQxEBcgTcAsb44zJ35WUv1raWzEz1fskEe/OjkhtoRNTjwpyQXniRPXL3bzdizKI8
 d3EQ==
X-Gm-Message-State: AOAM53091VEW53EKZhmqB26P0wQTmTf4gjyu7+xkPWFh8Sozn2imgNmW
 t7+I8u3PBQ3X0koPeu4t7mm72+7Nr5iSM9IJ
X-Google-Smtp-Source: ABdhPJxwdReDEXMbFJJ2ZY98NhjqAoYTGOMJdsqlxFhjUmR3UdLOKRHGJgRx1nYkUL+MLTYMbadOnQ==
X-Received: by 2002:a2e:9119:0:b0:247:e306:1379 with SMTP id
 m25-20020a2e9119000000b00247e3061379mr14424776ljg.361.1647285636233; 
 Mon, 14 Mar 2022 12:20:36 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a196e0f000000b0044827945789sm3414454lfc.155.2022.03.14.12.20.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:20:35 -0700 (PDT)
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
Subject: [PATCH v16 7/7] net/vmnet: update hmp-commands.hx
Date: Mon, 14 Mar 2022 22:15:45 +0300
Message-Id: <20220314191545.81861-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x22f.google.com
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


