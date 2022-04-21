Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4D50A72D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:33:14 +0200 (CEST)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhag6-0003VB-0r
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrW-0007cR-AG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrU-00032Q-P9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AoNqAMq3lpq78IVxBhWTjPkTqZTFHUuUETthXV0Dus=;
 b=TIoM+3dLf0VI7VmEL2oAhXpqHk7SHRHh46GIAP+gsEvH5flywSdSLLpecyDvpKfO4iRxNf
 sC2+oyC1lVsKXVPSj7EmRUo9iiGNGrWLZ012B7dzHjJRzoO/5LnRqsZIrfF3xZHXV1cZ2S
 nFj7vZVYQQ0SU2pY2Oh1N/gMihBQHBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-zzhlHLS-MSa5DjGSJMEs0g-1; Thu, 21 Apr 2022 12:40:54 -0400
X-MC-Unique: zzhlHLS-MSa5DjGSJMEs0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71454381A834
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:40:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB53840D016E;
 Thu, 21 Apr 2022 16:40:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 04/18] migration: fix use of TLS PSK credentials with a UNIX
 socket
Date: Thu, 21 Apr 2022 17:40:29 +0100
Message-Id: <20220421164043.209703-5-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The migration TLS code has a check mandating that a hostname be
available when starting a TLS session. This is expected when using
x509 credentials, but is bogus for PSK and anonymous credentials
as neither involve hostname validation.

The TLS crdentials object gained suitable error reporting in the
case of TLS with x509 credentials, so there is no longer any need
for the migration code to do its own (incorrect) validation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-7-berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.35.1


