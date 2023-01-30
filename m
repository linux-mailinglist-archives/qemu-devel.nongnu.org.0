Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B82681B8D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafb-0007mC-2c; Mon, 30 Jan 2023 15:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeu-0007KO-PG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaem-0007Sh-ME
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yeIkLp6mwg6zAUGeAJkH0mc6uTtuf4xanN2xYsMRjHQ=;
 b=OQw4eNcUJ+qQ88GPn7o2c6tInwFe+1+ztq+b72+a5bKEZJU8WMf84C/BzETZw6C3PpCa6d
 CKZ/vNEpqfswY4wPm6Mqbt5HOsNbl+1JfaPlrGDrRyjMMycbTfkGvn94QA2TlKDUdNGSQ2
 M2AcgGFsSGjTy5T92hIwUvk37yo+ZkA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-9N9XO7RhON6D6Qrfxlst3Q-1; Mon, 30 Jan 2023 15:21:35 -0500
X-MC-Unique: 9N9XO7RhON6D6Qrfxlst3Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 he34-20020a1709073da200b00887ced84328so2715101ejc.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeIkLp6mwg6zAUGeAJkH0mc6uTtuf4xanN2xYsMRjHQ=;
 b=GUCOrHvxRY5brt0TWqel/+RPUpa6r4W60hUQcGXqARmN2l8uCxDDqtGVcQcwu377Lf
 HBkKCgNL+3TaSgnGC1LK9PeVv4GZf7halJPdhn278Fpq9lh6ftL2e6P6t5M26i7itPlq
 v6aYZR47r9rRCh+vKaxbjQbTM28hY5EhvORiWC6UbhYH0QIb2nYpTeBtcKg3F+HtXuWT
 Crmn9EWvSryw3dbS+3TFcPjAthzBp4mSmDCfqRsP4Z8x5b5JUOupbUyb3zKWgTjrQaqa
 6ML8cq24BU40NXoaoAF0NWS+ewZmOF6eHbNDpS+oZEGy6X2mLV30QarBS1Y4LtaiCVku
 aTiQ==
X-Gm-Message-State: AO0yUKUlzHoMScMz4d5m23ifCI6TPkHFPDkEjr/8Lud971WSViumK9sL
 Yj/Yd+2cA/1BXzydUy3rsyM8/O8S/c+hK0LDLSULP5mOCDYFF1/8a7Y60uRX0Eretl/9wS0IVDd
 xE4oilUCKyYMtdTLBAgcrFzLapFiRWE1aDMaEZp8TPmBi4LJx2QP8m+QFxkgr
X-Received: by 2002:a17:907:6e12:b0:883:3661:97e5 with SMTP id
 sd18-20020a1709076e1200b00883366197e5mr1036032ejc.50.1675110093291; 
 Mon, 30 Jan 2023 12:21:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9rQPLTmXJXSIMRufvGNqevATuWfPoPZobrAQ+HYYaYEpNZkGXq/Xl0hK80jKgahv8fHVJmVA==
X-Received: by 2002:a17:907:6e12:b0:883:3661:97e5 with SMTP id
 sd18-20020a1709076e1200b00883366197e5mr1036017ejc.50.1675110093083; 
 Mon, 30 Jan 2023 12:21:33 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170906670800b00878775876c5sm7163394ejp.73.2023.01.30.12.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:32 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Minghao Yuan <yuanmh12@chinatelecom.cn>
Subject: [PULL 51/56] vhost-user: Skip unnecessary duplicated
 VHOST_USER_ADD/REM_MEM_REG requests
Message-ID: <20230130201810.11518-52-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Minghao Yuan <yuanmh12@chinatelecom.cn>

The VHOST_USER_ADD/REM_MEM_REG requests should be categorized into
non-vring specific messages, and should be sent only once.

Signed-off-by: Minghao Yuan <yuanmh12@chinatelecom.cn>
Message-Id: <20230123122119.194347-1-yuanmh12@chinatelecom.cn>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6c79da953b..eca9e104ba 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -459,6 +459,8 @@ static bool vhost_user_one_time_request(VhostUserRequest request)
     case VHOST_USER_SET_MEM_TABLE:
     case VHOST_USER_GET_QUEUE_NUM:
     case VHOST_USER_NET_SET_MTU:
+    case VHOST_USER_ADD_MEM_REG:
+    case VHOST_USER_REM_MEM_REG:
         return true;
     default:
         return false;
-- 
MST


