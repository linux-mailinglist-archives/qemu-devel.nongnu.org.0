Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A501453A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 12:19:43 +0100 (CET)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuE2v-00084E-QI
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 06:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iuDyq-00040Q-GE
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iuDyp-0006bE-L8
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41458
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iuDyp-0006ay-Hh
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579691727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bpc7h+vgWmBBF1bWkDQbQnMseD5ZrIS6bw9UBUOoPs=;
 b=VSpmHHF6Q7OPUWx/JftCxBf4TQpLW0f0UKJ2S9knz6rermqZGb7M9kibOqTql/K4RuFhht
 OPA8TLFMCoOEIMu0B0qzu7eKKJSj1D3+cznQoja+dAodfq6PsIGu3uKsR1ZeajSc+ZV6cb
 /PfXPnQG9E3bY5LGcxG1t34PXDgS4Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-XaFHNgJfNl2bpha7V4jmSg-1; Wed, 22 Jan 2020 06:15:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353618010C9
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 11:15:22 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94555C1BB;
 Wed, 22 Jan 2020 11:15:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] migration-test: Use g_free() instead of free()
Date: Wed, 22 Jan 2020 12:15:12 +0100
Message-Id: <20200122111517.33223-2-quintela@redhat.com>
In-Reply-To: <20200122111517.33223-1-quintela@redhat.com>
References: <20200122111517.33223-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: XaFHNgJfNl2bpha7V4jmSg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 26e2e77289..b6a74a05ce 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1291,7 +1291,7 @@ static void test_multifd_tcp(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to, true);
-    free(uri);
+    g_free(uri);
 }
=20
 int main(int argc, char **argv)
--=20
2.24.1


