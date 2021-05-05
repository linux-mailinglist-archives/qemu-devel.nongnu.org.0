Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01903738C1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:43:38 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leF0D-00084H-Ri
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEuq-0000yn-8l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEun-0007dJ-5h
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKFPMuA5gXmiCEpl0mCUt0lLiExZwjh2+65uOHQ3Rpc=;
 b=R+7J47MfWmB4GVMOZie9almpLfSsFKZjUhollH9fnF/m6Y8IjGNJpQ8c+f+7ygBX3pCJOL
 V53Z1gHDhbHbZy1dVlPybiE1H9MJq5eeVi+DEwEvKSeI0Itj1ubZ8A10vTQ4VBTtS+kogA
 nZwZGy2b3F0RMdbAkzSXj05o463fxJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-TU5FqT39MTOeGCR116qRXw-1; Wed, 05 May 2021 06:37:58 -0400
X-MC-Unique: TU5FqT39MTOeGCR116qRXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DAAC107ACCA;
 Wed,  5 May 2021 10:37:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 093EF5C3E0;
 Wed,  5 May 2021 10:37:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] usb/dev-mtp: use GDateTime for formatting timestamp for
 objects
Date: Wed,  5 May 2021 11:36:59 +0100
Message-Id: <20210505103702.521457-5-berrange@redhat.com>
In-Reply-To: <20210505103702.521457-1-berrange@redhat.com>
References: <20210505103702.521457-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/usb/dev-mtp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index bbb8274344..a71fcc326d 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -772,12 +772,9 @@ static void usb_mtp_add_str(MTPData *data, const char *str)
 
 static void usb_mtp_add_time(MTPData *data, time_t time)
 {
-    char buf[16];
-    struct tm tm;
-
-    gmtime_r(&time, &tm);
-    strftime(buf, sizeof(buf), "%Y%m%dT%H%M%S", &tm);
-    usb_mtp_add_str(data, buf);
+    g_autoptr(GDateTime) then = g_date_time_new_from_unix_utc(time);
+    g_autofree char *thenstr = g_date_time_format(then, "%Y%m%dT%H%M%S");
+    usb_mtp_add_str(data, thenstr);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.31.1


