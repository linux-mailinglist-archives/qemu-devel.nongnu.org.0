Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB08698BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:26:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWlK-0006Io-9b; Thu, 16 Feb 2023 00:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlG-0006IQ-TW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlE-0008Ss-RF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJW3mqWgOGg6y2rioCOHh498Rm7Se1bPgF5dSmxc4co=;
 b=WirY5qxP1Pim5uTpFYX8rm2zp0VIIH+V5d/L4I/yDUANDDpQSkpdrmUGADFNk59A3hn3Qj
 i1uveIpQnzio7JhuLyWzHuZZNjdIY8z3pwjC9/jk/q74woMhVvr00NvKLUdOkmYFymXeoi
 5mJTbmMPPCSf2D3LnY4kT796aFJ8pi8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-oF6nxiS5NQyGrI3wQN7oaQ-1; Thu, 16 Feb 2023 00:24:46 -0500
X-MC-Unique: oF6nxiS5NQyGrI3wQN7oaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2124F281722D;
 Thu, 16 Feb 2023 05:24:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-253.pek2.redhat.com
 [10.72.12.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D35B492B0E;
 Thu, 16 Feb 2023 05:24:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Christian Svensson <blue@cmd.nu>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 06/10] net: Increase L2TPv3 buffer to fit jumboframes
Date: Thu, 16 Feb 2023 13:24:20 +0800
Message-Id: <20230216052424.50926-7-jasowang@redhat.com>
In-Reply-To: <20230216052424.50926-1-jasowang@redhat.com>
References: <20230216052424.50926-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christian Svensson <blue@cmd.nu>

Increase the allocated buffer size to fit larger packets.
Given that jumboframes can commonly be up to 9000 bytes the closest suitable
value seems to be 16 KiB.

Tested by running qemu towards a Linux L2TPv3 endpoint and pushing
jumboframe traffic through the interfaces.

Signed-off-by: Christian Svensson <blue@cmd.nu>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/l2tpv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 53b2d32..b5547cb 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -42,7 +42,7 @@
  */
 
 #define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
-#define BUFFER_SIZE 2048
+#define BUFFER_SIZE 16384
 #define IOVSIZE 2
 #define MAX_L2TPV3_MSGCNT 64
 #define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)
-- 
2.7.4


