Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B394A82C9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:58:49 +0100 (CET)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZpA-00023v-OB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZiM-0000wP-55
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZiJ-0005yy-O4
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643885502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9q3m67X3wlhlfhxrtP+2LHiDiV1HbEf4+0+6wprYdhI=;
 b=EiQQ4IgKtNOG4Qc3y8ovS4LkA9xK90tD4x4cF2Ts52pStlofgB9/lHPnvUUj0z6LNZXzZR
 0dfP3XMmw+xrrIWmQqnqJLw3cmZj+6RSyu4wzeyGX7OiNomu50eFpn9LHW55wY0EQNQE8c
 B7ahO8Sv1Sha9YcObStiT8GX1USfkNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-8McFf7eENmCdaucJyRvJXg-1; Thu, 03 Feb 2022 05:51:41 -0500
X-MC-Unique: 8McFf7eENmCdaucJyRvJXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85177874982
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 10:51:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711B3108B7;
 Thu,  3 Feb 2022 10:51:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: take over seccomp from Eduardo Otubo
Date: Thu,  3 Feb 2022 10:51:18 +0000
Message-Id: <20220203105118.520687-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo has indicated that he no longer has time to be involved in
a QEMU aintainership role. As one of the more frequent contributors
of patches and design ideas to seccomp, I'll take over.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bdb55924f4..2b0b400709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2973,8 +2973,8 @@ F: docs/sphinx/fakedbusdoc.py
 F: tests/qtest/dbus*
 
 Seccomp
-M: Eduardo Otubo <otubo@redhat.com>
-S: Supported
+M: Daniel P. Berrange <berrange@redhat.com>
+S: Odd Fixes
 F: softmmu/qemu-seccomp.c
 F: include/sysemu/seccomp.h
 F: tests/unit/test-seccomp.c
-- 
2.34.1


