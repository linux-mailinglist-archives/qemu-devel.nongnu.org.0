Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38651E541
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 09:34:38 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnExZ-0003wV-5d
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 03:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEts-0001za-K1
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEtp-0001fB-0N
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:46 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so8681236pjh.4
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 00:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3CPdH+RD54hIHIqTYN4JhVu9DVg+RzvT3Hqs/pJZ6wU=;
 b=t/PMJMweeA0r9V1HZbCZfHgkZnJXlRU4tK/HJhyK8HDqdRy8+Jaj0HG7U6UOAxB337
 u32dswucvk56ksWa5R6UkS5DPXAD7heLDg93VeT8GZ3BcvW/rykgrJ3/JPfiM2Kof0V2
 pbFJGOd2mS1lB8tQiBchd5jjy5Di6uPDS3bmjFm7B81GYe6D7B1pe25w7QpKeQGPjkUq
 EDqC/pWgYznFv9z8lGIVE0bP6HljJczapFPrK4b6H7qC3Cy/CjVqq8zuhWeuh5D5JeOS
 btgjR7b5d2vg9NnkyZfI0sQ0ruzC6LRk3cViPsXQ43NEy1xzR7vW+6zJQZajEu8Z5Z6y
 E3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3CPdH+RD54hIHIqTYN4JhVu9DVg+RzvT3Hqs/pJZ6wU=;
 b=w0fsfHQawrIX4/t4Y2yKZtrg1xNJFhfwvBHVcE4N6LGpD1hfonN6zlnGdy3+KSJW/d
 +fRe2LnIPxz01abi52h9ZgWicynwHihLbIacc5kwT/OgEV1BgKpxlG0GqnGHBbPOuLks
 cl5eH2BlMUUBAH8BtxKj08+bcxQEM6LjFXsWS09Q/hk6VITW6Msp+Tyl/AmjMnErdANc
 xRCzf7yzpQqnQS0JoAAiAO57VailEGJTkTQCLulZa42SIAI6lK+euyO4zMx5NCv2sNG2
 sNk+TUDNJO3vcQdkPnU6XOputRH/h4SXDYyHlIVEkKBpFktCpRGFWsMqFiQT5FWCY2pD
 1qCg==
X-Gm-Message-State: AOAM5315FIS1UTinhlKsNV7VaiWV9aRARcxE7fdU2gHYvYDjW+27yNlF
 Mn1Ct6bkdJkv1cKOuSmhBgWEHA==
X-Google-Smtp-Source: ABdhPJzaLXhkVP2HW3TBYC+1BXudmb9ebtLVIuYFUGkgRtwhQTJAnrCVDw1ka4G+B3iWv+Y7ADT7hw==
X-Received: by 2002:a17:90a:a410:b0:1dc:d03b:5623 with SMTP id
 y16-20020a17090aa41000b001dcd03b5623mr8639904pjp.95.1651908643746; 
 Sat, 07 May 2022 00:30:43 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 z15-20020aa7990f000000b0050dc76281c8sm4595821pff.162.2022.05.07.00.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 00:30:42 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org,
	its@irrelevant.dk,
	k.jensen@samsung.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hch@lst.de,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 1/2] hw/nvme: introduce smart bits of aen cfg
Date: Sat,  7 May 2022 15:26:43 +0800
Message-Id: <20220507072644.263105-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507072644.263105-1-pizhenwei@bytedance.com>
References: <20220507072644.263105-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

According to NVM Express v1.4, Section 5.21.1.11 (Asynchronous Event
Configuration), introduce bit 0 ~ bit 5.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/block/nvme.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc8..d92912f9ad 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1122,7 +1122,13 @@ typedef struct NvmeIdCtrlNvm {
 } NvmeIdCtrlNvm;
 
 enum NvmeIdCtrlOaes {
-    NVME_OAES_NS_ATTR   = 1 << 8,
+    NVME_OAES_SMART_SPARE                 = NVME_SMART_SPARE,
+    NVME_OAES_SMART_TEMPERATURE           = NVME_SMART_TEMPERATURE,
+    NVME_OAES_SMART_RELIABILITY           = NVME_SMART_RELIABILITY,
+    NVME_OAES_SMART_MEDIA_READ_ONLY       = NVME_SMART_MEDIA_READ_ONLY,
+    NVME_OAES_SMART_FAILED_VOLATILE_MEDIA = NVME_SMART_FAILED_VOLATILE_MEDIA,
+    NVME_OAES_SMART_PMR_UNRELIABLE        = NVME_SMART_PMR_UNRELIABLE,
+    NVME_OAES_NS_ATTR                     = 1 << 8,
 };
 
 enum NvmeIdCtrlCtratt {
-- 
2.20.1


