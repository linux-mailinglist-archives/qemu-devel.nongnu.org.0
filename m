Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7C2128E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:04:00 +0200 (CEST)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr1gt-0005A3-KJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1U2-0000iz-An
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21241
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Tf-0004vC-Sm
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ef+sUQ/Zs65iEO4sHN/RkG+7pP3g2yjvMbA1o61CdxQ=;
 b=QorDY/v1Q1Hn0fDrUcB+HOQkwCOazIHtPZjoC4tF+U7NFPkL4rqO6QIGOGF3j4+L4m9+y+
 SOApEGx7xy0d4tHQ1hpMpy/HiS4XGweCnPo3OpANlQiS5s8spbD154NKA9HmedeBJ1sP9F
 3o10Rjv32Vb0W/ulOAZWxcMaPdy6Cx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-EVTgaDCTPiukMJe6szA_vA-1; Thu, 02 Jul 2020 11:50:10 -0400
X-MC-Unique: EVTgaDCTPiukMJe6szA_vA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42491D8EA1;
 Thu,  2 Jul 2020 15:50:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F39B4FA3F;
 Thu,  2 Jul 2020 15:50:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 44CE81132FDA; Thu,  2 Jul 2020 17:50:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/44] qemu-img: Ignore Error objects where the return
 value suffices
Date: Thu,  2 Jul 2020 17:49:58 +0200
Message-Id: <20200702155000.3455325-43-armbru@redhat.com>
In-Reply-To: <20200702155000.3455325-1-armbru@redhat.com>
References: <20200702155000.3455325-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qemu-img.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 27bf94e7ae..c11bfe0268 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -464,22 +464,18 @@ static int add_old_style_options(const char *fmt, QemuOpts *opts,
                                  const char *base_filename,
                                  const char *base_fmt)
 {
-    Error *err = NULL;
-
     if (base_filename) {
         if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FILE, base_filename,
-                          &err)) {
+                          NULL)) {
             error_report("Backing file not supported for file format '%s'",
                          fmt);
-            error_free(err);
             return -1;
         }
     }
     if (base_fmt) {
-        if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FMT, base_fmt, &err)) {
+        if (!qemu_opt_set(opts, BLOCK_OPT_BACKING_FMT, base_fmt, NULL)) {
             error_report("Backing file format not supported for file "
                          "format '%s'", fmt);
-            error_free(err);
             return -1;
         }
     }
-- 
2.26.2


