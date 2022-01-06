Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A9486560
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:40:46 +0100 (CET)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T0X-00007d-BG
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdl-0004YE-9Q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdg-0000rB-Tt
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=fRLEluCcRU1DyGAgQKqkCo0JzsmNz5eRHZp54zgfXrN5Tiu92ZyoKIRqUKNibX8jYkMJ4o
 I3ewcxuc7w5y6sLi4sHfzIZceSYs1E0PDctJxM3HdTIDXtqPnLiPKoNxgEFw0zZD6Qttpw
 4wUsEFs5oTjNQIJRvBlBuLf99YUGRPQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-FVQYQktrNkiK4YFhfJucNw-1; Thu, 06 Jan 2022 08:17:05 -0500
X-MC-Unique: FVQYQktrNkiK4YFhfJucNw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k40-20020a05600c1ca800b00345bf554707so1928760wms.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=fcIHnrPBa7LyJQRqrv7SEI+F+gs1elBFf7GMj4x2enemkYZm37X8bGQw2DLLzQd8uO
 euVBjqvMhXFZZoEqaUHUrt43Wu5iN9Nq3rmorQwTUHgBQvJpoWO6fJuyH7SqGZSwDEgG
 Y1T8z0A1AxP5J8nPMz7mudescEeTxhcaNJ1I5gRP2Qvh2ABY2ebhM9l75+dXNq42O3X1
 k9Nbdo0hmN9DjWukHU+EESE+Tuk+mxsw6AoOF3/nS8VLBJ+jM5oMDydLLM3T3JSsTdvg
 dc4WpJItlLdVLvUm0Ud94MCbXli3vcU+3/iIwvz6LTOLum0XuipiG5iyQbTyLTogOgEU
 dwgg==
X-Gm-Message-State: AOAM532gKyR+fl9WKychB+KB61u4aLoCHV6sCY46gl8A/4Av//zVugFk
 BF8VvBvG7ilnaC+7LaUUQkEbHJx4ply3pXZpiwpeENytj9mR7xXAl0pxneJRE3DUg62cme5sCPV
 pIQiF8IXNHcViwp8y0GvOOkCyuVdAxll3l5DsAqx+n7Vv8ddsQmDbaGUN7w03
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr51160043wrp.683.1641475023858; 
 Thu, 06 Jan 2022 05:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/gS0WvX1zOKitKkIshtjJW3f0dVft4SUWXtCBihHvdx23ja6hLN2jGB6JH2o7yQQch/GCKQ==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr51160027wrp.683.1641475023611; 
 Thu, 06 Jan 2022 05:17:03 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u10sm2091129wrs.28.2022.01.06.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:03 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/52] vhost-backend: avoid overflow on memslots_limit
Message-ID: <20220106131534.423671-18-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


