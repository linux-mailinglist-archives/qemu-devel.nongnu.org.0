Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508368CFC2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHkh-00085A-Bo; Tue, 07 Feb 2023 01:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHk1-0007LX-6h
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjz-00044B-Ff
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675752366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mio3AGiefmL/jc/ixLRzIIZ2DOgsg5gqJq29mnTQ8ok=;
 b=Kc+NDROeyjCt1yOfoS9sHuvSRqr1NdJ9E8XajcHgLM0SnGisgBsdJyTnziuNo6LzZZTGvk
 0OYb5Xzxv2YyM8qTwwRNkSsKB02JgB1OHMPXwM8bSoTM1gUkb6HQPGuOQm+A9HBi5mqwKf
 fClWXX2+PXDtt/IzM8ag91xJvyANvxw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-NgY-KWpBNqGPht3JI7oKEQ-1; Tue, 07 Feb 2023 01:45:25 -0500
X-MC-Unique: NgY-KWpBNqGPht3JI7oKEQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EE7185A5B1;
 Tue,  7 Feb 2023 06:45:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36BD5492B21;
 Tue,  7 Feb 2023 06:45:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4E3D21E6A21; Tue,  7 Feb 2023 07:45:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 02/20] scripts/clean-includes: Don't claim duplicate headers
 found when not
Date: Tue,  7 Feb 2023 07:45:05 +0100
Message-Id: <20230207064523.3968603-3-armbru@redhat.com>
In-Reply-To: <20230207064523.3968603-1-armbru@redhat.com>
References: <20230207064523.3968603-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

When running with --check-dup-head, the script always claims it "Found
duplicate header file includes."  Fix to do it only when it actually
found some.

Fixes: d66253e46ae2 ("scripts/clean-includes: added duplicate #include check")
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20230202133830.2152150-3-armbru@redhat.com>
---
 scripts/clean-includes | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 86944f27fc..8e8420d785 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -177,9 +177,8 @@ for f in "$@"; do
 done
 
 if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
-    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
-        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
-    if [ $? -eq 0 ]; then
+    if egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
+        | sort | uniq -c | grep -v '^ *1 '; then
         echo "Found duplicate header file includes. Please check the above files manually."
         exit 1
     fi
-- 
2.39.0


