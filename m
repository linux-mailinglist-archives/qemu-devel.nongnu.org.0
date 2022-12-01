Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1F63ED8D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:21:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ggF-0004DF-Hn; Thu, 01 Dec 2022 05:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfp-0004AB-Nc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfl-0006ze-Ft
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxWdceZVkvMSao5c21nPBOAg8xKBEqGtd/xWk9Y1Z8k=;
 b=eAOXbqW5BN4rCHN3nEwqC0XNwo/gZSyUrue4zBX+eGEJYM9N2yyYPGw3H5le4VFOuAj5So
 3e7IE2TBmGGW67gzsIdCwQhGSSt7c4eupPaEFhhb4/7ZmWe3WnUZi8iXb/xNSydvLTjUBR
 6eEaCe9TfkkUHvkqFvg2WPCZVUkPzNM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-55mXHlbwOLSMJv3hQizRGA-1; Thu, 01 Dec 2022 05:20:01 -0500
X-MC-Unique: 55mXHlbwOLSMJv3hQizRGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EAF729DD9B8;
 Thu,  1 Dec 2022 10:20:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6F572166BA5;
 Thu,  1 Dec 2022 10:20:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, libvir-list@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/3] block: mention 'password-secret' option for -iscsi
Date: Thu,  1 Dec 2022 05:19:57 -0500
Message-Id: <20221201101959.419545-2-berrange@redhat.com>
In-Reply-To: <20221201101959.419545-1-berrange@redhat.com>
References: <20221201101959.419545-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'password-secret' option was added

  commit b189346eb1784df95ed6fed610411dbf23d19e1f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Thu Jan 21 14:19:21 2016 +0000

    iscsi: add support for getting CHAP password via QCryptoSecret API

but was not mentioned in the command line docs

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b23..055df73306 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1889,7 +1889,7 @@ SRST
 ERST
 
 DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
-    "-iscsi [user=user][,password=password]\n"
+    "-iscsi [user=user][,password=password],password-secret=secret-id]\n"
     "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
     "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
     "       [,timeout=timeout]\n"
-- 
2.38.1


