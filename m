Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DC2AF232
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:31:22 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqDZ-00087M-Um
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvF-0007HH-Gr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvC-0002FA-IL
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=jnfLh5kQTTjmxj8uOYjWUwt97OU41Ppq7xx2ZfyODaw=;
 b=G65Q/1kpji8Fe6Di4DxuAviTTMSqksK9nZqkPE2b181nfnvVvWgytwVhbaOheNlVRAtzps
 KV5t3ca8awSUfvR3IqHqYwemH1lmQjycu9SlJmzyaUvYtNpQgp5O5/Hqz7EPG6oj7+YO+D
 8ro/aB4LZjoy/lkodG+WzLDRvlwkMps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-jPysZ_JdO3qWMXfT-hGiug-1; Wed, 11 Nov 2020 08:12:17 -0500
X-MC-Unique: jPysZ_JdO3qWMXfT-hGiug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B21BA1009446;
 Wed, 11 Nov 2020 13:12:16 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1725A7513A;
 Wed, 11 Nov 2020 13:12:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/17] net/l2tpv3: Remove redundant check in net_init_l2tpv3()
Date: Wed, 11 Nov 2020 21:11:37 +0800
Message-Id: <1605100301-11317-14-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: AlexChen <alex.chen@huawei.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

The result has been checked to be NULL before, it cannot be NULL here,
so the check is redundant. Remove it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/l2tpv3.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 55fea17..e4d4218 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -655,9 +655,8 @@ int net_init_l2tpv3(const Netdev *netdev,
         error_setg(errp, "could not bind socket err=%i", errno);
         goto outerr;
     }
-    if (result) {
-        freeaddrinfo(result);
-    }
+
+    freeaddrinfo(result);
 
     memset(&hints, 0, sizeof(hints));
 
@@ -686,9 +685,7 @@ int net_init_l2tpv3(const Netdev *netdev,
     memcpy(s->dgram_dst, result->ai_addr, result->ai_addrlen);
     s->dst_size = result->ai_addrlen;
 
-    if (result) {
-        freeaddrinfo(result);
-    }
+    freeaddrinfo(result);
 
     if (l2tpv3->has_counter && l2tpv3->counter) {
         s->has_counter = true;
-- 
2.7.4


