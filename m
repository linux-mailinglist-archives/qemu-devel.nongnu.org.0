Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96368B9E2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOycM-0002SW-1w; Mon, 06 Feb 2023 05:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOyc7-0002Fb-AP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOyc5-0001Kl-IR
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675678840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W2UFCAH60hTZiIVfuXmzBvSVzM2fQE5o9aZjgR5+A00=;
 b=X4KfkGiKIDFTRqEVRnBPjUHrFC2OGicSZdGvR2PKHc/CE2oQHBhi5TNXizLtUxmY7XsugY
 IrrIARyk0ifQXTXBiEnDuWl1EE9Hly9Tu2uYc/F4o8PYVEPkYeInVHvVV8wNIs7510NPGH
 26qKhY43/hQiO39Lzk49c1Yg0L7LRTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-Y7lhrmX_PdiliYinRwqz4g-1; Mon, 06 Feb 2023 05:20:38 -0500
X-MC-Unique: Y7lhrmX_PdiliYinRwqz4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F81183B3C1
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 10:20:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D0B2166B29
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 10:20:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21FBE21E6A1F; Mon,  6 Feb 2023 11:20:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] meson: Avoid duplicates in generated config-poison.h again
Date: Mon,  6 Feb 2023 11:20:37 +0100
Message-Id: <20230206102037.3621709-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Commit eed56e9a89f "configure, meson: move config-poison.h to meson"
lost a "| sort -u".  Restore it.  config-poison shrinks from ~4500 to
~700 lines when all targets are enabled.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/make-config-poison.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
index d222a04304..1892854261 100755
--- a/scripts/make-config-poison.sh
+++ b/scripts/make-config-poison.sh
@@ -13,4 +13,4 @@ exec sed -n \
   -e    's///' \
   -e    's/ .*//' \
   -e    's/^/#pragma GCC poison /p' \
-  -e '}' "$@"
+  -e '}' "$@" | sort -u
-- 
2.39.0


