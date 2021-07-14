Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F83C8611
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:25:14 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fp3-0001CN-KH
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fc8-0006Qu-VW
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fc6-0008Ba-KU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeSMvZXdNsNQu3ORIpYf/cckmfR6IMoBFlCMlPz5uTY=;
 b=Z3FHh8ULT9e/Ub5lYuurpvsSPCatBqVgyAeVvjN52JV70FhMmB//sr576DbHMq+azE78E0
 HJiuCxRPyWHHz12Vqs/59Qgpdf/R2iFIlSl33h4tbGZBwpJ2OC+Ba34aGTScYYLcF/lSzm
 IeltoNfKvMntcyQyhdtobl7pgNMBwRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-QWZlXEoZM2e3z4VPiAkcOA-1; Wed, 14 Jul 2021 10:11:48 -0400
X-MC-Unique: QWZlXEoZM2e3z4VPiAkcOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 658A7189CD21;
 Wed, 14 Jul 2021 14:11:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B74C19C87;
 Wed, 14 Jul 2021 14:11:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] net/rocker: use GDateTime for formatting timestamp in
 debug messages
Date: Wed, 14 Jul 2021 15:08:51 +0100
Message-Id: <20210714140858.2247409-20-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/net/rocker/rocker.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index 941c932265..412fa44d01 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -25,14 +25,9 @@
 #if defined(DEBUG_ROCKER)
 #  define DPRINTF(fmt, ...) \
     do {                                                           \
-        struct timeval tv;                                         \
-        char timestr[64];                                          \
-        time_t now;                                                \
-        gettimeofday(&tv, NULL);                                   \
-        now = tv.tv_sec;                                           \
-        strftime(timestr, sizeof(timestr), "%T", localtime(&now)); \
-        fprintf(stderr, "%s.%06ld ", timestr, tv.tv_usec);         \
-        fprintf(stderr, "ROCKER: " fmt, ## __VA_ARGS__);           \
+        g_autoptr(GDateTime) now = g_date_time_new_now_local();    \
+        g_autofree char *nowstr = g_date_time_format(now, "%T.%f");\
+        fprintf(stderr, "%s ROCKER: " fmt, nowstr, ## __VA_ARGS__);\
     } while (0)
 #else
 static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
-- 
2.31.1


