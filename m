Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B42D324E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:43:18 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhxF-0007KC-Vc
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWv-0005IQ-7K
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:05 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWq-0007vs-6d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:04 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i9so1631793wrc.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMyVntgTVDQgB/DwHPOgVcoS8NgeRLdXH3fFwhmO8Fs=;
 b=VlCpK2QT66K9VLJBFw6Yiie96rePDcmQ51F5yBLTyBl2TZESLzp4pUMPx5BEnArQv4
 NTv8NZSqP/lDbgEGkEnRDj9fvDJoldlUJ+y9pVpOJlXE2mGkWEAKjBGfhvmf8C18jf5l
 V+9p+AnSQJNTA2PBsZi8E/eVRyc4GDh2G0cGvgpmQ9C52oS30WGJj9Nvfy2elxTxmkuv
 dZO1uVWE3CdJ0y/ToJcvDL1JuuPrG9WXDY2DoktN5JNb9Ml5KPTre/9TOZs19xQhai7L
 WxLseHO6eCs/3Q4ZCHlz6NcMdU/nGIfwEuvojgDoXV1gwzFgfhqKabiFTlzowneqyj15
 ItFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMyVntgTVDQgB/DwHPOgVcoS8NgeRLdXH3fFwhmO8Fs=;
 b=jCJVnxSzVDt2+rAtBriBvPlXYpfSBtDq8yZWkpntQNctroaFNsl5k0MCWUjSsQ9M9E
 MItFSLJa4SJDwcLHPKKsswECGCf1v8qyFYwZJzElB7PEJG2NOKRWwx3m+sh+pRSepFjA
 7HSUFEeNOkkAWitghsLb6yDX3P9y32EewlrguS6YQsc6+wPK5wlTuVdgro168gs3SLAQ
 JUlENkbtDnCPzrDB3N7//ndDSdGkr4bDteQjjMOhTEfGpXvCIJdY/97RRks4OFz7Iqlq
 w0y9BHSdGX58MCXaKM8so9x6wTIZtZ0n7CWXvNmAgsCYv/jxw39LOJtdcsffQB9L56U3
 57aw==
X-Gm-Message-State: AOAM532XAVkjDwGKGBnZVX/E0TQuoWaa/3dIMo6sPEIeUtz0UC7Cy101
 jvPWzA0Jz1nEBlE4cIf+9WbBWJwF4PQe7g==
X-Google-Smtp-Source: ABdhPJzRhPTTnJa/ITX/cnw9HhC8CM6DLk+4EAg38rohtkZq7Pt5zqdYfhM1ZoOAHf6DjkDj/2tzJA==
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr23964096wrc.125.1607451356603; 
 Tue, 08 Dec 2020 10:15:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u12sm4978873wmu.28.2020.12.08.10.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:15:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] clock: Get rid of clock_get_ns()
Date: Tue,  8 Dec 2020 18:15:50 +0000
Message-Id: <20201208181554.435-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries makes some changes to the clock API:
 * Remove clock_get_ns()
 * Add clock_ticks_to_ns() to return number of nanoseconds
   it will take the clock to tick N times
 * clock_display_freq() to return prettily-formatted string
   for showing humans the approximate clock frequency

This is based on discussions we had about these APIs a little while
back.  The core driver here is that the clock objects internally
store the period in units of 2^-32 ns, so both clock_get_ns() and
clock_get_hz() are inherently returning a rounded-off result, which
can be badly inaccurate for fast clocks or if you want to multiply it
by a large tick count.

Ideally I'd like to get rid of clock_get_hz() as well, but
that looks trickier than handling clock_get_ns().

Patch 4 borrows a lot of the concept from one of Philippe's that he
sent out previously.

NB: tested with 'make check' and 'make check-acceptance' only.

thanks
-- PMM

Peter Maydell (4):
  clock: Introduce clock_ticks_to_ns()
  target/mips: Don't use clock_get_ns() in clock period calculation
  clock: Remove clock_get_ns()
  clock: Define and use new clock_display_freq()

 docs/devel/clocks.rst  | 37 +++++++++++++++++++++++++++++++++----
 include/hw/clock.h     | 41 ++++++++++++++++++++++++++++++++++++++---
 hw/core/clock.c        |  6 ++++++
 softmmu/qdev-monitor.c |  6 +++---
 target/mips/cpu.c      |  4 ++--
 5 files changed, 82 insertions(+), 12 deletions(-)

-- 
2.20.1


