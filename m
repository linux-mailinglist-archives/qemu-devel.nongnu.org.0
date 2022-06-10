Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E325462A5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:40:32 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzb80-0002bq-T9
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYY-0002mu-Cj
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYW-0006TL-Pn
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LI5FhlwlFzEWmRAW1OAJAt8/dWVtDGrVDjAqYRS76zY=;
 b=TL6asR0qft+b8ir3uMUCPITHNwulec17Vz47mhDE3nhR5sY4xZLQ4oHWhFqxcuhl4/knvo
 A7k6/HujwYzRJN3HfdAK6WmG0kcIW7j+aYtE9PESbszS0hs3/+JkDzrjohqpOlzv+pYDOS
 ZptcAw601gyOFYzeW52xq3WQhh31JEs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-EvAIc1fuNMy02TygPPYB5Q-1; Fri, 10 Jun 2022 03:59:41 -0400
X-MC-Unique: EvAIc1fuNMy02TygPPYB5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so933976wms.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LI5FhlwlFzEWmRAW1OAJAt8/dWVtDGrVDjAqYRS76zY=;
 b=4RfTBBspvhdD+bLGSCsBARA4A+tHRpiOInIf/989XSl57i/aMRghjmUsCLC1POLKjv
 G/0t+OPNEWNUq7lYT1O7jN4Va061LkeUMWx967mtT39HOmy2uUGp22AN5em/MaWq6j/s
 XnX0Q0+Ja9SsvsEHETQGPYJkPBti1hKLRTTLoR6XG3p9jr8/wQjG2rc1x/f9UnT+3wXO
 S3j7R8rerPAgsIy2Kl1A4OEnKnQQPQHttoJuDrx0VvAV4Y9aA+Yu/ARNMAJXQtwMOzdO
 TiRpaI2GBFgxk3KbSbiiD+3UhbU1OzHGHCyajlzBZHcJR4FmM8O3ISFVrytDHfwenZwu
 zseQ==
X-Gm-Message-State: AOAM531MVw0eXbSdZ9buy7f40tjyMjFr1LFeJloV2JBuz+Nz6iWFliox
 /TEnj2bHniPQftX/PMcGc9hmqb/28qUlwArsH8pZrVm+v7G9lQ/lEcGPc4jzbtmZ4zTrLQTrqL8
 YksPsHHlx2ZkuOddPjsLPq1Iun1J8cP8taCBBOpuCafFUB4YUbwT4z3hXKPow
X-Received: by 2002:a05:6000:178c:b0:218:5e44:e9a0 with SMTP id
 e12-20020a056000178c00b002185e44e9a0mr13344012wrg.76.1654847979641; 
 Fri, 10 Jun 2022 00:59:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzsJ8jcoT+C0pM2whud7u1QR3FLebThaW0MTENeRG/jHXLGU5Wvh5XovcgOrf2zjLQ++jB+g==
X-Received: by 2002:a05:6000:178c:b0:218:5e44:e9a0 with SMTP id
 e12-20020a056000178c00b002185e44e9a0mr13343987wrg.76.1654847979398; 
 Fri, 10 Jun 2022 00:59:39 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c028400b0039c45fc58c4sm1996972wmk.21.2022.06.10.00.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:39 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Changpeng Liu <changpeng.liu@intel.com>
Subject: [PULL 52/54] hw/virtio/vhost-user: don't use uninitialized variable
Message-ID: <20220610075631.367501-53-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Changpeng Liu <changpeng.liu@intel.com>

Variable `vdev` in `struct vhost_dev` will not be ready
until start the device, so let's not use it for the error
output here.

Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")

Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
Message-Id: <20220525125540.50979-1-changpeng.liu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")
Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")
Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
---
 hw/virtio/vhost-user.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b040c1ad2b..0594178224 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2031,18 +2031,16 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         if (supports_f_config) {
             if (!virtio_has_feature(protocol_features,
                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
-                error_setg(errp, "vhost-user device %s expecting "
+                error_setg(errp, "vhost-user device expecting "
                            "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
-                           "not support it.", dev->vdev->name);
+                           "not support it.");
                 return -EPROTO;
             }
         } else {
             if (virtio_has_feature(protocol_features,
                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
                 warn_reportf_err(*errp, "vhost-user backend supports "
-                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
-                                 "device %s but QEMU does not.",
-                                 dev->vdev->name);
+                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
                 protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
             }
         }
-- 
MST


