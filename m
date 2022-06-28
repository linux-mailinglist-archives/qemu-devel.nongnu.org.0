Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF755BCE6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 03:11:43 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5zlU-0003Jh-HC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 21:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zje-0001zJ-6H
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zjb-0002Tu-IQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656378582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=BBBcTcC3lgIa35o8Avug19PTQP3J8O1nHTsrZcOP6xZ0Kw9369hyr2YD/MPqKH5YLQHyGT
 xVJrOsOUTugc1Wrb5labBgaYbjkgCuHebmuxgR4FH4YuCALj7IJyLpdbc36B1noYay6BqK
 As/YjeTClym/Ga0IYmNOx+CdPey1OW0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-bkBzq5APN7KqCjZZH4KohQ-1; Mon, 27 Jun 2022 21:09:41 -0400
X-MC-Unique: bkBzq5APN7KqCjZZH4KohQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso11806107qkb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 18:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=QywUlYidY4iSGqV/clxxjMcm5uZpR8aYYQtA+/fD0CRVK24aJ9agUXKmgfmnLDrxqa
 UzwSbEU7yjCz+4XH2e2oLb/0xaTvc0Wy/JdR0UuDPubCX8RVbjE4C/ST1yUBrEQYTFlf
 78pxSpyDeXYG2IpZDL1yAy3aOT0qOszw0wQ3k+sM2zOUHW6sda0SmoOFPvI+D9paU/TI
 P13aA+Daxsh3xjOu47stgNv/JM1mzsebqmnMPVS9/lSNDUc2R6ZFNDQ6YpqPSXoaKwfy
 SAutgkTOhpQzy33zY7ItSNQ3VcS9tv0UygeJsJ+bCQVdi9LqaHQLoTl6gEkiR82jZYyL
 LXOA==
X-Gm-Message-State: AJIora9bm0VvPMCjR1eEhd8ZX9ISkCtUmoMHcl/gLFmdCLKRkhnn4dxK
 6k5F5LkgzyPzDct6LrjrUhaPCbT6x7HXjXDKcYOohSkq2LyaFQICgkDzcinGZVKOe4fBhdqpBSY
 yf46ke7RK6iNiMDk=
X-Received: by 2002:ac8:7e8b:0:b0:31b:c86b:ec0a with SMTP id
 w11-20020ac87e8b000000b0031bc86bec0amr3037183qtj.503.1656378580709; 
 Mon, 27 Jun 2022 18:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/yRtNPa/21w15K1lE4jUbHEQoXyKG1oN8rUsNbVsUFGJUighNLBZ1hzgvIjw2+yhLO8P2lg==
X-Received: by 2002:ac8:7e8b:0:b0:31b:c86b:ec0a with SMTP id
 w11-20020ac87e8b000000b0031bc86bec0amr3037172qtj.503.1656378580484; 
 Mon, 27 Jun 2022 18:09:40 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:57bb:78f:fc5a:be9c:9417])
 by smtp.gmail.com with ESMTPSA id
 cc18-20020a05622a411200b0031b7441b02asm1742047qtb.89.2022.06.27.18.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:09:39 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] QIOChannelSocket: Fix zero-copy flush returning code 1
 when nothing sent
Date: Mon, 27 Jun 2022 22:09:08 -0300
Message-Id: <20220628010908.390564-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628010908.390564-1-leobras@redhat.com>
References: <20220628010908.390564-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
returns 1. This return code should be used only when Linux fails to use
MSG_ZEROCOPY on a lot of sendmsg().

Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
was attempted.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 4466bb1cd4..698c086b70 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     struct cmsghdr *cm;
     char control[CMSG_SPACE(sizeof(*serr))];
     int received;
-    int ret = 1;
+    int ret;
+
+    if (!sioc->zero_copy_queued) {
+        return 0;
+    }
 
     msg.msg_control = control;
     msg.msg_controllen = sizeof(control);
     memset(control, 0, sizeof(control));
 
+    ret = 1;
+
     while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
         received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
         if (received < 0) {
-- 
2.36.1


