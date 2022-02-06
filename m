Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F64AAEAA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:48:43 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe9z-0004bD-2o
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzu-0000DI-Po
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzq-0003g7-UD
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBmM0KuFSdatxXqXavJnWM1XP+AlL96uwaW9+q+ldEs=;
 b=I1zfdC4PZnNHaEY4RUqFDRf99FSB0CCYd57G1vo5Hj9B746lO1VXKaktyEHbEhGmYn6kQ/
 WZ8M+fB3Bg8kbMsC1UcFgc5FmWCYAiGYXrzolrO4IH+fIDNPr51Pvgwv54laSFH70r0xb4
 gyfPDZ3KoeB3rK1kavOYRn7gTox+mUI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-jUJflfQ8NPqkwivACYCfSg-1; Sun, 06 Feb 2022 04:38:13 -0500
X-MC-Unique: jUJflfQ8NPqkwivACYCfSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r205-20020a1c44d6000000b0037bb51b549aso1802493wma.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PBmM0KuFSdatxXqXavJnWM1XP+AlL96uwaW9+q+ldEs=;
 b=WZrhdT3+y91c8NOK5QGNVUu0nMKbinK+UlO2WsHMdsAFcxhpJcQ/qwoATA3ItSsIX2
 JNUDoVISK8sZHuUJ2yXzKCvzCMfd6HyC47qeADjHCtAnSpON/iuUHgRdyVjX30/9sEPD
 A45CykNHk+ZU9InoUSXpqOab7WotmX72ypw7YG+bhca/84fBKnv5wMwIHgfyOEPQMD+q
 JJaGpM+mPglhFLfIsicLAxK5H21jOaK0ktZH4SnWfIW2GMESd1H7QkTObhPldqHOIqXM
 PZUBAdZBPqiYRJYZcQVBiIYanmC5WUw3PvLMyfb1UuwfAEIPLCkznS5pxv5jpUEuWtMh
 G++w==
X-Gm-Message-State: AOAM530S93hF8cYzJctnn+nooUzq1YkNGXIMG6pKnJyn9E4bHDr8Q2dw
 ITq6xpmLCjSEfxiv1gDW7/onVEiKg03gdqN/Ok4fTvznmjPoOkQJAb+Zu3QeTbC/gX/X9hxwpF5
 yJm00ha5SA6gPogmypM7sYPxx+nwgwG3g2JQHSP4ti5Gc+rgsTPSQJWqcPcrv
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr5882467wrp.671.1644140291990; 
 Sun, 06 Feb 2022 01:38:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7l4rOabKnCahlz8F0hwEcj2JGhAZ6QLcuFwJFwcDz7Eh0C2YVeTPFf4Ml9pc3mwvtY5F0Og==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr5882450wrp.671.1644140291762; 
 Sun, 06 Feb 2022 01:38:11 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id d7sm8574323wri.117.2022.02.06.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:11 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/24] libvhost-user: Add vu_add_mem_reg input validation
Message-ID: <20220206093702.1282676-10-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

Today if multiple FDs are sent from the VMM to the backend in a
VHOST_USER_ADD_MEM_REG message, one FD will be mapped and the remaining
FDs will be leaked. Therefore if multiple FDs are sent we report an
error and fail the operation, closing all FDs in the message.

Likewise in case the VMM sends a message with a size less than that
of a memory region descriptor, we add a check to gracefully report an
error and fail the operation rather than crashing.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-3-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b09b1c269e..1a8fc9d600 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,21 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region = &dev->regions[dev->nregions];
     void *mmap_addr;
 
+    if (vmsg->fd_num != 1) {
+        vmsg_close_fds(vmsg);
+        vu_panic(dev, "VHOST_USER_ADD_MEM_REG received %d fds - only 1 fd "
+                      "should be sent for this message type", vmsg->fd_num);
+        return false;
+    }
+
+    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "VHOST_USER_ADD_MEM_REG requires a message size of at "
+                      "least %d bytes and only %d bytes were received",
+                      VHOST_USER_MEM_REG_SIZE, vmsg->size);
+        return false;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 value
      * we know all the postcopy client bases have been received, and we
-- 
MST


