Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7E6A0891
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdN-0002yk-RQ; Thu, 23 Feb 2023 07:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdL-0002xk-MO
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdK-0003yY-0T
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vhFRU/UKtNpcUDpNmY0QPHvlmmZdAVaFnOsl5iQ5H0=;
 b=CJkqGMsuN8O2NNvZtDkVTzS1UZIvJGJHA+AofzID9bOPVXv6G/lL6dkfsiOFzRMN2lyZHB
 Jj0COBKwjqb4dAqJE2JJh5kO6oytUxeuYhLkYwReo8lHLoMqqatxMGvueWdBthkFgbubel
 YJWKqHuDvAQD6JEBiJyGewwfUaRak9E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-LFz2XuiyM12oiEPgsiaL4A-1; Thu, 23 Feb 2023 07:23:30 -0500
X-MC-Unique: LFz2XuiyM12oiEPgsiaL4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112C43813F38;
 Thu, 23 Feb 2023 12:23:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A811121314;
 Thu, 23 Feb 2023 12:23:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FB1B21E6A24; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	John Snow <jsnow@redhat.com>
Subject: [PULL 5/8] qapi: Add minor typing workaround for 3.6
Date: Thu, 23 Feb 2023 13:23:24 +0100
Message-Id: <20230223122327.1920247-6-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

Pylint under 3.6 does not believe that Collection is subscriptable at
runtime. It is, making this a Pylint
bug. https://github.com/PyCQA/pylint/issues/2377

They closed it as fixed, but that doesn't seem to be true as of Pylint
2.13.9, the latest version you can install under Python 3.6. 2.13.9 was
released 2022-05-13, about seven months after the bug was closed.

The least-annoying fix here is to just use the concret type.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230215000011.1725012-4-jsnow@redhat.com>
[Dumbed down from Sequence[str] to List[str], commit message adjusted]
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5a1782b57e..358b8e2a8b 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -33,7 +33,6 @@
 
 import re
 from typing import (
-    Collection,
     Dict,
     Iterable,
     List,
@@ -195,8 +194,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
 def check_keys(value: _JSONObject,
                info: QAPISourceInfo,
                source: str,
-               required: Collection[str],
-               optional: Collection[str]) -> None:
+               required: List[str],
+               optional: List[str]) -> None:
     """
     Ensure that a dict has a specific set of keys.
 
-- 
2.39.0


