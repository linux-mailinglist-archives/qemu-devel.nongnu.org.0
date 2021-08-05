Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B243E153A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:59:59 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcyc-0006Jz-TQ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctg-0005Lc-96
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBcte-000455-Ux
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6QdzSnjdtvRLRdd79lFYLTkD/1lcOyCDNWgBB23tfY=;
 b=LuKsJRzRT2kwne2LWxJImYcArFAAO3f6dsE+HKj6pdk93xSkgOMlMycHq8Duy/ZcavBGQU
 n7Ck8o43iEKLKXBNwQhjzMGGGflfQwIdMVCR3jMlzwv4Irh8XXedxTGgLDRqRSeUUEe8M3
 YNOPo40NJc5RwXVyrRkqOCaz6wcCUq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-kV6RW-MUMf-_fAJhmXvdvQ-1; Thu, 05 Aug 2021 08:54:48 -0400
X-MC-Unique: kV6RW-MUMf-_fAJhmXvdvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FB18799F7;
 Thu,  5 Aug 2021 12:54:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 394A610016F2;
 Thu,  5 Aug 2021 12:54:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] chardev: report a simpler error about duplicated id
Date: Thu,  5 Aug 2021 16:53:31 +0400
Message-Id: <20210805125331.826741-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Report:
  "Chardev with id 'char2' already exists"
Rather than:
  "Failed to add chardev 'char2': duplicate yank instance"

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/chardev/char.c b/chardev/char.c
index f59a61774b..4595a8d430 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1036,6 +1036,11 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     ChardevReturn *ret;
     g_autoptr(Chardev) chr = NULL;
 
+    if (qemu_chr_find(id)) {
+        error_setg(errp, "Chardev with id '%s' already exists", id);
+        return NULL;
+    }
+
     cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
     if (!cc) {
         goto err;
-- 
2.32.0.264.g75ae10bc75


