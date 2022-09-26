Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD855E9EDF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:15:39 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl9G-0007fZ-Dt
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpq-0005Q7-B6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpn-0003nB-N1
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIdR0vI29oZeRCFZBp8CQiXoR7cYaIYvZ9xzZVFSJ94=;
 b=ih8k0mS/59r7VS2qmt5E6mbfH/8ZMaizYOyo778RsiRWDwToiDtwOvbmfM1/mtnlYHvj8P
 28FOVtQi7/haYwHL5o2j0cuxZZztv7Q4kzdM+ugXjL9lwBBehV698pkMVNJAENuc7JR7AE
 l4MxdmngdCTahYCHtwMEnipUTuSeqYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-yg-xe8O6MkmeUPftbKzi0Q-1; Mon, 26 Sep 2022 05:55:27 -0400
X-MC-Unique: yg-xe8O6MkmeUPftbKzi0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25B5B872841;
 Mon, 26 Sep 2022 09:55:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D064540C6EC2;
 Mon, 26 Sep 2022 09:55:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D4B5518030BB; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>
Subject: [PULL 16/25] hcd-xhci: drop operation with secondary stream arrays
 enabled
Date: Mon, 26 Sep 2022 11:55:00 +0200
Message-Id: <20220926095509.3759409-17-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiang Liu <cyruscyliu@gmail.com>

The abort() in xhci_find_stream() can be triggered via enabling the secondary
stream arrays by setting linear stream array (LSA) bit (in endpoint context) to
0. We may show warnings and drop this operation.

Fixes: 024426acc0a2 ("usb-xhci: usb3 streams")
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1192
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Message-Id: <20220904125926.2141607-1-cyruscyliu@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index acd60b1a4904..8299f35e6695 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -1020,7 +1020,9 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPContext *epctx,
         }
         sctx = epctx->pstreams + streamid;
     } else {
-        FIXME("secondary streams not implemented yet");
+        fprintf(stderr, "xhci: FIXME: secondary streams not implemented yet");
+        *cc_error = CC_INVALID_STREAM_TYPE_ERROR;
+        return NULL;
     }
 
     if (sctx->sct == -1) {
-- 
2.37.3


