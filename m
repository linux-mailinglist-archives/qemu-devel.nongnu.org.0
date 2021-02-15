Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A054E31BBE0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:08:14 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfTx-0002Em-EY
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNF-0005OZ-AY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfND-0000g5-2a
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbEsh+aZqTJoLF+nmSGGSz31gOUx3qYYW0pgtpMQuSw=;
 b=iPbhyPrzeb9nMq3oXo8ClSSN1W7XXs2SHit8YHcaw6cH2NmMqo7QNmLCGdC8JQ3UgtEoPq
 XEq+fV5MPTJeqfgRahLh/znhsYbKpqe6fxMMLZqETc7KVUtGK/2VDSWO8t7MkeFaQGBhik
 UfcId8V4PLag1HoYnSm5HWjU+4YN3Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-N7K9OlzhOECavQbUjqLAnw-1; Mon, 15 Feb 2021 10:01:11 -0500
X-MC-Unique: N7K9OlzhOECavQbUjqLAnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B16A19357B1;
 Mon, 15 Feb 2021 15:01:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544AE5C241;
 Mon, 15 Feb 2021 15:01:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/11] xen-block: fix reporting of discard feature
Date: Mon, 15 Feb 2021 16:00:54 +0100
Message-Id: <20210215150100.436555-6-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roger Pau Monne <roger.pau@citrix.com>

Linux blkfront expects both "discard-granularity" and
"discard-alignment" present on xenbus in order to properly enable the
feature, not exposing "discard-alignment" left some Linux blkfront
versions with a broken discard setup. This has also been addressed in
Linux with:

https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/T/#u

Fix QEMU to report a "discard-alignment" of 0, in order for it to work
with older Linux frontends.

Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Message-Id: <20210118153330.82324-1-roger.pau@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/xen-block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 0e7d66c2a7..a3b69e2709 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -253,6 +253,7 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
         xen_device_backend_printf(xendev, "feature-discard", "%u", 1);
         xen_device_backend_printf(xendev, "discard-granularity", "%u",
                                   conf->discard_granularity);
+        xen_device_backend_printf(xendev, "discard-alignment", "%u", 0);
     }
 
     xen_device_backend_printf(xendev, "feature-flush-cache", "%u", 1);
-- 
2.29.2


