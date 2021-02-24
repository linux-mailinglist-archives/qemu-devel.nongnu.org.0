Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2807323F59
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:05:05 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEviq-0007Y1-QL
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQX-0001yf-Ba
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQT-0003YA-IF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AobaPlNgCAnqHONabFOcGNEwPc/8s4zw3ZcU4Gk/lEw=;
 b=N7rUmslTt1KQCeM+OBdoe86u8Tk/krjc69b+OwsmUPMqK1PnNhgWyY+zAw/RFrcwEwFWt9
 ql16G4iG4BjF7DeEsk74Wg+2drLB+PApfEcUnJMvwwv4v5QE7G4Mnoov3Td8ErzdQOXCJq
 fq8+t7fF5XeWcBcaiIOGa75rUVdmMmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-nqb_WIFUN1e9dZTjagFVqw-1; Wed, 24 Feb 2021 09:46:01 -0500
X-MC-Unique: nqb_WIFUN1e9dZTjagFVqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C4A3A4B3F2;
 Wed, 24 Feb 2021 13:55:54 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0776662467;
 Wed, 24 Feb 2021 13:55:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/31] qom: Make "object" QemuOptsList optional
Date: Wed, 24 Feb 2021 14:52:44 +0100
Message-Id: <20210224135255.253837-21-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is going away anyway, but for a few more commits, we'll be in
a state where some binaries still use QemuOpts and others don't. If the
"object" QemuOptsList doesn't even exist, we don't have to remove (or
fail to remove, and therefore abort) a user creatable object from it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/object_interfaces.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 1e9ad6f08a..b9a99c8bf4 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -290,6 +290,7 @@ void user_creatable_print_help_from_qdict(QDict *args)
 
 bool user_creatable_del(const char *id, Error **errp)
 {
+    QemuOptsList *opts_list;
     Object *container;
     Object *obj;
 
@@ -309,8 +310,10 @@ bool user_creatable_del(const char *id, Error **errp)
      * if object was defined on the command-line, remove its corresponding
      * option group entry
      */
-    qemu_opts_del(qemu_opts_find(qemu_find_opts_err("object", &error_abort),
-                                 id));
+    opts_list = qemu_find_opts_err("object", NULL);
+    if (opts_list) {
+        qemu_opts_del(qemu_opts_find(opts_list, id));
+    }
 
     object_unparent(obj);
     return true;
-- 
2.29.2


