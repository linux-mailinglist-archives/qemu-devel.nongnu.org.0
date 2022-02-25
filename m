Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F14C4CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:45:48 +0100 (CET)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNef6-0004cs-1a
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqc-0002eu-Cj
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:38 -0500
Received: from [2a00:1450:4864:20::12f] (port=39764
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqY-00048p-8n
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:38 -0500
Received: by mail-lf1-x12f.google.com with SMTP id j7so10432657lfu.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 08:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AKFcugkOOM4INBFZwwvV6ls8yH3+XJfod5pstppv9o=;
 b=ICDGKtgvKlEP0/+RjOeM+6sDPxp4kJGe9148IBJPmkijQ4bXPgQJ2NArFVd4fatndG
 TJONTIzeWLwzTxW8apPodAJXFLMEq5VCaXdTPCmhX0fbzBqK5bFOj0qx0+/xZbBnOjp+
 CCJdi0tm1trRddPPJryqP+471/uFJH0Wkl7uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AKFcugkOOM4INBFZwwvV6ls8yH3+XJfod5pstppv9o=;
 b=jDmB2ParQJtn5/VZAAz/fqolRUxQXlK4sTIQGF2VEL73Qo6EVVbVGAXuFhHd88WOOu
 +RfYemhCPyrxpZcOSQXmuE9oKV0K5N0OOs6AhLnphkiOR6ATw0MILXnJS6YjfIsJjIjC
 R7she1XtYvRkDcgLSS6uE2/PRiCz60oVjxrROTjpc0Y80x46lk5CiyeN0dk8E8Mcbfv/
 nGpgHErO14SSY9QD+/h1NYFkb7GalXAvsVkcJE94MnnsumG219ANRWUcaDll669EHxvA
 2uPUE2IDvsf+wN77ktGwIhkR8IOnfQe/0D8RcG0NfvHGzVbNcDXm3jWgcD2hmYytiTtz
 wwLQ==
X-Gm-Message-State: AOAM532LgyAeyhFMxxc0xikS+tuBRsJBIJnQq2seC+XdRxae8SkKjc8m
 KjqzBbxZvfbxE52RLicTY60SyNMIUWevow==
X-Google-Smtp-Source: ABdhPJyzECa7YOzDDwxEEPWuKW08mB3YuRze1mRxi0x8TDXVPQIrVhYwiBtXFlYo9XmetCs+1QbV2A==
X-Received: by 2002:ac2:5e68:0:b0:442:a748:af58 with SMTP id
 a8-20020ac25e68000000b00442a748af58mr5470188lfr.440.1645808012338; 
 Fri, 25 Feb 2022 08:53:32 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a2e834b000000b00246308690e2sm309683ljh.85.2022.02.25.08.53.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:53:31 -0800 (PST)
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
Subject: [PATCH v14 7/8] net/vmnet: update hmp-commands.hx
Date: Fri, 25 Feb 2022 19:52:37 +0300
Message-Id: <20220225165238.63646-8-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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
index 70a9136ac2..406ac4bba8 100644
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


