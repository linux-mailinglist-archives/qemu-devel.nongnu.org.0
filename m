Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB450DB7A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:43:50 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuJx-0005BW-Ou
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu06-0006UM-4p
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002fN-PY
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAZUwc5ZqVj8eUHH2Oe1Tiz0RIqORJb8+QvvQ1BqMLI=;
 b=jAYYJXBGl122yd0XGTPw9V7yOwWFSd5E7izCyvYir/FWPma+Nm5ckxdHax2kvHLWLf5uRC
 RsftVp0oq/v/Ol+4dP0AfYfIJ1Rr2fcuhgFuHfnUNm8wHCw+OVN4j5Pc0nHzz8BV0mzbCZ
 wgVUYB0iVl4hjKq0sZZgERDHXT55UHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-0UY_C6VnMN2ClcYZDI0MJQ-1; Mon, 25 Apr 2022 04:22:06 -0400
X-MC-Unique: 0UY_C6VnMN2ClcYZDI0MJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 az27-20020a05600c601b00b0038ff021c8a4so9975318wmb.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAZUwc5ZqVj8eUHH2Oe1Tiz0RIqORJb8+QvvQ1BqMLI=;
 b=5cHvV5n2817EDUTC8Xne/dDUB1Qjqb2IslrErDXQHpX2Bdwj9DbxP25YArEDG/p87y
 QAMAK1UH67UQ60MnbBHRa0Q0ozHk+KNePEGe0YPlPikUHWlKC8JR4jOIWAKQ/SoC8DR+
 VAeC9jIruSitHiAYWB+p4uhRHgaWWHlNvy4ag3GXads9RE59N95HPigHsY+lU9e/r1fE
 Gd5v8uxYYc06bi3YXJ4jcNJlwx05Z+67jHG63eXebrNdBJqPYlDe0GwtXKVOvCxLcDZ5
 Y7ahniiSOj1pc2/IXY5hsLqU7RYT6mbTgf6ZbIY3U43tTmGo5YN3cUUDPHd4TsXr/BoQ
 RMPA==
X-Gm-Message-State: AOAM533Z84RuRkY/quADWVDCzesLioF/G6NnTVqNFZCl7NmR42tp6R+q
 9S8D/2IE75L6N1HsVgn5DiRF0P0/RG+ZfMdkWS4uwSx3ZfUDR3u+fr/EPk91z/dGu5trf4PUDiu
 qW1UiSKJUXeWZb4I=
X-Received: by 2002:a5d:47a4:0:b0:20a:c95e:b3f3 with SMTP id
 4-20020a5d47a4000000b0020ac95eb3f3mr12086549wrb.663.1650874924928; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9AN3DTpD4mNyWicCScIo/ePV7PEwSCtTlMYdcy2N7R8rIsAaI7dxGdpvi0OKSlN4jAW/JFA==
X-Received: by 2002:a5d:47a4:0:b0:20a:c95e:b3f3 with SMTP id
 4-20020a5d47a4000000b0020ac95eb3f3mr12086529wrb.663.1650874924731; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b0020a9e488976sm8952474wri.25.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 40E2E67B1B5D;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/18] audio: Add easy dummy audio initialiser
Date: Mon, 25 Apr 2022 10:21:51 +0200
Message-Id: <7b0a067b8b0a32ef7ec7c040d1e79d40a9a6b0de.1650874791.git.mkletzan@redhat.com>
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

In case of sound devices which are created by default (some of them even with
-nodefaults) it would not be nice to users if qemu required explicit:

  -audiodev driver=none,id=audio0 -machine default-audiodev=audio0

when they just want to run a VM and not care about any audio output.  Instead
this little helper makes it easy to create a dummy audiodev (driver=none) in
case there is no default-audiodev specified for the machine.  To make sure users
are not surprised by no sound output a helping message is also printed out.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/audio.c | 34 ++++++++++++++++++++++++++++++++++
 audio/audio.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 9e91a5a4f2b8..671845c65d18 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -37,6 +37,7 @@
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
 #include "trace.h"
+#include "hw/boards.h"
 
 #define AUDIO_CAP "audio"
 #include "audio_int.h"
@@ -2122,6 +2123,39 @@ void audio_init_audiodevs(void)
     }
 }
 
+static void audio_init_dummy(const char *id)
+{
+    Audiodev *dev = g_new0(Audiodev, 1);
+    AudiodevListEntry *e = g_new0(AudiodevListEntry, 1);
+
+    dev->driver = AUDIODEV_DRIVER_NONE;
+    dev->id = g_strdup(id);
+
+    audio_validate_opts(dev, &error_abort);
+    audio_init(dev, NULL);
+
+    e->dev = dev;
+    QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
+}
+
+const char *audio_maybe_init_dummy(const char *default_id)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (ms->default_audiodev) {
+        return ms->default_audiodev;
+    }
+
+    dolog("warning: No audiodev specified for implicit machine devices, "
+          "no audio output will be available for these. "
+          "For setting a backend audiodev for such devices try using "
+          "the default-audiodev machine option.\n");
+
+    audio_init_dummy(default_id);
+
+    return default_id;
+}
+
 audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo)
 {
     return (audsettings) {
diff --git a/audio/audio.h b/audio/audio.h
index 3d5ecdecd5c1..335704a4ddb1 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -175,6 +175,8 @@ void audio_legacy_help(void);
 AudioState *audio_state_by_name(const char *name);
 const char *audio_get_id(QEMUSoundCard *card);
 
+const char *audio_maybe_init_dummy(const char *default_id);
+
 #define DEFINE_AUDIO_PROPERTIES(_s, _f)         \
     DEFINE_PROP_AUDIODEV("audiodev", _s, _f)
 
-- 
2.35.1


