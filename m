Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10F48B66E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:02:48 +0100 (CET)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MPv-0002OU-Io
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7F-0003qh-Kg; Tue, 11 Jan 2022 13:43:29 -0500
Received: from [2a00:1450:4864:20::42b] (port=33288
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7A-0005v4-Om; Tue, 11 Jan 2022 13:43:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d19so14880wrb.0;
 Tue, 11 Jan 2022 10:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFQEkNDw+pjRjww0vCiwQyACSZhEnWGP9jxosSkqEcY=;
 b=PRv1NgfAQethOjcPYN4vqSS/d5sF8HC0hqfytOH9WK2sifOGbLP2ggqQeALaLY2kjN
 r4bIA/ruMLk8Ss0+4e0Bm4/mtpky5XhFEg7DhTTOwkg0ni58SLrRZDRCMQrlz1hnbwuH
 qVYuSXMTlvU1BLBeJGn0gXGuIMFUgLsWKt7TPHPaos9wxPSurMIfv7LxNI9C4bz9fjgL
 9pChmxyTSOLClk1Yq6o0s092YKofTFZiSXY3RJLyzLVXFRQJfsBUBlbphXkSSlPBfa1z
 +f4z+ggLH+W+FrYV8A+4f2V42nCMrw/GUhCsPNSTuqJVmDa6q1z4f4yNrcJIK1PNm+Oc
 xK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BFQEkNDw+pjRjww0vCiwQyACSZhEnWGP9jxosSkqEcY=;
 b=VKj9+SN1olSetfZBUb7Xqtpjg4FLQTNuUUyOcEb0a8MEmPn66DyofcfgFBcpCTSy38
 ghN522nNkbU+wtKGS1S39bvfVrvGzg9eG+fkwIuik+uzaZ3ObvefI7fqOE7DP39bFjbJ
 EKLa7BAWrTzgJ8pXq9SynzAHdsvLyqiUpPUVdFZC1O0MvR44RDKgH9hMsCGVELsE1yoN
 L1i7nELSksJ00LyuvoxWiyXMBxUjmsJui+zKlIG2Pv00kt3SdCWoVgrs4OTKGv1nr8lQ
 bh4Fq3gRxwyRlJnnojXJ9GXAene341Lfv5bH/8Ub5eZ+8V8pfSF6pazF1UjnQTr2pjUi
 LN1Q==
X-Gm-Message-State: AOAM5313wFvRyI7WD0yy5D485ID2w74Io+JXfEbOWBTyuAz5ySuEJxsK
 mv8uZVTbRQkyZ5wt9uXq7OiiaQKbdYtkog==
X-Google-Smtp-Source: ABdhPJwSRtqjb4isnTQzQHyPZHeUP7Z+bejct95ZNX76jharvaA66jAZJGpAM9O83TYOlx/Ziz3EaQ==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr5046533wrr.106.1641926601235; 
 Tue, 11 Jan 2022 10:43:21 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id d5sm9875216wrs.61.2022.01.11.10.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/10] hw/nvram: Restrict fw_cfg QOM interface to sysemu
 and tools
Date: Tue, 11 Jan 2022 19:43:01 +0100
Message-Id: <20220111184309.28637-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

fw_cfg QOM interface is required by system emulation and
qemu-storage-daemon. User-mode emulation doesn't need it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nvram/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 202a5466e63..f5ee9f6b88c 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,5 +1,7 @@
-# QOM interfaces must be available anytime QOM is used.
-qom_ss.add(files('fw_cfg-interface.c'))
+if have_system or have_tools
+  # QOM interfaces must be available anytime QOM is used.
+  qom_ss.add(files('fw_cfg-interface.c'))
+endif
 
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
-- 
2.34.1


