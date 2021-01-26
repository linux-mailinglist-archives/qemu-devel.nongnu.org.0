Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF98303D84
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:46:14 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NjZ-0003VB-74
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4NgS-00027o-JV
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4NgN-00041P-Mu
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611664973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se3HBlmEVDTc8dgcbM4AZOzs4tqtqBD0FvgAXCbGgBc=;
 b=GLanu7o7kCrtSgb5DDRiq64P7KyhXhm10CWhICunipE/2k6WNfcWfQi7YGIO3Iuanm44F7
 Ea9neupQHA6qcWnJLFAYZKpnw/7DQVV90/kHHS+4Yy3iW+Od/8+e0f562bNA2X+dCBAFdN
 TAVENZlluTFJMU17tOUqtTnMO273IX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-jXXYmJWpM6yUgtmADNCLrw-1; Tue, 26 Jan 2021 07:42:51 -0500
X-MC-Unique: jXXYmJWpM6yUgtmADNCLrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7491915721
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 12:42:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D34CB60C62;
 Tue, 26 Jan 2021 12:42:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65693113861E; Tue, 26 Jan 2021 13:42:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] backends/dbus-vmstate: Fix short read error handling
Date: Tue, 26 Jan 2021 13:42:39 +0100
Message-Id: <20210126124240.2081959-2-armbru@redhat.com>
In-Reply-To: <20210126124240.2081959-1-armbru@redhat.com>
References: <20210126124240.2081959-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: marcandre.lureau@redhat.com, kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dbus_vmstate_post_load() fails, it complains to stderr.  Except
on short read, where it checks with g_return_val_if_fail().  This
fails silently if G_DISABLE_CHECKS is undefined (it should be), or
else pads the short read with uninitialized bytes.

Replace g_return_val_if_fail() by a proper error check.

Fixes: 5010cec2bc87dafab39b3913c8ca91f88df9c540
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 backends/dbus-vmstate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8e9c..2a0d2e4a31 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
                                      &bytes_read, NULL, &err)) {
             goto error;
         }
-        g_return_val_if_fail(bytes_read == len, -1);
+        if (bytes_read != len) {
+            error_report("%s: Short read", __func__);
+            return -1;
+        }
         id[len] = 0;
 
         trace_dbus_vmstate_loading(id);
-- 
2.26.2


