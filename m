Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090022D81DF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:21:35 +0100 (CET)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqn8-0003Io-0J
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYB-0001lA-IB
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYA-0006J0-0b
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjbAAGsu3eif6zWUP3OWVxWI0koAqnB2AtUWbzN1whY=;
 b=N7Z5PoAzp+fyY41VzVKRbb+7TRso5dBeSaq9E3RZTC1w+sL1E5xlv7oMBjO/o3jO1AuqBz
 3OTomZm5H7XO1peHbmx0TEzvBtVJFKEHsIs+seYNXfrgcYbDVAk1fsg/P43SRWXKhKOU2A
 wbftCdX5xMTn64w6cNz9SDMFyETKSTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-D8KVOaMNNxmCQra5LRWZow-1; Fri, 11 Dec 2020 17:06:03 -0500
X-MC-Unique: D8KVOaMNNxmCQra5LRWZow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C35FB800D53;
 Fri, 11 Dec 2020 22:06:02 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 187E41002391;
 Fri, 11 Dec 2020 22:05:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/32] qdev: Don't use dev->id on set_size32() error message
Date: Fri, 11 Dec 2020 17:05:03 -0500
Message-Id: <20201211220529.2290218-7-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All other qdev property error messages use "<type>.<property>"
instead of "<id>.<property>".  Change set_size32() for consistency,
and to make the code not specific to TYPE_DEVICE.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 67ae19df05..daf844c2d3 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -542,7 +542,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
         error_setg(errp,
                    "Property %s.%s doesn't take value %" PRIu64
                    " (maximum: %u)",
-                   dev->id ? : "", name, value, UINT32_MAX);
+                   object_get_typename(obj), name, value, UINT32_MAX);
         return;
     }
 
-- 
2.28.0


