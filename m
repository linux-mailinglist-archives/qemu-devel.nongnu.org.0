Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29803C8613
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:25:44 +0200 (CEST)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fpX-0001l6-Ow
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fcE-0006Rh-EG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fcB-0008Fl-VQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xp2o5PD1UTe8LJyY+jf30tqjE2o/ydPUbEBr1Unv9MY=;
 b=WB8Q3sCAuv3UeBbFujDpNn21bxdGHx838tUfIgzaMTQ9cOu4QifVAsWR/DQsj8KR+o5Sxt
 +GpLgbM79zrj9YLSx/t5lzuSgwrMYsTIaRnBWqEg3WyTcr6YiEbpLo8x2/XtlauovmtLwq
 KYah2I2WDxmWxqztbQhYxdIr51XSn/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-0t4A1lXGNMmoMeyRklh1YA-1; Wed, 14 Jul 2021 10:11:54 -0400
X-MC-Unique: 0t4A1lXGNMmoMeyRklh1YA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335B610C1ADC;
 Wed, 14 Jul 2021 14:11:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB04B19C87;
 Wed, 14 Jul 2021 14:11:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] io: use GDateTime for formatting timestamp for websock
 headers
Date: Wed, 14 Jul 2021 15:08:52 +0100
Message-Id: <20210714140858.2247409-21-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-websock.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index 03c1f7cb62..70889bb54d 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -177,15 +177,9 @@ qio_channel_websock_handshake_send_res(QIOChannelWebsock *ioc,
 
 static gchar *qio_channel_websock_date_str(void)
 {
-    struct tm tm;
-    time_t now = time(NULL);
-    char datebuf[128];
+    g_autoptr(GDateTime) now = g_date_time_new_now_utc();
 
-    gmtime_r(&now, &tm);
-
-    strftime(datebuf, sizeof(datebuf), "%a, %d %b %Y %H:%M:%S GMT", &tm);
-
-    return g_strdup(datebuf);
+    return g_date_time_format(now, "%a, %d %b %Y %H:%M:%S GMT");
 }
 
 static void qio_channel_websock_handshake_send_res_err(QIOChannelWebsock *ioc,
-- 
2.31.1


