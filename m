Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B32C1BC1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:51:13 +0100 (CET)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khOQC-00059b-NU
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJw-0008Kb-0K
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJu-000295-EU
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=pMeXkB1AB/xl4g4gJSc84NMewiDMIKOU1AYZLOAF3V4=;
 b=hlJU9eLKVnfHvwlQZGesEbhpLXl4uWX+cixS8j0Xib3SCKwetFvtL8dYgaKR2kBy3AyIex
 hdi7t3czdgmo2P7Zf5ZmKr7NOg3cRbkz1rlH3wBsVQ6NvzuDOth76Oc8oO8fHhp/Hk5EVb
 f/i6xMnyBDnJUC5zJ9GezC2P+HAtH7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-BR_7kRyAOjqxHdSKgdg2tQ-1; Mon, 23 Nov 2020 21:44:37 -0500
X-MC-Unique: BR_7kRyAOjqxHdSKgdg2tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80674805BE0;
 Tue, 24 Nov 2020 02:44:35 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA7B5D9CA;
 Tue, 24 Nov 2020 02:44:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 4/5] tap: fix a memory leak
Date: Tue, 24 Nov 2020 10:44:22 +0800
Message-Id: <1606185863-25996-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
References: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: yuanjungong <ruc_gongyuanjun@163.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: yuanjungong <ruc_gongyuanjun@163.com>

Close fd before returning.

Buglink: https://bugs.launchpad.net/qemu/+bug/1904486

Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/tap.c b/net/tap.c
index c46ff66..fe95fa7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                              name, fd);
+            close(fd);
             return -1;
         }
 
@@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
                          vhostfdname, vnet_hdr, fd, &err);
         if (err) {
             error_propagate(errp, err);
+            close(fd);
             return -1;
         }
     } else if (tap->has_fds) {
-- 
2.7.4


