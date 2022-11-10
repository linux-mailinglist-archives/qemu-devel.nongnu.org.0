Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09918624298
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:53:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot72y-00044o-1l; Thu, 10 Nov 2022 07:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot72o-00044C-3B
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot72m-0007VH-Ol
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668084751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yt3kIUE40aFmrB/WJw24YkSi3cH7sKtl0qiAtyDPQSc=;
 b=i7FVHAeFyNfxUVK+kGaWzG0nGDapDNby4egc/6B679cyrqEGfim8UAiKxqTkcVWFq+mzRU
 VOVUCh1/RKwPuzSbVLCAFK/jV5l2TjkDZwFXDdDqMDsThbf4HjBzwLwLLTTPHNLky2Untp
 H8veNjwUKQwBLUXYW7irkjilLjep6b8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-USV8hlDjPRCIXRQ1j5RgZg-1; Thu, 10 Nov 2022 07:52:30 -0500
X-MC-Unique: USV8hlDjPRCIXRQ1j5RgZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F2C21C05AAB;
 Thu, 10 Nov 2022 12:52:30 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 166302166B29;
 Thu, 10 Nov 2022 12:52:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 3/3] net: Replace "Supported NIC models" with "Available
 NIC models"
Date: Thu, 10 Nov 2022 13:52:24 +0100
Message-Id: <20221110125224.99596-4-thuth@redhat.com>
In-Reply-To: <20221110125224.99596-1-thuth@redhat.com>
References: <20221110125224.99596-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Just because a NIC model is compiled into the QEMU binary does not
necessary mean that it can be used with each and every machine.
So let's rather talk about "available" models instead of "supported"
models, just to avoid confusion.

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index cdd3ebc515..5d96c8858f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -941,7 +941,7 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
         return 0;
     }
 
-    printf("Supported NIC models:\n");
+    printf("Available NIC models:\n");
     for (i = 0 ; models[i]; i++) {
         printf("%s\n", models[i]);
     }
-- 
2.31.1


