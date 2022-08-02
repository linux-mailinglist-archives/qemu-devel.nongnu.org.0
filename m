Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37310587A20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:54:43 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIobq-0003U9-A8
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXc-0001HL-Ct
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXa-0002ND-QD
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:20 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bk11so7303294wrb.10
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=efF1G23JZGBcKIp6YkFQGGk2fqRXWagTopKygNR1po59PbUd4t45kjdbsNpQhdOIp9
 rN4irGKpt3YfkzxMTiDaMJ1gRkwHo5wHg4a+OVZVXS3SN8lu3nr5N0pl7t3szYTXZwOM
 /rQAm8SdInJ9UZ+MW0XKnCUhAybH98awbs0Q8X99VLNlAyPMZL3UIOdA9RHfmmKWfw8I
 HWV/UOlnuNz21LKpw/rHYto1QW+w/hm4IVU02VKdWQ99bCT6EdzCDERwei6OuUmIeSvQ
 PsFwuzZ+xjrcOXyyiaJtJ/ZaU9qmhkaaKDf1PfQcrEnxIEXz7W3C49pzS+k4GC68xNiS
 XbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=MqciDGsmCi3P6IDoIwBr/03QBlHpEm0ihyczULxavqclrkp8iF/6z6AeZGP0GXehFI
 lZui+GZZzpwthTStKoXlbH2ctG1EkrTLortkHq48G3j7GvYboRrp0dDFEMR9qWJ4mKr8
 HiaPky4Beirv6gqadIXBdAjqF/HjFBjOOK2J7ojItcwOy2dER5gPZXbA0oiLHosPP3cz
 gBksLLRIzE+sTtXC4XtAqkJ1iCzl8Gj5/M09lEVgvb9gLnPGHLAzHxuahx2/TWG2PfKw
 ADG19A6OesABejUf1Dz01BtfCPi8u1LBYEXhMY7BMgvHROxh2auD+AL3LWEJRxLY59o0
 PtfA==
X-Gm-Message-State: ACgBeo0yA5c0cZvB1fUZHKOEfY7Cw6UoXfmF6cbAhDmw67eiypoexg3B
 W0/VHkiH8U2vQWR/ASlR+fGsyA==
X-Google-Smtp-Source: AA6agR6o/9O+Wa8d6ULbcE7q6RefoClwbZ7tggUNqcMfWXiwmDQ8Gs/xJGnef+Zsua7zuz90y/OZmw==
X-Received: by 2002:a5d:6e89:0:b0:21e:ad87:ab24 with SMTP id
 k9-20020a5d6e89000000b0021ead87ab24mr12832977wrz.259.1659433817294; 
 Tue, 02 Aug 2022 02:50:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0021b956da1dcsm14528615wrz.113.2022.08.02.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECB611FFBB;
 Tue,  2 Aug 2022 10:50:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 03/22] hw/virtio: handle un-configured shutdown in
 virtio-pci
Date: Tue,  2 Aug 2022 10:49:51 +0100
Message-Id: <20220802095010.3330793-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

The assert() protecting against leakage is a little aggressive and
causes needless crashes if a device is shutdown without having been
configured. In this case no descriptors are lost because none have
been assigned.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220726192150.2435175-9-alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..5ce61f9b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 
     nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
 
-    /* When deassigning, pass a consistent nvqs value
-     * to avoid leaking notifiers.
+    /*
+     * When deassigning, pass a consistent nvqs value to avoid leaking
+     * notifiers. But first check we've actually been configured, exit
+     * early if we haven't.
      */
+    if (!assign && !proxy->nvqs_with_notifiers) {
+        return 0;
+    }
     assert(assign || nvqs == proxy->nvqs_with_notifiers);
 
     proxy->nvqs_with_notifiers = nvqs;
-- 
2.30.2


