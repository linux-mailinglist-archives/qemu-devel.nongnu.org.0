Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3D2DAFCE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:10:52 +0100 (CET)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpByV-00069B-Bc
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxI-0005Ih-BZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxF-0000kY-Hw
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so20185459wrc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HxrmziQTc5fwRL5YXfV79HkuHWc8g30OuzR6nfoN+dw=;
 b=PBr8PF/qMacv7/H5x1O+BvobDDfj9vB8jeWgtXIKjqUAv/OzgYc3F+Yt0pMLGCh/zx
 PfKNBDoR8VZz5oLyidL6EX2eDwUzXZRDVoNDpNDlthMvJNdWFwq1XaGgbh/wxxhpz7Me
 oiJv5y8mpfV/NptAzmBF7pUhOWS+IWdLPALBDCoeTb2+RIyj6sIRd7WLNkbC175PG4G/
 vDstzjWWMX2gWw96AWv+0pJhCGHUx1ZBrvyzoB1IlgKWDJlbeKdk3/USvQahQhcawY36
 DVdfbDImU3luOlmN46WVIAusU/k1jQgdaiNMs8z5ECDdsbumvCc9gOMxFqYVOE64M92m
 Hvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HxrmziQTc5fwRL5YXfV79HkuHWc8g30OuzR6nfoN+dw=;
 b=a86ETiw83tyVT2fHEVJwyTmPvRm6fE5NSYG8rcWCi1BepZXFYxFTqeNh5GYmfiWweL
 qvO+oQw+ndRy8PHnsE5BQAnk4ev+f599jbKGYyoUonm5D17wdwj9nSdwmF8Nk6ucBHnu
 d4nbxhGcTwIhoxW/Swl4YPpl7fDEmpYNoAo6tsezgsPLL5BiDQbbSs5GAb4uwSN6c/9c
 SesTFwsLagdM9w8Go6dqlBzrFopsMTtI9FR3twyWAaSdRFj5b3hgmqzVSasID6Kq0G0+
 VrtBQDiTqmRi4tLzu8la0szQZ0a/BSb1sLcrH8oXmE5AoE27rZ2KpGSrjggdqEhl9Osr
 Ldew==
X-Gm-Message-State: AOAM530qok/KplXD2jR0viEWDL8OOBNeqwJTv2Ptael89WNmYJ3uyfPA
 CrWeJFiGw4t6ukk5qlO1ffkkpsSojhX3pw==
X-Google-Smtp-Source: ABdhPJwO9mI/8TVkfWI1ChH0UEB1odGC/ba44iLSr3EmlIwvsLctxkgdOX+SbhuQjTUMkVtrxWIC4g==
X-Received: by 2002:adf:f989:: with SMTP id f9mr28745079wrr.299.1608044971644; 
 Tue, 15 Dec 2020 07:09:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm36930593wmi.15.2020.12.15.07.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:09:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] clock: Get rid of clock_get_ns()
Date: Tue, 15 Dec 2020 15:09:25 +0000
Message-Id: <20201215150929.30311-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
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

Changes v1->v2:
 * In patch 1, saturate return value to INT64_MAX (and update
   docs to explain this and why)

Patches 2-4 have been reviewed, only patch 1 needs review.

thanks
-- PMM

Peter Maydell (4):
  clock: Introduce clock_ticks_to_ns()
  target/mips: Don't use clock_get_ns() in clock period calculation
  clock: Remove clock_get_ns()
  clock: Define and use new clock_display_freq()

 docs/devel/clocks.rst  | 51 ++++++++++++++++++++++++++++++++++++----
 include/hw/clock.h     | 53 +++++++++++++++++++++++++++++++++++++++---
 hw/core/clock.c        |  6 +++++
 softmmu/qdev-monitor.c |  6 ++---
 target/mips/cpu.c      |  4 ++--
 5 files changed, 108 insertions(+), 12 deletions(-)

-- 
2.20.1


