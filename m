Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C750DB26
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:28:50 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niu5R-0000zZ-4f
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu06-0006Uj-NL
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002f2-QP
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LP+dkidDrA7cfJYHAisZQeWSrGU9PlpHAtpMlIl/SfU=;
 b=W2X4SkT9/CzP9Ljv4Et/cXO+X0Y3bcBkk5HS82pe8HatLJQ303SNCEUOdtnwL6ziky8t+p
 sT2ocww2LDe9UA76NCdetLX+9uAkTTUtW1eZb4irsvsn1l9iqHF0/AMUS+C1hqDPQD9tgI
 4Ne5p/DbUUGHoJNvru3LY9cww8nr7TY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-3NzVTrl8OZGt-HCW4NULiw-1; Mon, 25 Apr 2022 04:22:04 -0400
X-MC-Unique: 3NzVTrl8OZGt-HCW4NULiw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l11-20020adfc78b000000b0020abc1ce7e4so2424172wrg.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LP+dkidDrA7cfJYHAisZQeWSrGU9PlpHAtpMlIl/SfU=;
 b=WtPykElShU14/3s1gBk17dDYCmkLFMwQUx+Y9XouimehN5t1SzwKx3zq3ltPfLTEHC
 qPVfWRSR/3ivgLCgtwKq5bONfvPQvQHrnNfSdOyxzzDK4PO3aTvGBUoyB0U+GLVMj8er
 bRcfUSBB1WYnKEKGnPW5/v7YZtWYRLmLciFvO3eYPyJoR5YHDLR5opWLfDM5kC2Yecoo
 0KzJAT7aWlqbIG2K4YFAdM09dV300tP+HlicFTrEzWG2bXycyzDNwI0gxLjwEqv0tQQa
 VLE+0fZ4WfdDfEGvqOVaMqyFqTI2xM3LdM1AUkshpZRH6TTb8XubB6iMPvnCzCJ5Dber
 OGTg==
X-Gm-Message-State: AOAM531WgdaCgqoGkSPTe4v8awbhyWB36GzfBKqBYobxkwa4ql10+MDr
 dTwmnQep7IQLySzlkbZVVM1DIHesqdsTdOToTHEYbS/T5a70Q37IOp7fOV5SQtPHENLckeTqtCt
 0Wf/rdc5VdStn+go=
X-Received: by 2002:a7b:c155:0:b0:38e:b840:c99e with SMTP id
 z21-20020a7bc155000000b0038eb840c99emr24205908wmi.201.1650874923791; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF3yOmquu6AEfkG27LCAoxXCxRyK/bmeHLHRzKzd33HzQgGq5KPLwi+gafnv2wUQux0kat3w==
X-Received: by 2002:a7b:c155:0:b0:38e:b840:c99e with SMTP id
 z21-20020a7bc155000000b0038eb840c99emr24205866wmi.201.1650874923491; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 s2-20020adfa282000000b0020ad9c40555sm2790490wra.94.2022.04.25.01.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:02 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 23B7667B1B59;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/18] hw/audio/lm4549: Add errp error reporting to init
 function
Date: Mon, 25 Apr 2022 10:21:47 +0200
Message-Id: <be1bf295b3c6a3dee272b4b4e8115e37c2a772b5.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
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

This will be used in future commit.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/audio/lm4549.c | 3 ++-
 hw/audio/lm4549.h | 3 ++-
 hw/audio/pl041.c  | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/audio/lm4549.c b/hw/audio/lm4549.c
index 32b1481b5614..418041bc9c6c 100644
--- a/hw/audio/lm4549.c
+++ b/hw/audio/lm4549.c
@@ -276,7 +276,8 @@ static int lm4549_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void lm4549_init(lm4549_state *s, lm4549_callback data_req_cb, void* opaque)
+void lm4549_init(lm4549_state *s, lm4549_callback data_req_cb, void* opaque,
+                 Error **errp)
 {
     struct audsettings as;
 
diff --git a/hw/audio/lm4549.h b/hw/audio/lm4549.h
index aba9bb5b077c..61c3ab12dd33 100644
--- a/hw/audio/lm4549.h
+++ b/hw/audio/lm4549.h
@@ -36,7 +36,8 @@ typedef struct {
 extern const VMStateDescription vmstate_lm4549_state;
 
 
-void lm4549_init(lm4549_state *s, lm4549_callback data_req, void *opaque);
+void lm4549_init(lm4549_state *s, lm4549_callback data_req, void *opaque,
+                 Error **errp);
 uint32_t lm4549_read(lm4549_state *s, hwaddr offset);
 void lm4549_write(lm4549_state *s, hwaddr offset, uint32_t value);
 uint32_t lm4549_write_samples(lm4549_state *s, uint32_t left, uint32_t right);
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index 03acd4fe344b..868dffbfd321 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -564,7 +564,7 @@ static void pl041_realize(DeviceState *dev, Error **errp)
     }
 
     /* Init the codec */
-    lm4549_init(&s->codec, &pl041_request_data, (void *)s);
+    lm4549_init(&s->codec, &pl041_request_data, (void *)s, errp);
 }
 
 static const VMStateDescription vmstate_pl041_regfile = {
-- 
2.35.1


