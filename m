Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C8621BFC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:35:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTQQ-0005J2-BW; Tue, 08 Nov 2022 13:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQG-0005G9-7u
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:08 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQE-0002QX-GH
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id k8so22426327wrh.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCjXnigQrezHvMbD6pi+K2YoWSCNKyXOSu5TkCCmKYE=;
 b=xupEfgp6Iy6lz8FlOT/3N+RRZmtkMyeuVwi4vV6lb5re9A+mtqETg6Uxf61sIG92bG
 k/cf97qXblfvWGhfwTB+6T5o2DJ7Z3oWXdVweTTmGRQsethcj2CZs6KenMcq0XwCrAzN
 O4zyT+J7E1Ur3pHcBoZfbX4xoF8t0hZLTwjjmi15b9WC/RSCxk6YkqF74fTzjXUmwBI7
 1CyjYLVz7kakfmjZYHlPTbfo33DlLcJi7zL7Jpso1zJ4jM8GBDd6uPQjMY1omayj9uP0
 vq76ZIXnmcP0RVPSvDHZlKh0E1+WPLlTCVDYObGJnVY2EDCzM0/Lj7EWCop32bicPT9H
 6O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCjXnigQrezHvMbD6pi+K2YoWSCNKyXOSu5TkCCmKYE=;
 b=Q7PUJAv2nnYNoj9aZ0/37zqUFfr9sG8GvqpFZ7xk+2FEpoqRUAB2xTFadMw5L4Gn/z
 7EoOvG+52jWAiintaZzG5mrWHIr0ye63/OoAbeafPOc0e3LqX4kknz+CejMl3AE9UZ36
 UuJxNSIRdVch+nBAeI8dxFBEhpyDv8D2NfPUFaFb5RQzjndDSsx38skCd0j1hLGzmE4C
 k3CwYrH6WqhkvrVRd4NNBLWKkeYXTmJ7qzkBg+gUZXu5rqS5hZ80bMsQcBwBpMF6OoqZ
 Z0KwHi/HD/Y1gKxhrX9qTWqhSXpzzcY34f63cLLSXAUvjRD/4ncqwHlNvJOxsE5lr3MT
 2ifQ==
X-Gm-Message-State: ACrzQf1NEQXgDyBdaWhv1O+4bvaWu/kydqMVwVukii/7wiOE9eZrHbek
 QSpliKnELwlO5LbZ10wxoOk6oUJwUZER2Q==
X-Google-Smtp-Source: AMsMyM4OxNZHiETdfw7s0Bgv0ZhYJJKQOtHbyyWmJa6jL8qTA2RLUgud1uqhuv4fcdFX/GdGmPASBg==
X-Received: by 2002:a5d:4910:0:b0:235:ab9b:33a2 with SMTP id
 x16-20020a5d4910000000b00235ab9b33a2mr36973557wrq.58.1667932444655; 
 Tue, 08 Nov 2022 10:34:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003c6c4639ac6sm12430513wmr.34.2022.11.08.10.34.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Nov 2022 10:34:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 RivenDell <XRivenDell@outlook.com>, Siqi Chen <coc.cyqh@gmail.com>,
 ningqiang <ningqiang1@huawei.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Subject: [PULL 2/3] hw/sd/sdhci: Do not set Buf Wr Ena before writing block
 (CVE-2022-3872)
Date: Tue,  8 Nov 2022 19:33:51 +0100
Message-Id: <20221108183352.9466-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108183352.9466-1-philmd@linaro.org>
References: <20221108183352.9466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

When sdhci_write_block_to_card() is called to transfer data from
the FIFO to the SD bus, the data is already present in the buffer
and we have to consume it directly.

See the description of the 'Buffer Write Enable' bit from the
'Present State' register (prnsts::SDHC_SPACE_AVAILABLE) in Table
2.14 from the SDHCI spec v2:

  Buffer Write Enable

  This status is used for non-DMA write transfers.

  The Host Controller can implement multiple buffers to transfer
  data efficiently. This read only flag indicates if space is
  available for write data. If this bit is 1, data can be written
  to the buffer. A change of this bit from 1 to 0 occurs when all
  the block data is written to the buffer. A change of this bit
  from 0 to 1 occurs when top of block data can be written to the
  buffer and generates the Buffer Write Ready interrupt.

In our case, we do not want to overwrite the buffer, so we want
this bit to be 0, then set it to 1 once the data is written onto
the bus.

This is probably a copy/paste error from commit d7dfca0807
("hw/sdhci: introduce standard SD host controller").

OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=45986#c4

Reproducers:

  $ cat << EOF | \
     qemu-system-x86_64 -nodefaults -display none -machine accel=qtest \
       -m 512M  -device sdhci-pci -device sd-card,drive=mydrive \
       -drive if=none,index=0,file=null-co://,format=raw,id=mydrive \
       -nographic -qtest stdio
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80001001
  outl 0xcfc 0x06000000
  write 0xe0000058 0x1 0x6e
  write 0xe0000059 0x1 0x5a
  write 0xe0000028 0x1 0x10
  write 0xe000002c 0x1 0x05
  write 0x5a6e 0x1 0x21
  write 0x5a75 0x1 0x20
  write 0xe0000005 0x1 0x02
  write 0xe000000c 0x1 0x01
  write 0xe000000e 0x1 0x20
  write 0xe000000f 0x1 0x00
  write 0xe000000c 0x1 0x00
  write 0xe0000020 0x1 0x00
  EOF

or https://lore.kernel.org/qemu-devel/CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com/

Fixes: CVE-2022-3872
Reported-by: RivenDell <XRivenDell@outlook.com>
Reported-by: Siqi Chen <coc.cyqh@gmail.com>
Reported-by: ningqiang <ningqiang1@huawei.com>
Reported-by: ClusterFuzz
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
Message-Id: <20221107221236.47841-2-philmd@linaro.org>
---
 hw/sd/sdhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..f230e7475f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -954,7 +954,7 @@ static void sdhci_data_transfer(void *opaque)
             sdhci_read_block_from_card(s);
         } else {
             s->prnsts |= SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
-                    SDHC_SPACE_AVAILABLE | SDHC_DATA_INHIBIT;
+                                           SDHC_DATA_INHIBIT;
             sdhci_write_block_to_card(s);
         }
     }
-- 
2.38.1


