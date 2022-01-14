Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7148EB36
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:07:31 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NEn-0002iJ-IB
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:07:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0U-000309-Ro
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0T-0000K7-90
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJAeIDTzFB0lyVcDFZdcUvZc+kB3SleGw6HOFB3RExs=;
 b=SiWfrrUGN6SxFV5+/IM7rev1OPKTzt87mfxxX8+T98ej8Z/Cv1QguUeaFZxdU13rKi9pDv
 FhMbOnMhehVfx/oe9i+A5T5Ti+e65NcJkP9P186f5ZVD7k4ClletaLdkwhoX6kjvWQPN3+
 9xebdXkJ9FOuRpO+bzs6kd/L8Xq8FUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-jcDR5ID1PtC7v07t4gii1w-1; Fri, 14 Jan 2022 08:52:39 -0500
X-MC-Unique: jcDR5ID1PtC7v07t4gii1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60311853020;
 Fri, 14 Jan 2022 13:52:38 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50C5105B20E;
 Fri, 14 Jan 2022 13:52:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/16] qemu-storage-daemon: Add vhost-user-blk help
Date: Fri, 14 Jan 2022 14:52:16 +0100
Message-Id: <20220114135226.185407-7-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add missing vhost-user-blk help:

  $ qemu-storage-daemon -h
  ...
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             addr.type=unix,addr.path=<socket-path>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over UNIX domain socket
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             fd,addr.str=<fd>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over file descriptor
  ...

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Reported-by: Qing Wang <qinwang@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220107105420.395011-3-f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 52cf17e8ac..9d76d1114d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -104,6 +104,19 @@ static void help(void)
 "                         export the specified block node over FUSE\n"
 "\n"
 #endif /* CONFIG_FUSE */
+#ifdef CONFIG_VHOST_USER_BLK_SERVER
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           addr.type=unix,addr.path=<socket-path>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhost-user-blk device over UNIX domain socket\n"
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           fd,addr.str=<fd>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhost-user-blk device over file descriptor\n"
+"\n"
+#endif /* CONFIG_VHOST_USER_BLK_SERVER */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.31.1


