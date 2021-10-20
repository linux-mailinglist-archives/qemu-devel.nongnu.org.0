Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71A4349F4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:20:03 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9da-0003vc-Be
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i5-0004nN-4y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i3-0003hQ-KN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yj3JiZzos9wfmafHbbhWyjt5GZKs2MQbtgHmoUqM9p0=;
 b=Kl+pIYIZewt9QKVyVjvv1b1hiPLhcsUfUYYTAO7v2h58T/7Cdh4V5rg+UOrgdQG/X832kt
 hoYR54MEhSwQxXi3fNOHKpjwELZ7FtABDGMmhdyu7G9PUqvdJGBuk7FyeFyHBH64qaCgQv
 oTq4LF2BNKgsGG0P5fbJ38dMqEQs8Mc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-i8c97qYhNpmUWxHpXbyJjA-1; Wed, 20 Oct 2021 06:20:33 -0400
X-MC-Unique: i8c97qYhNpmUWxHpXbyJjA-1
Received: by mail-ed1-f72.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso20517552edf.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yj3JiZzos9wfmafHbbhWyjt5GZKs2MQbtgHmoUqM9p0=;
 b=sgKLBLpswRCzWHZrK2Zl1rdrylrxgs1mx8UgtGsIVQadernoBTb+HyKUue/le9WZDU
 2pL8yLKpPS+VfkoxKytL8liLARWCcZ5JjYYnG2AAIiZcHRp4FKmL6maiI9awLkFi7qZl
 OOh8XO6YG6zyJfcmuUZ15ptdmGDw202tzOXIBKKIqAGqBTBIfW3jUzBL9D0aUui3L3FX
 D6jqKzT1/y+Kc3DXBOutfgOmDSYr2X2cE3/AipEtGI19hNS0H3kIu8e4fYJvAYHG1ZtF
 UBwxz9+dMHJEXHyozpQoDuGOaUqIL32x1frC5e9C7yFlB11/QSoEKYWupad8HGUAhThb
 AGJA==
X-Gm-Message-State: AOAM531dv/vT/oOUcXML9xPSNS1JZCbIlV3dJnKfzXKZY8KwoxUzEuNV
 M8Zf0nfouqjYZR4yZCdXG5LZW/z5IWBXV0WnRlZwz8hSEOG8yLbBda0oznC/fQRLt6scWzXcdFr
 ikkVlpGXRCmi2yxZ7m4r1kUPePc0trBWOvkpEPAxfmeYCwEdOdHq8V7Asjg8j
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr45041160ejc.169.1634725232115; 
 Wed, 20 Oct 2021 03:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhIgydcQQGt/U1Xvpc84XOVU9AFYeaCsmYROJIkLCgLNGR/zG0oCbyJj46t+t0WIxfB8gFVg==
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr45041118ejc.169.1634725231781; 
 Wed, 20 Oct 2021 03:20:31 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id c6sm811707ejb.41.2021.10.20.03.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:31 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/44] vhost-user-blk-test: pass vhost-user socket fds to QSD
Message-ID: <20211020101844.988480-28-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

qemu-storage-daemon is launched with the vhost-user listen socket path.
The path is first unlinked before opening the listen socket. This
prevents stale UNIX domain socket files from stopping socket
initialization.

This behavior is undesirable in vhost-user-blk-test and the cause of a
bug:

There is a race condition in vhost-user-blk-test when QEMU launches
before QSD. It connects to the old socket that QSD unlinks and the
vhost-user connection is never serviced, resulting in a hang.

Pass the listen socket fd to QSD to maintain listen socket continuity
and prevent the lost connection.

Fixes: 806952026df41939680abe92b329715b9b4e01cc ("test: new qTest case to test the vhost-user-blk-server")
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211019135655.83067-1-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 6f108a1b62..62e670f39b 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -906,9 +906,9 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
         img_path = drive_create();
         g_string_append_printf(storage_daemon_command,
             "--blockdev driver=file,node-name=disk%d,filename=%s "
-            "--export type=vhost-user-blk,id=disk%d,addr.type=unix,addr.path=%s,"
+            "--export type=vhost-user-blk,id=disk%d,addr.type=fd,addr.str=%d,"
             "node-name=disk%i,writable=on,num-queues=%d ",
-            i, img_path, i, sock_path, i, num_queues);
+            i, img_path, i, fd, i, num_queues);
 
         g_string_append_printf(cmd_line, "-chardev socket,id=char%d,path=%s ",
                                i + 1, sock_path);
-- 
MST


