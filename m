Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B86E280B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:07:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvR-0007zf-Bs; Fri, 14 Apr 2023 12:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuj-0006Rv-9g
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuh-0007uB-7E
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id r15so1090400wmo.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488276; x=1684080276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMkpUFkutd+rkxciDVz0OwgC4E2pyiYQdv8Xz2UBqBQ=;
 b=ZDAQ4JDh77Z7nJTcc8Cyx2jNOtWdsdacBdEdLIskqZUBEJfISElHBRSNzucK5uIiom
 JLRB60GJHXNOJ70N5CXbtcxRu4KOiC5nZox3p4vMKUlDqMuHVeZoOmpG0fShBCKVXGse
 8cjmUrEGkYhg45X0aBgkaxewoggWVhif7cYCESRCGaChFtW8N3Fn0q8nfxbcMFhNN9H2
 8CPJu5Fx0qe+wIAWxJdg1tDPhEfvDzRTq7fddkWTkG/hDp/4aOQboduTYg3EnQT/fP9S
 v5N50Pxhcuo0JKZAfk1IVH6WY721yJDsb2oyBWqpoqYV0J9w3biurcufZt6UtStI0Guw
 LKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488276; x=1684080276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMkpUFkutd+rkxciDVz0OwgC4E2pyiYQdv8Xz2UBqBQ=;
 b=WDI1b+7JRsJZn69RVgpmIWCEDTcQNNSP167lgCzyZ5Lic9CuKt812CYk0uXoVEoTTA
 CDt1OdDmiMAmUWpwTqMX/F8R3CO2RDW2KrFwkB3bJuCMPHgXp6/HswXQFE6MSJgO0xpP
 lGK+pW5BQpuKXHNmgHxBWNBjIPwVQEi5YJttbsMCx/+doLiLux4CHDGcKNMnKOWl8XPG
 mN1O/xTcajLauBJpYCN39M3u1IaMfb7bYAGXVHR8B9C6AnigEt3I5Le0ZFrm2vLZlqgl
 GpBfPi7oDv2xu59mJmD49AseyckTFJOhPhB16JYXTq0MdGlP+qh4w1lKkjtNh08EQRY9
 SbxA==
X-Gm-Message-State: AAQBX9egJ9oLusml62CmX0L34sQAbfDriX64k5nmy1dDM1xYYILhhzXg
 nUQGy5lpkAqJ2Z3+bESKwqw7ow==
X-Google-Smtp-Source: AKy350b+gWdgW8geLhlMjwQEXNAW/SY1Ts5ykdwuwZsP3ZlgVVB+OxUBXuL8FvCQa3gIZ4vLMi7zYw==
X-Received: by 2002:a7b:c419:0:b0:3ee:672d:caa5 with SMTP id
 k25-20020a7bc419000000b003ee672dcaa5mr4433072wmi.17.1681488276405; 
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d65c2000000b002ceacff44c7sm3807575wrw.83.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4416B1FFBC;
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
Subject: [PATCH 04/12] include/hw/virtio: document some more usage of notifiers
Date: Fri, 14 Apr 2023 17:04:25 +0100
Message-Id: <20230414160433.2096866-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


