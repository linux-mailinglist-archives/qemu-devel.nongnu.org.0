Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90F346BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:07:28 +0100 (CET)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpBP-0006m8-60
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Z-00075v-3b
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1P-0002n3-Vk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21nJvjA+GH2g+nMkZt6Wt4tRob7Dh6P7KVMyu2vIfpg=;
 b=bY8+kYbTRoIxZ8vDEqXNbIcns9Bt4wbEMO/MaGJ+3UDMB1UAQFf4LhKCqYPXG9TyISy9kU
 IbEAHPBGNiR/H7Ks85HL3HUGuBMjpLwtKTipEmtGuM92v+JkTRj0iRtcNuAF1+/hbMO1iX
 EA8nCOQ9cB5i4C1ekMepKyu3bi/+bdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-v23-f4aKMhm1iQm1FtFFPQ-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: v23-f4aKMhm1iQm1FtFFPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA436100747E;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3030D2BFC7;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C63EF11326A6; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] tests/qapi-schema: Rename returns-whitelist to
 returns-bad-type
Date: Tue, 23 Mar 2021 22:56:47 +0100
Message-Id: <20210323215658.3840228-19-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test covers returning "bad" types.  Pragma returns-whitelist is
just one aspect.  Naming it returns-whitelist is suboptimal.  Rename
to returns-bad-type.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-19-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qapi-schema/meson.build                                   | 2 +-
 tests/qapi-schema/returns-bad-type.err                          | 2 ++
 .../{returns-whitelist.json => returns-bad-type.json}           | 0
 .../qapi-schema/{returns-whitelist.out => returns-bad-type.out} | 0
 tests/qapi-schema/returns-whitelist.err                         | 2 --
 5 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 tests/qapi-schema/returns-bad-type.err
 rename tests/qapi-schema/{returns-whitelist.json => returns-bad-type.json} (100%)
 rename tests/qapi-schema/{returns-whitelist.out => returns-bad-type.out} (100%)
 delete mode 100644 tests/qapi-schema/returns-whitelist.err

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index ffc276b765..4e7635f0a8 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -166,9 +166,9 @@ schemas = [
   'reserved-type-list.json',
   'returns-alternate.json',
   'returns-array-bad.json',
+  'returns-bad-type.json',
   'returns-dict.json',
   'returns-unknown.json',
-  'returns-whitelist.json',
   'string-code-point-31.json',
   'string-code-point-127.json',
   'struct-base-clash-deep.json',
diff --git a/tests/qapi-schema/returns-bad-type.err b/tests/qapi-schema/returns-bad-type.err
new file mode 100644
index 0000000000..2c270de9ad
--- /dev/null
+++ b/tests/qapi-schema/returns-bad-type.err
@@ -0,0 +1,2 @@
+returns-bad-type.json: In command 'no-way-this-will-get-whitelisted':
+returns-bad-type.json:14: command's 'returns' cannot take array type ['int']
diff --git a/tests/qapi-schema/returns-whitelist.json b/tests/qapi-schema/returns-bad-type.json
similarity index 100%
rename from tests/qapi-schema/returns-whitelist.json
rename to tests/qapi-schema/returns-bad-type.json
diff --git a/tests/qapi-schema/returns-whitelist.out b/tests/qapi-schema/returns-bad-type.out
similarity index 100%
rename from tests/qapi-schema/returns-whitelist.out
rename to tests/qapi-schema/returns-bad-type.out
diff --git a/tests/qapi-schema/returns-whitelist.err b/tests/qapi-schema/returns-whitelist.err
deleted file mode 100644
index c6e46b9b86..0000000000
--- a/tests/qapi-schema/returns-whitelist.err
+++ /dev/null
@@ -1,2 +0,0 @@
-returns-whitelist.json: In command 'no-way-this-will-get-whitelisted':
-returns-whitelist.json:14: command's 'returns' cannot take array type ['int']
-- 
2.26.3


