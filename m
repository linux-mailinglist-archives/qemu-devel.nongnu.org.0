Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FFB46EAAA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:08:13 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvL1n-0001ak-NR
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqj-0002be-KW
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: from [2a00:1450:4864:20::333] (port=40926
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqg-0001Zl-Ok
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so6742467wmj.5
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzyL0rwW98AtDdWXVvxfJFra64F6h5kdluyzTy63cnM=;
 b=oZDrJa9FfyOHcAOZAaRYIrY9M3SNfGzDUVJXbkTKIVjtaYdT4j83kHej6fp97yinl5
 qDZbohsYigwLLzazSs9qIIquQP6VOOAkIB4SXIkhrI69oGNVq/5vl/mxuSR1oG5vsQ5d
 Z87PiGxh1yVKcUCDn0tPMGk8uYWSWRNtyQlZGkUMMq2F8OyYBCytUG9kvvHLlp55CJSR
 kUP6FiV7UXVpMfhxyzcWJld9utxksQdKWfLDQTbkLL8LAcx3vHWAQ7K77v5eNC07P7SM
 SvMIs9tbm9b7D6VTbfwWST08bBltR6089Ov8RnKqFUSjIiJZAr/m0UWnolvyebvXVzxh
 ZCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzyL0rwW98AtDdWXVvxfJFra64F6h5kdluyzTy63cnM=;
 b=z4BFWAJaHH7+jcBW/Yyjw8BVI+9vg/kkgPkjTTEnONmQ4qUDg4g0XPVfVKjOzL3Jm4
 H2Rex/jW6OrX2M+ipakJDYArgaA/cK4Qyfsm/MDekZaZkVNz3j7f4uAzVyzPHoqHLDOY
 dnrHRZ5Cj8bgYCltoImMG6LHIpOr3lk6K23wlmNFPoOB2l3uqmFJ6gSG9Z82pg9r7/gD
 Jt+5a5UmfX3+eqeKjhM86U58uqFh7/4mfaeDV1ZxUAytBNmJ4r/XJUSaXtaytOnJRLAP
 jQ8usYKwCqwEaoZ//iGTB/4usFxvUPxVIU5TA662YcIND8oNZ2SrRe1YKmMy8cYNggRn
 6UWQ==
X-Gm-Message-State: AOAM531LCvYZM6BymGb4c0/TOw3F0K6Zebbd/YOEKohEMfqY3fsCMYny
 Ib55FM3KuZgtjyBqbvMN2IM1AppttNmHmQ==
X-Google-Smtp-Source: ABdhPJzgZv330Jx20YFtt+MqOXIl/xcbyXLy1edkA3yV1bj0BtOh2DgYsU4QW1B6Fms1tK1CAkJrtQ==
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr7618376wmb.182.1639061801441; 
 Thu, 09 Dec 2021 06:56:41 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:41 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 6/8] virtio_video: Add Fast Walsh-Hadamard Transform format
Date: Thu,  9 Dec 2021 14:55:59 +0000
Message-Id: <20211209145601.331477-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux vicodec (Virtual Codec) test driver in Linux implements
FWHT. FWHT was designed to be fast and simple and to have
characteristics of other video codecs and therefore face similar
issues [1].

https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/standard-headers/linux/virtio_video.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
index 16b5f642a9..3b517d50c4 100644
--- a/include/standard-headers/linux/virtio_video.h
+++ b/include/standard-headers/linux/virtio_video.h
@@ -75,6 +75,7 @@ enum virtio_video_format {
 	VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
 	VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
 	VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
+	VIRTIO_VIDEO_FORMAT_FWHT, /* FWHT used by vicodec */
 	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
 };
 
-- 
2.25.1


