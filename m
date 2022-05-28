Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4699536BE0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:25:09 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nush2-0000TV-7U
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc6-0005zx-Py
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc2-0003nG-EJ
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gbi+ns0E9k3QqlSNvGdnIAhWJyAGVC0cdAw2ra/5jlQ=; b=rCqhTHGId4l+D4NCrzWB7hYsm8
 bFFr4b1rYweV5C6T/5qgtNJ/BJmPrtxl9cAJIwTvSznx13gsxgMu5BDlwmDcNFbmnF7+ky78Mq7ad
 zfEf7ljLXJtpXEpvDHAr5NccXERX76JCpcdF0rYu+3dKu6Q8UP4GThoU2FsqpjOals2XiR5tIKbg1
 aZUHWuJJeIUx/AybXVUTdddu5PxaUZSQzxLUdv2qZLSZzhM/kFAf8L7yCVEon98qkcG6wj0ee1sOR
 n6fDWvhxlyOK/KJIutq4b+s4tGGeR/4547eEJJvbs56aHXreYi3DRCMbZg+7mwrOM5/4+89aBLnDY
 HfuwgCySsgrxqOb9QfX5IxGeyzeHuw5ucoGkU+POAufW/FzBovZ8bscbUIWW0WJ8AZPlRlJ27uh/H
 CbU8pf+Cj4CmlUdII98FO1tvThCLS+vn558fCR+hJsPC8HoKfoNgOSuSrpqt3brVbJUHtNesoiCAm
 wTTftuY4aJb6HhW+M50Ief5gyj+pW2rZciVomje6FTU0ApfN67KGYaGf5I7CjT13D06FtNXWbujlO
 mAt/sO6pSbWtdLW7uHLrmqAuyeA+r5c6JSwm+GR+WTXHESoRqZcgrZe1m17EgiF5Q+n/Dt6SnBPz9
 +ul8EUWkDgBanV0aOg5oJQ8f9LDgY/SV45EK9goJo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusai-0003JL-64; Sat, 28 May 2022 10:18:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:22 +0100
Message-Id: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/12] hw/acpi/piix4: remove legacy piix4_pm_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Whilst reviewing Bernhard's PIIX Southbridge QOMifcation patches at 
https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04329.html, I
noticed that we should first eliminate the legacy device init function
piix4_pm_init().

This series moves the outstanding logic from piix4_pm_init() into the
relevant instance init() and realize() functions, changes the IRQs to
use qdev gpios, and then finally removes the now-unused piix4_pm_initfn()
function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (12):
  hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
    piix4_pm_realize()
  hw/acpi/piix4: change smm_enabled from int to bool
  hw/acpi/piix4: convert smm_enabled bool to qdev property
  hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
  hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
  hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
  hw/acpi/piix4: introduce piix4_pm_init() instance init function
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
2.20.1


