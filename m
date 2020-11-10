Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B283E2AD9A0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:04:20 +0100 (CET)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVBz-0004AL-Mx
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8X-0002S5-IG
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:45 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8I-0007KP-TC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:45 -0500
Received: by mail-wr1-x441.google.com with SMTP id s8so5887371wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqejLAyov01H1x+PgUkQUuif5nZDpmbW7+uLz2z8bUc=;
 b=E0Iwj5Pc7u4wPmKb7KFA/oUwdTnDKDFnamSWX3vErZJLNGIVu/1Su71j1xyn7kf86F
 mx2q8N6D7s+mGFF5WHb6AblkcWiamUS9zpn2r3nORVjnAsmhOpBHKeO1csB5BZ4y/q3o
 kZK4pXMfgSZZ5FgBlIIq9t7DqXBtYrlASd9cheI3BB4q1lsAKq5KAUifsq0BBh0Bm4N7
 m6mqoqc5UWhQmU3qeA4fHiqWQuY+oSXFDbJ7KeOzgpiTa72JlYL0brdtgkQF+cZ6ihOO
 9X4/7V5LsKx8cWR+xtdtfwNGYW8sF0BuvmQ+6rUcGs9CtcXN7aA+7VjfzigxwVkT/Z+8
 WvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqejLAyov01H1x+PgUkQUuif5nZDpmbW7+uLz2z8bUc=;
 b=HxVyltdXTDBNP0jwkXWCpkIJ9VKv1cnozMbp9m+lm/XtbFVjoRSumIcLQHWtGzXTEY
 B0DQHSKIq8+wROwe24FhXV/5CZUPk3v8sDL3iSlj9B36fwPgcP4t4kbmEnAQ1BAUC4CQ
 JxyjgPkhk8Eu1EReDAMzr3vx5m1bgZnyT2ywc2Luil7XSGT0gPaH8nwntY2gAxUzaQBk
 obGSIk8kg7f+qBtPmrBlFi32wIIVhNenTCTZRFvAARe4+qPvD80EAPwrtMgCEOy1dj5T
 H6GvSLppJwV1BgtATt8TjOx2iRs9mgQbyiYtkZhXdJ9eCWcpW846kM8ne3ILrY6H4IbW
 jbfA==
X-Gm-Message-State: AOAM533PVzgzIkYFkph4xtjLg4ltFdDZRqTJ9Gmbjp54ujN3cRG53Pxx
 v2LKFqaBJHvyxy7EFrVbgqUABOmbDBU/Fg==
X-Google-Smtp-Source: ABdhPJyhAohCEMSE/+Hzfcv7fYODp1xvRhjh6ADDFSb6qbZPI9IqPKlxo1mlLy2JCaLT9Gfypzw4yw==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr26335132wrt.158.1605020426271; 
 Tue, 10 Nov 2020 07:00:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm3392493wma.25.2020.11.10.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:00:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2]  hw/misc/tmp105: Correct temperature limit check logic
Date: Tue, 10 Nov 2020 15:00:21 +0000
Message-Id: <20201110150023.25533-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This patchseries fixes bug https://bugs.launchpad.net/qemu/+bug/1734474
which is a regression between QEMU 1.3.0 and 1.4.0 of ability to boot a
guest image on the n800 machine.  The regression was introduced by
commit cb5ef3fa1871522a08, which fixed a logic error in the tmp105
device's handling of i2c writes.  That commit is correct, but it exposed
an underlying bug in the tmp105 implementation.  Previously, we
accidentallywrote 0 to the config register when this guest tried to
write 0x36, which meant (among other things) that we left the device
in "comparator mode" rather than putting it into "interrupt mode" as
the guest wanted, and it turns out that our interrupt-mode logic was
buggy, so we would signal an over-temperature interrupt immediately
and continuously, and the guest would hang.

Patch 1 fixes a silly omission where we weren't setting the
reset values for the T_high and T_low limit registers.
Patch 2 fixes the interrupt mode limit checks.

With these two the n9800 image linked to in the bug report can
boot properly again.

thanks
-- PMM

Peter Maydell (2):
  hw/misc/tmp105: reset the T_low and T_High registers
  tmp105: Correct handling of temperature limit checks

 hw/misc/tmp105.c | 73 ++++++++++++++++++++++++++++++++++++++++++------
 hw/misc/tmp105.h |  7 +++++
 2 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.20.1


