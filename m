Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73A55BE6F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:24:25 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63i4-0002E6-H2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633v-00081y-04
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633t-0006sg-Eb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jIPXKtPDOIaKtveN4KYmlBLs9WGMDzIvtvcv0OAZQ6o=;
 b=ZOFb8FolBq2EjSmY2PlU53ov0APi9fVuE04Ho1yqBCXpFkdhySs3F0mIIj625Y7iabRAlV
 EE8j25IEjMLZnDC17q+Et/w5w2VJzroXnshJlGbGrE5LlQdRHZXlHpkn2/FTLrI5vQ/oX0
 Xsu8NQxk6uMEGZ2BatjXWnthlI/tQlo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-wR21qW39OKuzMFR7IT33zQ-1; Tue, 28 Jun 2022 00:42:51 -0400
X-MC-Unique: wR21qW39OKuzMFR7IT33zQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4549997wmc.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jIPXKtPDOIaKtveN4KYmlBLs9WGMDzIvtvcv0OAZQ6o=;
 b=Dj2GfU2gx0exSOGhDYO282IJvwwHgkj8CW3yCbpI7ajc7aBoaTGB4ReLtunXzMssbW
 1wpKLPC4ucVvYDZz/bAS6cfL1K8v5do9R9oBPUt2uOhvMLlUvWmWIiFmLkJf83F5HAk1
 cmy7ULoKkHL0goCHUgUjFisjQ5OiyAgOq74YejLTCV4THUsx7MR6rHRLMzASr7X2jx1w
 fRvzyN2L8+0eo8opntwD4cL0/xG1/+A2qbQiL8bzhaUQNkr4pUc/pb/e88gfimHdniUu
 Jft48+65I/gXc6holzl6FE9SH+jxGB2kylgUIGC5G7LlMmMSuyJnykHQphuEMA2yTLnm
 fU+Q==
X-Gm-Message-State: AJIora+jRZ34JlqUgFYfUe9R9MYNlx4wpAWZ/ujkmEXAH775AXMDctIe
 NVXnmoKPtVNMVJMYg44+ZsMohbnW2sVPpP3NL2Yvatsm2w5IDhTfrCYiBR6oLPw8CPTtOK3Wwpr
 xrGQ278+5oLhh4Xl2ApEXLlsV5xOT0JKkU0S46E953lZi5++bxpuBrECGuyYV
X-Received: by 2002:a05:600c:1c27:b0:3a0:5098:c8b6 with SMTP id
 j39-20020a05600c1c2700b003a05098c8b6mr2886294wms.69.1656391369942; 
 Mon, 27 Jun 2022 21:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usNK1Zoq/Xl5vxBmD7SNQJjRVmlBjOR7hjBEBT56or67xmOst7eDQ01YgvjENxw7m0bOA8JA==
X-Received: by 2002:a05:600c:1c27:b0:3a0:5098:c8b6 with SMTP id
 j39-20020a05600c1c2700b003a05098c8b6mr2886270wms.69.1656391369647; 
 Mon, 27 Jun 2022 21:42:49 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 e3-20020adfef03000000b0021bbd525b8esm10779320wro.45.2022.06.27.21.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:49 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 07/12] libvhost-user: Fix VHOST_USER_GET_MAX_MEM_SLOTS reply
Message-ID: <20220628044201.217173-8-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Kevin Wolf <kwolf@redhat.com>

With REPLY_NEEDED, libvhost-user sends both the acutal result and an
additional ACK reply for VHOST_USER_GET_MAX_MEM_SLOTS. This is
incorrect, the spec mandates that it behave the same with and without
REPLY_NEEDED because it always sends a reply.

Fixes: 6fb2e173d20c9bbb5466183d33a3ad7dcd0375fa
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220627134500.94842-3-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b4cc3c2d68..cfa1bcc334 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1827,18 +1827,11 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
 
 static bool vu_handle_get_max_memslots(VuDev *dev, VhostUserMsg *vmsg)
 {
-    vmsg->flags = VHOST_USER_REPLY_MASK | VHOST_USER_VERSION;
-    vmsg->size  = sizeof(vmsg->payload.u64);
-    vmsg->payload.u64 = VHOST_USER_MAX_RAM_SLOTS;
-    vmsg->fd_num = 0;
-
-    if (!vu_message_write(dev, dev->sock, vmsg)) {
-        vu_panic(dev, "Failed to send max ram slots: %s\n", strerror(errno));
-    }
+    vmsg_set_reply_u64(vmsg, VHOST_USER_MAX_RAM_SLOTS);
 
     DPRINT("u64: 0x%016"PRIx64"\n", (uint64_t) VHOST_USER_MAX_RAM_SLOTS);
 
-    return false;
+    return true;
 }
 
 static bool
-- 
MST


