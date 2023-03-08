Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052996AFC11
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiO0-0005NH-U4; Tue, 07 Mar 2023 20:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNy-00057t-Ja
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNw-00024P-Vf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GpL4q25IuknOPB1RIp1qp8KrJ0+1tHccB9yllob9AFg=;
 b=QPFEBpBGMOK9gCUWiUVKQ1iTO3dHD3i7Vr0O/wuYSR7upmZt1e1TtWxlZ4S/1OcMTygwOU
 KDrc51Xfq1qrrztPNC+r8p8n8VYnX0IEQVJyu11zEl3xN5kuldlG17OJ91OY9v5MYkBCXt
 QqojK4fYuJlws964FNxhlvjj4Rp+vVI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142--aShlAc5N8-VGUdP4EPaqg-1; Tue, 07 Mar 2023 20:14:27 -0500
X-MC-Unique: -aShlAc5N8-VGUdP4EPaqg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so11267637eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpL4q25IuknOPB1RIp1qp8KrJ0+1tHccB9yllob9AFg=;
 b=D3VAUMgjRTctskpx893T5VkPO9USyfID+QAHDG3b1g+ppGDNvHhGlg3LiCXY+StVYe
 68UOI6pwtux/lFVpMHONlYm80DOMInVSToaCuNU9pnhQ1Ji5c6nBg0F5+Wc4FyHuaNj2
 3QHQmCCtsxI82PLlIyl1q+b64pP3eLN2t3u6v2xEImN1Ffbf04M78zXRcLLV26+6B4Fo
 FYuem6Ce/2HiFg6wXDEPm385eCwVfLO5MfW5Hn0bKI467G9E5YimfMxvHJN2JTnYXri0
 Djwx+wHmwoKzRwGvLkXZxCxVVeT4Um4goqhYK5kgyvLB1SFsGrQhlG9JQJup2BZZB3km
 I6Gw==
X-Gm-Message-State: AO0yUKXEI0Z0zeNHNI2PIdf+AzbfbTSeSJj3+NMDhY7Niz4aTBVcTnmf
 89B5zfxiRns0xevdpjY5tyt0xYaRrivTLvXpfIX4k2acv0lXAKXeBiPVolYdQzyB9VD+6e41zKp
 9M00gvXTAWo5rSAQrhrpV20mLeFYh0aAj3p6ajGgblh4IbLfW7xWivhJduWbiU5HQ7FTP
X-Received: by 2002:a17:906:6b83:b0:8e5:c06b:90e2 with SMTP id
 l3-20020a1709066b8300b008e5c06b90e2mr15080528ejr.21.1678238065561; 
 Tue, 07 Mar 2023 17:14:25 -0800 (PST)
X-Google-Smtp-Source: AK7set83UHgXr/qOT0NbK8WfgRSltmFmPnBn0L1jquS33EwsITuouldiAvN2sfulsHRoK0Ox/C1VKw==
X-Received: by 2002:a17:906:6b83:b0:8e5:c06b:90e2 with SMTP id
 l3-20020a1709066b8300b008e5c06b90e2mr15080515ejr.21.1678238065293; 
 Tue, 07 Mar 2023 17:14:25 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 27-20020a170906005b00b008b175c46867sm6748607ejg.116.2023.03.07.17.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:24 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Esteve <aesteve@redhat.com>
Subject: [PULL 71/73] hw/virtio/vhost-user: avoid using unitialized errp
Message-ID: <90e31232cf8fa7f257263dd431ea954a1ae54bff.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Albert Esteve <aesteve@redhat.com>

During protocol negotiation, when we the QEMU
stub does not support a backend with F_CONFIG,
it throws a warning and supresses the
VHOST_USER_PROTOCOL_F_CONFIG bit.

However, the warning uses warn_reportf_err macro
and passes an unitialized errp pointer. However,
the macro tries to edit the 'msg' member of the
unitialized Error and segfaults.

Instead, just use warn_report, which prints a
warning message directly to the output.

Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")
Signed-off-by: Albert Esteve <aesteve@redhat.com>
Message-Id: <20230302121719.9390-1-aesteve@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 8968541514..e5285df4ba 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2031,8 +2031,8 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         } else {
             if (virtio_has_feature(protocol_features,
                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
-                warn_reportf_err(*errp, "vhost-user backend supports "
-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
+                warn_report("vhost-user backend supports "
+                            "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
                 protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
             }
         }
-- 
MST


