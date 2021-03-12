Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B23396D9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:45:47 +0100 (CET)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmnC-0007jZ-Gi
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbh-0005Wa-Ly
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbd-0002fX-2T
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso15611583wmi.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2+FoxPUsl3ql0sfBkfX+WZgRl9gRX3YL+B1LkTue4Q=;
 b=fk+vk82TQVMMoImoExwzAFGQk9qrBU+Uu5Axj6WtqT7+bT/1AebGG+OflNucHgdqre
 c2TEntJhJgIL7CnGjXlQ/sD19+gwdRFXY5/B/Pk6YoCuLsHsrprRjDVJ7SRGT6vMy4g+
 35I0Xw62nba0IyvflR0m33UXARkTkUeVUg0dV5m6tNkGbCKsrf2uT84RSzCJIW10B1oE
 I3aozwKPkBeDuQp+cxmwuG+B2B2MixUmc/UQqg5vNQqn0ML98GRpkmjka0OmzxJxLt2V
 7R0jXumJ7s5d0EuGM9A7fRPq3RHDRuqSk8iW0ZCNeGW4BhjmgTPf18nG++F19mjmcXwv
 G5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2+FoxPUsl3ql0sfBkfX+WZgRl9gRX3YL+B1LkTue4Q=;
 b=OGAHIGt3CSHroHwXI+fktS8kyfozdfclMjXicX5ubDBKiFQovDOX6LfJ0mPTnHfm+8
 Rys4punstSj6s6U7ZTUf7WLi37zR+z25YlLCOpq4QKkJCYCde7h7miB46L0clyjdFAWu
 FoQW3uH02nrxo8DAJUpriyI2cVpTpqCplSDYDMM08N6Lpi7ThcGTQB8RIEri8vwR7JRM
 b4J2oi1lllfzgpvkLj4/ny2nxujfN9fkz24z841o3a9IwpJ/c1zMP9yRdBuT98SFi7eb
 ogHz3EC5hNW5wJpV81BPLJQ/OFFYUx5ohL3StfLGVLgg+MPQJfxCYfrF+UcJHHX6AMco
 SjgQ==
X-Gm-Message-State: AOAM532Nn9h4UmOzI7VtAybHqEzlWwgxCKbiQ3c+qH9vDXOE18GgfXRY
 dmUZbSY6AqSGzmliK2HAVTV3UA==
X-Google-Smtp-Source: ABdhPJwZ0QzQq9rhxJnK8QysJzuRdH43oy6KqxKCb4ZmVLLTkuxK4r/V+dKGd+7fvIxAb6wqEewOKA==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr13884675wme.86.1615570181495; 
 Fri, 12 Mar 2021 09:29:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm2679001wmf.45.2021.03.12.09.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:29:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset handle
 memory aliasing
Date: Fri, 12 Mar 2021 17:29:37 +0000
Message-Id: <20210312172939.695-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
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

I still think that long-term the preferable option is going to be to
sort out our reset handling so that we can use three-phase-reset
everywhere and then have the rom blob loader write data in phase 2
which the CPU reset can read in phase 3. But that doesn't work today
because CPUs are not on any qbus and so they must be manually reset
outside the standard "system reset by resetting the qbus tree", using
qemu_register_reset(). The ROM blob loader also registers its reset
via qemu_register_reset(). Sadly qemu_register_reset() has no support
for three-phase-reset currently. That all adds up to "fixing reset
handling sufficiently for this approach to solve the problem is going
to take a long time", so for the moment this series is a reasonably
self-contained way to allow QEMU to run guest images linked to an
alias of the vector table address.

thanks
-- PMM

Peter Maydell (2):
  memory: Add offset_in_region to flatview_cb arguments
  target/arm: Make M-profile VTOR loads on reset handle memory aliasing

 include/exec/memory.h           |  4 +-
 softmmu/memory.c                |  3 +-
 target/arm/cpu.c                | 68 ++++++++++++++++++++++++++++++++-
 tests/qtest/fuzz/generic_fuzz.c |  4 +-
 4 files changed, 75 insertions(+), 4 deletions(-)

-- 
2.20.1


