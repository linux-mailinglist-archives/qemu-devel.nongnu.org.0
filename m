Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2131A5ED
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:19:15 +0100 (CET)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeuI-0006UA-Tg
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerf-00048W-54
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerd-0003qB-1V
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIFMhONtHFFJQrXdCykz8Xygs7fyXrTSwinNlTOE1Qo=;
 b=TlYswC5ld4FiatBmxkSBDMMA0Vrh7K9h3C4WS8u4ru4ZYML1TNS9mFZ253XP9/na9WagQG
 8mFPgbIIF0JlYFlxpuyvKVm5WGlvGBwy4SDm0XPvxztUf1R3sZ2Ee0D6LL/3UcQQbYQy16
 ZQKhmNcXC1Qzg8gee1AG9cQAz285Mmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-C5uQ13jzPqaDrCqjxEyLug-1; Fri, 12 Feb 2021 15:16:25 -0500
X-MC-Unique: C5uQ13jzPqaDrCqjxEyLug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3131801965;
 Fri, 12 Feb 2021 20:16:24 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5208F614EB;
 Fri, 12 Feb 2021 20:16:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Date: Fri, 12 Feb 2021 14:16:09 -0600
Message-Id: <20210212201619.1388255-5-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

Using error_prepend() in qio_channel_readv_full_all() causes a segfault
as errp is not set when ret is 0. This results in the failure of iotest
83. Replacing with error_setg() fixes the problem.

Additionally, removes a full stop at the end of error message

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Fixes: bebab91ebdfc591f8793a9a17370df1bfbe8b2ca
  (io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all helpers)
Message-Id: <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 io/channel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/io/channel.c b/io/channel.c
index 4555021b6246..e8b019dc36e2 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -202,8 +202,7 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
     int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);

     if (ret == 0) {
-        error_prepend(errp,
-                      "Unexpected end-of-file before all data were read.");
+        error_setg(errp, "Unexpected end-of-file before all data were read");
         return -1;
     }
     if (ret == 1) {
-- 
2.30.1


