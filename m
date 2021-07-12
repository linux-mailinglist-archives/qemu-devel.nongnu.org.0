Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53123C5CF7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:10:07 +0200 (CEST)
Received: from localhost ([::1]:33748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vhC-0008BH-Co
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaN-0000a0-9l
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vaL-0005rf-R3
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626094977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/QssY+FhIEYHDs8mgNs2jmJcHzN/OKRRUeoPy0iiAY=;
 b=FZbFbXzUz1nfpPyMceHG/M+9NJ+qVPg/ROcakrVx970ugpY030j7CnTuAphVd35r/oZxYc
 CRAWiSsBeAtmfPLZEZPr7eBXX7hvwl+Js1nbKa/0RAO4q8lnxEIHh9/CaVnOB8xueXR8hD
 LK0Lk/4V+CRwqkVH/wSteYe/gyMAz18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-GQF9fo0KNdiTd24zwOgbZA-1; Mon, 12 Jul 2021 09:02:54 -0400
X-MC-Unique: GQF9fo0KNdiTd24zwOgbZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E9B9F92F;
 Mon, 12 Jul 2021 13:02:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD8C55FC03;
 Mon, 12 Jul 2021 13:02:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] crypto: remove conditional around 3DES crypto test cases
Date: Mon, 12 Jul 2021 14:02:02 +0100
Message-Id: <20210712130223.1825930-2-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main method checks whether the cipher choice is supported
at runtime, so there is no need for compile time conditions.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-cipher.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/unit/test-crypto-cipher.c b/tests/unit/test-crypto-cipher.c
index 280319a223..fd0a8de34c 100644
--- a/tests/unit/test-crypto-cipher.c
+++ b/tests/unit/test-crypto-cipher.c
@@ -165,7 +165,6 @@ static QCryptoCipherTestData test_data[] = {
             "ffd29f1bb5596ad94ea2d8e6196b7f09"
             "30d8ed0bf2773af36dd82a6280c20926",
     },
-#if defined(CONFIG_NETTLE) || defined(CONFIG_GCRYPT)
     {
         /* Borrowed from linux-kernel crypto/testmgr.h */
         .path = "/crypto/cipher/3des-cbc",
@@ -283,7 +282,6 @@ static QCryptoCipherTestData test_data[] = {
             "407772c2ea0e3a7846b991b6e73d5142"
             "fd51b0c62c6313785ceefccfc4700034",
     },
-#endif
     {
         /* RFC 2144, Appendix B.1 */
         .path = "/crypto/cipher/cast5-128",
-- 
2.31.1


