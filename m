Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FE4C9862
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:32:24 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB2c-0003tL-9M
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY7-00026v-Ma
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:53 -0500
Received: from [2a00:1450:4864:20::62e] (port=43655
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY4-0005C3-Q2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:50 -0500
Received: by mail-ej1-x62e.google.com with SMTP id d10so34240273eje.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YDbuVIoUX2LeJkIqTfaWsWBKlajC5Wcob9iRhMRnO8=;
 b=ofNvD5UB1hARGWIHr3lSpjCJFDyCcpLsFVgk1udLTgEGXQZb6ADl7uvNjpyEpAxPUv
 mPX0Ri2MZVS5zOoN6bNjv6KH7PS02YoZ+DGNCSITrbfTl3izqtSAuk9n4cubFAuU2Vqp
 ZSCWy4TQdipoQz8moYjilGqok+Z5cCe/cbPx102snGQVwNycW+sz2OjpA25VGbeptR+G
 kSNq+STZ6AyjdaJHPxKHaPZdXxq60IQO5fRDx7dw/B8T+uIwXvpVztBkzkraBITVga3b
 g/JhYClmw+q7VK543A+1fPaCipQx+zP9a6PpZPs+/oTrse7RJFJPJZAyIhKbNy4Ee+ki
 LwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YDbuVIoUX2LeJkIqTfaWsWBKlajC5Wcob9iRhMRnO8=;
 b=CgrhJ4kzWIFOjbHWNhSMJZz9IFIuchha5CREjkEU6Dlgyfv+hyT1RENPZ0LDre9x1g
 IphtfP2YvQ+zqcbEA37ZETBIN0TIFopuxP++av6ErB0zvtT7ARrrgHiYW9o+7s/BrVlz
 uZIq5S1EZ5JhfusD6ss/GIISjdXOtq1PAO/oVUGhlYYUCRe9u9NgZnFLF8ljYyleePue
 20t0aQ04As0RcjNy/cuilRWWcXZ7U/Vh+zfEiaZN75zcXXN9m4/FnWJAmUv6Ulks1aqz
 QbZVpqX8hHt+tJ3uG9xQOzNI7XAEdJKuPvsY3qH09FnMqrsW+qEm1ZsUuuLTpbXFoYty
 3xXw==
X-Gm-Message-State: AOAM533HQBZDzk2W5rJYcDc0QZIGeLDS9EnbwmTR0od/5+8AmWSMQ7ng
 eRuQLkqlesk8C7pTJjM4w2kglb123fE=
X-Google-Smtp-Source: ABdhPJwhEMKHHWgAUQRU3xGD42M2IsRoIU5wFNzmGyGk9vgbxbl4bQkMHvBlvLHK2u+6dBQQL8dUmg==
X-Received: by 2002:a17:907:2d90:b0:6d8:9fc9:ac36 with SMTP id
 gt16-20020a1709072d9000b006d89fc9ac36mr846268ejc.28.1646172045715; 
 Tue, 01 Mar 2022 14:00:45 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] isa: Resolve unneeded IRQ attributes from ISADevice
Date: Tue,  1 Mar 2022 23:00:30 +0100
Message-Id: <20220301220037.76555-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
* Use DEFINE_PROP_UINT8 / uint8_t for new IRQ properties. (Philippe)
* Use "%u" format when printing maximum allowed IRQ number in error messages.
  (Philippe)
* Use object_property_get_uint() in pnv.c. (Philippe)
* Squash cleanup patches (7-22) into
  "Inline and remove one-line isa_init_irq()" (Philippe)
* Mention in the commit message of patch 1 that mc146818rtc has its IRQ number
  now displayed in the human monitor. Since the IRQ numbers of the other
  "QOM'ified" devices were already displayed I've only adapted this commit
  message. (Philippe)

v2:
* The newly QOM'ified devices now report an error to the user in their realize
  functions if the configured IRQ number is greater than 15. (PMM)

v1:
The IRQ attributes of ISADevice are hardcoded to support up to two IRQs per
device which creates an artificial limit. By not having the attributes in the
first place, this limitation can be avoided altogether.

The IRQ attributes are mostly used for printing ('info qtree') and there is one
user, hw/ppc/pnv, to use the attributes directly. As it turns out, the printing
is redundant if the IRQ numbers are exposed as QOM properties and hw/ppc/pnv
can be easily ported away.

The patch series is structured as follows: Patch 1-3 QOM'ify the last devices
which rely on printing their IRQ numbers via the ISADevice attributes. Patch
4 and 5 remove the last users of the ISADevice attributes such that they can be
removed in patch 6. The remainder of the patch series is cleanup.

Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq(). That is,
the former function becomes redundant. All users are therefore converted to use
isa_get_irq() directly. Finally, the last patch removes the now unused
isa_init_irq().


Bernhard Beschow (7):
  hw/rtc/mc146818rtc: QOM'ify IRQ number
  hw/rtc/m48t59-isa: QOM'ify IRQ number
  hw/input/pckbd: QOM'ify IRQ numbers
  hw/isa/isa-bus: Remove isabus_dev_print()
  hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
  isa: Drop unused attributes from ISADevice
  isa: Inline and remove one-line isa_init_irq()

 hw/audio/cs4231a.c           |  2 +-
 hw/audio/gus.c               |  2 +-
 hw/audio/sb16.c              |  2 +-
 hw/block/fdc-isa.c           |  2 +-
 hw/char/parallel.c           |  2 +-
 hw/char/serial-isa.c         |  2 +-
 hw/ide/isa.c                 |  2 +-
 hw/input/pckbd.c             | 26 +++++++++++++++++++++----
 hw/ipmi/isa_ipmi_bt.c        |  2 +-
 hw/ipmi/isa_ipmi_kcs.c       |  2 +-
 hw/isa/isa-bus.c             | 37 +-----------------------------------
 hw/isa/piix4.c               |  2 +-
 hw/net/ne2000-isa.c          |  2 +-
 hw/ppc/pnv.c                 |  5 ++++-
 hw/rtc/m48t59-isa.c          |  9 ++++++++-
 hw/rtc/mc146818rtc.c         | 13 +++++++++++--
 hw/tpm/tpm_tis_isa.c         |  2 +-
 include/hw/isa/isa.h         |  3 ---
 include/hw/rtc/mc146818rtc.h |  1 +
 tests/qemu-iotests/172.out   | 26 -------------------------
 20 files changed, 59 insertions(+), 85 deletions(-)

-- 
2.35.1


