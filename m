Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4950DB50
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:37:27 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuDm-0007GL-1N
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu03-0006TD-6P
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002ex-DZ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/07G+KOnjwzPWs5gbVSF2lCzR4/Df0FQ6EC3Xytgne8=;
 b=D0SbXmk22P32dFepvZGi6TdCFU3cH5Ep6mKDpDkLxb2ubKEHPm8E61wg3lGaE4lp1a5R21
 0DTQCirRlM+E62SMdS2bWpvEtCwlnpFl5CzVcxa9t6eEGSKFfFezstbQIX0zu/FnSWzPKB
 q07MfNBw/50UJ8L4bLwpiaFSim+c5Mw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-mQtdEsG8O2ajILQKGn5DcQ-1; Mon, 25 Apr 2022 04:22:05 -0400
X-MC-Unique: mQtdEsG8O2ajILQKGn5DcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 d6-20020a05600c34c600b0039296a2ac7cso6875586wmq.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/07G+KOnjwzPWs5gbVSF2lCzR4/Df0FQ6EC3Xytgne8=;
 b=z7aQpdkWH4XfJnyT29zmIVnTvIfxTrUNVIJPtMaiGd2iC8iio8JqaQJSD8BjoGzhgR
 oRqV7w2LIlUROx6D4gg4bi92vkLU2/WKg0J05BMBipCROBKcUBsml8IgppcOXUMVjB9a
 Dd/BVjmoZcHeBpExuu20FzLC9smsKmG933QjN4/Dm/CWahyOYE2AXQZ+s1KGdz17B6yt
 T8kI56On3fTu5uquWNgsIsPIY81Xy+48cQ5MZxfcBGMKu3SOGAb18JaK99xhVk+Qpnmj
 KcMCKPEvwCMkKsJALpLMcEDFqIY4kTqCyFH8utLQiRkiLy+0LKCRDwFCzgog0LdawPw+
 xbYA==
X-Gm-Message-State: AOAM533r9cIFGNDgb67U3pEq3Ym+VhGvz3n6LComijxVB49kSLIex1Qi
 rg3U2tTPJk2V7TzPj3KBlSaBNQSCSLPxEwDqaxJ2x6i/cZItNgbX5sOXSAxL+rL8zhefohsoOaO
 jz47dKeoqtZZhbYg=
X-Received: by 2002:a05:600c:3b97:b0:393:ea66:77ef with SMTP id
 n23-20020a05600c3b9700b00393ea6677efmr5295096wms.120.1650874924770; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwVF3dK0i9vOzAY/PYvnp5i5lQER5yvkUNth9GcfEFLwk+oH+Lrsa2v9IyXQkqINxFUFcY9g==
X-Received: by 2002:a05:600c:3b97:b0:393:ea66:77ef with SMTP id
 n23-20020a05600c3b9700b00393ea6677efmr5295078wms.120.1650874924601; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b0038ffb253bb3sm12904265wmb.36.2022.04.25.01.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 31F3C67B1B5B;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/18] ui/vnc: Require audiodev=
Date: Mon, 25 Apr 2022 10:21:49 +0200
Message-Id: <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 ui/vnc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index badf1d7664fe..2e7af139b030 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4188,12 +4188,15 @@ void vnc_display_open(const char *id, Error **errp)
     vd->ledstate = 0;
 
     audiodev = qemu_opt_get(opts, "audiodev");
-    if (audiodev) {
-        vd->audio_state = audio_state_by_name(audiodev);
-        if (!vd->audio_state) {
-            error_setg(errp, "Audiodev '%s' not found", audiodev);
-            goto fail;
-        }
+    if (!audiodev) {
+        error_setg(errp, "Audiodev parameter for vnc required");
+        goto fail;
+    }
+
+    vd->audio_state = audio_state_by_name(audiodev);
+    if (!vd->audio_state) {
+        error_setg(errp, "Audiodev '%s' not found", audiodev);
+        goto fail;
     }
 
     device_id = qemu_opt_get(opts, "display");
-- 
2.35.1


