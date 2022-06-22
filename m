Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D62C555363
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 20:42:30 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45J7-00026r-0y
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 14:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GF-0007Xz-Ny
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GD-0002C5-Ia
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZS2Qj8OGgQg6pZYnLbW8umeBCQiTi5i+/MP8qAvgLE=;
 b=FxHp1xHga8uc7wRoe3TxpsOAcaPQVYEyPjbNzc4X4GgdxUO3B+6W+AE4PFxQ+GBdfpafk/
 eY1tWTbo+8KlGkV3L5/Ni356rzr55Y3wuqA/+Tfvamq/V2I9Lb/iBpt7uyhV933DuGcovD
 62Ftxg0NRNUYIogVstNY6Aeuwm7z0/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-mqpEWu6AMGujvTmayQKD9A-1; Wed, 22 Jun 2022 14:39:27 -0400
X-MC-Unique: mqpEWu6AMGujvTmayQKD9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92BC0800DA1;
 Wed, 22 Jun 2022 18:39:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A827E1131D;
 Wed, 22 Jun 2022 18:39:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 03/33] QIOChannelSocket: Fix zero-copy send so socket flush
 works
Date: Wed, 22 Jun 2022 19:38:47 +0100
Message-Id: <20220622183917.155308-4-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Bras <leobras@redhat.com>

Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
part of the flushing mechanism got missing: incrementing zero_copy_queued.

Without that, the flushing interface becomes a no-op, and there is no
guarantee the buffer is really sent.

This can go as bad as causing a corruption in RAM during migration.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/channel-socket.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index b8c13dba7c..4466bb1cd4 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -611,6 +611,11 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                          "Unable to write to socket");
         return -1;
     }
+
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        sioc->zero_copy_queued++;
+    }
+
     return ret;
 }
 #else /* WIN32 */
-- 
2.36.1


