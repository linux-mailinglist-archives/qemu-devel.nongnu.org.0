Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43E2137C8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 11:35:35 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrI6Y-0006V5-N1
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 05:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrHtV-0002p3-Cl
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:22:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51815
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrHtT-0000yD-WC
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593768120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtvVYwlc1+ydxWQZdKR7ou+wPvfLfU9yuoxoUybNOEo=;
 b=dT6oHVtRx9wWNZleCPqjSGawhuUTrbSJpHmlRBr9VMOTMhmlnxUESZlTgwMkGdhcjZPs7O
 NUic3wh8s0nOjJ52zmSQFfw6cp7BVj8/L1UTqcyLnj2A8uY3Esp+9R5vTzgYhEq6GqiEhX
 dxUnfqewLI5OmnwdUUtdXhyqNBd8AjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-gGWpX8jtOZWUQrEghJhGmQ-1; Fri, 03 Jul 2020 05:21:56 -0400
X-MC-Unique: gGWpX8jtOZWUQrEghJhGmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29540107ACF3;
 Fri,  3 Jul 2020 09:21:55 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 350AD7AC63;
 Fri,  3 Jul 2020 09:21:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/7] qemu-storage-daemon: add missing cleanup calls
Date: Fri,  3 Jul 2020 11:21:39 +0200
Message-Id: <20200703092143.165594-4-kwolf@redhat.com>
In-Reply-To: <20200703092143.165594-1-kwolf@redhat.com>
References: <20200703092143.165594-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 02:53:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Several components used by qemu-storage-daemon have cleanup functions
that aren't called. Keep the "valgrind --leak-check=full" as clean as
possible by invoking the necessary cleanup functions.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200619101132.2401756-3-stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-storage-daemon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qemu-storage-daemon.c b/qemu-storage-daemon.c
index a01cbd6371..7e9b0e0d3f 100644
--- a/qemu-storage-daemon.c
+++ b/qemu-storage-daemon.c
@@ -335,5 +335,9 @@ int main(int argc, char *argv[])
         main_loop_wait(false);
     }
 
+    monitor_cleanup();
+    qemu_chr_cleanup();
+    user_creatable_cleanup();
+
     return EXIT_SUCCESS;
 }
-- 
2.25.4


