Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F050DC01
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:08:13 +0200 (CEST)
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuhY-0002Qj-2P
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0r-0007KX-3P
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0p-0002rL-32
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9HfXFFqm8XD3sd/B71lxNFxNbf5q88arJTDKzK7o3M=;
 b=WSX/WBoyT49aM7NxGWaYTwWRcCKJn0Hsu8VNQz3oFBcTox2mhtg/6l4INFWnNeaceXPAQB
 NQhBRU6Iu4DJ8f/KtvkG5hZTX9XyK8da7FA7hR4yJKdd3i78ulq7TN6ETE0QfBaYTQ6rRU
 In0QEOpnDjCKflcwK4W6gwUqiKvJ/zU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-hED7U5QHNemqZWm8fXi9OA-1; Mon, 25 Apr 2022 04:22:08 -0400
X-MC-Unique: hED7U5QHNemqZWm8fXi9OA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g13-20020a1c4e0d000000b0038eba16aa46so6862150wmh.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9HfXFFqm8XD3sd/B71lxNFxNbf5q88arJTDKzK7o3M=;
 b=CPM7/6+1AdlV9KdMDHW1/x5YxM0YC1nZmKoQFMZ97xT5pF2qmAqnC15nogF4Gierzg
 +BNpuPgjizVtQ8nBfY1AqeNN+LGWqI/I/EfNbReFhwIHOatebBYP86i0dbjgFNoezlDf
 cqNO4QiYok+TkGS4e9MEPhR+Pj2cjJQ3NaF13cG181Un9pyfe4BNlSPsuH4MUEXortIz
 si3W3E4NtU3EKValZp37qpFTLsEOh/yTpaJ8Mn+i1bxAUK4QAdVTU6XX8RDRBKWQUU5o
 QRmzZh+H3HwV9rjxlwwyCbNPxTePtAX8mdQqKZMowswcQRum+XK7N7dekNK9I4Z0i4VK
 CX0w==
X-Gm-Message-State: AOAM530SQVp87RYT9Buj/hvCrDQn1rD1rXB2bepeQwoMQrt6oZVwWYo0
 k+bvairX15e0iLPt2H17smam9T9CvNmPGN4zfiOBi6gcNQlS5hxadrAP2bLyhbbDPIHsW1GD2ig
 BhJn/MX/SSBSrmFA=
X-Received: by 2002:a05:600c:500c:b0:392:b12f:40a with SMTP id
 n12-20020a05600c500c00b00392b12f040amr15318845wmr.122.1650874926858; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLFvk5nzTaC2g1M8XY2wI8/zxlrWzXYrheN/6UUX0J7RkRiN+T145v3db5tf+iW6dHFnb7Eg==
X-Received: by 2002:a05:600c:500c:b0:392:b12f:40a with SMTP id
 n12-20020a05600c500c00b00392b12f040amr15318821wmr.122.1650874926684; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b0020a7be3f1d2sm9949427wri.53.2022.04.25.01.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 9C2A067B1B67;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/18] audio/spiceaudio: Fail initialisation when not using
 spice
Date: Mon, 25 Apr 2022 10:22:01 +0200
Message-Id: <5db1fdef0330f20ed6ae306b5a71dad1b5e9b44c.1650874791.git.mkletzan@redhat.com>
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

The caller would already fail, but this way the message can better
express the reason for the failure.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2043498

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/spiceaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index a8d370fe6f31..fdbd7dc285ad 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -74,8 +74,9 @@ static const SpiceRecordInterface record_sif = {
 static void *spice_audio_init(Audiodev *dev)
 {
     if (!using_spice) {
-        return NULL;
+        error_setg(&error_fatal, "Cannot use spice audio without -spice");
     }
+
     return &spice_audio_init;
 }
 
-- 
2.35.1


