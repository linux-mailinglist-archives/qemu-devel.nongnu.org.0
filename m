Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8474DA3AB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:04:37 +0100 (CET)
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDPI-00068O-SG
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:04:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKU-0007B6-Qj
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:38 -0400
Received: from [2a00:1450:4864:20::430] (port=45985
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKR-0001bM-7U
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id p9so74424wra.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=Vz/ChaebF2hABysmIOPlVB3LUY3GDzZePxr4teCpFDLaJYlQQQqN3PeVExUWxk52AV
 KHrpPsDcTsMt+BZfcOW0IrVLV+uac9CPMYiPP2zIo1iNOVBby7LITOh4FbvJBpa+iFqW
 +LJ2p98HICUd1+xWfO6ag1TdkydVDgh3+K2Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=f74aWjWjBKIQS6l/aXw70WibJxVlTIN0/+PfyoPkXyG64enkqUkJ0POC9JPJGutI2N
 Iup6eDIXsku+nbAsvGuFHKSOztgSfuN7HCfyruwX9DmsT1jbjNfvIxV5WsVlWGwFYq8q
 WgdAXfI67bO65RBu2UWm3kZF9M6sN8JAkMXqU2FbhqK1dySn5JN4XJN4M1WOi2w3Z6AE
 4eAsF9xLPNoLiXlB/xhBHmvmDDCnjMP6ZFvzJfIdaKfesTrQEQpkWlsAPR29+t5BX/ZR
 +o6hZ+SB+HBZtJScqfuSePWWxkH1NcjZqkv5J2TA4vdtuiR9EhZFs6H+kREn4MoiPmkY
 UL9w==
X-Gm-Message-State: AOAM531UxUO3J/BQxhp4DAu5c8SYXU44eZzNiWufuDD62iqeOOAFfZAZ
 aIL3F67BSuhMmdzaM38lZ3Gon7B0t7rQ+pOQ
X-Google-Smtp-Source: ABdhPJypcfcllyEXToueFcT7YTYNQ0v2mCPvJBBfv45Ul5nZ5k9rmQF86Mc0/t8O3DmZ0QKbIg4j6g==
X-Received: by 2002:adf:f48d:0:b0:1ed:e2d7:d5e0 with SMTP id
 l13-20020adff48d000000b001ede2d7d5e0mr21391770wro.252.1647374373704; 
 Tue, 15 Mar 2022 12:59:33 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm785211wrr.54.2022.03.15.12.59.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:59:33 -0700 (PDT)
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
Subject: [PATCH v18 7/7] net/vmnet: update hmp-commands.hx
Date: Tue, 15 Mar 2022 22:59:14 +0300
Message-Id: <20220315195914.12107-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x430.google.com
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


