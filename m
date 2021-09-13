Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BF4088A7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:59:29 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPikK-0005kc-2d
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPic0-00007S-Fg
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibv-00073y-3w
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631526646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ih3xKVtC8HRP3geypL4wwOximBaYMWR1t2LiU50XzGY=;
 b=N0elxKwUn9YJazMv2h46OQZ6oQ0HQNMoE8Vn6uraQTarkGmP7qcOxIQARmXwfHbdUZxCEn
 zflktNW0Do3jF3q7a8qx2hiqdDUK+nl57qhxC2GiDXKF+coYAimWxbS3lUgWDwz+DzwVcK
 cUgXt+l9gXPLbfUKWh4+OKVs2kpjiIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-CmEcvYJ4NN6LAzohguJkmQ-1; Mon, 13 Sep 2021 05:50:44 -0400
X-MC-Unique: CmEcvYJ4NN6LAzohguJkmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1455A1923768;
 Mon, 13 Sep 2021 09:50:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D61146A257;
 Mon, 13 Sep 2021 09:50:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BB97113861E; Mon, 13 Sep 2021 11:50:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] qapi: Fix a botched type annotation
Date: Mon, 13 Sep 2021 11:50:34 +0200
Message-Id: <20210913095038.3040776-2-armbru@redhat.com>
In-Reply-To: <20210913095038.3040776-1-armbru@redhat.com>
References: <20210913095038.3040776-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mypy is unhappy:

    $ mypy --config-file=scripts/qapi/mypy.ini `git-ls-files scripts/qapi/\*py`
    scripts/qapi/common.py:208: error: Function is missing a return type annotation
    scripts/qapi/common.py:227: error: Returning Any from function declared to return "str"

Messed up in commit ccea6a8637 "qapi: Factor common recursion out of
cgen_ifcond(), docgen_ifcond()".  Tidy up.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210908045428.2689093-2-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 5f8f76e5b2..c4d11b9637 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -205,7 +205,8 @@ def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
 
-    def do_gen(ifcond: Union[str, Dict[str, Any]], need_parens: bool):
+    def do_gen(ifcond: Union[str, Dict[str, Any]],
+               need_parens: bool) -> str:
         if isinstance(ifcond, str):
             return cond_fmt % ifcond
         assert isinstance(ifcond, dict) and len(ifcond) == 1
-- 
2.31.1


