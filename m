Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55B4F2A79
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:03:58 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgyb-0002GY-F9
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWs-00021w-6b
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWo-0000H1-9Z
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAYlcSOjelFUVVkytt3FoJg5qyQ3x6afFGMG4S6Gqlk=;
 b=Xxpw16j/hiY7Of8pWlDgU4G9vn0QuPB6lCRrH/pJKcfAiNGexVMOWlfy6sHuKxmifcva1Q
 IIQDDqpnHr2lyM9qdIhrSQn2yT/qpeBhtVI2mExE2faOqaw3Cbmkg6R6ABzl4Qtsmz3iH4
 MI463IhgJsuweffIoRTEhv+XJoPbzgA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-S9bZoDpZMw6RDjfXQKVc7A-1; Tue, 05 Apr 2022 06:34:58 -0400
X-MC-Unique: S9bZoDpZMw6RDjfXQKVc7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAB4A3822203;
 Tue,  5 Apr 2022 10:34:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8882492D58;
 Tue,  5 Apr 2022 10:34:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7FD021E6936; Tue,  5 Apr 2022 12:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] qapi: Fix calc-dirty-rate example
Date: Tue,  5 Apr 2022 12:34:55 +0200
Message-Id: <20220405103455.4145273-11-armbru@redhat.com>
In-Reply-To: <20220405103455.4145273-1-armbru@redhat.com>
References: <20220405103455.4145273-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The example shows {"command": ...}, which is wrong.  Fix it to
{"execute": ...}.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220401082028.3583296-1-armbru@redhat.com>
Reviewed-by: Victor Toso <victortoso@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index f74777608a..27d7b28158 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1845,7 +1845,7 @@
 # Since: 5.2
 #
 # Example:
-#   {"command": "calc-dirty-rate", "arguments": {"calc-time": 1,
+#   {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
 #                                                'sample-pages': 512} }
 #
 ##
-- 
2.35.1


