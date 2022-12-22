Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D868653CBD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:01:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GV9-00009i-2V; Thu, 22 Dec 2022 03:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GUx-00006r-QN
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:00:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GUw-0003mQ-5G
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:00:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id h10so823230wrx.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWzy4CIRhUOqHOcTLWw0eZAa1rtKKowFtFuMx9dLf04=;
 b=KqkAIKW5mZXTphq7AiBEtjm3PgcIgpQMoFORR4D0SWrlK4O5HASr+vIY19XpF8/ezI
 cDfkJyBrmNI8y++f53uSdLbA/uUi9DLbAXw7iEU9Fx2QiO1HAXZpHyvFW0BBpWLxPmTv
 tRXrDy/mMOx/901IAodpR9YykSQPBgFeSKUZdP9wfR4pWIln+G4NLX2i9/77Mie4CDZT
 lgEYCHOS+TQVkqWuXKlOwR/dQWx7Whi+Badf6GsO2t4hryiCLeZv4acnM+nJbG7DPsQW
 c+b2IQGNl19eWRG5GIA5CHeT3bnYh0Zl1stjeaR7cPl0+HsbTqhZAVcyyESUNSefn8WM
 C10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWzy4CIRhUOqHOcTLWw0eZAa1rtKKowFtFuMx9dLf04=;
 b=LHZLEOca7ItgZhOzKPoIRicHhGGROvyzSVnAAqjB/FCrgQCGEQKMMc5Y0R1QG/0DIC
 cKPs2CqczO1fIaB1Tt9pyaFcQ0lt3QcQHsRcUfXfdX0mhs383cgsKZnxqEMB0BRSy4WV
 U9z4PG2D9HSrhK8l3DVbMU8Q6UL/OMg3ug7MFqnMzXgr8eSxZXMWGGTdlAuDVyJdEEWA
 csKVf1yZZpUb7520ZtVIvLKuUard6cUHZ9xjtnSBRlfzLvviFhmtKWv021bbalwvO2de
 H9bBfdvNCVuc1G2zJyyAAty1SACN2zM/Va1JS5XNUExwThQOOeCrvw/95WFKJM7ti76j
 wRkQ==
X-Gm-Message-State: AFqh2kpub2iIogF2hrMkLBnYsx7agMkB6E26oKTDzebdPU1CjIPC+x4j
 yU7NiPQ9L3GIbZLZ/aBQ28rcE+zOGoyxrHKUyDk=
X-Google-Smtp-Source: AMrXdXtBGwyMiVG76gdJWavckNepUk2vKChO/zLM7GayDK3+uTmbVHFI+3k3/Y7ESTZcYI9zYoQwfA==
X-Received: by 2002:a5d:438e:0:b0:24f:11eb:2746 with SMTP id
 i14-20020a5d438e000000b0024f11eb2746mr3088847wrq.68.1671696012353; 
 Thu, 22 Dec 2022 00:00:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ba18-20020a0560001c1200b002421ce6a275sm17406983wrb.114.2022.12.22.00.00.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 00:00:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jonah Palmer <jonah.palmer@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/virtio: Rename virtio_device_find() ->
 qmp_find_virtio_device()
Date: Thu, 22 Dec 2022 09:00:04 +0100
Message-Id: <20221222080005.27616-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222080005.27616-1-philmd@linaro.org>
References: <20221222080005.27616-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

To emphasize this function is QMP related, rename it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 289eb71045..a87007d22f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3826,7 +3826,7 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
-static VirtIODevice *virtio_device_find(const char *path)
+static VirtIODevice *qmp_find_virtio_device(const char *path)
 {
     VirtIODevice *vdev;
 
@@ -3867,7 +3867,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     VirtIODevice *vdev;
     VirtioStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -3943,7 +3943,7 @@ VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
     VirtIODevice *vdev;
     VirtVhostQueueStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -3987,7 +3987,7 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     VirtIODevice *vdev;
     VirtQueueStatus *status;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIODevice", path);
         return NULL;
@@ -4080,7 +4080,7 @@ VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
     VirtQueue *vq;
     VirtioQueueElement *element = NULL;
 
-    vdev = virtio_device_find(path);
+    vdev = qmp_find_virtio_device(path);
     if (vdev == NULL) {
         error_setg(errp, "Path %s is not a VirtIO device", path);
         return NULL;
-- 
2.38.1


