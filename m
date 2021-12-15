Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A19475B30
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:57:55 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVj9-0000fG-2F
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrj-0000zX-BH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrZ-0001Sm-3E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKJvwrbQwRZMbI1XBsNDH7ArYF32UukWB8lQX6aZC5A=;
 b=c/VJPp8A3DJ+C2xlg3sGypmtMSQLrfU9Qr8ne72pvRxmcCZ6sJUr9m/Qmjdw1N+74Isbn3
 j8+ZkG9kBPUdL5IthXD+xQEdUvHZ5ccnanXFt7MOcKF+VM6TWJHyfLjBuTTROwduOAPzDN
 yupm/g32yXuQSVj+46VsGW7Uv/1lHvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-i7u6ubpJPpiVkGyVsnvJ1g-1; Wed, 15 Dec 2021 09:02:26 -0500
X-MC-Unique: i7u6ubpJPpiVkGyVsnvJ1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9081E100C697;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 609055E482;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DABB11384A5; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] hw/arm/mcimx6ul-evk: Replace drive_get_next() by
 drive_get()
Date: Wed, 15 Dec 2021 15:02:15 +0100
Message-Id: <20211215140222.769652-7-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "mcimx6ul-evk" connects backends with drive_get_next() in a
counting loop.  Change it to use drive_get() directly.  This makes the
unit numbers explicit in the code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-7-armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mcimx6ul-evk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 77fae874b1..28b4886f48 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -52,7 +52,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.31.1


