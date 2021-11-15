Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C34507E2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:09:16 +0100 (CET)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdbf-0007YN-4G
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNY-0003yt-6g
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNU-0007r5-MU
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOdFReUIemS5m4H/yoW/pvPIxTA1UiLo9iU1PEMmxSM=;
 b=NZRljWWFBh++CQ9gGITobhQhxmmGfAhZqgaxLum7OEdri040QN05+Jrgnz34R/aWvMjtj1
 JzJ79u+UwMhdOrbDNaj1hr4QIPSgDc1NcWhEn2GdmdZ8BQHo6lMezMH6xantJzibU0UJgv
 ItR1KBTuXpdDxvRC6AUSdRAtp2egZ7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-NLkjvHzKMqqIU-xogIdbtg-1; Mon, 15 Nov 2021 09:54:32 -0500
X-MC-Unique: NLkjvHzKMqqIU-xogIdbtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C600E1006AB6;
 Mon, 15 Nov 2021 14:54:31 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B801C19D9F;
 Mon, 15 Nov 2021 14:54:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/13] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Date: Mon, 15 Nov 2021 15:54:09 +0100
Message-Id: <20211115145409.176785-14-kwolf@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
References: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Reported by Coverity (CID 1465222).

Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
Cc: Damien Hedde <damien.hedde@greensocs.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211102163342.31162-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 softmmu/qdev-monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b5aaae4b8c..01ec420e61 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -593,8 +593,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
         if (prop) {
             dev->id = id;
         } else {
-            g_free(id);
             error_setg(errp, "Duplicate device ID '%s'", id);
+            g_free(id);
             return NULL;
         }
     } else {
-- 
2.31.1


