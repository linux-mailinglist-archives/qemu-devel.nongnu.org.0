Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C3698289
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:45:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLp4-0000aY-6z; Wed, 15 Feb 2023 12:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLp1-0000ZT-Tt
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:43:59 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLoz-0008CV-Qe
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:43:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id co8so16222877wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1qgw8+Wwe6UbEIQRuVneXNaCb/C9jGyBn8UJr2mvMpE=;
 b=OUQYxjBOzhi4iZJef7RmHx3pYvwnmJUQ9l254ANvT2XMvaNRjgh549I0BaL2o47oQM
 jEHSngvage9JIW3vJigdLEUyqataQvj3iecmCSgaj+oITeCWfqBIO9G9ZNyzuYyx8TCo
 LT4l2JYUwrNY/oSrO6U82VGZeA3zn0fjqvRUMHjQJElb6QqLyqzAwnXZpwn2qQ+XpmDl
 xejTlxSPs7dSIl9n+MgYiiUzOleavDjjTIrgaj12JaHZJ1CQ5mZ28SRb2MDfil4ksVnW
 JEr9Vj2QmEWvtSVaD0hxOjWlT54LqcvP9dpDm3ln7tRP9hItK4p9WnozsISPz3ACuEXP
 1QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qgw8+Wwe6UbEIQRuVneXNaCb/C9jGyBn8UJr2mvMpE=;
 b=DOxmiaLKAmYic3roCSIMI9md8F4DAtPEbJ136zcNvF/79rRbs7Eh0Yj76t4W/LoAZv
 HFBtzCpc1qeRqbuQ9tkbCXnyOdGd42T9Ow38hBlRvgHYLCW2J/rFbAoVqnJKUnbZ1WyJ
 CIFUL56oXf4+8IGFFQtCcZcqnu603R1uv4H72uNzghMViAtIaa4Jk3o7c76F3uaA/U+m
 jH4M8a1/BzQL4UcxKf0PlkP12WvJoyxPBwh/s6uXtxFt/7YFAXNbWPSDQkDtSBSkN4jj
 FvWw2XPQ9frF+LMrsX9HMOqz4hE094ELzIkLVN26mJUariG1SrxZvwp7q9tRs1Dkx+5w
 UMrw==
X-Gm-Message-State: AO0yUKU3zbAXO10z9YFRjgR2MgKpWkFd7DeK9oFvwkh0b4NkzUKMlF7i
 /ukU5Tynf7O8xRHp/b4zy6H0BgJO9BpBj/PN
X-Google-Smtp-Source: AK7set+gN7zPm/eZBuNOrogb8C7yyYd5GMjKJw0HuEPzZaP/Jq4izkNObYCrrwIqDlZz0ODyc4yUKQ==
X-Received: by 2002:adf:fdc3:0:b0:2c5:4480:b590 with SMTP id
 i3-20020adffdc3000000b002c54480b590mr2456780wrs.54.1676483035789; 
 Wed, 15 Feb 2023 09:43:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5409000000b002c558228b6dsm8674648wrv.12.2023.02.15.09.43.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 09:43:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/timer/i8254: Un-inline and simplify IRQs
Date: Wed, 15 Feb 2023 18:43:48 +0100
Message-Id: <20230215174353.37097-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

i8254_pit_init() uses a odd pattern of "use this IRQ output
line if non-NULL, otherwise use the ISA IRQ #number as output".

Rework as simply "Use this IRQ output".

Un-inline/rename/document functions.

Based-on: <20230215161641.32663-1-philmd@linaro.org>
          "hw/ide: Untangle ISA/PCI abuses of ide_init_ioport" v2
https://lore.kernel.org/qemu-devel/20230215161641.32663-1-philmd@linaro.org/

Philippe Mathieu-Daudé (5):
  hw/timer/hpet: Include missing 'hw/qdev-properties.h' header
  hw/timer/i8254: Factor i8254_pit_create() out and document
  hw/i386/pc: Un-inline i8254_pit_init()
  hw/timer/i8254: Really inline i8254_pit_init()
  hw/i386/kvm: Factor i8254_pit_create_try_kvm() out

 hw/i386/kvm/i8254.c        | 18 ++++++++++++++
 hw/i386/microvm.c          |  6 +----
 hw/i386/pc.c               | 15 +++++-------
 hw/isa/i82378.c            |  2 +-
 hw/isa/piix4.c             |  4 ++--
 hw/isa/vt82c686.c          |  2 +-
 hw/mips/jazz.c             |  2 +-
 hw/timer/hpet.c            |  1 +
 hw/timer/i8254.c           | 16 +++++++++++++
 include/hw/timer/i8254.h   | 48 +++++++++++++-------------------------
 target/i386/kvm/kvm-stub.c |  6 +++++
 11 files changed, 69 insertions(+), 51 deletions(-)

-- 
2.38.1


