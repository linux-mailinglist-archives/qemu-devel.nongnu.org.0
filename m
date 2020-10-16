Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64228FC9F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 05:11:35 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTG9W-0007xj-6y
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 23:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kTG7a-0006oa-Ra
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 23:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kTG7U-0002vH-Va
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 23:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602817765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb5iC4s5b9MYo8InFPEDp1QyjX8H6RWFPgdXrq01d5k=;
 b=J35Bwck0y2pssEPeltsFMsCSQWDe6Se7zeKLaBcZ4q4xctNSoGqBGoQiHI5fjtqQnBaxP1
 fYZzrORN/TvPBFJd55EX1GZdp9zpVM0FfF+hWRRBQYCzwRl54/2riM+Lj11u5Grw2xWIVZ
 yRSJdPQneWqirPYanBa6vxEpq3zTvPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-_j9pL1EPMbmWkEmrn-9JWg-1; Thu, 15 Oct 2020 23:09:24 -0400
X-MC-Unique: _j9pL1EPMbmWkEmrn-9JWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 538EE57054;
 Fri, 16 Oct 2020 03:09:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-176.pek2.redhat.com [10.72.13.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72ED26EF68;
 Fri, 16 Oct 2020 03:09:21 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] net: Add vhost-vdpa in show_netdevs()
Date: Fri, 16 Oct 2020 11:09:09 +0800
Message-Id: <20201016030909.9522-2-lulu@redhat.com>
In-Reply-To: <20201016030909.9522-1-lulu@redhat.com>
References: <20201016030909.9522-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the bug that while Check qemu supported netdev,
there is no vhost-vdpa

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 net/net.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/net.c b/net/net.c
index 7a2a0fb5ac..794c652282 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1049,6 +1049,9 @@ static void show_netdevs(void)
 #endif
 #ifdef CONFIG_POSIX
         "vhost-user",
+#endif
+#ifdef CONFIG_VHOST_VDPA
+        "vhost-vdpa",
 #endif
     };
 
-- 
2.21.3


