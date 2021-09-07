Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C257A4028B4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:25:49 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaAe-0006TN-Qp
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5q-0006dF-K3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5o-0006LJ-LX
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAeWEZvjIXkGAYZ+H8tFtsLpCD/98+4IPunIltXcOxU=;
 b=L1/K+CXVKKy7Zzm9B0ImtPR/qyXHvmEfcoQJe2wdYq6jgWVmeNoqtFA+qrO/yoQLppgTCy
 FEQXHnf34hutCUu9Vvtdqa+iOLtmfuCcrROieC+YdmRaM0hiKVVXHjN/DZ0PsITZrkbMrm
 JZA76IU2mipwFrD9vfF/WNCLMZWzIlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-AhznjB7ZPRmpTs9r7HCQ6g-1; Tue, 07 Sep 2021 08:20:46 -0400
X-MC-Unique: AhznjB7ZPRmpTs9r7HCQ6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B69CF188E3C2
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:20:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B4110013D7;
 Tue,  7 Sep 2021 12:20:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 04/32] glib-compat: add G_SIZEOF_MEMBER
Date: Tue,  7 Sep 2021 16:19:15 +0400
Message-Id: <20210907121943.3498701-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The macro was introduced in 2.64. Let's redefine it, to allow its usage
with older versions and silence the deprecation warning.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/glib-compat.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f5..e278e09d1d 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -110,4 +110,11 @@ qemu_g_test_slow(void)
 
 #pragma GCC diagnostic pop
 
+/* introduced in 2.64 */
+#ifdef G_SIZEOF_MEMBER
+#undef G_SIZEOF_MEMBER
+#endif
+
+#define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)->member)
+
 #endif
-- 
2.33.0.113.g6c40894d24


