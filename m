Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DB550A291
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:34:09 +0200 (CEST)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXsm-0002sP-GZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nhXjf-0004qI-NI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nhXjd-0002wO-4R
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3W8uguSEAEwm4KrhtVtCxoLif7KPYjYRYk+SlDjIjGo=;
 b=Yv2s/ZJHdcihrBDU8n7uPGxdoJ+wFQAgG9V8NnUVqBii8zUHJuzSxv83k1ty0Q0r3y85X/
 oaRfjTcdAFTdxSHt8reAhEtlXH9gI1AC9bGXm8On2eYnYX4VB8pNLiKTqLm5CF55Ot5cNA
 pyM0s4hjrSUlFuz8e2OYpBD0S4F5ryg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-Zr8myBriNfK1IbcU9oUDRA-1; Thu, 21 Apr 2022 10:24:37 -0400
X-MC-Unique: Zr8myBriNfK1IbcU9oUDRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3279F29DD990;
 Thu, 21 Apr 2022 14:24:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DEE40CFD22;
 Thu, 21 Apr 2022 14:24:36 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/108: Fix when missing user_allow_other
Date: Thu, 21 Apr 2022 16:24:35 +0200
Message-Id: <20220421142435.569600-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE exports' allow-other option defaults to "auto", which means that it
will try passing allow_other as a mount option, and fall back to not
using it when an error occurs.  We make no effort to hide fusermount's
error message (because it would be difficult, and because users might
want to know about the fallback occurring), and so when allow_other does
not work (primarily when /etc/fuse.conf does not contain
user_allow_other), this error message will appear and break the
reference output.

We do not need allow_other here, though, so we can just pass
allow-other=off to fix that.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/108 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 688d3ae8f6..9e923d6a59 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -326,7 +326,7 @@ else
 
     $QSD \
         --blockdev file,node-name=export-node,filename="$TEST_IMG" \
-        --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=off \
+        --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=off,allow-other=off \
         --pidfile "$TEST_DIR/qsd.pid" \
         --daemonize
 fi
-- 
2.35.1


