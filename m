Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03175461726
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:57:28 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh9r-0005bl-3q
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:57:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh44-0003dq-TP
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh42-00030y-Qe
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UihEY1SXLbY91vozy6vIng0o2j8rRpby6Zz/fyXU1q8=;
 b=DV4s6/DPi1idikuunTgHcZ5T4Nhehvatyo6Z0r3LzCTTrXwtyYOOZTOy+E5oRkGlfQOOEG
 batbQl9p2NAx6DP8QAkeOwa+GNIHIUeP8EVwJX9v6nAv/FgIkXVhOdIAU+nTzbxFsB53BR
 lodprA7MM0nD0hyju1zvOaOGl/yumYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-pTWGYr4sP4ebcmXIFbCMOw-1; Mon, 29 Nov 2021 08:51:19 -0500
X-MC-Unique: pTWGYr4sP4ebcmXIFbCMOw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso13784248eds.12
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UihEY1SXLbY91vozy6vIng0o2j8rRpby6Zz/fyXU1q8=;
 b=mOYCaDEQHxxv9Lsa0LlUbmreIRUUhtUQzl/DcgSEpljNDCnK8/BO4KlkGU61JtVr3O
 PkditbInN3PD/du48vdwKW9J1zx67GVLa5bo2nmfd71KrVOtusKF6PC1hXl6AERYEWYG
 IeFJy8gltlaozlOeZuZqTwLFEXOSyIR1fDbbfMd26xUvDMFlOFK5BT1seKwniFtjVVEF
 x0WVTX6f+IAc9z/PaWy68b/8gTvh+oWoApfDCvq17nzgTbCCStyyEpsRuHQcBgNSd+hR
 sPNPN/6eUXm+iW910W+mPh8UsnTdD3xz/C8sWe8mSz67hdeCuC3fUqsfIcnIGhKYjcY+
 +Z8Q==
X-Gm-Message-State: AOAM5338vRIZUZdFLrAg0SBEagMp9yp+Ea+qbYeJHXPVk/z9G9jv0FDF
 98o5CCU+vpjbNXK67E2bkIoh63TRRBvb2ZQfRMx6J6jaTRc6VxRMX7+omsFhwW/RseACRRjboHh
 w9shan1u+gBFzdZy4NkuQ5Xx0831LOE8NhhtTRxoL//gAU9npXJS01+/AhNDx
X-Received: by 2002:a50:fe8e:: with SMTP id d14mr76254423edt.51.1638193878363; 
 Mon, 29 Nov 2021 05:51:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD/+9g2YN3amhtLlDHx0qvTDIrGQB9hTArcABiZNegkp6pspCS87yK21AcEYFqcjFPvwrkWQ==
X-Received: by 2002:a50:fe8e:: with SMTP id d14mr76254392edt.51.1638193878137; 
 Mon, 29 Nov 2021 05:51:18 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id qa31sm7475891ejc.33.2021.11.29.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:17 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] vdpa: Add dummy receive callback
Message-ID: <20211129135053.560225-4-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
cases. These assumes a tap device can handle the packets.

If a vdpa device fail to start, it can trigger a sigsegv because of
that. Add dummy receiver that returns no progress so it can keep
running.

Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20211125101614.76927-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2e3c22a8c7..25dd6dd975 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -170,9 +170,17 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
     return true;
 }
 
+/** Dummy receive in case qemu falls back to userland tap networking */
+static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
+                                  size_t size)
+{
+    return 0;
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
+        .receive = vhost_vdpa_receive,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
-- 
MST


