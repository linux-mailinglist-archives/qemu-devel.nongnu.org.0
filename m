Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFE2948CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 09:20:59 +0200 (CEST)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV8Qc-0006Mm-LX
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 03:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV8LN-0001rR-1I
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 03:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV8LJ-0005gx-Eo
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 03:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603264528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqzFgVIyvY2SXetIJb9uisHev+QHSk1bJrGsA1GUim8=;
 b=JDaOIFUmIBpMPeS+huhyXdwGE6VcLJ8SCB12hPMeR11wfxa4z2qT1F0wF/J2vZz/Ylub8J
 iMEbUo3TYlDBYdM5d8g9YU9obRRQ6d+Dqp03IPkNXYKgZzcxvOYNGMojdQvrV+h6FiwWTc
 woD3hFvRH5kk8YAZ36MHuNLQYXfbNhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-vuWmYNGUOs-LzXCOB9_YRw-1; Wed, 21 Oct 2020 03:15:26 -0400
X-MC-Unique: vuWmYNGUOs-LzXCOB9_YRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA9AB879521;
 Wed, 21 Oct 2020 07:15:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB4C075129;
 Wed, 21 Oct 2020 07:15:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25A4411275C0; Wed, 21 Oct 2020 09:15:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qga-win: Fix guest-get-devices error API violations
Date: Wed, 21 Oct 2020 09:15:19 +0200
Message-Id: <20201021071520.2168877-4-armbru@redhat.com>
In-Reply-To: <20201021071520.2168877-1-armbru@redhat.com>
References: <20201021071520.2168877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: marcandre.lureau@redhat.com, tgolembi@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

qmp_guest_get_devices() is wrong that way: it calls error_setg() in a
loop.

If no iteration fails, the function returns a value and sets no error.
Okay.

If exactly one iteration fails, the function returns a value and sets
an error.  Wrong.

If multiple iterations fail, the function trips error_setv()'s
assertion.

Fix it to return immediately on error.

Perhaps the failure to convert the driver version to UTF-8 should not
be an error.  We could simply not report the botched version string
instead.

Drop a superfluous continue while there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-win32.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index b01616a992..1efe3ba076 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2385,7 +2385,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
         device->driver_name = g_utf16_to_utf8(name, -1, NULL, NULL, NULL);
         if (device->driver_name == NULL) {
             error_setg(errp, "conversion to utf8 failed (driver name)");
-            continue;
+            return NULL;
         }
         slog("querying device: %s", device->driver_name);
         hw_ids = ga_get_hardware_ids(dev_info_data.DevInst);
@@ -2428,7 +2428,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             NULL, NULL);
         if (device->driver_version == NULL) {
             error_setg(errp, "conversion to utf8 failed (driver version)");
-            continue;
+            return NULL;
         }
         device->has_driver_version = true;
 
@@ -2452,7 +2452,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             cur_item->next = item;
             cur_item = item;
         }
-        continue;
     }
 
     if (dev_info != INVALID_HANDLE_VALUE) {
-- 
2.26.2


