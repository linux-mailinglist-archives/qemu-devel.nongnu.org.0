Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBA6DC7B9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:14:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsHe-0001Cs-MK; Mon, 10 Apr 2023 10:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHc-0001CS-US
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHb-0000Rw-DV
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso9421714wmq.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681136050; x=1683728050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=goC2KTdCIkvqONgwVMav+ADKaZdno6NhfhK+xBTVzDU=;
 b=P5+hhvUylyxaSSwcIQvrEJ4li7XLb336sjhNq8oUNWeyDWludWsvyKKKGz8jNRQau+
 2ZpTNPL07u7tcwCF4Sbj3uiIbeotX9YGvcO2zSRgMhKxHuSAP/FXBJYp3uiZvQrNs8pV
 VRtc6G5v5vHNEN7y1eN8rU6sq/z0Yw6k+6vX5c+aRCRwUo9KgzSfXqu2vtv6HbOx7wxZ
 EZD6rSL/mA5CCHLyvGfufwqZ0YBlAgqL5/YfuQ1wIPMVsknFQH3GnDoJK4MK2PA3VxJZ
 1j4toR0n/r8gmf1NM7nb9QJ8GY4DPIBJeXIvvTbZznqWlEg//+pda12LlbjQCheDNrdx
 SQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136050; x=1683728050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=goC2KTdCIkvqONgwVMav+ADKaZdno6NhfhK+xBTVzDU=;
 b=hK61Njk0YnCxKuCqwE2ECguYkDTpVhXA4wG5LxwQoY18w+tkaoy5jxXx2pwXfjmFI/
 c+c2ciya49DOJ2vrDJikbUeYRycNgLzsxpe/SlWHuiDtu7LAjnnsvnPT/PcQ3Qt/Zu2E
 Wbfdru7Fg7QYEOc/fW0Qk4x5lmuwmPOh4h2glx1J7ROhqJLuk+55TB39m37QdtruULY6
 QGN55dIEaS+9Ssr+3Me0VQ1iIID/s1vOUB3ZATXSH5ApPFiOMjUfMVJpdb96s2EJDR10
 6hvJBLBh8cV0LUnuG8T8xpzlskC2mcIRq6fKwpGd5b7gdM2Cm1dN+2EogYPA6N6S/WlX
 yLvg==
X-Gm-Message-State: AAQBX9dFBYR01G3D3DdVpGG4U+UCK7fG4o9R/GzmXLkFAV07VLujHQ1c
 FPyR7NUCeqKln807FO6QnYFTdXi63yjrbvvSOrE=
X-Google-Smtp-Source: AKy350Ygneg1h9xMT51xbzX9qnyAKsXc7pJMYgHiLgGCZneOdkpy8o/OeNjiUKIAwyvdZoUd0a5V4w==
X-Received: by 2002:a05:600c:4e44:b0:3ed:de03:7f0a with SMTP id
 e4-20020a05600c4e4400b003edde037f0amr7176243wmq.10.1681136049976; 
 Mon, 10 Apr 2023 07:14:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm13793060wmj.22.2023.04.10.07.14.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:14:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target-arm queue
Date: Mon, 10 Apr 2023 15:14:06 +0100
Message-Id: <20230410141408.3564269-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

This bug seemed worth fixing for 8.0 since we need an rc4 anyway:
we were using uninitialized data for the guarded bit when
combining stage 1 and stage 2 attrs.

thanks
-- PMM

The following changes since commit 08dede07030973c1053868bc64de7e10bfa02ad6:

  Merge tag 'pull-ppc-20230409' of https://github.com/legoater/qemu into staging (2023-04-10 11:47:52 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230410

for you to fetch changes up to 8539dc00552e8ea60420856fc1262c8299bc6308:

  target/arm: Copy guarded bit in combine_cacheattrs (2023-04-10 14:31:40 +0100)

----------------------------------------------------------------
target-arm: Fix bug where we weren't initializing
            guarded bit state when combining S1/S2 attrs

----------------------------------------------------------------
Richard Henderson (2):
      target/arm: PTE bit GP only applies to stage1
      target/arm: Copy guarded bit in combine_cacheattrs

 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

