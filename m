Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D72D89E1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:06:51 +0100 (CET)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBAI-0001vm-Im
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9od-0001F2-SU
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:40:24 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9oZ-0001Kc-GL
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:40:23 -0500
Received: by mail-ed1-x542.google.com with SMTP id h16so12895766edt.7
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q1nCt1AU+q2ppP4mKVD3OxMWqwBqqNCq2DnbQ2irACA=;
 b=n2K62MW1rG0LPmN1u9kmuy0jj9FBDQHP6uZT8JnJNIr6endUe94Ba7x4uxhfMZqVdp
 +8yumfLSgrcHrKFZK5V8Cc0Kr75mIpqkfw9V8jkMXRPojmow100is96fykGrr8hI0LLh
 6Y1EBNUFQO0+uIv2QYQVRAE1jpkZHZqtP3NPhNY3gM/hk+5AIpct7QYW6Th4TXuln+sf
 NNdrMGJoVwtFTI691tIozSXU1qvYBNi9xQRsU91vin0TZDymHtpKKJ94PALes8m10S7S
 Ksxs5CvnC78L7Nj1+op5AoNLIgIoji1223EhwqMScnIJxaNoggJOj4d4ZrNAN0XhYH0z
 gFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q1nCt1AU+q2ppP4mKVD3OxMWqwBqqNCq2DnbQ2irACA=;
 b=iGqk+PaTlzOMroxpbvHvq8752RFsy4UTmcb/HSYeQMkglwhMWBwr9WoGGD7yABTKaI
 yqDFAIBSRBoIkAd2pkVCgIv3vwGlk8xOO3Jh70sIeyU8HjyU97HduEqTgd+EFWTaJLGk
 /F5ickQ5+sB9eEjQD/vRDFqYcwlqyu3WGJyVQlkI1ftuXcIjkH+FFuJ/zxj7f78r+vs9
 uYaPnt0+OrfFV4paSjLYbZU+uq/HC7NNUtBP8ueXjVcqYMKcrkBIsMZo4tiBnCVBQoSk
 3Oxzwh/NH3jnCclHCBBxpSBtnEWD/gALNnzemqOiKPOm3UwW+CCDpjAOMW0kY+hEtACu
 DSgA==
X-Gm-Message-State: AOAM530ZdwRbwy/fmcQK5ESDm36y/6m1ATwdNjmlbwy6iSs3VQHUtaon
 PPhBs4e1SrJFTBxk1RX61sqEYQzMuMvE9Q==
X-Google-Smtp-Source: ABdhPJxcfuIdTXvg9V6ijw6j+Cpnptnj2gq2h6YOb2GiIDdfsj0pjSSiOssTgbhMSBfW4K6pR0eAGw==
X-Received: by 2002:adf:a29d:: with SMTP id s29mr19425381wra.272.1607784097099; 
 Sat, 12 Dec 2020 06:41:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w3sm20146993wma.3.2020.12.12.06.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 06:41:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] sparc/leon3: Make grlib-irqmp handle its own inbound IRQ
 lines
Date: Sat, 12 Dec 2020 14:41:32 +0000
Message-Id: <20201212144134.29594-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the GRLIB_IRQMP device is used in one place (the leon3
board), but instead of the device providing inbound gpio lines for
the board to wire up, the board code itself calls
qemu_allocate_irqs() with the handler function being a set_irq
function defined in the code for the device.

Patch one in this series refactors this into the standard setup of a
device having input gpio lines.  The main motivation here is that it
squashes a trivial Coverity memory leak warning.  Patch two just
removes a stray unused typedef that I noticed in passing.

Incidentally I suspect the irqmp_ack logic could also be done more
neatly, but I didn't feel like getting into that at this point.

Tested by booting the 'buildroot' image downloadable from
https://www.gaisler.com/anonftp/linux/linux-2.6/images/leon-linux-4.9/leon-linux-4.9-1.0/up/
and runnable with
 ./build/sparc-all/qemu-system-sparc -M leon3_generic -display none -serial stdio -kernel image.ram


thanks
-- PMM

Peter Maydell (2):
  hw/sparc: Make grlib-irqmp device handle its own inbound IRQ lines
  include/hw/sparc/grlib.h: Remove unused set_pil_in_fn typedef

 include/hw/sparc/grlib.h |  4 ----
 hw/intc/grlib_irqmp.c    |  5 ++++-
 hw/sparc/leon3.c         | 21 +++++++++------------
 3 files changed, 13 insertions(+), 17 deletions(-)

-- 
2.20.1


