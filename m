Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAA3C1953
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:41:06 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YxO-00037v-0C
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Yq9-00068q-L3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Yq8-00025V-4j
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx+EntwNoDE0rSe5POzw6g2WXKu8L0NTv1fe1d4IzNY=;
 b=NI4B3dLrjZQnPEzKE0quuNwu/mPWDloTM0VaqUDpLLJ+OR5Hng8NVjThz3HHEtwqfeES2c
 GuHx0enEQPd0oGQr/V+4oFxjqspC9/pxTiBH19B2o2K3X79FFrNDzdMx90mcFYOWTjjoZ7
 j5Wfk6/QaI+upVwRVTh6AV5r9TkaSm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-7YG6ilIqO9WqFeGkI7rXiA-1; Thu, 08 Jul 2021 14:33:34 -0400
X-MC-Unique: 7YG6ilIqO9WqFeGkI7rXiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5552B100D0DF
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:33:17 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D404C17567;
 Thu,  8 Jul 2021 18:33:10 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] contrib: qemu-guest-agent.service: Don't ignore failure
Date: Thu,  8 Jul 2021 14:32:01 -0400
Message-Id: <cd3ccf4837fb7220fde9d0d4fb683c0fed1bb792.1625769000.git.crobinso@redhat.com>
In-Reply-To: <cover.1625769000.git.crobinso@redhat.com>
References: <cover.1625769000.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RHEL7+ and Fedora don't ignore errors, nor Arch. Debian and OpenSUSE
do but I think that's because their service files are based on
this / what Fedora used to ship.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 contrib/systemd/qemu-guest-agent.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/systemd/qemu-guest-agent.service b/contrib/systemd/qemu-guest-agent.service
index 7e1c50577b..505636a5ba 100644
--- a/contrib/systemd/qemu-guest-agent.service
+++ b/contrib/systemd/qemu-guest-agent.service
@@ -5,7 +5,7 @@ BindsTo=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 After=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 
 [Service]
-ExecStart=-/usr/bin/qemu-ga
+ExecStart=/usr/bin/qemu-ga
 Restart=always
 RestartSec=0
 
-- 
2.31.1


