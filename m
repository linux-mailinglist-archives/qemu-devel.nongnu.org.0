Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560732EEAE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:23:55 +0100 (CET)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICJ0-0007y4-H3
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7S-0000Nj-Nb
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7P-0000Yj-IG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwUITLh7DanxHf2ZXN5CFzcBLbQSQkaevZRh+6hWBrU=;
 b=gbXFk4ZWkH/QQ1j1nxjsePAo7JWvWvW72zAUwMeiQLNtyX1vOxy7V+C1MO3CK/maZsIPBP
 WFb95i+G/Gi6m+ndUzlEXwoJopNFAseHCMMYI1BYadnbTCNO7NROnlZn8Wx2wjBx/l0p/d
 DZHNGoopclWdLwlkxsTVTgAje3XCOBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-V09vM242NQelZ6H4Ha5dHA-1; Fri, 05 Mar 2021 10:11:46 -0500
X-MC-Unique: V09vM242NQelZ6H4Ha5dHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66471E4963;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC705D6B1;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 870B91132C13; Fri,  5 Mar 2021 16:11:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] error: Fix "Converting to ERRP_GUARD()" doc on "valid at
 return"
Date: Fri,  5 Mar 2021 16:11:40 +0100
Message-Id: <20210305151143.741181-2-armbru@redhat.com>
In-Reply-To: <20210305151143.741181-1-armbru@redhat.com>
References: <20210305151143.741181-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting errp = NULL is wrong: the automatic error propagation still
propagates the dangling pointer _auto_errp_prop.local_err.  We need to
set *errp = NULL to clear the dangling pointer.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210125132635.1253219-1-armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qapi/error.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index eaa05c4837..4a9260b0cc 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -235,7 +235,7 @@
  *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...)
  *
  * 4. Ensure @errp is valid at return: when you destroy *errp, set
- *    errp = NULL.
+ *    *errp = NULL.
  *
  * Example:
  *
-- 
2.26.2


