Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8FE6F5441
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:15:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8a0-00039A-SK; Wed, 03 May 2023 05:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zl-00030i-I9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zj-00073V-9s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qh9Z7SDMxmfTTyiqO7zQepPLJ7V+DQzGPZswLsafXg=;
 b=Y8CTusgC8C2pHwBEMmY+y44e9GiG/ijpZyQtOZAdZ0LHCJvgAEeROMO2iJ+1dsei6NeRNL
 MuagzdFM3oKihokxyWQRaJzA03Sy1UkH8K/anUGE9l9o2ajYCA4D2pFmbAq2yawd0qqho1
 78pMGJfsfk337Gyg1OlzDbSTEEdqYDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-yiMj2dJAMMCFTESWMiJUPQ-1; Wed, 03 May 2023 05:13:47 -0400
X-MC-Unique: yiMj2dJAMMCFTESWMiJUPQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EC4285530C
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:13:47 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D6FD492C13;
 Wed,  3 May 2023 09:13:45 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 2/7] qapi: support iommufd in vdpa
Date: Wed,  3 May 2023 17:13:32 +0800
Message-Id: <20230503091337.2130631-3-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a new option for iommufd, The usage is
....
-object iommufd,id=iommufd0 \
-device virtio-net-pci,netdev=vhost-vdpa1,disable-legacy=on,disable-modern=off\
-netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=vhost-vdpa1,iommufd=iommufd0\
...

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 qapi/net.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi/net.json b/qapi/net.json
index 522ac582ed..fffaf9bb5e 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -461,6 +461,7 @@
     '*vhostdev':     'str',
     '*vhostfd':      'str',
     '*queues':       'int',
+    '*iommufd':       'str',
     '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
 
 ##
-- 
2.34.3


