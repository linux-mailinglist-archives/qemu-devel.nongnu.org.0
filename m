Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096F68E48D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:46:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXfM-0006kZ-9Z; Tue, 07 Feb 2023 18:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfJ-0006jV-Vz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfI-0004Ek-7p
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u10so9120668wmj.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q0jotaNaSpC+AlYtASAodH+ntcY27MDH6+WcRABNJuo=;
 b=PFskuUpxxLRPlffaPLnXZVpe9wa+yZ6bDtXn/6E8WQQtSuewd1wL2HsZszzqHIx7Np
 OfQpEI9MvuUUFmuDMWzSYX3MYlH8qMyiR4p4OCDDLkACiRERV7j8+CgYCQ6pzWkKTOV0
 tXk+My9ZbJempj+XTqBMN3io1GtZHGynykbJyy/83Q4JTbp0VmGG9hZJJ4ercnK/g9Oy
 YDE7b/BAedPDvbMNUYOjXMzD3efoMtupmX+rtS8c5dz3nofb8AqMvE77gN9mlw1fLPe/
 gpvi07amLCi8FkcFSyhCNOrFCHb/EmYY69otFYWYw7ACv0MwY3V0d7mAq46zndpjrQii
 9iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0jotaNaSpC+AlYtASAodH+ntcY27MDH6+WcRABNJuo=;
 b=wsUjSyC/thGBApPU9Q9m7R1JPHecfLHlydudR1LWKQi3JjZX0oTPKywSyNHYWiMj00
 +NsT95N0yPw6K1EtgGH+/m20zVAhpDKkDfWmDdcodSFh8m7rezX7kgzWK3P3a31cCGP1
 XOBkMU5PZdmWuep2/V6F+ka3EAdOcYEVKdLl+uEr0bmfXxkWhzg5yzsp/IHFrGSywxz5
 NnjQFCsNjx0wAnFiZlfAScesbXZj2lNqX5N3uFyvPdlcsqtIj38qWgGGjZQP9DriSYeC
 unQX4qDq0n1ZIrjlWmwa+cTokXYypqRb9LVXK8/h6GlW46pmE5tL6aNIPCdffRse+4U6
 EUFQ==
X-Gm-Message-State: AO0yUKVCjFKC1zVY3WPUaff67Sak9NxvmYwq1eU4XjRjTKmYTefiKiPA
 LzfU5S4+ZZWj6129Zxc3L8fS+3FIR40uCvRV
X-Google-Smtp-Source: AK7set8vkzdIrzWSyh1TefDqsrw/wEbLoyPmSbBjiW4ab3pPRWZNRTDZFOIcFXWu2O+jyNZ3muBQng==
X-Received: by 2002:a05:600c:a287:b0:3dc:4316:52be with SMTP id
 hu7-20020a05600ca28700b003dc431652bemr433313wmb.10.1675813578132; 
 Tue, 07 Feb 2023 15:46:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm221125wmc.25.2023.02.07.15.46.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 15:46:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] exec/ioport: Factor
 portio_list_register[flush_coalesced]() out
Date: Wed,  8 Feb 2023 00:46:13 +0100
Message-Id: <20230207234615.77300-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Preliminary to further ISA API cleanups...

Convert this sequence:

- portio_list_init()
- portio_list_set_flush_coalesced()
- portio_list_add()

to portio_list_register_flush_coalesced(),
and the non-coalescing equivalent:

- portio_list_init()
- portio_list_add()

to portio_list_register().

Philippe Mathieu-Daudé (2):
  exec/ioport: Factor portio_list_register_flush_coalesced() out
  exec/ioport: Factor portio_list_register() out

 hw/audio/adlib.c        |  4 ++--
 hw/display/qxl.c        |  7 +++---
 hw/display/vga.c        |  9 ++++----
 hw/dma/i82374.c         |  7 +++---
 hw/isa/isa-bus.c        |  6 ++----
 hw/watchdog/wdt_ib700.c |  4 ++--
 include/exec/ioport.h   | 15 +++++++------
 softmmu/ioport.c        | 48 ++++++++++++++++++++++++++++++-----------
 8 files changed, 60 insertions(+), 40 deletions(-)

-- 
2.38.1


