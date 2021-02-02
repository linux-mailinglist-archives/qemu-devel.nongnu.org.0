Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D782E30C4C8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:04:45 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yAW-0005hD-R9
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xp4-0000AR-U0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xox-0003kj-Jp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6GlXwQdZFHER7NZ9Uc0kVz4OGfeJoBR/Pttd2LGiSs=;
 b=cZHUI2xY5ryMvKU2OOjyaYnvvHkww92tsc5ytT9gKaHMAtwEpjztnyUSSLxPS4Y6n0X7k+
 tizCseZTWJLjgP0A3ODjUD83Mwm2gQnlPB0sNtzZP2JkGNZ4Zk2MNfliUkCDgxjF/1dXv5
 qK1zMQ2SzdUpcqCfwH0pVj7lqIr0LHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-XLXCnolBMG-_VKfFIimnXA-1; Tue, 02 Feb 2021 10:42:22 -0500
X-MC-Unique: XLXCnolBMG-_VKfFIimnXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE40981621;
 Tue,  2 Feb 2021 15:42:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-202.ams2.redhat.com
 [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17F5E1980D;
 Tue,  2 Feb 2021 15:42:18 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 11/12] iotests: fix loading of common.config from tests/
 subdir
Date: Tue,  2 Feb 2021 15:41:37 +0000
Message-Id: <20210202154138.246464-12-berrange@redhat.com>
In-Reply-To: <20210202154138.246464-1-berrange@redhat.com>
References: <20210202154138.246464-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

common.rc assumes it is being sourced from the same directory and
so also tries to source common.config from the current working
directory. With the ability to now have named tests in the tests/
subdir we need to check two locations for common.config.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 297acf9b6a..77c37e8312 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -109,8 +109,14 @@ peek_file_raw()
     dd if="$1" bs=1 skip="$2" count="$3" status=none
 }
 
-
-if ! . ./common.config
+config=common.config
+test -f $config || config=../common.config
+if ! test -f $config
+then
+    echo "$0: failed to find common.config"
+    exit 1
+fi
+if ! . $config
     then
     echo "$0: failed to source common.config"
     exit 1
-- 
2.29.2


