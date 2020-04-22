Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E681B45FC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:12:21 +0200 (CEST)
Received: from localhost ([::1]:50312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFAq-0002a9-VP
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF68-0003lU-Le
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF67-0003oA-IW
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32027
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRF67-0003kE-14
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587560846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H2M8bjsIlcLctdaefUgx2egEhpey1ae4R76ADCSuTc=;
 b=Yz9rG6WQDHRlzUder9OOCHuEs576ulVnVfEwWdvOyUIoS00mvplgOZJkm/LEoPUd2VSJoc
 iFvaQSXlzTJ5xOfZTZVC3OdaJYD2WGyHSgwxzNttRsXPcOYjUx0TeY9IGV+XRH5UeSl0pi
 N1J/TzNRb4ashA5ICuMEoZsdzldZUtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Kh-KxkYeM2eRoz8o7Vp1eg-1; Wed, 22 Apr 2020 09:07:24 -0400
X-MC-Unique: Kh-KxkYeM2eRoz8o7Vp1eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BDE7107ACC9
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D50B5D715
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31C8E11358C8; Wed, 22 Apr 2020 15:07:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/14] tests/test-logging: Fix test for -dfilter
 0..0xffffffffffffffff
Date: Wed, 22 Apr 2020 15:07:17 +0200
Message-Id: <20200422130719.28225-13-armbru@redhat.com>
In-Reply-To: <20200422130719.28225-1-armbru@redhat.com>
References: <20200422130719.28225-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 58e19e6e7914354242a67442d0006f9e31684d1a
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-logging.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 6387e4933f..8580b82420 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -73,10 +73,10 @@ static void test_parse_range(void)
     g_assert(qemu_log_in_addr_range(UINT64_MAX));
     g_assert_false(qemu_log_in_addr_range(UINT64_MAX - 1));
=20
-    qemu_set_dfilter_ranges("0..0xffffffffffffffff", &err);
+    qemu_set_dfilter_ranges("0..0xffffffffffffffff", &error_abort);
     g_assert(qemu_log_in_addr_range(0));
     g_assert(qemu_log_in_addr_range(UINT64_MAX));
-=20
+
     qemu_set_dfilter_ranges("2..1", &err);
     error_free_or_abort(&err);
=20
--=20
2.21.1


