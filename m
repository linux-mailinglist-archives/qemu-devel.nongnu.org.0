Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C6399F33
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:43:28 +0200 (CEST)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokox-0000Qf-Hi
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loknR-0006Yy-Th
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loknN-0007oO-V9
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622716909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WpsCzicMOuLZhhP0URMwZ3hPid1C5q1WEze+3bRcPQ=;
 b=P89T/9DlyB1raguHpzm901NB6tfSVtCDYlQhaZr+iPsgZkhy4QO8/xvWf/tioW9sky4Uut
 ev3CMNhvve9jPJGrTWEe7t0RZLnpURJmAoDAnpDyvvzyq8rfwN1gXh7XtLSWFVqZk0eies
 xa5Z4zjusSv5OmpInz/Ob0i0z2IcQRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-aSIwYG4DMxiBecGflqoYBw-1; Thu, 03 Jun 2021 06:41:46 -0400
X-MC-Unique: aSIwYG4DMxiBecGflqoYBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230F98018A7;
 Thu,  3 Jun 2021 10:41:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7501E5D9F0;
 Thu,  3 Jun 2021 10:41:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/hyperv/vmbus: Wire up vmstate_vmbus_dev
Date: Thu,  3 Jun 2021 12:41:38 +0200
Message-Id: <20210603104139.556512-2-thuth@redhat.com>
In-Reply-To: <20210603104139.556512-1-thuth@redhat.com>
References: <20210603104139.556512-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 Jon Doron <arilou@gmail.com>, Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vmstate_vmbus_dev structure is currently completely unused.
Looks like this has been forgotten to get wired up  in the
vmbus_dev_class_init() function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/hyperv/vmbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 984caf898d..2384103cb0 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2445,6 +2445,7 @@ static void vmbus_dev_class_init(ObjectClass *klass, void *data)
     kdev->realize = vmbus_dev_realize;
     kdev->unrealize = vmbus_dev_unrealize;
     kdev->reset = vmbus_dev_reset;
+    kdev->vmsd = &vmstate_vmbus_dev;
 }
 
 static Property vmbus_dev_instanceid =
-- 
2.27.0


