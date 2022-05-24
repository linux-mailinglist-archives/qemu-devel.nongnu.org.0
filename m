Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39171532DC4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:44:06 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWhZ-0006jS-7v
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWej-00042U-OL
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWea-0005Lp-KS
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id z17so3978513wmf.1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuv0XY2H3KqTbh7O/QyKEXQHF+ELTPI/LNmsm5wiDv4=;
 b=lgIihCWikM2XdSIQsw1gRlsHXfdcEyoU6a2au0m2lylQxjv4oRorj1/qser3tYMsRq
 uhj9bcgHsl6G/aCxkzaeriMiFDGZ06r9kCL9k6R4M3TmnO+XJSe1sk4uBnXBpCwjpfgv
 LATH7qQ69E27UUdeO2+7ojltDfWhd1GRS/sIf7G3YsDjlgG/+Zz9WMumBRpg7MUKyTIe
 s+qRRgi99So67IkY621FrOpPtjg0tMYtTF4ZGlbvhxpwie7wTFHR1WX/If2YCEqHNUBh
 6/vWweNEFXXs4CQGZxgeTyG78jvLDiTJW5weTAWgE1gs82SyJT59Sciopjeu3+ndJcIe
 NcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuv0XY2H3KqTbh7O/QyKEXQHF+ELTPI/LNmsm5wiDv4=;
 b=4vn/pJfxKw9a1LVxmXHKCgdO0rzVkoxygo6zbLtKFOAcooATtm5mNfjy3RsM0O5l9Y
 qDr4eU+32MNIGVitgktLL+YjMY3tSl7M5vZIT4kNiSkSvlZ9xmLDa1HeabFjmx7cawSo
 KO1CWwXsevui4fdag7Y1kTiI5/tCDp9Z+S9As2LqyZ5I0gPu/2dvb8oSV4iaq6qH/7mT
 KGYsvMil9wQoT4HJ0IF1zjYmdlgBnee3cJQZHyB0InwSJ8rJ/ecf5QlIO/3UHQp+iYnz
 aAyrIguqb/b7KscMhJRYBdLxdSnJ95fWit68slOihrZziK0pk2ZHRIaXQZk0evKbnFjk
 /1KQ==
X-Gm-Message-State: AOAM532nu2UgPzfpw6G9Ywe3MVOK7A/UV0LsNudoi4u2xS7TgkRZbrAo
 GGcfag96/8UUKsSdmzjkpKIL+Q==
X-Google-Smtp-Source: ABdhPJxtIvi7uAKswMNOG2G/xdqxQVaKkA62in5dR1jXwMZYFU0QtnI4zntmvydM2dg0dW0/PX+UPw==
X-Received: by 2002:a7b:c841:0:b0:394:890e:9195 with SMTP id
 c1-20020a7bc841000000b00394890e9195mr4368259wml.59.1653406859054; 
 Tue, 24 May 2022 08:40:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adfb182000000b0020c5253d8d0sm13055061wra.28.2022.05.24.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:40:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C3051FFBA;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 02/15] include/hw/virtio: more comment for
 VIRTIO_F_BAD_FEATURE
Date: Tue, 24 May 2022 16:40:43 +0100
Message-Id: <20220524154056.2896913-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging a new vhost user you may be surprised to see
VHOST_USER_F_PROTOCOL getting squashed in the maze of
backend_features, acked_features and guest_features. Expand the
description here to help the next poor soul trying to work through
this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..2b2587d324 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -24,7 +24,12 @@
 #include "qom/object.h"
 #include "hw/virtio/vhost.h"
 
-/* A guest should never accept this.  It implies negotiation is broken. */
+/*
+ * A guest should never accept this.  It implies negotiation is
+ * broken between the driver frontend and the device. This bit is
+ * re-used for vhost to advertise VHOST_USER_F_PROTOCOL_FEATURES
+ * between QEMU and a vhost backend.
+ */
 #define VIRTIO_F_BAD_FEATURE		30
 
 #define VIRTIO_LEGACY_FEATURES ((0x1ULL << VIRTIO_F_BAD_FEATURE) | \
-- 
2.30.2


