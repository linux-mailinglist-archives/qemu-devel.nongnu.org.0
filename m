Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2EF4CAC87
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:52:53 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPT9g-00015Z-Oq
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:52:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7b-0006fW-Ow
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7a-0008G3-4p
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivqX3reEgW0Ybx2wFwyhYb/t8wsrnYVRvzeaNB0ctU8=;
 b=g/EV5KojS8Qy8djCtfl8/cKKx660jFx0BVNi0WsFVUqok5Q49DqJyok2mWcuNXTEDRcYhZ
 mikUSc9CWGzz1bzrCoWbz0CR/6cRnpFo58vfHKPx0J/Xhzhfst9W0wRvXCFgJmWdtALbBq
 xS4Wd1e2xjdMAwd44mcPbdadHcqMhQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-lYYo7ybpNf67jsZOWGjD9g-1; Wed, 02 Mar 2022 12:50:40 -0500
X-MC-Unique: lYYo7ybpNf67jsZOWGjD9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC2FF1854E26
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:50:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D0CF80014;
 Wed,  2 Mar 2022 17:50:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] migration: fix use of TLS PSK credentials with a UNIX
 socket
Date: Wed,  2 Mar 2022 17:49:21 +0000
Message-Id: <20220302174932.2692378-8-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The migration TLS code has a check mandating that a hostname be
available when starting a TLS session. This is expected when using
x509 credentials, but is bogus for PSK and anonymous credentials
as neither involve hostname validation.

The TLS crdentials object gained suitable error reporting in the
case of TLS with x509 credentials, so there is no longer any need
for the migration code to do its own (incorrect) validation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/tls.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/migration/tls.c b/migration/tls.c
index ca1ea3bbdd..32c384a8b6 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -137,10 +137,6 @@ QIOChannelTLS *migration_tls_client_create(MigrationState *s,
     if (s->parameters.tls_hostname && *s->parameters.tls_hostname) {
         hostname = s->parameters.tls_hostname;
     }
-    if (!hostname) {
-        error_setg(errp, "No hostname available for TLS");
-        return NULL;
-    }
 
     tioc = qio_channel_tls_new_client(
         ioc, creds, hostname, errp);
-- 
2.34.1


