Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5C5EBE14
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:15:47 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6gs-0006cp-4e
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oV-0005Ua-8N
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oP-0000JV-VY
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIdR0vI29oZeRCFZBp8CQiXoR7cYaIYvZ9xzZVFSJ94=;
 b=TQty7XSZx+vhNYlTAn90J57aTXXfk99bQBFBRhW+TusEHoc5zCzyRWU+Wuz7cNG9QBee1o
 gwskmxcdvyk7SiUa6kcBgRUm8kjO0+dOEWId135jgyS0/aXyxeHyKpXtHcdr1xlynbiVpZ
 RJREE+bWEgMWnz7HV+281IfUFPuk5Ys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-xyPk2uJbMoWNxEez66wYJA-1; Tue, 27 Sep 2022 04:19:28 -0400
X-MC-Unique: xyPk2uJbMoWNxEez66wYJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CC585A583;
 Tue, 27 Sep 2022 08:19:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4469A1402BDE;
 Tue, 27 Sep 2022 08:19:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6F8C180099C; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Qiang Liu <cyruscyliu@gmail.com>
Subject: [PULL 15/24] hcd-xhci: drop operation with secondary stream arrays
 enabled
Date: Tue, 27 Sep 2022 10:19:03 +0200
Message-Id: <20220927081912.180983-16-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


