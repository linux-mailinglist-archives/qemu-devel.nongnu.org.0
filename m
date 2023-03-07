Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A06ADD52
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVVF-0007Uk-1H; Tue, 07 Mar 2023 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUx-0007HW-TP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUu-0005gF-Cd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso10184374wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678188526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kfSglnpBNn9ufA2bE48Fm1KqCuy3CFXTGjlu6UUQwrs=;
 b=S4H+6ccP9I7lVPvNVrT7cP5NTyYxHGhxbTuyHVYhAJVawrOyG8nXMgvmFys3ebNnBq
 bngtJezZN/wZh+sTV0OZ0biXBusrBSKnwOqGiL8Ne7Fp7Q0lsweWR7JidKkvCs5SsiRO
 KoZ45olrXeXqVirLeDveteizromLyhjZVhc56v6HiefRWkT8fidtT2rvJTVZff/aWLaU
 Wk+rJxuz9wRP8Jeo5pT8HoijeYZKMFLNQG8qmRV7DuOBFMmsnY4yZlS2OKc0+gpuWBMP
 VqLI2KNyQFejFDoeKHCOXSWarODVsn2vBUJKAH6ZixK5JD6FCX6n7YsyEzIBiFQx7136
 bwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfSglnpBNn9ufA2bE48Fm1KqCuy3CFXTGjlu6UUQwrs=;
 b=OgEDATle13rvW3y9tNsWrPWpBv9zsq5RP4br2IGoNLLhcne93XyYs4AswDdavCVOxr
 2trzkmQ/ZG+fr15n47dTd2m9HFCXaAwd5Wpep9pY0v+NkRYBHGQGG6VvVKtGixltDPHY
 vEPO3bOmShmDo8/FrDor4JgxIpEL77H1UoKMgDtkeCk6jMyNbGvJkpxUAfqQu2B10X1p
 FNm0EYUtQeBtlJ59fGrrPrMqQ1P/EU5w0TlTyoRFtb4ivm5RigSAiiqX/h7prTG8Ixyr
 6Hh0Ge3do4XMLTfE24IK5/DQAEWzxvFksT8lRQ9FlTSouNeFwcbguhcuR7wHs3lOlYh3
 WdFQ==
X-Gm-Message-State: AO0yUKVdYqNxqXEnSe6jwzbTHNjLIlSGIitUI4GxavLkYSbhnzeyAUsr
 OExMccUZzS6jUSxQTENqbBnuUQ==
X-Google-Smtp-Source: AK7set+T1Pst0DnK4EjtQJNnqDEk2vblrvArfmuuy5f/wc+IDQ13UHyHQsZKH6slzFOJWxg9s613iQ==
X-Received: by 2002:a05:600c:3d18:b0:3eb:98aa:54cd with SMTP id
 bh24-20020a05600c3d1800b003eb98aa54cdmr8661502wmb.17.1678188526395; 
 Tue, 07 Mar 2023 03:28:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm16533357wmb.36.2023.03.07.03.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:28:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88A981FFB7;
 Tue,  7 Mar 2023 11:28:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvmarm@lists.cs.columbia.edu
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>,
 kvmarm@lists.linux.dev, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Date: Tue,  7 Mar 2023 11:28:38 +0000
Message-Id: <20230307112845.452053-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

I last had a go at getting these up-streamed at the end of 2021 so
its probably worth having another go. From the last iteration a
number of the groundwork patches did get merged:

  Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
  Date: Thu,  2 Dec 2021 11:53:43 +0000
  Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>

So this leaves a minor gtags patch, adding the isaac RNG library which
would also be useful for other users, see:

  Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number generator
  Date: Tue, 22 Nov 2022 18:11:36 +0200
  Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>

Otherwise there are a few minor checkpatch tweaks.

I would still like to enable KVM unit tests inside QEMU as things like
the x86 APIC tests are probably a better fit for unit testing TCG
emulation than booting a whole OS with various APICs enabled.

Alex Bennée (7):
  Makefile: add GNU global tags support
  add .gitpublish metadata
  lib: add isaac prng library from CCAN
  arm/tlbflush-code: TLB flush during code execution
  arm/locking-tests: add comprehensive locking test
  arm/barrier-litmus-tests: add simple mp and sal litmus tests
  arm/tcg-test: some basic TCG exercising tests

 Makefile                  |   5 +-
 arm/Makefile.arm          |   2 +
 arm/Makefile.arm64        |   2 +
 arm/Makefile.common       |   6 +-
 lib/arm/asm/barrier.h     |  19 ++
 lib/arm64/asm/barrier.h   |  50 +++++
 lib/prng.h                |  83 +++++++
 lib/prng.c                | 163 ++++++++++++++
 arm/tcg-test-asm.S        | 171 +++++++++++++++
 arm/tcg-test-asm64.S      | 170 ++++++++++++++
 arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
 arm/locking-test.c        | 321 +++++++++++++++++++++++++++
 arm/spinlock-test.c       |  87 --------
 arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
 arm/tlbflush-code.c       | 209 ++++++++++++++++++
 arm/unittests.cfg         | 170 ++++++++++++++
 .gitignore                |   3 +
 .gitpublish               |  18 ++
 18 files changed, 2180 insertions(+), 89 deletions(-)
 create mode 100644 lib/prng.h
 create mode 100644 lib/prng.c
 create mode 100644 arm/tcg-test-asm.S
 create mode 100644 arm/tcg-test-asm64.S
 create mode 100644 arm/barrier-litmus-test.c
 create mode 100644 arm/locking-test.c
 delete mode 100644 arm/spinlock-test.c
 create mode 100644 arm/tcg-test.c
 create mode 100644 arm/tlbflush-code.c
 create mode 100644 .gitpublish

-- 
2.39.2


