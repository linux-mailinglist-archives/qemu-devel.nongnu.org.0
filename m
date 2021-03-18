Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281AF340C92
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:12:35 +0100 (CET)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMx8M-0005d1-7O
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlC-0006Vg-8c
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008Cx-62
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id t9so6451485wrn.11
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9yZWllhXgYeYx/lgwEn/dHPz2GZSIIWoUuIwOoQLhs=;
 b=L9RrXC/U21eqhd/8VDml60tk21rqQ28LMpxrX6e5vMwUtKAuna2K5bnDrnXvTnCU7G
 1gvVic03gPniF/9ODatnmx5FXM1cgpMm0g67chovlGU2pwmQfb442VyY2nW9PVG3IntV
 qcX/GWBlvLNI1fBEWhCmfeI493gvzkU5SKcyZLYslwTXOxV+NB8Y8FW3+ZLG+Mof1bzP
 YrPqQ05c4+m8PuvmaosTncUx0Fk4d7Wlh0rNmFriVX7oBrFPuLF6E8qarqv612ssvZFI
 NMJejFqCWPm15FEPX4LcotOTTYwIzXcVtgerx/UuviZBE8QAP/BTJlN3tE9RGFYbw+qb
 bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9yZWllhXgYeYx/lgwEn/dHPz2GZSIIWoUuIwOoQLhs=;
 b=RUHOvPi+q3lXR7PKBKdhngmsSGhhZ4SmbwVU5cf4fLMZ3j0Q4K94ggSPqJzoUUuZAy
 9bcPdnFcP8QPgusi39Wc4svciNZepYSdI+aOwou0ZjT6cKI7BpLZCuQZ0XVJ0Tq6lgxY
 17vIGiq3Bjr1YjvgnAgzE5sOMMpDaDUTcmOwVoEUPzCyOBGByd1HCIICsreQAf7yQnNv
 i5hyAxFF1kXSXL7eFMq65Ueslp1iRz6Yrl5iAsHvSWMVWK+izFD6Vy9OKAvjDOHtMFTX
 nw1xXVVoYFHw5he5iF+wlPaJ5x0p805WjvYsGwb9yxbD43T/RQuiArKha5VzS5gVQnZ8
 lQjQ==
X-Gm-Message-State: AOAM530r8cCroq37N5Lm22ExH3EU/iSTXTovyYvwpBMU0WAixhwJwVWn
 BklLjViO9h1IM6NxS5H1o1rooQ==
X-Google-Smtp-Source: ABdhPJwjG9t9JMKnllPWjy8Nxps+Kvpp9X89B5t9HKZoqk9u7r+ZZ1cBTrW83oHR032WermxO/c/Mg==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr405803wrr.287.1616089706834; 
 Thu, 18 Mar 2021 10:48:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 0/5] arm: Make M-profile VTOR loads on reset handle
 memory aliasin
Date: Thu, 18 Mar 2021 17:48:18 +0000
Message-Id: <20210318174823.18066-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be accessed
via multiple possible physical addresses; if the board has the vector
table at address X but the user's ELF file loads data via a different
address Y which is an alias to the same underlying guest RAM then
rom_ptr() will not find it.

This series handles the possibility of aliasing by iterating through
the whole FlatView of the CPU's address space checking for other
mappings of the MemoryRegion corresponding to the location of the
vector table.  If we find any aliases we use rom_ptr() to see if the
ROM blob loader has any data there.

Changes from v1:
 * do a little bit more cleanup on flatview_for_each_range():
   - switch return type to bool
   - document it
 * put the "rom_ptr() but handle aliases" functionality into
   a generally-available function rom_ptr_for_as()

We discussed the idea of just making rom_ptr() itself handle the
aliasing, but that would require looking at all the callsites to
identify a good address space to use; it's also a bit more invasive to
other platforms than I would like at this point in the release
cycle. So I opted for "provide a new function" as a safer and simpler
compromise. In many cases callers of rom_ptr() probably should be
changed to use rom_ptr_for_as() at some point, though.

I realised that although if we can get reset ordering sorted out
we can remove this use of rom_ptr()/rom_ptr_from_as() from the
Arm CPU reset function, we will still have the same "need to read
the blob data directly" problem for board init functions which
are the bulk of the callers of rom_ptr(). I suppose in theory
we could rewrite those to postpone their accessing of the data
until reset, but that sounds like it could get complicated. Anyway,
that means that rom_ptr_for_as() might have a fairly long life.

thanks
-- PMM

Peter Maydell (5):
  memory: Make flatview_cb return bool, not int
  memory: Document flatview_for_each_range()
  memory: Add offset_in_region to flatview_cb arguments
  hw/core/loader: Add new function rom_ptr_for_as()
  target/arm: Make M-profile VTOR loads on reset handle memory aliasing

 include/exec/memory.h           | 32 ++++++++++++--
 include/hw/loader.h             | 31 ++++++++++++++
 hw/core/loader.c                | 75 +++++++++++++++++++++++++++++++++
 softmmu/memory.c                |  4 +-
 target/arm/cpu.c                |  2 +-
 tests/qtest/fuzz/generic_fuzz.c | 11 +++--
 6 files changed, 145 insertions(+), 10 deletions(-)

-- 
2.20.1


