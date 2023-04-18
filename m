Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F926E6963
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:24:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5W-0006mw-DH; Tue, 18 Apr 2023 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5U-0006mI-N6
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-0001B0-8B
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so143172wms.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834904; x=1684426904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMkpUFkutd+rkxciDVz0OwgC4E2pyiYQdv8Xz2UBqBQ=;
 b=pYO2bM/HxOUrYC2DCsCRsjUUil5wQCYuoiMIhEF3v/4pvUZw5SxTR7GpxY2ZJ++QAw
 oPlH6J74QUxKDX2bcgL2k2W5n1rnYaLSnBCD0xpyAqUaM5DGpkcwL5fBqFZ0IoK97QN/
 biv1o3AT+5wDuC2L2ewl1wv8Vt9YsNUgAko0HRw7QGGBTb7e23NClAdTMtFSKZQRJtWV
 1BYFEkSJ0axr1mLY/wzHlubuAh8kWI6w9616SLVuGb+wPGZqWk5r1AQMAaPdWcajJuY5
 3zWODqYBwvT6bKsIuZG/Yf4UQtzHE514S8e7WxxiQP/Yz+tMbDb35wWY/5IM4a2+HhmU
 AK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834904; x=1684426904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMkpUFkutd+rkxciDVz0OwgC4E2pyiYQdv8Xz2UBqBQ=;
 b=KXwVvvcViEq+AQcF0gXfdSE4gDH0ufnoiy8vv80mGnP/AfJ+y+Q6ByhXdSjGIE+ERg
 x9Cp5ODCd3h/sdk5GgBE0cNtdu6HtyRE7VpQB5PT53dBO5U6GvDseMoCIPEP/s3pA1Fs
 S1pMp6bcXqoPmDHAW5kSUsrfq7KiT7YiBweJblnSGT1uRV0wiJmEpnQ3W0JtLNC54vJc
 bi2Hqzp2GH1UFYov0IUTs+5xxezQHirZ4/xRt33vz3qsTRFiYO8JJ0Rk8tIblFVXoYow
 K4XbF2MmQ0iQzXIbWNnQCDIcS86s0aOSGvHA/Dd4Lh+rQ0LGUABz87Qzb/beQgUkfR73
 LTJQ==
X-Gm-Message-State: AAQBX9cRaKQ6cgOv1g0FfTuw8IUQzhhbzJJBpgDBTrF/Fe3sSLNtX5Iy
 GE7b2GnsaE/kK4WYIyF5T7g4MQ==
X-Google-Smtp-Source: AKy350bDS4bb3FKP9JBfG3bThVNVL8AMCipdT5rIhxJKNe3LIcUPgdwDBqKq50TJkiaHsmeRC2TRcA==
X-Received: by 2002:a7b:c4d3:0:b0:3f1:76d4:d43f with SMTP id
 g19-20020a7bc4d3000000b003f176d4d43fmr3771383wmk.8.1681834904592; 
 Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a7bc4d7000000b003f17300c7dcsm7279114wmk.48.2023.04.18.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C471B1FFBE;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 06/13] include/hw/virtio: document some more usage of
 notifiers
Date: Tue, 18 Apr 2023 17:21:33 +0100
Message-Id: <20230418162140.373219-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lets document some more of the core VirtIODevice structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 1ba7a9dd74..ef77e9ef0e 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -150,10 +150,18 @@ struct VirtIODevice
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
+    /**
+     * @user_guest_notifier_mask: gate usage of ->guest_notifier_mask() callback.
+     * This is used to suppress the masking of guest updates for
+     * vhost-user devices which are asynchronous by design.
+     */
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    /**
+     * @config_notifier: the event notifier that handles config events
+     */
     EventNotifier config_notifier;
 };
 
-- 
2.39.2


