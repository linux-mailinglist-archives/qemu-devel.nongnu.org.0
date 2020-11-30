Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC52C82C4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:02:55 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgxK-0002Ar-IJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrp-0006eb-5t
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrn-00064D-LE
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606733831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEip2j71Edqqa1PCGfx1mJTINqjJV4OUvhnOpck7vbc=;
 b=bcmxzSn/DQluacTMENAp3ssLfbCy1M+tLiIa6Fis/abQ0+i/q/Ai6sOAM4gCrks9XIrw+J
 0Vfy7VGIiQeQ/JOXZequ5mFxEyy9CMV1Ei58sqdD2uOpDGnKVBaViEc7PA4FuHrRHuEC6U
 FWnwqdBEkauZMbWqeR0T+9gg/aiVaM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-xbs4Y6FvPkG6tDUVfXeqBg-1; Mon, 30 Nov 2020 05:57:08 -0500
X-MC-Unique: xbs4Y6FvPkG6tDUVfXeqBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7FB8144F2;
 Mon, 30 Nov 2020 10:57:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37B491346F;
 Mon, 30 Nov 2020 10:57:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] crypto: Forbid broken unloading of secrets
Date: Mon, 30 Nov 2020 11:56:13 +0100
Message-Id: <20201130105615.21799-3-kwolf@redhat.com>
In-Reply-To: <20201130105615.21799-1-kwolf@redhat.com>
References: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, jasowang@redhat.com, fnu.vikram@xilinx.com,
 berrange@redhat.com, pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.28.0


