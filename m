Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE59333A04
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:30:18 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw6b-0003g9-U2
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpT-0001D7-PI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:35 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpS-0006zz-4l
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:35 -0500
Received: by mail-ej1-x631.google.com with SMTP id dx17so37544996ejb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=WWiBc7WA3O2AVkpTLFlp8tq2hPGcdq5p9G8byDecpz8=;
 b=KFinxy9fkf4RtTGdQqrrmuzJ+5v8L/NxL9Z9YyWsYu4DWA6mpdHA1KUvm/UwCgp5Q7
 rvyI0ZaNJv4A5MedHOtdRU28EqdWBJg7lRSEjKzoBHZPWBwbhfgBDGCeMZVjJMpKPNki
 AawNkmRpRbXxrDxYaPBO7MfD/z4ZTpw6s5e/vwdXKCNQibWiXfr6hnM7GixwnHrTBoUF
 1IXFV3j/w5dQIcvvFD0uZc6m0LGExkR+JEBC591z2Q1vuEZmG5RuRL7+VEVdNSrIs8+d
 uJkFEgOdoySfi+tokTllSYuf5xGASXJoTOK+bR1Y/gKCJKq3DFnc05xiuyFELzDQ7Hu3
 SjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=WWiBc7WA3O2AVkpTLFlp8tq2hPGcdq5p9G8byDecpz8=;
 b=J0EUBjHhTS/CSVawtHsyyjE3sIEXu6KrqdvMnLGa8l3Z17teBW9zILuyoMVwnVOpln
 kW4eyg7pul5WRbF61gIUDcjRO+zuXTVIrL3Tjg8wpqu/7Wg3+O8EF3k8HbuytUyavIDO
 A/U/vVkjatKammILXL8PhyMhBK/wPHxpJB87tdUxubZEGKCH4DtPhAuPCTSnEvdpSzX2
 f1mzFf4uTcK8YQRrD3naM1Y97ahi2rDWjFhB87VxmOTOvmuVDRtmzD8vVW6jlIGhnoWD
 FwhepWRjC0R74WK6SLygH7O1B4VCO8MV0kCoagcVXC3gQDwzy2VeWfGe3I0KFGkmTL07
 6Ihw==
X-Gm-Message-State: AOAM533BUxsbYQwcqkQjwumPBKi8gNp6yw83LEL862ac5QoeL8K7JzS1
 QEehfllrE31UBKwULfyGIxI=
X-Google-Smtp-Source: ABdhPJzRqWoxoEaxPvWiOnnKfuNzIy1Fve2IdZ3ok/+o0JEzjsL+sUpHGAIm3VmEuu7jiqUKUIswIw==
X-Received: by 2002:a17:907:162b:: with SMTP id
 hb43mr2887031ejc.41.1615371152884; 
 Wed, 10 Mar 2021 02:12:32 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 07/10] hw/net: pcnet: Remove the logic of padding short frames
 in the receive path
Date: Wed, 10 Mar 2021 18:11:54 +0800
Message-Id: <20210310101157.15136-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598..16330335cd 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.17.1


