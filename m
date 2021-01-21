Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4882FDF7D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:39:25 +0100 (CET)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Psa-0003PB-8n
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PqS-0001Sv-9y
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PqO-0003gJ-85
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMc731tEFnsXko4U+QJ30gaYBXGIH8k21n+B4p1bOZc=;
 b=P8uDqUGoqN1is8Hm41zKLb787M9USIBMnfudhDDHwRNdA9EqY5UUglPAY9piymVCL89/te
 pYq50j5figHF9Gh7rS7E7S5ayY1j6vHSAax1h93n0t4f79skxfHgbQt9z+VnZHL64aph4X
 dnsYqXaszThgifCSKqe9qIR1eEyvi94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-vN09YQuwPLCyAEFFoZ9peQ-1; Wed, 20 Jan 2021 21:37:02 -0500
X-MC-Unique: vN09YQuwPLCyAEFFoZ9peQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACE45180A08A;
 Thu, 21 Jan 2021 02:37:01 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 753E95D764;
 Thu, 21 Jan 2021 02:37:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] qemu-nbd: Fix a memleak in qemu_nbd_client_list()
Date: Wed, 20 Jan 2021 20:36:45 -0600
Message-Id: <20210121023657.1186241-2-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex Chen <alex.chen@huawei.com>, Alberto Garcia <berto@igalia.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

When the qio_channel_socket_connect_sync() fails
we should goto 'out' label to free the 'sioc' instead of return.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <20201130123651.17543-1-alex.chen@huawei.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419d7..47587a709e6b 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -181,7 +181,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
     sioc = qio_channel_socket_new();
     if (qio_channel_socket_connect_sync(sioc, saddr, &err) < 0) {
         error_report_err(err);
-        return EXIT_FAILURE;
+        goto out;
     }
     rc = nbd_receive_export_list(QIO_CHANNEL(sioc), tls, hostname, &list,
                                  &err);
-- 
2.30.0


