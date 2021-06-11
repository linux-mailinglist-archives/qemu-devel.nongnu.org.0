Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E153A3BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:09:08 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraLr-0003BA-8E
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDx-000449-Ti
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDw-0002EX-36
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9Hx9o+jynN5rJRjXtek6QTT0rR1HclsIzHRSczYNBw=;
 b=eifEilmJNAqXU6DHLWjGw5kHQi62P9iFogHRO1At0ky1Y0PVISDaIoc71ORFFf6+wq6kaf
 FYJgOSNJBWhs14iIjiBUVT0ehT2tpqryJMrcrnpQRYAZNKdDREaNK++0Ok7NecDy6FTGne
 OcWPjB2xFgd3Qp+iLNeHOFuWvpqKMRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-YnumHObWOl-nNcKbcz9kOw-1; Fri, 11 Jun 2021 02:00:51 -0400
X-MC-Unique: YnumHObWOl-nNcKbcz9kOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BCB71922965;
 Fri, 11 Jun 2021 06:00:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7FE60917;
 Fri, 11 Jun 2021 06:00:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/12] Optimize the function of filter_send
Date: Fri, 11 Jun 2021 14:00:20 +0800
Message-Id: <20210611060024.46763-9-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>,
 Lukas Straub <lukasstraub2@web.de>, Jason Wang <jasowang@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The iov_size has been calculated in filter_send(). we can directly
return the size.In this way, this is no need to repeat calculations
in filter_redirector_receive_iov();

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/filter-mirror.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f8e6500..f20240c 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -88,7 +88,7 @@ static int filter_send(MirrorState *s,
         goto err;
     }
 
-    return 0;
+    return size;
 
 err:
     return ret < 0 ? ret : -EIO;
@@ -159,7 +159,7 @@ static ssize_t filter_mirror_receive_iov(NetFilterState *nf,
     int ret;
 
     ret = filter_send(s, iov, iovcnt);
-    if (ret) {
+    if (ret < 0) {
         error_report("filter mirror send failed(%s)", strerror(-ret));
     }
 
@@ -182,10 +182,10 @@ static ssize_t filter_redirector_receive_iov(NetFilterState *nf,
 
     if (qemu_chr_fe_backend_connected(&s->chr_out)) {
         ret = filter_send(s, iov, iovcnt);
-        if (ret) {
+        if (ret < 0) {
             error_report("filter redirector send failed(%s)", strerror(-ret));
         }
-        return iov_size(iov, iovcnt);
+        return ret;
     } else {
         return 0;
     }
-- 
2.7.4


