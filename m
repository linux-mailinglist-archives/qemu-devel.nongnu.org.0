Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C66EDD34
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMN-0006ER-2X; Tue, 25 Apr 2023 03:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMJ-0006Dh-VX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDME-0006Pb-DH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p204nU6e9RAXfoO9ghJizRo/OYq7RM/x1C2g9Tz5bYw=;
 b=Vsq3+DGqIb6RVHhlnFG+v6DBpVSKTtbYndnOeFMmQn7le1VTbkr0tYK8SldiwR56YEkPN2
 /Gqyo4H+cirdXDf0iD1FJnhFsKV++JJ8pkQmqLLjhwoIO8wbbb/SaJkoz0LS6/mk56qOSU
 NIilPn+0NnKxHoJqd8YaXgs2L4AQWbk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-RucyNdbTNDCy0hH6v65VFA-1; Tue, 25 Apr 2023 03:45:00 -0400
X-MC-Unique: RucyNdbTNDCy0hH6v65VFA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f175a24fd1so29720325e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408697; x=1685000697;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p204nU6e9RAXfoO9ghJizRo/OYq7RM/x1C2g9Tz5bYw=;
 b=gY36jefDIoRhDgB72bNwPNUe2yOTQ9Tk8sjqT2iWJ3KezPaCwHpUUA9yHZZZuM7w1a
 VjYwvioHA1mhK2xuss+rAT7Mqxff+X1vM+xgKz5d+UUvNtmYYLORxjcH4oc9ID7Hwchf
 OKhXShMcqkMElN5H5vZWdpOkPYRDoMb1kKTITtWmOPOrcWNj6ZH8gITmGvc/9eu6H9Zh
 KjqgxIpRZJlsHiiupiLQJKEaw2TZjQwWcCs/NxXjokC9G4Wjiti0PHTJQeg+FQMIroaO
 lxYz6Bg5Y1nowLd5daB6GHh61pwE3iDOuAQyiheWNGsXiBZSxOn9VnAM4D3D02a8kakV
 YdyA==
X-Gm-Message-State: AAQBX9cmUT/3KwOfcpv+LziX0m6DUvQ4QBzZpJMgBQAF9gsJVHk4QAtP
 rRrKy59HI0NLkQ5CcTJCNyxORenhQ+nsoDeIsQJomc4iiQ/NmAsJ3pjn+OYpktH2QsgES589h6E
 kdom3pdXeJlEvdTUUwaz9ZAeC6MM1v+90mtVLz6rEbmVrEh3p9Por8PKMfc4+mmBQk0+b
X-Received: by 2002:a7b:c045:0:b0:3f1:662a:93c4 with SMTP id
 u5-20020a7bc045000000b003f1662a93c4mr10017947wmc.36.1682408697647; 
 Tue, 25 Apr 2023 00:44:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5jRGEPhZnNWIYvTqyMuB8QwyKRaYg7BgL5V+IrYknN9K7EdEd3yyGtcj9TFXEwfz6LL0PIw==
X-Received: by 2002:a7b:c045:0:b0:3f1:662a:93c4 with SMTP id
 u5-20020a7bc045000000b003f1662a93c4mr10017921wmc.36.1682408697248; 
 Tue, 25 Apr 2023 00:44:57 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003f17e79d74asm14277648wmc.7.2023.04.25.00.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:44:56 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:44:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 03/31] vdpa: accept VIRTIO_NET_F_SPEED_DUPLEX in SVQ
Message-ID: <0d74e2b785ed0391316479ccf97c8f1ad5966145.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

There is no reason to block it as it has nothing to do with the vrings.
All the support of the feature comes via config space.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Suggested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
Message-Id: <20230307170018.260557-1-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99904a0da7..37cdc84562 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -104,7 +104,8 @@ static const uint64_t vdpa_svq_device_features =
     /* VHOST_F_LOG_ALL is exposed by SVQ */
     BIT_ULL(VHOST_F_LOG_ALL) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
-    BIT_ULL(VIRTIO_NET_F_STANDBY);
+    BIT_ULL(VIRTIO_NET_F_STANDBY) |
+    BIT_ULL(VIRTIO_NET_F_SPEED_DUPLEX);
 
 #define VHOST_VDPA_NET_CVQ_ASID 1
 
-- 
MST


