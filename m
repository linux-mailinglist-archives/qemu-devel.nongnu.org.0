Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EB4149FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:00:29 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1rQ-0003oG-2i
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT1nc-0002NW-3W
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT1nZ-0001KQ-3T
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632315383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwLwE/eXUJjiQ8akFWRgN7NpWcVKHtD8YU9p5p/m+Oc=;
 b=QeB7nT3u26oNGyc0yvdoNYV1qH3VHlnXwujKFurEH1EHkNBMCA6tlddJ9JwY9NKRpc4i42
 ohgSSJgSaFB+ZMriNdutB+d+0/lDMoo37BpRW+JdAkLNpaOjeHvt8P0KpnRPRJjhZeM9RL
 szCciwklskPrWt6Td3uXgDqO5/kxz+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-J1ZFU-H7NNm64nPxOz-L9g-1; Wed, 22 Sep 2021 08:56:22 -0400
X-MC-Unique: J1ZFU-H7NNm64nPxOz-L9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E61B18D6A2A;
 Wed, 22 Sep 2021 12:56:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7AE60BF4;
 Wed, 22 Sep 2021 12:56:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC269113861E; Wed, 22 Sep 2021 14:56:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/qapi-schema: Use Python OSError instead of outmoded
 IOError
Date: Wed, 22 Sep 2021 14:56:18 +0200
Message-Id: <20210922125619.670673-2-armbru@redhat.com>
In-Reply-To: <20210922125619.670673-1-armbru@redhat.com>
References: <20210922125619.670673-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: marcandre.lureau@gmail.com, jsnow@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/test-qapi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 73cffae2b6..2e384f5efd 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
         errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
         expected_out = outfp.readlines()
         expected_err = errfp.readlines()
-    except IOError as err:
+    except OSError as err:
         print("%s: can't open '%s': %s"
               % (sys.argv[0], err.filename, err.strerror),
               file=sys.stderr)
@@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
         errfp.truncate(0)
         errfp.seek(0)
         errfp.writelines(actual_err)
-    except IOError as err:
+    except OSError as err:
         print("%s: can't write '%s': %s"
               % (sys.argv[0], err.filename, err.strerror),
               file=sys.stderr)
-- 
2.31.1


