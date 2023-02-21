Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824569EB3F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc1H-0005Pb-G0; Tue, 21 Feb 2023 18:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc1C-0005LZ-V4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc19-0002hn-Q4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id p16so2211318wmq.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCjOFfN/JCWa/PeEus9yAgUI0eq6WXQy8QoVJLxSGDI=;
 b=jMMKDzXX2P8N4rIHCofsi7Cr6rQJJnrEkC2mpN7TAiI6UwEri8p3Yt2JfHWTayJUjI
 qoQ6lSksT7eR6cEkukai1JvI+BQXeSJTLkUWFiR6JqxmpZSWo7fFIMugI49JIJt1urTz
 3F1X27CjnzS+zw3lMk71CkzYc1HqJpbMufkBnewUlZsHe33d02QJe931E6X0LRX5V6s0
 GoMLYAbx5DGN7/TGyEggkcn90Ieb/nEjKFbAMNaF3SKVGbkGKzKnYZukpkzLAyoz3KVq
 Y3E5Cr5P/hOoFcqhjD6wIA+auK4W2DTtlTEOPLAl6/IeGszuRfms8b2JuOfcTjwEaulP
 59VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCjOFfN/JCWa/PeEus9yAgUI0eq6WXQy8QoVJLxSGDI=;
 b=KexXSLcf5l4zWUzjD7/h6+noyWJID8RpHd29LvMZbS4KIcq1ikfaZteClJ0a1Shcyd
 Id08DxH2cDnLz7wd2AG4FI9w0PUIP7LTEZwLGthGHV5pjT7TXv/DLPu8m6rxveXVDaIO
 BY0hOfG/2vtdSxiMSjsO6Qc3Qga2RNPNogQlbCLq80hctZTnKVZQ95QC/k0i0K5WqJ2r
 aDS+ezFAo+fJnkXGxOsU8MLUkgAqzP/pceUUAPOu2NFcXEYHL9fiA9BWnVoGncmbNZ+p
 jHMrNjV+1QpDRdRVK+i/ZlYoht68+fIkWRyu1T71yhIEiyokM5eO7fDCJdL56DShbKID
 QxzA==
X-Gm-Message-State: AO0yUKWj2NTPuCH04tqIVj8up7aW8K1fkFg+Sfex7fwEzb5HxteWjpwB
 pYRsIF0D9wQY6Fe6EPjrNxK3PPd8hnfyZVlN
X-Google-Smtp-Source: AK7set8hb5N4zqpLpQZaAsPu7Bg17Rq+2Fbq9vf+ucCPUcZ3h9/lLExvhr0UbFeJTdAon2CtAgnUqg==
X-Received: by 2002:a05:600c:984:b0:3e1:fff7:e970 with SMTP id
 w4-20020a05600c098400b003e1fff7e970mr4862034wmp.30.1677021950629; 
 Tue, 21 Feb 2023 15:25:50 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc858000000b003e11ad0750csm3155554wml.47.2023.02.21.15.25.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 5/5] hw: Remove mentions of NDEBUG
Date: Wed, 22 Feb 2023 00:25:20 +0100
Message-Id: <20230221232520.14480-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since commit 262a69f428 ("osdep.h: Prohibit disabling
assert() in supported builds") 'NDEBUG' can not be defined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/mptsas.c   | 2 --
 hw/virtio/virtio.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index c485da792c..5b373d3ed6 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
     n = qemu_get_be32(f);
     /* TODO: add a way for SCSIBusInfo's load_request to fail,
      * and fail migration instead of asserting here.
-     * This is just one thing (there are probably more) that must be
-     * fixed before we can allow NDEBUG compilation.
      */
     assert(n >= 0);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fc..c6b3e3fb08 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
 
     /* TODO: teach all callers that this can fail, and return failure instead
      * of asserting here.
-     * This is just one thing (there are probably more) that must be
-     * fixed before we can allow NDEBUG compilation.
      */
     assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
     assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
-- 
2.38.1


