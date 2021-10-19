Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBC43383E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:18:17 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpwW-0002TV-10
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcpnP-0008Go-4B
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcpnI-0006x8-S5
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634652524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yj3JiZzos9wfmafHbbhWyjt5GZKs2MQbtgHmoUqM9p0=;
 b=Zlu4t8vEdMmmbdl7maqfVTMxYjFaju5c5EVcaJJNijcw50zUkhMztNWbFlzla/qXYJr32K
 izmYYiCalL0iF1uGQfOCq1w1rb7GGguHjO09jmUfqwz+2KeLxFcxGrlRoyIRKYadZkQOQ+
 qiiydLTMNnmIdqoRkYx7cGnkVbad7gk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-_PBTGcHcMUuXAfKoTuPNvw-1; Tue, 19 Oct 2021 10:08:42 -0400
X-MC-Unique: _PBTGcHcMUuXAfKoTuPNvw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so10252029wri.11
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yj3JiZzos9wfmafHbbhWyjt5GZKs2MQbtgHmoUqM9p0=;
 b=WMBj4BTispEA9u9YakSiclb4OJR+QVz2wVlHLqO17GMWRHxOPk5pNawjwdDUyljch+
 qPWXtrH1GAc4B9EKo0UtbpwfAT+yPr+MjUhwvRgO9U8HK3NVvWKHA+ofhdVyJjEm5ANT
 x4PGBB1Re/FcXto5Cp7ScLL/EFi4rB6ntfNiOdBDf6pcTbMPwE6t36THNTDgy64ywrbb
 xBzMlEe5R7Bo04ziHElCWl3K/OQGERjmgJZolM56xsx/8S38mASuxVtUcjjflBunDzeL
 /EWukRBloKTlcKQg8dR1hHkN4d6xPnVd5CrUS17K6XsQKWZ2h6u/bzqxQ0vb3ewZcwUD
 fylw==
X-Gm-Message-State: AOAM5333vG2y88Agwhl2azW914w3KSZ9RRSFkloAr00lSVslnHCn7mh1
 eUb6Co7Id+GdIVUb0tr9M4Kuh3s+PEM5fAvrd9Ne+Gt75eJThK6wveWMATokf14h52PBHLKEwj9
 B2gsJ8IuJp3gJYUeF1Ll9EozD9WnDOqVH7WreDSbc8hgApW1tRD1NEAm9L+83
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr6490248wmr.48.1634652521312;
 Tue, 19 Oct 2021 07:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztb3//ywRJsulbhgbhigY+63A9a2DBu1WHF6nuIYy/65Ha97Sl4OPgAB2MkNZK5eCSDB05Dw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr6490221wmr.48.1634652521127;
 Tue, 19 Oct 2021 07:08:41 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id f15sm15162384wrt.38.2021.10.19.07.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:08:40 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:08:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/29] vhost-user-blk-test: pass vhost-user socket fds to QSD
Message-ID: <20211019140622.738008-31-mst@redhat.com>
References: <20211019140622.738008-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


