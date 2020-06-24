Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C465206F21
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:43:11 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo0zu-0001qN-LK
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0un-0000oN-0s
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54515
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uh-000268-B6
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yigXi+5jJxPcEfqszOa6dKjHvjPy5dq/aBEievotLbg=;
 b=AxdyRUm4Wz0u0OKnrA6BvofLWj5cA/kgUSwyG9ipXm0x01xAkqeXQBS/O4UFSv7KTmJaeD
 q5DqXFxu7bzj1PyXptr7qb+WeIBUCiBtpevzc2dl+H0tcJ1Wc8PCG+rzqhY7YakdjQm2+N
 Rh6SKzPaRCINrMTrsPFuDT+LZn3TZ04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-x-nNOMqzPiiwWhG2V8lQxQ-1; Wed, 24 Jun 2020 04:37:44 -0400
X-MC-Unique: x-nNOMqzPiiwWhG2V8lQxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96242107ACF3;
 Wed, 24 Jun 2020 08:37:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A9D7168D;
 Wed, 24 Jun 2020 08:37:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E96B1138474; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/25] usb/dev-mtp: Fix Error double free after inotify
 failure
Date: Wed, 24 Jun 2020 10:37:18 +0200
Message-Id: <20200624083737.3086768-7-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Gerd Hoffmann <kraxel@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

error_report_err() frees its first argument.  Freeing it again is
wrong.  Don't.

Fixes: 47287c27d0c367a89f7b2851e23a7f8b2d499dd6
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/usb/dev-mtp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 168428156b..15a2243101 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -634,7 +634,6 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
             error_reportf_err(err,
                               "usb-mtp: failed to add watch for %s: ",
                               o->path);
-            error_free(err);
         } else {
             trace_usb_mtp_file_monitor_event(s->dev.addr, o->path,
                                              "Watch Added");
@@ -1279,7 +1278,6 @@ static void usb_mtp_command(MTPState *s, MTPControl *c)
         if (err) {
             error_reportf_err(err,
                               "usb-mtp: file monitoring init failed: ");
-            error_free(err);
         } else {
             QTAILQ_INIT(&s->events);
         }
-- 
2.26.2


