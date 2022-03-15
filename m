Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DB4DA418
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:38:47 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDwM-0003ny-TA
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:38:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmY-0006rH-8i
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:38 -0400
Received: from [2a00:1450:4864:20::32d] (port=55059
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmW-00067I-J1
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id r64so132374wmr.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=aWo7oQOUM3ENRW84M4GEut8TM5Equ2Py6CyRjoiedG8h1WyH8jE+F+NyBIQC2jBH+q
 A86svcba9PQLJ1wxiD+mkElIDdpphRckRxBFk9zOu+r0Vfvu1UUdgWa+AH+n1aSRF2eu
 /LdX2Ym+6WMh+zqkPrB4l0y1ZDfIvhBqo5g+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=0xcxNuWs26pR0ThFPMO4FLbcCmcgdRH4zbIgzpUlZR8sz7MOmq48DDg4zZc05obYlW
 Am2Edbm0GG+nVGDhZvucYQuq/R/VWKr4VqeSv4qHt5ZFJanXhTZMPBU1XxWwVk/5vyjb
 CG3PPrnH/2ZRQdrA/xvQTfX1tM6bci9mYnefYV6ZMuz07KtwaCaThOzD1ERVhAK3oYVI
 YtRicn24Oo3aPsBtt6wPZfxdEHbts5ajREkFeynjuSa5tENOgVEpDFHKBplz8TpsjXje
 /dqTIuniPp1GjAimMW3AWnk/6toJJqSxW7fRLNSSD8rSV7O7hOW3lIXqaM8I9Hs07aL3
 ByrA==
X-Gm-Message-State: AOAM532j1MHJX/NpYOqm4lDfBPPfMncy0B6f7HHkg7o67qOCKt+hv/cL
 ZC/7/oiLhrND0NaVv0Db5Yn6Vqc6JHDasObB
X-Google-Smtp-Source: ABdhPJz8Xc+3KRl1aFU2x6FqZeItQ64fHJCA6kT3yaGegvY9UAKpqF3TIPo1OFGp4gDFjDmsZg7aug==
X-Received: by 2002:a05:600c:5c7:b0:389:9cf2:53b4 with SMTP id
 p7-20020a05600c05c700b003899cf253b4mr4639036wmd.114.1647376115020; 
 Tue, 15 Mar 2022 13:28:35 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm13378166wrg.85.2022.03.15.13.28.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:28:34 -0700 (PDT)
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
Subject: [PATCH v19 7/7] net/vmnet: update hmp-commands.hx
Date: Tue, 15 Mar 2022 23:27:04 +0300
Message-Id: <20220315202704.18263-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wm1-x32d.google.com
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


