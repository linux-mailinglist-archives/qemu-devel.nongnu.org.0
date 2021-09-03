Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE634005F2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:39:23 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMF22-0006EU-MG
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvD-0005iZ-Hl
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEv9-0003YH-W1
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+V6piWKKtsMf9Sz6Tt9oc/yE2HRvSfP5VOvoW0gligg=;
 b=bxdDk8ancpZl8UfY1V24nIQskZYn/Ig4Y8a9Uf06BXPHuQj1GZwXpyJGk5I/ntITq7NcLV
 4ulreRXRKFJzxm+YB3YLcKa2LA9d7Fp7huNtv4LS2B3S0HGRSmYkmlAW+V1thW/hhz1a1y
 q3RwhaZCxQx8b71FcXg0w0MuCtOMWxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-kpM_e7BmP4mXlX0XigGq8w-1; Fri, 03 Sep 2021 15:32:12 -0400
X-MC-Unique: kpM_e7BmP4mXlX0XigGq8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2A284A5E3;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8FC60BF1;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BC6BC1138611; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] qapi: Set boolean value correctly in examples
Date: Fri,  3 Sep 2021 21:31:57 +0200
Message-Id: <20210903193209.1426791-2-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Guoyi Tu <tugy@chinatelecom.cn>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guoyi Tu <tugy@chinatelecom.cn>

Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Message-Id: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/trace.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/trace.json b/qapi/trace.json
index 47c68f04da..eedfded512 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -99,7 +99,7 @@
 # Example:
 #
 # -> { "execute": "trace-event-set-state",
-#      "arguments": { "name": "qemu_memalign", "enable": "true" } }
+#      "arguments": { "name": "qemu_memalign", "enable": true } }
 # <- { "return": {} }
 #
 ##
-- 
2.31.1


