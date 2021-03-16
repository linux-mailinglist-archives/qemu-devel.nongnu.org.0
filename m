Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B533D3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:20:21 +0100 (CET)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8gO-0005r5-SO
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8Rc-0003C9-96
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:05:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8Ra-0003yH-Ex
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:05:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso1197941pji.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jyb/b1jyASe9wzHMIMHOmxI51zIjBjecJDfrWL1qudA=;
 b=gta/VsIdvuM0fEqL00ANq/JWY/iA7KV3kk6aDOgUeglu6CffZih6MP3sGIiHe8JGqs
 5Zftg9TxZ583lCJgRTGizdQH/NupmBQrS53SQdhI4SAIpTmsVWn3BdQa/8Rxgp5MZSK3
 f2E6yr0U6bsuQZeD26fJUJf8czWKKWxjsx8jIHnLYVRQ5wUMTU1luWc9FOGPrFyVts+E
 axKDWjbjOAZL3VlcU1BQeqAyA51bxeFlBL6/Mr/kTMKIBOVE+v6pyqREQhBVx0D+YK79
 3DA3LkhXpVeBm+b/TP/YRDmVvRMdGlRaQJrk8U5yzDjLPgadTVe3faeCgDOwobDdP9R3
 QeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jyb/b1jyASe9wzHMIMHOmxI51zIjBjecJDfrWL1qudA=;
 b=PmWK8P8ztvLvpD5GtrcJtIUEey/U6TjVRb07af/vFQ+zJiSYSK+dvIreo9KJ7dgvKD
 14a+bv9vYsM20rMGTh0te5YQtD2mOcBVEqcyovyOZeMtOgEe40zOPrwooB7nwHLv0pLj
 pOytpQyNI//dfpT8bLqO1/n7A9Iio5iO/eiwERVSWDHGfqyeGqYN0kkffEjtgyHzaVQV
 ufo5Sd2UQy+Yl8vBGMzG7nTAVv+PNHN0y4GH5r9eDtp/NSRmNNcv8urHM8Fu9rws5pOG
 ek266Ao3CmCyLVtTp3IA0EaZ2rO8P3Au9j1kTjgYgXwLKaOjgmwVvyz0vr52NBiGxqaD
 p4XQ==
X-Gm-Message-State: AOAM530JyXrOj5x9ruqGP3UjoHmgThqZ5/VqwXeX5bkXo8j+kOncqUIQ
 IVgsJhOUvdNqY8EYQpCeLQ8=
X-Google-Smtp-Source: ABdhPJwXxUZM4YpHeNGYvBpb/U8IZhYT79NepLlEPT9UovLk7qFoZ32gbyYxfY4yKF6OIpQlsWQynQ==
X-Received: by 2002:a17:902:8303:b029:e6:4ef3:4f17 with SMTP id
 bd3-20020a1709028303b02900e64ef34f17mr16056972plb.22.1615896300211; 
 Tue, 16 Mar 2021 05:05:00 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] hw/net: sunhme: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:20 +0800
Message-Id: <20210316120420.19658-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v1)

 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905f87..6971796e57 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -714,8 +714,6 @@ static inline void sunhme_set_rx_ring_nr(SunHMEState *s, int i)
     s->erxregs[HME_ERXI_RING >> 2] = ring;
 }
 
-#define MIN_BUF_SIZE 60
-
 static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                               size_t size)
 {
@@ -724,7 +722,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
     dma_addr_t rb, addr;
     uint32_t intstatus, status, buffer, buffersize, sum;
     uint16_t csum;
-    uint8_t buf1[60];
     int nr, cr, len, rxoffset, csum_offset;
 
     trace_sunhme_rx_incoming(size);
@@ -775,14 +772,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     trace_sunhme_rx_filter_accept();
 
-    /* If too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     rb = s->erxregs[HME_ERXI_RING >> 2] & HME_ERXI_RING_ADDR;
     nr = sunhme_get_rx_ring_count(s);
     cr = sunhme_get_rx_ring_nr(s);
-- 
2.25.1


