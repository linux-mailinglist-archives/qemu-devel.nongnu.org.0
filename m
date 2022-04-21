Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8650A883
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:53:49 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbw4-000616-8m
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjp-0001cP-Uz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjo-0005yj-DT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AoNqAMq3lpq78IVxBhWTjPkTqZTFHUuUETthXV0Dus=;
 b=EXUZPGwlXbI6fo9D1T6OpsQRzvfYGxvH0S8aabQlbhEfUVsHDfmKEfyF2ZFQL/MxDCZdV+
 3Gp5E8X7z3icMy6qh/1ZTcHkQBWyXAlDKhyAnJ52UnGSVzQeoTgBrzLp8Pa9V+3wXhDmiv
 8R+0kJDLI02WPvtBq0p25WkkrJKK6lE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-h8udsAtZPMq857uvUfFKkg-1; Thu, 21 Apr 2022 14:41:03 -0400
X-MC-Unique: h8udsAtZPMq857uvUfFKkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61DF62808563
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C29B40C1438;
 Thu, 21 Apr 2022 18:41:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 04/18] migration: fix use of TLS PSK credentials with a UNIX
 socket
Date: Thu, 21 Apr 2022 19:40:38 +0100
Message-Id: <20220421184052.306581-5-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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


