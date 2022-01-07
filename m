Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5562487622
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:03:33 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n1w-0004xJ-Nk
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtQ-0003hU-9x; Fri, 07 Jan 2022 05:54:44 -0500
Received: from [2a00:1450:4864:20::32c] (port=54087
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtK-0008Mg-7m; Fri, 07 Jan 2022 05:54:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l4so3636032wmq.3;
 Fri, 07 Jan 2022 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRt1ZQeTh5X10hpoQU2/jHbFxikau/BmnLWyXQMXPG8=;
 b=breiJyJCjJdM8/ZoQxm/OE+LnLAIyCDERWzPDsbVHSjr5glfhB5jYXVy0k4q1BgYvZ
 qthNPf3Iiv7+J1ww8PxmZCTr/I1UhMqgE919Uqwr4mSPiWDuTBgB5Rla73NmXvE7tw7G
 Yb8fnBd3zO1ttumHDvRkvCc4tHdbc5Kv4HWA4PaHu+wLAK003NxQav7B4CcaFR9FImR3
 Dgcgbjep9gcbjc8vMiMWVGNA7ArlNVDpTiqA/LRTCDvAEk9hBSlez2baZETEujHFgi0X
 fa7ueM3BahFRTH5K/T03Bs/69vhbVq1riLwaw1C+ZseQiF3DqUWvKcmnI9c+hCtXHEVT
 jdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pRt1ZQeTh5X10hpoQU2/jHbFxikau/BmnLWyXQMXPG8=;
 b=GYX9XxDTpPxdtBZcAf9l4jleoxCSm4shmdHcb0g0SyWQHAhsrtuaPNS7SPZbblAHeB
 ic9Lv3nnDHG84IX9262Rd0/Jz6UAs1Qn0wMSGXmHkze77DAD5ZQxcYyrGt1+XW0IjdCr
 y3jS5Q2Z6tX2wi72Iws0C3IwFDjoXDwmnH5rSNYalRrKR+Y9BqKCcjvHzQ9KzudHy84F
 L9ew8L0dAlHmqLuxlcJWjtZlZB3J8jIaXKf9FAnHr/yb1L29l5pwb2RCOO/FMEsNlcGQ
 In56nJm9CkR3/lD11VcaP1AZQTS0zNXCBtSommUizdFua+HTfBIrBBPZktneP4iS6cje
 ED4g==
X-Gm-Message-State: AOAM5303spsyMDpSn0fK/8xRMiUGUPXFt134pvJNcpgGaZNpLm0J9vmm
 rSH/1bEYlodqLMhPhlCS7S0xFYJ4D8hRwQ==
X-Google-Smtp-Source: ABdhPJwTMasOAzaXAAtmqkCaQl73LrHm3bplXAks+gJJk8WCU54X+Gu5yiCfkR6yWkaHqoEKstZ8bA==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr10763937wmj.162.1641552876396; 
 Fri, 07 Jan 2022 02:54:36 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id 1sm5056239wry.33.2022.01.07.02.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:54:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
Date: Fri,  7 Jan 2022 11:54:20 +0100
Message-Id: <20220107105420.395011-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107105420.395011-1-f4bug@amsat.org>
References: <20220107105420.395011-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building QEMU with --disable-vhost-user and using introspection,
query-qmp-schema lists vhost-user-blk even though it's not actually
available:

  { "execute": "query-qmp-schema" }
  {
      "return": [
          ...
          {
              "name": "312",
              "members": [
                  {
                      "name": "nbd"
                  },
                  {
                      "name": "vhost-user-blk"
                  }
              ],
              "meta-type": "enum",
              "values": [
                  "nbd",
                  "vhost-user-blk"
              ]
          },

Restrict vhost-user-blk in BlockExportType when
CONFIG_VHOST_USER_BLK_SERVER is disabled, so it
doesn't end listed by query-qmp-schema.

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reword + restrict BlockExportOptions union (armbru)
---
 qapi/block-export.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index c1b92ce1c1c..f9ce79a974b 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -277,7 +277,8 @@
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
-  'data': [ 'nbd', 'vhost-user-blk',
+  'data': [ 'nbd',
+            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
@@ -319,7 +320,8 @@
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd',
-      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
+      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
+                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
       'fuse': { 'type': 'BlockExportOptionsFuse',
                 'if': 'CONFIG_FUSE' }
    } }
-- 
2.33.1


