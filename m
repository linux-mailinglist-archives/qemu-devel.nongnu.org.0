Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E543A17C2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:47:07 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzU2-00053y-OM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSa-0002Z3-JS
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSY-0005H7-Qo
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Yf3psi08pzq+0OCT0UglBlxErIHmD76X4oAw1SryyQ=;
 b=M/S5rZycEYgejvFyTlXxDXeWSgy39pwPsNfOoPb/x2GZRStJduQZ02BaysNJblbQldwpwE
 0olAV8Skcmi5yKuZJ9QeYZIgm6cKpZQ55c6aOXmcv67muqzEaHYLUEXrjWj9AFpezoGewB
 S1Q3VaW+6IVezyM5Y2tifSP30z3SXcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Jnn8V8TsNjmh1NxSiPE_SA-1; Wed, 09 Jun 2021 10:45:32 -0400
X-MC-Unique: Jnn8V8TsNjmh1NxSiPE_SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 252C1100CFBB;
 Wed,  9 Jun 2021 14:45:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5D53100EB3E;
 Wed,  9 Jun 2021 14:45:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 4/9] io/net-listener: Call the notifier during finalize
Date: Wed,  9 Jun 2021 15:45:07 +0100
Message-Id: <20210609144512.211746-5-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Call the notifier during finalize; it's currently only called
if we change it, which is not the intent.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210421112834.107651-3-dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/net-listener.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io/net-listener.c b/io/net-listener.c
index 46c2643d00..1c984d69c6 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -292,6 +292,9 @@ static void qio_net_listener_finalize(Object *obj)
     QIONetListener *listener = QIO_NET_LISTENER(obj);
     size_t i;
 
+    if (listener->io_notify) {
+        listener->io_notify(listener->io_data);
+    }
     qio_net_listener_disconnect(listener);
 
     for (i = 0; i < listener->nsioc; i++) {
-- 
2.31.1


