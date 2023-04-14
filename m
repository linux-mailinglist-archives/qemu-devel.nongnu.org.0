Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CF6E2811
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:08:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvI-0007MB-0z; Fri, 14 Apr 2023 12:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuk-0006S1-8A
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLui-0007yo-Ct
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id l18so17963466wrb.9
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488276; x=1684080276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KH5LwiCrOTvBSCuNpYnxQcsypFz8wThrZQsAnqkj0KQ=;
 b=Sdj8gbiDPb4tzbA4IYEDhfIDNGgL1BAPjP2dI1RtO2mEIx2afuqR93ODe/ARptkGMc
 OgrYZvwPP6KoAwSs5SjkutYwzuhrQlzjuuxr0G+o2LSvwb6Y1kvL6uIBJstB8P+wqtoe
 ZTeSWcIx1YWMUCxRL9wvz/X3q8WBD0U2tbl6amzaot3mxH6pnjcWbbuS5HFkfxiL+Bpy
 R53uVYPdY7iEmXSAU/7QL4cxkwptnm0QpBRPx3945N/rbB1S0votndKpLEDWbPuhOuy8
 eyFgy61kF0I/tJipXdrdET3GXQ1o/RNL/WXgJfybuXLoV4+RUH/4OIyfpAieu92Jjpgs
 ueLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488276; x=1684080276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KH5LwiCrOTvBSCuNpYnxQcsypFz8wThrZQsAnqkj0KQ=;
 b=IvbW8syc2xUijUBtXHvA/Wau8DK/MSjoXmxi0S/qvnzpJWmcZEg/jN5Ke6BHeVj8oT
 TqS+qQeZ7jH5qNcxgww0wGtSYbyU5ZTEFiq5vMfAb83oAQpwQZTBv6P6y811Ed9ukcLh
 GAT/2ptNQhEt7ArzpyVgii2Sr64mAq+3Eg7lLV5qfyytka5p3oqTi1qZKgNDj9QlDUsL
 co6G2I8LsD1CfiX/fDaYIZSMiLGp7I3jycz68HDeC4afWGJEQvQeBLD7PaakG2B7tsAX
 OIrlRmLtnWu1Zfg9vWhuFzwe6zRznNWYqqyj2pGD7x/Wh+vF0yAwc3KhESGY+Xh59V8M
 Z8BQ==
X-Gm-Message-State: AAQBX9fFnV4uDSwFRShnr3BJFU/NhIegutcjdIoByZndq9vNwB47o6kP
 5ey2PZOLyKfiSks7rNsWVCQaDw==
X-Google-Smtp-Source: AKy350b7UUcqk7rWrOD5NIBnjb+3ihRuH4AAZosRuVBnyVv+oWQcysHENDTjz8Gww8xeZylB/zD12A==
X-Received: by 2002:adf:ee83:0:b0:2f5:39a2:fd99 with SMTP id
 b3-20020adfee83000000b002f539a2fd99mr4380381wro.71.1681488276102; 
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f17-20020adff8d1000000b002ef222822d5sm3855281wrq.74.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14A1B1FFBA;
 Fri, 14 Apr 2023 17:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 02/12] include/hw/virtio: document virtio_notify_config
Date: Fri, 14 Apr 2023 17:04:23 +0100
Message-Id: <20230414160433.2096866-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f236e94ca6..22ec098462 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -274,6 +274,13 @@ extern const VMStateInfo virtio_vmstate_info;
 
 int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id);
 
+/**
+ * virtio_notify_config() - signal a change to device config
+ * @vdev: the virtio device
+ *
+ * Assuming the virtio device is up (VIRTIO_CONFIG_S_DRIVER_OK) this
+ * will trigger a guest interrupt and update the config version.
+ */
 void virtio_notify_config(VirtIODevice *vdev);
 
 bool virtio_queue_get_notification(VirtQueue *vq);
-- 
2.39.2


