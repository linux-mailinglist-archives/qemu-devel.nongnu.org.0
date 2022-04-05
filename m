Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57634F2981
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:35:31 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfb1-0008PQ-0f
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMB-0006mO-Kd
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfM8-0001os-4x
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649150405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65LAApyknJ4Ap/WBTWbz9LDqY048gEZBR+OKXqDXuFo=;
 b=L3q8GMJd3SRnA2aNrRaJEDfsGCG5QTDkT3RoPSfKUjULFOEljr8m3UY6IdPey/c8bl4xrE
 jUGu0Wnep3xlBFE4jOwBL1AUmaHR/29nbQkiKejkvptjSUmXbiiPuSV6t0gibx0f1WS8gM
 VZG4xL3MGaiLyVPCdF6AlaNhcXlPviw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-P4gyo0feNF-kgldOZDbNEw-1; Tue, 05 Apr 2022 05:20:04 -0400
X-MC-Unique: P4gyo0feNF-kgldOZDbNEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB436801585
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 09:20:03 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.32.181.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6582167D9B
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 09:20:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] coverity: update model for latest tools
Date: Tue,  5 Apr 2022 11:19:59 +0200
Message-Id: <20220405092001.104507-2-pbonzini@redhat.com>
In-Reply-To: <20220405092001.104507-1-pbonzini@redhat.com>
References: <20220405092001.104507-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity is now rejecting incomplete types in the modeling file.
Just use a random number (in the neighborhood of the actual one)
for the size of a GIOChannel.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 9d4fba53d9..686d1a3008 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -356,7 +356,8 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
 typedef struct _GIOChannel GIOChannel;
 GIOChannel *g_io_channel_unix_new(int fd)
 {
-    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
+    /* cannot use incomplete type, the actual struct is roughly this size.  */
+    GIOChannel *c = g_malloc0(20 * sizeof(void *));
     __coverity_escape__(fd);
     return c;
 }
-- 
2.35.1



