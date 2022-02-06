Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B744AAEC6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:11:55 +0100 (CET)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeWQ-0003kq-Fz
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe01-0000J6-71
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzz-0003hi-7x
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7OKSfT1V8bnQJ29ZyLRYs/eX2kJnKtsDQ8zfEcJa6g=;
 b=edHr5dJgJiM6B48DShnAqGQUfdL6y4Ptqgvp4EiGKWyCiyELChAinOVNQhcDRrd3IdoxTN
 DPqbakEi5xmnD0F9orkbw9YpDJ+kLpVFf8ySQGLAM+vWJtI1q6uF9nOBO79Qi9MpVQYgJN
 kZeCuBbK/iPC0PlJnqBhSpNdMPfAMSE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-nnvAwZIaO_291mY9RmH-2Q-1; Sun, 06 Feb 2022 04:38:21 -0500
X-MC-Unique: nnvAwZIaO_291mY9RmH-2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso3946822wmg.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=y7OKSfT1V8bnQJ29ZyLRYs/eX2kJnKtsDQ8zfEcJa6g=;
 b=0158c1ndl8Bf4xzs2jz4b3SQp5tENsXC+spiwswlrJMYav5NTm32anVwiK8GuGkEam
 fpI9msIxcFiG3q++JAsSB3EY2NT29rXU4vnOoqvD3Xzv74a9jKQD2DFzp1aO00IhuCn0
 6L55vdebr0O2V/wGV5Ap78W0tcY/y9CkIVgJT9jKQn/E1uMepH7S7mPVWr1nbb+mnHzd
 QAcLhFk+9/o4zjpEQlVq60yJppvu1/JxaG5i8Vo4itSn4X9xpSD3gJ5y8gZw8yrPdk3W
 tFubnztGvOJW4dX1zyMMbl0qQjTIclxi12nAoYYCeUxfD8IK7JzEWvXUUrydAqflLJnG
 D98Q==
X-Gm-Message-State: AOAM533PSjH5+iQyha6Fk7qhEBbMJyBcQ0zS8ome28RaTvi0TjSi2W+8
 i0yoqR9tX15WiuAGziHK6HQm7rkwhs/1tv8LTEN84Omv/Vp0I5EP0o1iz9Nre2yI1YoZPS30b4A
 UJIpwzpzt7QeedFMyXP/TWn7DPFzWVKd3yUzZzq2BOVZaZpRtvU1ims57M81e
X-Received: by 2002:a5d:548d:: with SMTP id h13mr5871360wrv.28.1644140300470; 
 Sun, 06 Feb 2022 01:38:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwST1/AD6tWCTXkGdltt77b2csUNgZUwM+xFu4/YAQyjdGe2ERn35XpnDqmlrbOuw7nbSLUfQ==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr5871333wrv.28.1644140300240; 
 Sun, 06 Feb 2022 01:38:20 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id z1sm14132589wmk.32.2022.02.06.01.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:19 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/24] libvhost-user: prevent over-running max RAM slots
Message-ID: <20220206093702.1282676-13-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
libvhost-user, no guardrails were added to protect against QEMU
attempting to hot-add too many RAM slots to a VM with a libvhost-user
based backed attached.

This change adds the missing error handling by introducing a check on
the number of RAM slots the device has available before proceeding to
process the VHOST_USER_ADD_MEM_REG message.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-6-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 subprojects/libvhost-user/libvhost-user.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 3f4d7221ca..2a1fa00a44 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -705,6 +705,14 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         return false;
     }
 
+    if (dev->nregions == VHOST_USER_MAX_RAM_SLOTS) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "failing attempt to hot add memory via "
+                      "VHOST_USER_ADD_MEM_REG message because the backend has "
+                      "no free ram slots available");
+        return false;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 value
      * we know all the postcopy client bases have been received, and we
-- 
MST


