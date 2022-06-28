Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5B55BED6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:41:15 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64uQ-0006Rk-SK
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633k-0007gS-Qq
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633h-0006pc-1Y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n81oF0HqSDqpCv8m7EVTIj7PetZ5T/FjkogtpV7T6sg=;
 b=DS/DEF1Y40X0QiT0nL9OAQLUvwgFPq3MKSDp6h6lRC+SAudsjPIme1VPbKcRMn/M5sxlWd
 HasCApCWLjdhVj4ENvKwgfi+28cy8C+Y2TKjmJnKbniXUWh2xvsRn6oYMtEe8bRCFca9Ha
 Jo4PA8gjyXP4ubtpth3Fgw4nlpNkIU0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-VJr4phEhMka0UNWYXIvFmA-1; Tue, 28 Jun 2022 00:42:38 -0400
X-MC-Unique: VJr4phEhMka0UNWYXIvFmA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020a5d61cf000000b0021bc2461141so841863wrv.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n81oF0HqSDqpCv8m7EVTIj7PetZ5T/FjkogtpV7T6sg=;
 b=hgsNVa+U2Q2/w6bOo4axqA/wRXbVcqU0xDa8s0tzDjiAlQoYLYHdiCjTp8rQpu6KlJ
 6u5WKOpnVHznuy5cA2iJJwUZfztPdvM1fXVWha2vJbOxASCtDk1DjI6h36XbWoPngcDn
 QAb4gWCs5QVd03lfmg+Wgjab2+tOd2WkYlA5bBF992YPj4V1mHIQgW8lCbaXaqgXpxvZ
 x1/Exa1LfUGj3z5HKblMvXvejZdP4/z6njvbn2V70mLGHmrsqzbjkck6wg1nD6rmw24p
 /uY8291Qn2AgI5UgfQpJ2EwieB+jUAiObNizo2e1E3dyocbqsLBQDweY9LPZ5KrcUJdt
 FcFg==
X-Gm-Message-State: AJIora8Tf+5truZTSCAgEYOCuBDr/iyN3JDmunsS/iiLAN5/dw/y0xcr
 YXjQ/lzaiKMJsgcqmQrXAzWxG6W54EBfNir4+GnbQuI6ALrqAQr9kfn24M2QdyqXgG4vyqebh1T
 bKJeRHLr2sdofP5kvitlJ24VpYPJueLiI/E1FDdmatmv7acgAC3W/dBWFRqcv
X-Received: by 2002:a5d:604a:0:b0:21b:9517:66eb with SMTP id
 j10-20020a5d604a000000b0021b951766ebmr15407058wrt.494.1656391356917; 
 Mon, 27 Jun 2022 21:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unuOoJw7QfbqbO3TU6MR2TrNeJIA1+5Ui0mD4hpLgMgbyIZADc7bydBwdthjAPUIuFd12YSg==
X-Received: by 2002:a5d:604a:0:b0:21b:9517:66eb with SMTP id
 j10-20020a5d604a000000b0021b951766ebmr15407042wrt.494.1656391356618; 
 Mon, 27 Jun 2022 21:42:36 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 id18-20020a05600ca19200b0039c871d3191sm11668511wmb.3.2022.06.27.21.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:36 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PULL 03/12] vhost: add method vhost_set_vring_err
Message-ID: <20220628044201.217173-4-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
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

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Kernel and user vhost may report virtqueue errors via eventfd.
This is only reliable way to get notification about protocol error.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-Id: <20220623161325.18813-2-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 hw/virtio/vhost-backend.c         | 7 +++++++
 hw/virtio/vhost-user.c            | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..eab46d7f0b 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -69,6 +69,8 @@ typedef int (*vhost_set_vring_kick_op)(struct vhost_dev *dev,
                                        struct vhost_vring_file *file);
 typedef int (*vhost_set_vring_call_op)(struct vhost_dev *dev,
                                        struct vhost_vring_file *file);
+typedef int (*vhost_set_vring_err_op)(struct vhost_dev *dev,
+                                      struct vhost_vring_file *file);
 typedef int (*vhost_set_vring_busyloop_timeout_op)(struct vhost_dev *dev,
                                                    struct vhost_vring_state *r);
 typedef int (*vhost_set_features_op)(struct vhost_dev *dev,
@@ -145,6 +147,7 @@ typedef struct VhostOps {
     vhost_get_vring_base_op vhost_get_vring_base;
     vhost_set_vring_kick_op vhost_set_vring_kick;
     vhost_set_vring_call_op vhost_set_vring_call;
+    vhost_set_vring_err_op vhost_set_vring_err;
     vhost_set_vring_busyloop_timeout_op vhost_set_vring_busyloop_timeout;
     vhost_set_features_op vhost_set_features;
     vhost_get_features_op vhost_get_features;
diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 4de8b6b3b0..8e581575c9 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -146,6 +146,12 @@ static int vhost_kernel_set_vring_call(struct vhost_dev *dev,
     return vhost_kernel_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+static int vhost_kernel_set_vring_err(struct vhost_dev *dev,
+                                      struct vhost_vring_file *file)
+{
+    return vhost_kernel_call(dev, VHOST_SET_VRING_ERR, file);
+}
+
 static int vhost_kernel_set_vring_busyloop_timeout(struct vhost_dev *dev,
                                                    struct vhost_vring_state *s)
 {
@@ -309,6 +315,7 @@ const VhostOps kernel_ops = {
         .vhost_get_vring_base = vhost_kernel_get_vring_base,
         .vhost_set_vring_kick = vhost_kernel_set_vring_kick,
         .vhost_set_vring_call = vhost_kernel_set_vring_call,
+        .vhost_set_vring_err = vhost_kernel_set_vring_err,
         .vhost_set_vring_busyloop_timeout =
                                 vhost_kernel_set_vring_busyloop_timeout,
         .vhost_set_features = vhost_kernel_set_features,
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 4b9be26e84..75b8df21a4 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1313,6 +1313,11 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
+static int vhost_user_set_vring_err(struct vhost_dev *dev,
+                                    struct vhost_vring_file *file)
+{
+    return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_ERR, file);
+}
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 {
@@ -2616,6 +2621,7 @@ const VhostOps user_ops = {
         .vhost_get_vring_base = vhost_user_get_vring_base,
         .vhost_set_vring_kick = vhost_user_set_vring_kick,
         .vhost_set_vring_call = vhost_user_set_vring_call,
+        .vhost_set_vring_err = vhost_user_set_vring_err,
         .vhost_set_features = vhost_user_set_features,
         .vhost_get_features = vhost_user_get_features,
         .vhost_set_owner = vhost_user_set_owner,
-- 
MST


