Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE204F2A74
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:59:50 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgub-0005wv-2n
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWt-00024D-BB
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWo-0000EL-Rj
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ngw9FjODfxRNrDclyFZayFe+2j5L8SFn7uO4bDuIis=;
 b=VoCYUCSzfsZjlNETvkzOaB/6VNzke9JM6kRAskpNWxBMZhsHwtbAQQEa2UDIviq3sm/nFe
 LCJhidIqj9u6OygOhrE6la4s3LyNC46tY2BFKlHnKdyQJSJ89YzQY+dRrAlfdESNi2IjKe
 X+hGad5vgxFbTbqt/S89lNb7HUo0fNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-TTEJmtP9OPKjyd174v8eJg-1; Tue, 05 Apr 2022 06:34:57 -0400
X-MC-Unique: TTEJmtP9OPKjyd174v8eJg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFC8D85A5A8;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBDAB463DEC;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5F8921E691D; Tue,  5 Apr 2022 12:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] qapi: fix examples: replay-break and replay-seek
Date: Tue,  5 Apr 2022 12:34:47 +0200
Message-Id: <20220405103455.4145273-3-armbru@redhat.com>
In-Reply-To: <20220405103455.4145273-1-armbru@redhat.com>
References: <20220405103455.4145273-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

From: Victor Toso <victortoso@redhat.com>

Both examples outputs are using @data member for the arguments. This
is wrong. The expected member for the QMP is @arguments. Fix it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220331190633.121077-3-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/replay.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/replay.json b/qapi/replay.json
index b4d1ba253b..351898f60d 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -81,7 +81,7 @@
 #
 # Example:
 #
-# -> { "execute": "replay-break", "data": { "icount": 220414 } }
+# -> { "execute": "replay-break", "arguments": { "icount": 220414 } }
 #
 ##
 { 'command': 'replay-break', 'data': { 'icount': 'int' } }
@@ -117,6 +117,6 @@
 #
 # Example:
 #
-# -> { "execute": "replay-seek", "data": { "icount": 220414 } }
+# -> { "execute": "replay-seek", "arguments": { "icount": 220414 } }
 ##
 { 'command': 'replay-seek', 'data': { 'icount': 'int' } }
-- 
2.35.1


