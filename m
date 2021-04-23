Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B84369631
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:32:58 +0200 (CEST)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxnd-0000kL-Lf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlz-0007qO-CD
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlw-0000fv-OZ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619191872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO6aazNqb/ZxXd/OjC9yClw9jDHboKlu0snpTmGVkpg=;
 b=KwXpx1Ck9h8gsI7leOXsOfHumKIbgQALtGLl95dvyF9yQUJacm+dsAZsoIWsKajrfSN0ML
 Qa7iXVGe95yrZb1CUGKO4nQ5aZ8ssfPi9g7JbWzlTB4WWrKWkFuwAYFfmW2Ow769hqqq5V
 W53Yc3ooDUynk0LLBHUhxSq/VUaCT6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Bj957VKKOMizqZAcb-gzzw-1; Fri, 23 Apr 2021 11:31:08 -0400
X-MC-Unique: Bj957VKKOMizqZAcb-gzzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7717343A8;
 Fri, 23 Apr 2021 15:31:07 +0000 (UTC)
Received: from epycfail.redhat.com (unknown [10.36.110.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 478476A83C;
 Fri, 23 Apr 2021 15:31:06 +0000 (UTC)
From: Stefano Brivio <sbrivio@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] net: Don't ignore EINVAL on netdev socket connection
Date: Fri, 23 Apr 2021 17:30:45 +0200
Message-Id: <a6d475147682de1fe3b14eb325f4247e013e8440.1619190878.git.sbrivio@redhat.com>
In-Reply-To: <cover.1619190878.git.sbrivio@redhat.com>
References: <cover.1619190878.git.sbrivio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/socket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index aadd11dae2b3..d3293ac12e82 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -644,8 +644,7 @@ static int net_socket_connect_init(NetClientState *peer,
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
             } else if (errno == EINPROGRESS ||
-                       errno == EALREADY ||
-                       errno == EINVAL) {
+                       errno == EALREADY) {
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-- 
2.29.2


