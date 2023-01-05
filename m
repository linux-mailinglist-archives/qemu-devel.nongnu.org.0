Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5C65E789
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLp-0002cg-2A; Thu, 05 Jan 2023 04:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLf-0002PP-Eq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLd-0007Ax-Ut
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyeI9n00srHT95Wf05HcVdwfoBiIPp7caNy4o1qIx1E=;
 b=CNlSQq/rwIm+sbeB+8c0d6bprV9b6sf9AeBJa4ptyd38QizEC5NnY6m+eTY+GUyrImDown
 +Xb4xqGShTz4b5OVEmbT1iBfQ1vlmEtC8gjRxf76h/TVvUDT6cfEgL/Ueos49vjwbLkPO4
 9rYGc3Yy5JG3XVCYDLKKKo8Pxt5l/K8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-NzLio1BAMIqyk9l9lA8vtA-1; Thu, 05 Jan 2023 04:15:39 -0500
X-MC-Unique: NzLio1BAMIqyk9l9lA8vtA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o14-20020adfa10e000000b002631c56fe26so4630492wro.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gyeI9n00srHT95Wf05HcVdwfoBiIPp7caNy4o1qIx1E=;
 b=0PWtCBvRPC3ehh5TI30sE/XlcBuXlOde98+F5Zov/RBtd5I97gDpbPcLc7mA9Hp5M9
 4Cvp+nSgBLUuLYnkxdgSEbdI8KL9W3GR5mhprYAtvRMtV4dpyb6jJglfNQGDe5Xby0h6
 Eh1yhPCKmwHB4HUOXlfpNfkbUzFMBCZxvSiBf0+MG1QbvcUZFkyebz1M3TLBCan8GNum
 vOsG4oIt/B4DRuB3+BstD22HwXxaOXmIFsCmU/hQP4HRVuR2iw6M3EFPDSvU/JUFHX3e
 kk5EoVM5N73xoWoKRNk80clrbdw5EhXS5miuHDnUE8ibbEa8T9foCTPzIKS6/wraXCD5
 lHrw==
X-Gm-Message-State: AFqh2kpou8dCSntvUd3vhUQ8muWNZ+uHJVCbwxO7h4+00efAbBsec7e7
 CSZe0xI1vhXc3NGobbmP07K9rBHl6dRaH2osrgbTOgAS28OrWbspouGM18NFg9u8oNkmjYOVUAF
 JNakqMI1fVit5RwbS3R9ljt3Ip6DiinoHV35l9JQ0/LSY/SQX5vrtw/iYT/rT
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr34440618wmq.25.1672910138227; 
 Thu, 05 Jan 2023 01:15:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtTPQ88rC3LTzG01sihXMH6Qdx7o82vc5OyRFC0PJqRfx3hpEIBJ3rpnJk1YYxD7T5uAsqORA==
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr34440605wmq.25.1672910137952; 
 Thu, 05 Jan 2023 01:15:37 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c445000b003c6c3fb3cf6sm1860155wmn.18.2023.01.05.01.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:37 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/51] hw/virtio: Rename virtio_device_find() ->
 qmp_find_virtio_device()
Message-ID: <20230105091310.263867-26-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

To emphasize this function is QMP related, rename it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221222080005.27616-2-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6ff797e1cf..e08443e3bf 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3855,7 +3855,7 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
-static VirtIODevice *virtio_device_find(const char *path)
+static VirtIODevice *qmp_find_virtio_device(const char *path)
 {
     VirtIODevice *vdev;
 
@@ -3896,7 +3896,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     VirtIODevice *vdev;
     VirtioStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -3972,7 +3972,7 @@ VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
     VirtIODevice *vdev;
     VirtVhostQueueStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -4016,7 +4016,7 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     VirtIODevice *vdev;
     VirtQueueStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -4109,7 +4109,7 @@ VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
     VirtQueue *vq;
     VirtioQueueElement *element = NULL;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIO device", path);
         return NULL;
-- 
MST


