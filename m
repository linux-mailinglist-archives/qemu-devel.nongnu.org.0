Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470892D3F5E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:00:50 +0100 (CET)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwHB-0000sC-9g
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6B-0005O1-Ng
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw61-0007Q6-Mb
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=tPYQuJfAFpwqk/56/qEDeo41MhtdTN/7twypqmUBF6w=;
 b=NNnvkpNGzwQJs5mywozHHjyVPoFCj00LF6Fidp781SYN9dwn2gnl95iOnxTjudP1dwfV2l
 h0falAR8wtfNSc+igr65b2gotqXcTth4LeEiy9pWfDZysbwfuEPZ5YUGfQPXDmSy8q3eqj
 o8nzUjmR5YcW5BUf0qthzkBNOY3jzfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-t9Vc4PWUNi-TK4PMZer-8g-1; Wed, 09 Dec 2020 04:49:14 -0500
X-MC-Unique: t9Vc4PWUNi-TK4PMZer-8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82271927803;
 Wed,  9 Dec 2020 09:49:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB4A55C234;
 Wed,  9 Dec 2020 09:49:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/13] fuzz: avoid double-fetches by default
Date: Wed,  9 Dec 2020 10:48:51 +0100
Message-Id: <20201209094856.17788-9-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

The generic fuzzer can find double-fetch bugs. However:
* We currently have no good way of producing qemu-system reproducers for
  double-fetch bugs. Even if we can get developers to run the binary-blob
  reproducers with the qemu-fuzz builds, we currently don't have a minimizer for
  these reproducers, so they are usually not easy to follow.
* Often times the fuzzer will provide a reproducer containing a
  double-fetch for a bug that can be reproduced without double-fetching.

Until we find a way to build nice double-fetch reproducers that
developers are willing to look at, lets tell OSS-Fuzz to avoid
double-fetches.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20201202164214.93867-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 262a963d2e..07ad690683 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -916,6 +916,7 @@ static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
     g_assert(t->opaque);
 
     config = t->opaque;
+    setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
     setenv("QEMU_FUZZ_ARGS", config->args, 1);
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
-- 
2.18.4


