Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D547E135
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:17:02 +0100 (CET)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0L9h-0000cw-EZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7U-0006fj-60
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7S-0006rU-PN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640254482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayL3Y6gZm6XhBH2r4HXO5sw4wKPzmz4WxHL5sCFdC0w=;
 b=XlAAOruHSKdu+YB67H7kJvPWgE8NEpytNINmI5xGxQ1rjvICljNgxCL4u60lz4yGn+s20L
 HK6zKjqYan9Vt8jGXIPiSwhl6+gRwhFWjwrzpOlmJ7Azf+iO7pTVv2PMHZIx7zsE+pElE9
 ci4j1xsX6E0RX/Sn6p9ETDYWZyIfWf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-7MhYPLvcODqM20vt7DEErg-1; Thu, 23 Dec 2021 05:14:41 -0500
X-MC-Unique: 7MhYPLvcODqM20vt7DEErg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1819624wme.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayL3Y6gZm6XhBH2r4HXO5sw4wKPzmz4WxHL5sCFdC0w=;
 b=E07lATqFHJGFXLAj/gaVbrcOuKcLOMZ6Hifx9R8dxRrxAPbtVlPwoPCLcCwNisEZ5b
 lQ56QpmpZQmah2jClTn4L6Ia7HacF3w+fb0GeWI0NB+FPAVe6flhbQZRFtEEE0+EfVRV
 DwiPQ+gNec0bAHCJWp3X2nNiEY24cutvx1Bjv+V06htkbR7sDrFPGsBvZUUnMqG7GkkU
 tmwiVd2kl9Zk4X0abVsVkEC5TepyjGyrNCQ87qHkhlbBqKiot31/fZCSCJDSj+1QJlco
 XJJOqDiTJId1uVpNJeTXGysNupowjJEUxDDr4YwNQ43nzMV+pegbPj4XEfLF9uhkfxhg
 5yGw==
X-Gm-Message-State: AOAM532chpcohsLvqs0oVCseJ73sQgHmuSQQdhqpoUUKmaZM4phB1eL+
 AMCOZZA6EhAmb/Xu8suA8DSxTpckksbPUS+8+OrBQ2LyXIgbO/hVRpobz/4VcK8+nm4dFkfeZlX
 0hF9g1NgY8CpZngczUXJLkVvci/WjTYw1GI4haxRdIE2x57kbsRKEka/CI6H/yHBh
X-Received: by 2002:adf:e844:: with SMTP id d4mr1212965wrn.151.1640254479924; 
 Thu, 23 Dec 2021 02:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzZ0UO5oY2YIF+4pXbv/1JYA2isTkwfvU1LoGnVF5/B17dvuFf7LivJ76OgR17ZBEyijJdhg==
X-Received: by 2002:adf:e844:: with SMTP id d4mr1212940wrn.151.1640254479696; 
 Thu, 23 Dec 2021 02:14:39 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id s1sm7400975wmh.35.2021.12.23.02.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 02:14:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] qemu-storage-daemon: Add vhost-user-blk help
Date: Thu, 23 Dec 2021 11:14:25 +0100
Message-Id: <20211223101426.3143647-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223101426.3143647-1-philmd@redhat.com>
References: <20211223101426.3143647-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 52cf17e8ace..0c19e128e3f 100644
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
+"                         vhosts-user-blk device over UNIX domain socket\n"
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           fd,addr.str=<fd>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhosts-user-blk device over file descriptor\n"
+"\n"
+#endif /* CONFIG_VHOST_USER_BLK_SERVER */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.33.1


