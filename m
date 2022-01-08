Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87985488087
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:28:25 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60Wu-0004xZ-L6
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609n-0004Ch-Td
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609m-0002Me-Ek
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=YWtwfEDRAmBFdI9MZKtWvG8VRoH0q7tevPO5qdmqPZwTlolzXx6RwT/TB3f2dL9pcAcFh3
 k1c5zjN9UwF1YnuevSJ90eUKevwv3ksJkICNvBKKZ3j3Mb/VMN/eQgzyvwK4H72gRIlQFc
 YAC2ZE2y2YZtbAtfUAb65cE+VysaBko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-dIGfF2DuMxiLiRCo_3BQRw-1; Fri, 07 Jan 2022 20:04:28 -0500
X-MC-Unique: dIGfF2DuMxiLiRCo_3BQRw-1
Received: by mail-wm1-f71.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so2503383wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=YulsPOflRj3miPTzS+x0DXggck3ZZ2eKahINI9Ye4NXfvGRSU0i4AA31eZQMNOPxGT
 S0i3UF5hrjVncqbwbvQD00MYDY02LcbW5CuoAUd1JDndFB3VLZxP1yiCPCitwSsNIbPX
 T/UvO1twnVOznrB6dg6xCedO8w9dGs2Q7D8koi51LH/dFpgVKhzFzCBfGQ8I2b0NQfoq
 IOv1tdoU+Mzavxrd8geDkmpmI3FoSOeFZGylojvpTKG5ZnstvxYkHp+cUyrXt//7levE
 IOlbebuI2bldnHsJ5ioKf8qiAsGOTeS4+936lfiz1URTRQAk3ufHDtdRXZ3SSLApSHej
 knbg==
X-Gm-Message-State: AOAM532V8yvi9bKqwT4nuUxmWoIJcSA3q3rLebs0KHPM2lbKQPrbhQoA
 A3/zQNxFMazJOsR+kcsjaNlEnCU5UNRHmMJdBaW2ENFWJerTSR8xK6klc2wTsKDC6F7luYK/sGe
 uJ2P3PYBghFOEdjQ5+m5lFHwQ+1f1FqT4WMtWa8K241M751xoS00XUVj6D+Rn
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr45082838wrs.170.1641603867338; 
 Fri, 07 Jan 2022 17:04:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSgq0Wh1rgP2TfUG/QyIaEfmQMG2UskrjGGsRbC+SjG3GRfileSIka94afPm3K7MkHC0TEKw==
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr45082832wrs.170.1641603867162; 
 Fri, 07 Jan 2022 17:04:27 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id h2sm238486wmq.20.2022.01.07.17.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:26 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 17/55] vhost-backend: avoid overflow on memslots_limit
Message-ID: <20220108003423.15830-18-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Fix the (hypothetical) potential problem when the value parsed out of
the vhost module parameter in sysfs overflows the return value from
vhost_kernel_memslots_limit.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-6-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index b65f8f7e97..44f7dbb243 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
     if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
                             &s, NULL, NULL)) {
         uint64_t val = g_ascii_strtoull(s, NULL, 10);
-        if (!((val == G_MAXUINT64 || !val) && errno)) {
+        if (val < INT_MAX && val > 0) {
             g_free(s);
             return val;
         }
-- 
MST


