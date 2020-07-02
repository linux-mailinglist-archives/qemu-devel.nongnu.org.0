Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F243B2128D4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 17:59:40 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr1ch-0006pV-Ui
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Tn-0008WT-Vs
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40569
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Tb-0004pd-Kq
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hcw07Rj0vTw3fqjviFwHQ5qbtiufl7MB4xmke5EoMw=;
 b=Er7iYJMQjuxb0RIG0vg2a85hpQEL8uF/Ghd1XRp7Ee6z0G5sNMmR6bif43RqeVNGG6kcgo
 WBUw3drUS5kMXCCIGbeCCZJso+nhfyP5M4orAJpIBIDY1HWXHpREnlHNL5oFMUEncId5KU
 iolCeD3UPO8OZsuPFKYgCHCM64/eCvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-NLZ8d9wUN5iy8_muJCbPPQ-1; Thu, 02 Jul 2020 11:50:05 -0400
X-MC-Unique: NLZ8d9wUN5iy8_muJCbPPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B59BFD8EA6;
 Thu,  2 Jul 2020 15:50:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F45F7922F;
 Thu,  2 Jul 2020 15:50:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B784811358C8; Thu,  2 Jul 2020 17:50:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/44] block: Avoid error accumulation in bdrv_img_create()
Date: Thu,  2 Jul 2020 17:49:30 +0200
Message-Id: <20200702155000.3455325-15-armbru@redhat.com>
In-Reply-To: <20200702155000.3455325-1-armbru@redhat.com>
References: <20200702155000.3455325-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating an image fails because the format doesn't support option
"backing_file" or "backing_fmt", bdrv_img_create() first has
qemu_opt_set() put a generic error into @local_err, then puts the real
error into @errp with error_setg(), and then propagates the former to
the latter, which throws away the generic error.  A bit complicated,
but works.

Not that qemu_opt_set() returns a useful value, we can simply ignore
the generic error instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 8d478bdc51..b396f32a51 100644
--- a/block.c
+++ b/block.c
@@ -6090,7 +6090,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
 
     if (base_filename) {
         if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FILE, base_filename,
-                          &local_err)) {
+                          NULL)) {
             error_setg(errp, "Backing file not supported for file format '%s'",
                        fmt);
             goto out;
@@ -6098,7 +6098,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
     }
 
     if (base_fmt) {
-        if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FMT, base_fmt, &local_err)) {
+        if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FMT, base_fmt, NULL)) {
             error_setg(errp, "Backing file format not supported for file "
                              "format '%s'", fmt);
             goto out;
-- 
2.26.2


