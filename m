Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E218829ED71
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:47:43 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8HG-0007c6-Vq
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88r-00060B-Im
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88k-0008Ln-D0
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603978732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OY7QJGK3vdY037YYRIecs8AA+sXSLcI4y2LIdA4Gn8=;
 b=AljFCpQvP5eWaCwctH9UYuiBWqjI2ail1CHS4aF/hNHibYDEcZNDTKmXuGOtlq74mWeIiL
 JzMNzTQGoq0ZLUPAzAUA34My3GeKO5t+icpYpc6cwCexc/laqNit+KCeFisJml4GRr+9Da
 ewXN2j7CXtX/lGfooGnbaiwv8Gsn44o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-BwRyBJJOP0GIp-vl4uyl9Q-1; Thu, 29 Oct 2020 09:38:49 -0400
X-MC-Unique: BwRyBJJOP0GIp-vl4uyl9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6623807321;
 Thu, 29 Oct 2020 13:38:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D9735B4A9;
 Thu, 29 Oct 2020 13:38:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B60A1113275D; Thu, 29 Oct 2020 14:38:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] sockets: Bypass "replace empty @path" for abstract unix
 sockets
Date: Thu, 29 Oct 2020 14:38:32 +0100
Message-Id: <20201029133833.3450220-11-armbru@redhat.com>
In-Reply-To: <20201029133833.3450220-1-armbru@redhat.com>
References: <20201029133833.3450220-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

unix_listen_saddr() replaces empty @path by unique value.  It obtains
the value by creating and deleting a unique temporary file with
mkstemp().  This is racy, as the comment explains.  It's also entirely
undocumented as far as I can tell.  Goes back to commit d247d25f18
"sockets: helper functions for qemu (Gerd Hoffman)", v0.10.0.

Since abstract socket addresses have no connection with filesystem
pathnames, making them up with mkstemp() seems inappropriate.  Bypass
the replacement of empty @path.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 801c5e3957..18c8de8cdb 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -871,7 +871,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
         return -1;
     }
 
-    if (saddr->path && saddr->path[0]) {
+    if (saddr->path[0] || saddr->abstract) {
         path = saddr->path;
     } else {
         const char *tmpdir = getenv("TMPDIR");
-- 
2.26.2


