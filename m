Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CA32BA31
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:25:12 +0100 (CET)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX7P-0002x7-Q7
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWw9-0000pv-0z
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWw5-0007E7-Gk
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+1d1LK3/7O/279IVj+Ph/XHu1RN+wl0D3hJoCw8j8k=;
 b=hl9jEc/8cHq2p0TbpBb7Dipa6dep6FQFqR1VUE+DUwiDRBv08N+DoNgpsc2tQ7mYdu7GNh
 bqidqwXT5cZipm+n9jS0LhyXcdphvYJ78f2wpbdk/tDiqUqREokdezNuaeo3OLT/KKpqRC
 97NPZvgvLSdIz8TUschCFMP3Alah4go=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-QomY5t_NPayWSJaXdlo5cg-1; Wed, 03 Mar 2021 14:12:57 -0500
X-MC-Unique: QomY5t_NPayWSJaXdlo5cg-1
Received: by mail-wm1-f71.google.com with SMTP id c7so1718768wml.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+1d1LK3/7O/279IVj+Ph/XHu1RN+wl0D3hJoCw8j8k=;
 b=Gi7n3aZ8kmPI9z03hCLV3AV9kb9wTYbJlZ+m/6iwFOvZKyeBvaWhozsPvpNUHM/mCv
 3IZ/6LjAXFeG7i7t70Sh4TR9wNITMea8G9ujeqAzVa5NXEx8ai5I0vr+Xg+f6DiPZwcT
 DgpljCEWFPyOmJ63hVwFzTLrGVRcCz4v1LtudPJA/YbnX4QyvvmzbgXsk1O1Du+OPBCG
 8/VSuQLcSOK0CLDEobaRdSPlu/iWHcs/aKyFzJ8eMPbP1lbFp9aKMr4ceB1bTjF3+v04
 7oyslUS41maYMH9QcubWbwGCVaKuVCANznI8kjZng4IbGkAN/q6LpHwZ2DABn0P9R3oF
 RHKg==
X-Gm-Message-State: AOAM530fdJh9tCGg0N9XoLqbSMeysc0aXqefmkmwhVvNLguwJaKxpRyQ
 gVczwORGxzH24pi0Nc4FM+i26qMYgSQ2F0q8XpoE7FJJI0E4gjxt31+HWgUJnz67dDtLYmxt8xl
 /KRQaAmkMbVU9ikzOnag2FBjrmGAmhRuiSVLC2F44Pogm1BSVJEoFesmGLw2G5X4L
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr243080wrb.24.1614798774358;
 Wed, 03 Mar 2021 11:12:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDgbCUusOf8YtEWk8TzhlZX/nvR+AqM92YsE96kKHqIJ7afW6SvKWRzcLx5UhuRTsivyFi0Q==
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr243062wrb.24.1614798774227;
 Wed, 03 Mar 2021 11:12:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f16sm32286601wrt.21.2021.03.03.11.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 09/10] hw/net: sungem: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:12:04 +0100
Message-Id: <20210303191205.1656980-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-9-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/sungem.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 33c3722df6f..3fa83168db0 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -550,7 +550,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
     PCIDevice *d = PCI_DEVICE(s);
     uint32_t mac_crc, done, kick, max_fsize;
     uint32_t fcs_size, ints, rxdma_cfg, rxmac_cfg, csum, coff;
-    uint8_t smallbuf[60];
     struct gem_rxd desc;
     uint64_t dbase, baddr;
     unsigned int rx_cond;
@@ -584,19 +583,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }
 
-    /* We don't drop too small frames since we get them in qemu, we pad
-     * them instead. We should probably use the min frame size register
-     * but I don't want to use a variable size staging buffer and I
-     * know both MacOS and Linux use the default 64 anyway. We use 60
-     * here to account for the non-existent FCS.
-     */
-    if (size < 60) {
-        memcpy(smallbuf, buf, size);
-        memset(&smallbuf[size], 0, 60 - size);
-        buf = smallbuf;
-        size = 60;
-    }
-
     /* Get MAC crc */
     mac_crc = net_crc32_le(buf, ETH_ALEN);
 
-- 
2.26.2


