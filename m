Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B660295A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:32:58 +0200 (CEST)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okju6-0007C3-1b
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okjkm-00089v-8Z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:23:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okjkg-00045Z-Ld
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:23:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so13626661pjl.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=stqzzNREmZSLsCC9x3PnQnTpozjqxPTqxHAn/xXg378=;
 b=k9vvkEQGQqjLejifmPZOxaUF9Ms7pfkLIpSoIM2tudlmmINDmh/6Zvkv8mCINUMt44
 5ozUYLUg00dGkoE1rJI8pFeN1lmnAsO6s1hSSZ5+am0c5wHueLLC1qQL04bSM7N3jnA8
 5y2WT8fT3vdRvYt7VB61XAfToJX54z3gm8Vosx8JhhkdxWEdewpz/cHqNzxIivceca92
 o72wz8CqPnDawdu0vMU9sDeln3jfkHLL9hSL9q2wTM+og6aTo9dpdkdUPRaNp0z9Vudz
 UqC3xiy38pbSxUWiISWG1IAR3UtsGlcMWNLNJgKJJOIHt8oV0gNeqxYl+/m7xf9gSb+B
 8WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=stqzzNREmZSLsCC9x3PnQnTpozjqxPTqxHAn/xXg378=;
 b=EwYr75lqJn15WN2utXYt33bCf/oCEHQpe+aVjVyAIg18SchmV4K9QhcLkvCdZrfeSR
 g1nQ3U/JplrGmYzmIljTIVz0JJ1Wd4coWdRo4TK1l3xP9mOh7Jr35ry0/gam0rrIfHTA
 i7lMaav4rIXjSChG4AR2o0wS5YeD8ImqTpZrQs00E6axp3DK8TBlU2C1dKt5BxCY+E4l
 MX5lyid/SDTGiX1greXRo+sUe/D4N2L8u7bQDh0OshXTHRMpaLgu3lScP9DT6+cUdGHH
 p1FPY4YXcjl35KnWMHniGHacJg+M44H0j1Lf9oXbJaSCTiVA03yIFuMrj42lj06JVGa1
 yFxQ==
X-Gm-Message-State: ACrzQf3kWx76eFsX1mkiI99N9MT8JhlrwFfHr4buDHz5/qF+KYooWqGf
 KKlqcvjCQnWqT3zO/k9D1a3WVtJ0JO9RvzjJYVQlOqfjjQEMsw==
X-Google-Smtp-Source: AMsMyM7rebAOW3KlddVW2tahx2Uz6Z2593Rva+6PYuYgxP8Yg/ap70nEs/ypn6A7FJ/vQTGNtZkbXPSrkwnxGA2uPbw=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr2779070pjb.19.1666088592643; Tue, 18
 Oct 2022 03:23:12 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 11:23:01 +0100
Message-ID: <CAFEAcA_hi1VHNVetOKkpUXuYtJ4akdVZxwBqSXf76Zvx=YB6Xg@mail.gmail.com>
Subject: has anybody looked at the long-standing intermittent raspi2 avocado
 test failure?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you run this single avocado test:

while ./build/x86/tests/venv/bin/avocado run
build/x86/tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
; do true; done

then on my machine it will fail within 4 or 5 iterations. Has anybody
looked into this? Looking at a log from a failed test
https://people.linaro.org/~peter.maydell/raspi-avocado-fail.log
what seems to happen is that the test sends the "halt" command to
the guest. The DEBUG log reports a transition from RUNNING to
DISCONNECTING and the QMP connection disconnects, so presumably
the guest really did exit -- or is that something the test framework
is doing from its end? Anyway, the next thing that happens is
that after a 30s timeout something (the avocado framework?) sends
the QEMU process a SIGTERM, and there's a bunch of timeout related
python backtraces in the log.

In comparison, with a pass
https://people.linaro.org/~peter.maydell/raspi-avocado-pass.log
the transition from DISCONNECTING to IDLE is followed within about
5 seconds by a test pass.

So:

(1) has anybody looked at what's happening in this test in
particular?
(2) is it possible for avocado to log all of the communication
on the serial console? Currently the logging of what the guest
prints cuts out early (in both success and failure cases),
and what the test case sends to the guest is not logged at all
(3) what's the best way to debug this to figure out what's
actually happening?

I tried passing timeout=None to the self.vm.wait() call in
test_arm_raspi2_initrd(), which the comments in machine.py
is supposed to mean "wait forever", but that didn't actually
seem to change the timeout. (I had the idea of looking at
the status of the QEMU process etc at that point.)

thanks
-- PMM

