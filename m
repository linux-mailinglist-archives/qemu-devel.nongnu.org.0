Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C7E8798
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 12:56:42 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPQ77-0003S9-Gj
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 07:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iPQ1K-0005pt-5d
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iPQ1I-0002X1-CT
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:50:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20209
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iPQ1I-0002Wv-7y
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572349839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIFenYz29oEtAdF1W7uAide00ihg91ylC//YeKXag/8=;
 b=PSRQwdzXBKqoJT/rgsXlG9xikSf9MDMZ8URtlrucwz2O9gu2wfKEWf0nliOcjVMbzaUPK9
 JPhmvL3XxCQJAPeci13p4Sh8a6Junb9PfNBzL29WSqmwaFriLDryqec+oYbe/jrqLNGV9i
 7VC/3mkMVXmJKbuJrzxeGpNgHnlnsd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-aFyOEH6nPrqeC9pOfVvliQ-1; Tue, 29 Oct 2019 07:50:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E0481A334;
 Tue, 29 Oct 2019 11:50:35 +0000 (UTC)
Received: from localhost (ovpn-116-231.ams2.redhat.com [10.36.116.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F99D6C060;
 Tue, 29 Oct 2019 11:50:23 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/11] qapi: add unplug primary event
Date: Tue, 29 Oct 2019 12:48:59 +0100
Message-Id: <20191029114905.6856-6-jfreimann@redhat.com>
In-Reply-To: <20191029114905.6856-1-jfreimann@redhat.com>
References: <20191029114905.6856-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: aFyOEH6nPrqeC9pOfVvliQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com, aadam@redhat.com,
 jasowang@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, alex.williamson@redhat.com, laine@redhat.com,
 pbonzini@redhat.com, ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This event is emitted when we sent a request to unplug a
failover primary device from the Guest OS and it includes the
device id of the primary device.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 qapi/migration.json | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 82feb5bd39..e9e7a97c03 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1448,3 +1448,22 @@
 # Since: 3.0
 ##
 { 'command': 'migrate-pause', 'allow-oob': true }
+
+##
+# @UNPLUG_PRIMARY:
+#
+# Emitted from source side of a migration when migration state is
+# WAIT_UNPLUG. Device was unplugged by guest operating system.
+# Device resources in QEMU are kept on standby to be able to re-plug it in=
 case
+# of migration failure.
+#
+# @device-id: QEMU device id of the unplugged device
+#
+# Since: 4.2
+#
+# Example:
+#   {"event": "UNPLUG_PRIMARY", "data": {"device-id": "hostdev0"} }
+#
+##
+{ 'event': 'UNPLUG_PRIMARY',
+  'data': { 'device-id': 'str' } }
--=20
2.21.0


