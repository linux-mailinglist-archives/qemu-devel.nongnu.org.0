Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EE2128FC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:07:15 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr1k2-00031m-49
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1U0-0000fB-Vi
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58932
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Tf-0004tS-PN
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoxaS8HCvhbtSj+AnfqvqebShw8EsKZihvgQYUOkUtk=;
 b=OMzMDDM+IHZ8bx9NCEXZFpt18Fbre3fkVuOsJBe5rFBtOE5a6Yi1MrJ0DgrrOZ6yDWAeUm
 WzaZ/kM/z/lCzEW3FdW6QMxHvM+J0fVC8+Dyv/yPOHat/lAl8W5/3hcjuifBy64imUWjRa
 WuYxUwyO6FTSQITb+kh7acAjC9p+Vyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-NgKlROc8PT-7avd4nT6zdw-1; Thu, 02 Jul 2020 11:50:11 -0400
X-MC-Unique: NgKlROc8PT-7avd4nT6zdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C3CB8015CE;
 Thu,  2 Jul 2020 15:50:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8987C5C6DE;
 Thu,  2 Jul 2020 15:50:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 16C031135237; Thu,  2 Jul 2020 17:50:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/44] qdev: Make functions taking Error ** return bool,
 not void
Date: Thu,  2 Jul 2020 17:49:47 +0200
Message-Id: <20200702155000.3455325-32-armbru@redhat.com>
In-Reply-To: <20200702155000.3455325-1-armbru@redhat.com>
References: <20200702155000.3455325-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See recent commit "error: Document Error API usage rules" for
rationale.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/hw/qdev-properties.h     | 4 ++--
 hw/core/qdev-properties-system.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 49c6cd2460..f12ab9e6bc 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -236,8 +236,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 /*
  * Set properties between creation and realization.
  */
-void qdev_prop_set_drive_err(DeviceState *dev, const char *name,
-                         BlockBackend *value, Error **errp);
+bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
+                             BlockBackend *value, Error **errp);
 
 /*
  * Set properties between creation and realization.
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 810831b1df..7d2387f22c 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -421,7 +421,7 @@ const PropertyInfo qdev_prop_audiodev = {
     .set = set_audiodev,
 };
 
-void qdev_prop_set_drive_err(DeviceState *dev, const char *name,
+bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
                              BlockBackend *value, Error **errp)
 {
     const char *ref = "";
@@ -436,7 +436,7 @@ void qdev_prop_set_drive_err(DeviceState *dev, const char *name,
         }
     }
 
-    object_property_set_str(OBJECT(dev), name, ref, errp);
+    return object_property_set_str(OBJECT(dev), name, ref, errp);
 }
 
 void qdev_prop_set_drive(DeviceState *dev, const char *name,
-- 
2.26.2


