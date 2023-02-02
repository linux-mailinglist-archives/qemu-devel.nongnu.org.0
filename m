Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB46875D5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 07:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSyq-0005oH-Nj; Thu, 02 Feb 2023 01:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSyo-0005mX-LS
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:21:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSyn-0006eT-5e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675318912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJW3mqWgOGg6y2rioCOHh498Rm7Se1bPgF5dSmxc4co=;
 b=VkT9avosz/5URPopeJbLfhAecx0I4wGjUIZJ4K0VXwyA2fUrd7dD/Y3wfz8u80FZcS2xSr
 3BKt9DpdySb58LOwrdEld6TQY0BG/NbIQBPSV+cfPosq8j+Dbc/ZweYi+UqolZ9KeDcqdU
 tjIPFh8bsrO0JDTzMCYccASGIi76WdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-ZyUCP_WZOa-2Rg7npPXRPA-1; Thu, 02 Feb 2023 01:21:51 -0500
X-MC-Unique: ZyUCP_WZOa-2Rg7npPXRPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF31C101A52E;
 Thu,  2 Feb 2023 06:21:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-0.pek2.redhat.com [10.72.14.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D85404BEC0;
 Thu,  2 Feb 2023 06:21:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Christian Svensson <blue@cmd.nu>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 06/11] net: Increase L2TPv3 buffer to fit jumboframes
Date: Thu,  2 Feb 2023 14:21:21 +0800
Message-Id: <20230202062126.67550-7-jasowang@redhat.com>
In-Reply-To: <20230202062126.67550-1-jasowang@redhat.com>
References: <20230202062126.67550-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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


