Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED62DA473
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:59:46 +0100 (CET)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxkn-0002FP-2q
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxfH-0003bL-BY
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:54:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxfD-0000uv-FX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srrr8BplPYO0fdEbz8tXky8bnnFfwdoVvuEoFcFNi8E=;
 b=LrfFWj2lW2b5j6skBRwkhTlGC88kS04HR1tESGqvDcZt0JD5zzRKfdC1jLtjflwBPMg6Q3
 8amXQAywTEaGP+mwGOvThNP6cu+oKCKIoJ6qFsCiQMfDHGuxWpUuYCmLJ3UQTszzkqXiud
 +lhdLPmz2+MOgiC3gDv+pRSj7AXjT4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-OCzNKgBcPiKYJTPt-mTX0Q-1; Mon, 14 Dec 2020 18:53:56 -0500
X-MC-Unique: OCzNKgBcPiKYJTPt-mTX0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1365D107ACE3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C85713470;
 Mon, 14 Dec 2020 23:53:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] qapi: enable strict-optional checks
Date: Mon, 14 Dec 2020 18:53:27 -0500
Message-Id: <20201214235327.1007124-13-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the modules that we are checking so far, we can be stricter about the
difference between Optional[T] and T types. Enable that check.

Enabling it now will assist review on further typing and cleanup work.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/mypy.ini | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 74fc6c82153e..04bd5db5278d 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -1,6 +1,5 @@
 [mypy]
 strict = True
-strict_optional = False
 disallow_untyped_calls = False
 python_version = 3.6
 
-- 
2.26.2


