Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C2537A2D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:52:43 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdwv-0005oE-Pl
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYX-00088i-Hh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYW-0001JX-1N
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:29 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p8so10330739pfh.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEA3xsVCIiBgs3C0D9M/TxMN7LomxvvQQy/Sl18zl18=;
 b=jxFsx2Ya3M2FvDLhB9PlXIrqAStVuUTYBqxXjf1KmbSDlaP6obb7/bqATOcmxPyRiX
 j/Xp0xbFseR/wblmlgSnQWhZBWBrv7bhK5+fiz5a8X19ETFtYix3g2Vz1z7ZszJrTrvN
 cZdCTMBoUOyfdKrO9RzVG5dLfcF/TgOnoPM4PNwREib2lImQnjLlZ6HBucAzHmrGdzYO
 pEopN5iaESq5p2Nm8eGjqUoueGv68lhFzFKuMcTfhs/w8O+zI3ZURrIE+eieET8D9Amk
 NnlAVSix1MOrB8UdTapZ6FoEltwoYITv+nBcyfl6FTqwo3WofVIu9qRTZorYrKH3pbwU
 YWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEA3xsVCIiBgs3C0D9M/TxMN7LomxvvQQy/Sl18zl18=;
 b=5ZYVWHJ/Tcwm/pqS+AMla3wLxRSnxn3V1h6bluQ2CwddZUPBPFIxUs3mKkZSfFvWHB
 sjI2QSZU05Kgjgvgc+XFzgoAjN1BBk7+WKVFa8cqgxYenXXXny48Xm+Uwegwz8huQ3No
 8kQ4jtyZxBgi3jDlJepg34d63cISoOiQzgOpGwvO61SfKKoaSWkQOP7YF3l5E5FQ64MM
 /64/kuSu0MzLejLx9wwv4lymbwUPTa97rM7g9S7UAGI8fZQLgk7wdIySLnOTV9nwoiKn
 cIaL9oj6pQB6CflRG2XHE9XqFEuSc4sNT00HFfv4ZRVZFRSLwKx+0Iyb0KhqFq2SULXT
 VOaA==
X-Gm-Message-State: AOAM531GOtoFrJoqhCWFYVQz2LzUqqIH7Id0BBz7SP5psKCCRuBw0Uy1
 ufl+ZewRes9HXgSepKQyktg=
X-Google-Smtp-Source: ABdhPJyDKiUqREYUdWLBgS2P3HjTtRs2KGyoGe74f202IfV1uVteFC8TJSQN5eoiNoQOQevi5rDeeQ==
X-Received: by 2002:a05:6a00:2311:b0:4e1:52bf:e466 with SMTP id
 h17-20020a056a00231100b004e152bfe466mr56573800pfh.77.1653910046676; 
 Mon, 30 May 2022 04:27:26 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a17090ad34c00b001e0c5da6a51sm6590971pjx.50.2022.05.30.04.27.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:27:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 00/11] hw/acpi/piix4: remove legacy piix4_pm_init() function
Date: Mon, 30 May 2022 13:27:07 +0200
Message-Id: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This series moves the outstanding logic from piix4_pm_init() into
the relevant instance init() and realize() functions, changes the
IRQs to use qdev gpios, and then finally removes the now-unused
piix4_pm_initfn() function.

v2:
- Addressed Ani & Bernhard review comments

If no further comments I plan to queue this via mips-next end of
this week.

Regards,

Phil.

Mark Cave-Ayland (11):
  hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
    piix4_pm_realize()
  hw/acpi/piix4: change smm_enabled from int to bool
  hw/acpi/piix4: convert smm_enabled bool to qdev property
  hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
  hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
  hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
  hw/acpi/piix4: use qdev gpio to wire up sci_irq
  hw/acpi/piix4: use qdev gpio to wire up smi_irq
  hw/i386/pc_piix: create PIIX4_PM device directly instead of using
    piix4_pm_initfn()
  hw/isa/piix4.c: create PIIX4_PM device directly instead of using
    piix4_pm_initfn()
  hw/acpi/piix4: remove unused piix4_pm_initfn() function

 hw/acpi/piix4.c               | 77 ++++++-----------------------------
 hw/i386/acpi-build.c          |  1 +
 hw/i386/pc_piix.c             | 16 +++++---
 hw/isa/piix4.c                | 11 +++--
 include/hw/acpi/piix4.h       | 75 ++++++++++++++++++++++++++++++++++
 include/hw/southbridge/piix.h |  6 ---
 6 files changed, 107 insertions(+), 79 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

-- 
2.36.1


