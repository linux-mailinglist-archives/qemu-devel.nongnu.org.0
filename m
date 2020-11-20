Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3D2BB144
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:20:49 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA5Y-0006uy-7f
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3Z-00056L-6W
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3X-00004t-Jk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=l4Vy6asA4vFLjzmGUFjTURo8wkeLrtw+JjHO2MqXWmk=;
 b=jBAE3mIOMn7Eeb5HWnfyZ8qVjZToTDKit+eYXsJnUlOyi11xf98SxH7cuizpnf+nw6aECM
 pnHjUAROOEhTNPNuad7U0Kd7ZEcRxn2H7i04AXcIEJ38fXtd4HRMBFP34zENyFYEgb2xBf
 EoIDj2QGoqi+QofgfV0wyMgsyKeJQj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-MTa_QCngNwKt5obDidQaXQ-1; Fri, 20 Nov 2020 12:18:40 -0500
X-MC-Unique: MTa_QCngNwKt5obDidQaXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 361E4911EC;
 Fri, 20 Nov 2020 17:18:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7F65D6CF;
 Fri, 20 Nov 2020 17:18:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/4] qtest: do not return freed argument vector from qtest_rsp
Date: Fri, 20 Nov 2020 18:18:28 +0100
Message-Id: <20201120171828.488611-5-thuth@redhat.com>
In-Reply-To: <20201120171828.488611-1-thuth@redhat.com>
References: <20201120171828.488611-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

If expected_args is 0, qtest frees the argument vector and then returns it
nevertheless.  Coverity complains; in practice this is not an issue because
expected_args == 0 means that the caller is not interested in the argument
vector, but it would be a potential problem if somebody wanted to add
commands with optional arguments to qtest.

Suggested-by: Kamil Dudka <kdudka@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201120073149.99079-1-pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index be0fb430dd..e49f3a1e45 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -545,6 +545,7 @@ redo:
         }
     } else {
         g_strfreev(words);
+        words = NULL;
     }
 
     return words;
-- 
2.18.4


