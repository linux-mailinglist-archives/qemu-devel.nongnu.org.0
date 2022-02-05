Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F94AA592
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:13:49 +0100 (CET)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAaC-00054D-9r
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:13:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sX-IW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003JQ-AW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBmM0KuFSdatxXqXavJnWM1XP+AlL96uwaW9+q+ldEs=;
 b=eWCzLmyezJBsq/pB8KpZLFtQZ2rpdfodIOLKILQUjcLhLZbJ6sXcL9BAWz4ryU2omlUBJI
 F/fB7PXmvM846EFFJ8LuqFXfyDItRBn9ZBZK6B9Gm0sxvxPn0rn44dTpKhIyTpCCbdV9hs
 7wUdyGvU0dOSBw/1S+fH/B48hgk0dR4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-gitiwhS3NXCfhjg6-KAYDw-1; Fri, 04 Feb 2022 20:43:02 -0500
X-MC-Unique: gitiwhS3NXCfhjg6-KAYDw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g16-20020adfa490000000b001e30139d1fbso355439wrb.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PBmM0KuFSdatxXqXavJnWM1XP+AlL96uwaW9+q+ldEs=;
 b=wz3S7gkmEUWwo7omPGyVQOE7FcY+zgVip4csOf8Z000mhLNwzg9ldcQoScFitqKJV6
 9XcXFBZJ6QI77dUj4i3KumKpiA+0untta2HP1Tm9md/kIs4/0moezsYCu2Hk3WAfAjsH
 excYhuvuIyXOVvs9E9eVkiC7nlKQ2XwjXSz3l2h3Gp31iuBx6iTJ1HP39pc2CXe247AY
 5alKVLUjtYhG3IYSs58KU0FiAoZRYVGNI/Sh6YMcOLPZ1JxtyVrXG0VzKScTvDG61BpF
 Pn985eBHl47vBQsJp66qx5N1g5R2FegtfL+2p9QW8jChdhqQuK3C0jJgN7VNbZ2R4V9j
 SJpA==
X-Gm-Message-State: AOAM533hAugEWFkJUZq+Uleo/PNPogRC9qsnWjBRQzYu0YacOhURb8my
 gd/TG+J4LdBDmyemC9adijDhqcBP3smS5AUz3WaYDTt0dh8dh7yQilNe0TPxCy2gtA5Rg9HjEyf
 MCpYez2kKxFCs2iDqFhuxCQJ5grIETadb8aPwZQBAQSDrnQwbBSbXlaWFjg/A
X-Received: by 2002:a5d:6807:: with SMTP id w7mr1213064wru.534.1644025381386; 
 Fri, 04 Feb 2022 17:43:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycHBpT6Rz612efekjRPA6xOVli0xsFrAZ2IwximNOu6edrm/+H+Zb48U4Lrl4V/r51GOTD5Q==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr1213046wru.534.1644025381129; 
 Fri, 04 Feb 2022 17:43:01 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id g9sm3473705wri.95.2022.02.04.17.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:00 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/32] libvhost-user: Add vu_add_mem_reg input validation
Message-ID: <20220205014149.1189026-10-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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


