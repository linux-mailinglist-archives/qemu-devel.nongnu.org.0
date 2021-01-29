Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF2308BA4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:39:56 +0100 (CET)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XkR-0006Bv-FO
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIv-0003KJ-0t
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIt-0006zb-0V
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Y+XsgsuNWj+0ga3joW8YXXOVTV8AzQFFMVZpMMxo6M=;
 b=BBblSEEKp7PmsRHkpiSjc2EE5YK9er8onND1yqz7iq0LscoJNFAueMx78JSUGqJ0zVPHLJ
 9LDHj8saCxjrrIufkucRy1AeiwOevncuduZY0fSuVh4Wfd4zPWfDbb92TmGzvl+6Wmo9me
 Ql0EUAtMuW0vRBYS83zsb+yARE8N8zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-W_8jGL40N0qDLva7IsLrWg-1; Fri, 29 Jan 2021 12:11:22 -0500
X-MC-Unique: W_8jGL40N0qDLva7IsLrWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A138735D0;
 Fri, 29 Jan 2021 17:11:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2827A5D705;
 Fri, 29 Jan 2021 17:11:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] crypto: Forbid broken unloading of secrets
Date: Fri, 29 Jan 2021 17:10:52 +0000
Message-Id: <20210129171102.4109641-4-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

qcrypto_secret_prop_set_loaded() forgets to reset secret->rawdata after
unloading a secret, which will lead to a double free at some point.

Because there is no use case for unloading an already loaded secret
(apart from deleting the whole secret object) and we know that nobody
could use this because it would lead to crashes, let's just forbid the
operation instead of fixing the unloading.

Eventually, we'll want to get rid of 'loaded' in the external interface,
but for the meantime this is more consistent with rng, which has a
similar property 'opened' that also can't be reset to false after it
became true.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/secret_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/secret_common.c b/crypto/secret_common.c
index 35b82cb531..714a15d5e5 100644
--- a/crypto/secret_common.c
+++ b/crypto/secret_common.c
@@ -191,9 +191,9 @@ qcrypto_secret_prop_set_loaded(Object *obj,
 
         secret->rawdata = input;
         secret->rawlen = inputlen;
-    } else {
-        g_free(secret->rawdata);
-        secret->rawlen = 0;
+    } else if (secret->rawdata) {
+        error_setg(errp, "Cannot unload secret");
+        return;
     }
 }
 
-- 
2.29.2


