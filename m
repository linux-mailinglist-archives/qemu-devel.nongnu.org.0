Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9C3EDDB3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:14:25 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFi40-00060D-68
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi0O-000141-At
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi0I-0000vf-Fq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629141033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Msik88TWjmYxIlnfXsQXGA447iGC4A0xH5kicOLH9TY=;
 b=ia6vIqlc8IRJnp+Nt+uOxrr5m7BPmxzsWUjzFUdApr8eyt4tVtQYM06Li11ZcKUa3/gf60
 uk6jHWXMJjl7QGw/fs096XYQm/BeI5I1h1yd/Hta2KqPq9Zdfv80MMxp+rLWaTtwOqPOsV
 F9DMW/38qILDq2mfaC3KZQwkSUuPVHM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-BZHPfiSRPP-JyYUXmKrb8Q-1; Mon, 16 Aug 2021 15:10:32 -0400
X-MC-Unique: BZHPfiSRPP-JyYUXmKrb8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n20-20020a05600c4f9400b002e6dc6a99b9so273501wmq.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 12:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Msik88TWjmYxIlnfXsQXGA447iGC4A0xH5kicOLH9TY=;
 b=mRjzL4oifVTNHKu3l88RkYpqD++N4A4VyP2NW+27lT///H2undhjkyAe/h4knWEVuA
 EOc0Uu7bdHC4oAttEETy57wf0Dyiun7TX6QmerzO2iJl0oRgrUUfnwQm8tNKXmbygrm3
 SoUsI9JR5KqWu+5MOAD0m9CM+4Kfddb8mmjj5lPV5sCZoeCfkG2mvHR3kZ048YfU20pM
 jrgsY4SBWvz0gvfp5GJaLQOj9EA4LK5Du+uq0nZQjtj7sYQh8Vd9A9fGHAaFCx19QyW4
 YjDt/jmo8GgXR0NS6v5RApsJqRBo432ECbRv8agoq/MYoaOL8scoDdBuymocKT8eCRBE
 We3g==
X-Gm-Message-State: AOAM530t+R85y0OYbT0fwVaVHPn+JORpft++lRgKHzyFdNnAOwul1ZeJ
 OFVBpfHQq4uvApdAls8QJPIjGb5Go66h3PPZotu9Glm3TMdT9gZ4dyNEVK0Gkq+JBdzwwRXoI3W
 t55KSJax44ftkCXi796KsKClil0S0aekThmvamLfbbCmyUCiWwV+9CkDk/8QRmU+J
X-Received: by 2002:a5d:6483:: with SMTP id o3mr4587826wri.197.1629141031047; 
 Mon, 16 Aug 2021 12:10:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH1ZRbXlg+46P23Yvnnelgs8QXwxWt4C8qmMI7gHH/I/WwFdi7ZqOZyzigTVOaZRKBe49A5Q==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr4587799wri.197.1629141030841; 
 Mon, 16 Aug 2021 12:10:30 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y66sm15610wmy.39.2021.08.16.12.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:10:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] MAINTAINERS: Split Audio backends sections
Date: Mon, 16 Aug 2021 21:10:14 +0200
Message-Id: <20210816191014.2020783-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816191014.2020783-1-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the Audio backends into multiple sections (OS / framework /
library), allowing developers with different interests to add their
contact to the relevant entries.

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f18fcd76450..94dea726e05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2270,9 +2270,51 @@ Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
+X: audio/alsaaudio.c
+X: audio/coreaudio.c
+X: audio/dsound*
+X: audio/jackaudio.c
+X: audio/ossaudio.c
+X: audio/paaudio.c
+X: audio/sdlaudio.c
 X: audio/spiceaudio.c
 F: qapi/audio.json
 
+ALSA Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/alsaaudio.c
+
+Core Audio framework backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/coreaudio.c
+
+DSound Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/dsound*
+
+JACK Audio Connection Kit backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/jackaudio.c
+
+Open Sound System (OSS) Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/ossaudio.c
+
+PulseAudio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/paaudio.c
+
+SDL Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/sdlaudio.c
+
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
 M: Hanna Reitz <hreitz@redhat.com>
-- 
2.31.1


