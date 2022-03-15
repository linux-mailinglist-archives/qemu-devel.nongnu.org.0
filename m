Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A545F4D99B4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:54:08 +0100 (CET)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4oZ-0006B9-Me
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:54:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU40z-0007aH-BW
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:53 -0400
Received: from [2a00:1450:4864:20::236] (port=42878
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU40x-00017W-J1
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:52 -0400
Received: by mail-lj1-x236.google.com with SMTP id c15so9101986ljr.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=f7ZMwBgGnrYqMV/CDz4Z1KRrAB1CRZQS9I37106W8fBUIpIwEZHvj8SI0ULs2SAMuk
 YPwbFVWp7hu+7C9/n7QlNs0m+iVD9XJRPQub+3mtD+Q7vW+keifYZcn4Kili16a/DroN
 +K1Zdv0P3dU7Cu1uxVWG+ZdvddGron/4Egv8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0RH9VmCWPcsPrNitBQ5880IrTspVYz6x+t+QgkXXVo=;
 b=KlDq7tcGl0G7AzbU+TFxMC/gnu/9U+sPI4mBk7YLuiF7GcPY1thFFT1m09E9bMDeKT
 li68UgLO2cZH2/SbYx81a/qrX/bdFQaWZomvI6joIEmly1Nkw8SewJ19RrO3n9FOlcci
 bcGWJMZ64L1kt1N6CNZMb1ENSWUN2n21gtaA8B1yU3nr7zDdehZglz3WiVYk421QDonN
 7AnijqFTwzuJJIJfNajClbZlQ8RPNLgRjvkReUsC9R2ofsObEGVp0vIONvlsSJp5KrOo
 H/iRs3FEiNDQKXYylK2kusRs6GBWLTx/qonQ7A3vVASMP+O7/WW9AGCS3puFjwCd/SBG
 zeOg==
X-Gm-Message-State: AOAM5332xeAN0YGeT4IHobqI/mFTwluA8WeAhOmq6G1Llg6QhV69D7Lf
 ep43B6hJl0lzXFb8g1uHyWPXCVcRBo8Nfd3e
X-Google-Smtp-Source: ABdhPJxVQSDBBH+JOJ6iw9JRCm3krcay4mKc5z8lbNOaSJh2Dua2zqZ6sNOxsJWrvefixythGQOpXA==
X-Received: by 2002:a2e:3518:0:b0:247:e0be:922f with SMTP id
 z24-20020a2e3518000000b00247e0be922fmr16859933ljz.303.1647338569766; 
 Tue, 15 Mar 2022 03:02:49 -0700 (PDT)
Received: from UNIT-808.lan ([188.187.49.32]) by smtp.gmail.com with ESMTPSA id
 y23-20020a2e95d7000000b00247e4e386aasm4339993ljh.121.2022.03.15.03.02.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:02:49 -0700 (PDT)
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
Subject: [PATCH v17 7/7] net/vmnet: update hmp-commands.hx
Date: Tue, 15 Mar 2022 13:02:39 +0300
Message-Id: <20220315100239.2914-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x236.google.com
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


