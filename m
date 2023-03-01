Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAD6A695D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM4-0004GF-To; Wed, 01 Mar 2023 04:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXIM1-0004EG-A6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:29 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILz-0002op-I1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:28 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so12300011pja.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFzPkPZf6Pa8JMQAdnFsH+CdOrPu+2uPdlCUdItrC+M=;
 b=OpGLH6pH6wXjDc/gl8rXaBYWQqD6yBP3XK7WPH3/0OCW0WegvnieEACFROqtqAAPaO
 oMvYwAAFWAcxHgBeZqtrN+pwyVyr5GQNGJcZyYi/86S6CmElQsRpJRPias+6QX0nziai
 1kHoakyDIJ0T5zp1Q43NNYFntcDiPzaMibspgcRkOsZFZc1dMJJIgZCE+dZprrdj0G+j
 kmTSPp5Mlfzfr3VenUk4siItm0GdWgaXc9JTHv4qcRXqS98mFmSTy7OxV4EZfVMa0yYf
 kOWrsJTaEYBy7FJj+sGLmiZESJx2LHJUelMDIhalm5B9zpKJfPD8AsR7DDun3PAbjDs1
 petA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFzPkPZf6Pa8JMQAdnFsH+CdOrPu+2uPdlCUdItrC+M=;
 b=P+hFf56XYf1/BdvH7kSc/ye/Pmej0AWTPLmcn9W93i9Q3PMDrra7b9f4DmiKx1DTiI
 zk7USyRzCUq0Fklyle3tRqc7hTjbaJRgUFfgRaCadKsE3zK6uPAL2FquKmq+TZ5PGiGj
 IwBVua/X0jofTKmmZDrWz930OjYpsGgW9r2B0vmAogx1tvzoX37jVhy/6YPkPHGTmOmu
 rDCcSjUYads6sa3p4lV6dmnrc/5EH/fRCrH8kci4wLMpF+6bi1A7D38kBrkDRRmy+zT3
 JUrT66ceoaz/noJ+NOlDuzz623eTnP6U0/WYDPxrNX4TmPCMl5hF9xNVHiZBHSDvVCiL
 q5dg==
X-Gm-Message-State: AO0yUKWnRXkEmCoUKmk0eKd2E+FH80U2mD3gz1/N2GeeJj1hWA7KMRJD
 nVxwU2ZRWkNBB7fRY/J0OOk=
X-Google-Smtp-Source: AK7set+AqErlQxLqqIWlRsutBvPksKUJB0y1Tmlrnrj6eLlSVGJTGIu1xixJo3ECvcawInaOUEIxWg==
X-Received: by 2002:a17:902:c401:b0:19d:297:f30b with SMTP id
 k1-20020a170902c40100b0019d0297f30bmr7046920plk.19.1677661346358; 
 Wed, 01 Mar 2023 01:02:26 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:25 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 8/8] hw/net: sunhme: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:02:03 +0800
Message-Id: <20230301090203.1601925-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
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

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 1f3d8011ae..391d26fb82 100644
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
2.34.1


