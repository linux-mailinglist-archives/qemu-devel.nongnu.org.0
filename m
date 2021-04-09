Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E61359962
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:38:13 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnae-00012H-IV
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZ7-0007vm-GT
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:38 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZ1-0002Yb-1I
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:36 -0400
Received: by mail-ej1-x630.google.com with SMTP id hq27so7606354ejc.9
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uAelMJmssW3t/DhbzuYgpa9k5uNPuhBu6Mw8qfc6Eo=;
 b=Jtboe/zn3YDXm859bicdbEP4s4L2WpEH3RYL8BuNXYsKtiV2xmVBUGonN/7SWDINMs
 QKFzkml/SAqbSjxXDFyzbXqxtX8VwhYBWxiHzckbYp80hfcsxYCT8hfgiHvJ8wnrPqqT
 EfbfL5fAt1oWbzDJonRsdLNOar4omlJelJ1TijJHOBHBL1Iss37dYLQJKEBV03KSHBMU
 1PJcGmec1Et2cFXCeFXRgWOZnBSV8BRyjAKiPfx66iowHvtdWiEp6sgywDa6KCthMBYC
 Nsp8X/nAQvu+K87srnxDnqYN8w4BI71d1s8JJslo4lhWm4eT6WXMjG5A1BRN7EDoDOp8
 Dtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9uAelMJmssW3t/DhbzuYgpa9k5uNPuhBu6Mw8qfc6Eo=;
 b=qpwg5UXYaJ9LpY+8i558NyM2cCgWjoNocMB7pwaJHQclhYkZdJahWPkMLN/pS8aVcT
 ow4YYtOZxIeyKMsFdMtQR1xOqdwojrz5pi8lhfpsAmryK1g+YrhoR11yVMcMcmvWkxcZ
 QZ8Or3fvJbHmCpWVx7QSX7jq8WmjvkC7WAWklRHovl2Ynox7l9X6r2KkTuraOllWSi+Q
 jgXy4okD2zeniJs3+25DRbzQtRClMXGJZOwzfXmKX7t8iFLyF2S9/FVnvoATTLsH0Zxv
 dk59Dm5h64UvFku3OdsBzN4tTzP6rQSLyB64lTiW/LFvHwpZ9G5QCrb792Xx/6xqNl5D
 q/yw==
X-Gm-Message-State: AOAM531bZpF0/StQKIP+eAKH/LjDX6JDJG68vmmJfI2Lm+vp+6XUYdYb
 wT+6f84bO2cS881Pt9sy9KidbC/ShB4Dcw==
X-Google-Smtp-Source: ABdhPJxYHEpPXqlawfMhgLK1n6VzRUx00yJ5PInNbW4xoa52XDOz7ozcN2zrCsGKCAcQjO59r3TK0g==
X-Received: by 2002:a17:907:2809:: with SMTP id
 eb9mr15032454ejc.204.1617960985933; 
 Fri, 09 Apr 2021 02:36:25 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y2sm939170ejf.30.2021.04.09.02.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 0/6] target/mips/cp0_timer: Use
 new clock_ns_to_ticks()
Date: Fri,  9 Apr 2021 11:36:17 +0200
Message-Id: <20210409093623.2402750-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Fix clock_has_source()=0D
- Split patch to be more digestible=0D
- Raise loongson3_virt/TCG clock=0D
=0D
This series uses the recently introduced clock_ns_to_ticks()=0D
function which "tells me how many times this clock would tick=0D
in this length of time" to simplify the MIPS CP0 R4K timer=0D
logic and remove the restriction to use frequencies >=3D 1GHz.=0D
=0D
Still RFC because we could rethink the MIPS CP0 timer logic=0D
to avoid too frequent divu128 calls (painful on 32-bit hosts).=0D
=0D
Also, env_archcpu() could eventually be dropped (by passing=0D
MIPSCPU* instead of CPUMIPSState*).=0D
=0D
Still, enough for a first step cleanup.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  target/mips/cpu: Use clock_has_source() instead of clock_get()=0D
  target/mips/cpu: Update CP0 clock when CPU clock is propagated=0D
  target/mips/cp0_timer: Add ns_to_count() helper=0D
  target/mips/cp0_timer: Add ns_substract_to_count() helper=0D
  target/mips/cp0_timer: Use new clock_ns_to_ticks()=0D
  hw/mips/loongson3_virt: Raise CPU clock to 2 GHz=0D
=0D
 target/mips/cpu.h        |  1 -=0D
 hw/mips/loongson3_virt.c |  2 +-=0D
 target/mips/cp0_timer.c  | 45 ++++++++++++++++++++++++++++++++--------=0D
 target/mips/cpu.c        | 15 +++-----------=0D
 4 files changed, 40 insertions(+), 23 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

