Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72F4B3064
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:26:18 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeMr-0001py-SX
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCL-0005mz-6F
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:25 -0500
Received: from [2607:f8b0:4864:20::1031] (port=54101
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCI-00035L-UQ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:24 -0500
Received: by mail-pj1-x1031.google.com with SMTP id qe15so9258137pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RQYujVPZDKPLUZNsz6ZhPK4h1RfDBfdVrDdj4myITg=;
 b=lzsBKDSh7V3uEUS09VDrb56FtUE79Im22SBVSkMLDaMQ4QX0aeip6UokFEXDw/XSUU
 NwYnBnZiMxswjL/OzvhWha5WVoHoHaMvgw9EMJJJFlNu0ZoHq8Lw2JcG7JEEiDYTI9FF
 COWQXDOzyRreNWLTNMBkJIMTEPQbQ+tjvYbyXU710OVlYbbMFis48qrQ9iBBUxijaR3q
 Cy7QcxmLMWOJnNTwjwFTce1cUb6IqcOiD4oTXt2ki2xAr7vz2GyjfA5PVKOvABY5UgRI
 vk2CZ/j6nG5Kq5eipfUBnzPh5462KIqb7DsoGqZ9RwSPYEyUXpaSUOXriGvQWZj/Vtdx
 fAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RQYujVPZDKPLUZNsz6ZhPK4h1RfDBfdVrDdj4myITg=;
 b=2tD7h5ElJY8J4PFAvy3qq2wTtOq7JPgoUTZ8Tx0+wzUkL58S8yjPR6A2TdJ5OHr8x6
 BmAoC8tw93keaVfZsLrcgw1ymxhXBgT2cgcwIZnPvQtmHbQghwvWfbBS7zqOORSJxCe/
 VaGvcpchvcB2FfllZMI4gkEV0NoF8XdfM0owQQDLnaosmfBDT/299gRPZpLp1rfj8hpD
 jGEZ/mu/pdTKfcpLBiJTUSfCLGIqmP7mQ/mgjYGuCSw4OwIZ/06BiIrl6lJ7G1ngCvlS
 CIc6XoHg5GGafBTpcAsB/ViST3WwQS6MtV2b7TTnYHLzV7cOJ/hJqyofHlb628+fNSF2
 llqA==
X-Gm-Message-State: AOAM530tS8TzqKWggWRbUcxQ1Zm+IJhcv6Vmo9W/Q9DSnBgHJEJri5l+
 Jlna+MBFRHx6T+5x2xyhmJZxuxv7Qz4=
X-Google-Smtp-Source: ABdhPJwea93P9knf7Dlb8MMuuAd0E7GLZoHwPAsHoePMLivWlRqXQiW/yhcQOaL8hQgMIraHJAJLdQ==
X-Received: by 2002:a17:902:7609:: with SMTP id
 k9mr3430022pll.143.1644617721566; 
 Fri, 11 Feb 2022 14:15:21 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:21 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 08/25] virtio-snd: Add code for get config function
Date: Sat, 12 Feb 2022 03:43:02 +0530
Message-Id: <20220211221319.193404-9-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index ae438aa7ec..afa38adee7 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -41,6 +41,15 @@
 
 static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
 {
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
+    virtio_snd_config sndcfg;
+
+    memset(&sndcfg, 0, sizeof(virtio_snd_config));
+    stl_le_p(&(sndcfg.jacks), s->snd_conf.jacks);
+    stl_le_p(&(sndcfg.streams), s->snd_conf.streams);
+    stl_le_p(&(sndcfg.chmaps), s->snd_conf.chmaps);
+
+    memcpy(config, &sndcfg, sizeof(virtio_snd_config));
 }
 
 static void virtio_snd_set_config(VirtIODevice *vdev, const uint8_t *config)
-- 
2.31.1


