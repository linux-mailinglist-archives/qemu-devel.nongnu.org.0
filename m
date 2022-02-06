Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047324AAEC9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:16:49 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGebA-0000D3-37
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe04-0000Nf-Eh
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe02-0003i3-Hy
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WK+YLETmqJAgpCmbHz21EJfyUutFVg3g9CSFBrfdweQ=;
 b=BV6DeGdEjWt3VgCuZXR2lttHPGUZFcqURkW0MoHoNNku6AZCA6SwxRBoFdAtDdbGNzUhly
 2JctP3Xe3pRUkaE9C8j0ypiRUsdhZ+kBzF7bHQ4kbO7MoUkiSYNEQzFNfI18knOHYcUXMF
 ZOWYVoYYmeKpnuhZOsknpPGCBSr0S1o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-pZPHmoqjOdKAFJftvsoHQg-1; Sun, 06 Feb 2022 04:38:25 -0500
X-MC-Unique: pZPHmoqjOdKAFJftvsoHQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so10258521wms.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WK+YLETmqJAgpCmbHz21EJfyUutFVg3g9CSFBrfdweQ=;
 b=7S9hqQ+2O0r5YkaxNKz6NSEOgn5xDm5ORmtcOSj2c1M6iPlcF5U8RYapeE2DK2OyND
 Tkdo9Vx/FnGYz5B+CYPnBGf03518s/RHog+EPSuyPMqaicoRtVQAoGfmUkuIzD9gwQs2
 tfpuEvbXB7HOc69Oo5LNoqI2kDERevJ+LcgHKEwPPfIWgnIMJY3pNgkKHxSHru7ekfSE
 9CitCpSl/PEKyk4QrV0pyBwuRIVtS+cEkAMudJ0GSYMQm54ugE2klYNq1bGY3tHNKSsc
 oA9GpDm1VSEBKdaFH3y+BI514hSqdyyiUmDsV5JhSRxck46CuhfkwSQe0mClyI5eZQV1
 +pOQ==
X-Gm-Message-State: AOAM531jIyUyskm6mqDw0Zn/0EFvB8SAx9ltYlS2gmquJGYgO+VEXUUy
 7bD83nUxjkGbawO4dLt20uFp1gLiZFr5Y5RqzK08j7AbnHIteO1a34bkivC9ZNAemIDT/yGRdDX
 tgSv43ocNBebiNjP33M+hGhze8yywaGAFur74VONkssHEyDHzMDR4xpr5Avvj
X-Received: by 2002:a7b:c841:: with SMTP id c1mr6502481wml.136.1644140303371; 
 Sun, 06 Feb 2022 01:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2F8UrPT0CLSAJIxnWhMMfq91pjR0ZkxT9RCuW9hf0fG2eDxLZ3Pq7oBCOK3cnh0KqAov9fw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr6502465wml.136.1644140303174; 
 Sun, 06 Feb 2022 01:38:23 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id n22sm3122442wmc.48.2022.02.06.01.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:22 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/24] libvhost-user: handle removal of identical regions
Message-ID: <20220206093702.1282676-14-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

Today if QEMU (or any other VMM) has sent multiple copies of the same
region to a libvhost-user based backend and then attempts to remove the
region, only one instance of the region will be removed, leaving stale
copies of the region in dev->regions[].

This change resolves this by having vu_rem_mem_reg() iterate through all
regions in dev->regions[] and delete all matching regions.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-7-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 28 +++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2a1fa00a44..0ee43b8e93 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -821,6 +821,7 @@ static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
     int i;
+    bool found = false;
 
     if (vmsg->fd_num != 1) {
         vmsg_close_fds(vmsg);
@@ -856,21 +857,24 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
                 munmap(m, r->size + r->mmap_offset);
             }
 
-            break;
+            /*
+             * Shift all affected entries by 1 to close the hole at index i and
+             * zero out the last entry.
+             */
+            memmove(dev->regions + i, dev->regions + i + 1,
+                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
+            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRegion));
+            DPRINT("Successfully removed a region\n");
+            dev->nregions--;
+            i--;
+
+            found = true;
+
+            /* Continue the search for eventual duplicates. */
         }
     }
 
-    if (i < dev->nregions) {
-        /*
-         * Shift all affected entries by 1 to close the hole at index i and
-         * zero out the last entry.
-         */
-        memmove(dev->regions + i, dev->regions + i + 1,
-               sizeof(VuDevRegion) * (dev->nregions - i - 1));
-        memset(dev->regions + dev->nregions - 1, 0,
-               sizeof(VuDevRegion));
-        DPRINT("Successfully removed a region\n");
-        dev->nregions--;
+    if (found) {
         vmsg_set_reply_u64(vmsg, 0);
     } else {
         vu_panic(dev, "Specified region not found\n");
-- 
MST


