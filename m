Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF258033A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 18:59:36 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG1Qd-0001P4-AM
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 12:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.blinov@embecosm.com>)
 id 1oG1P5-0007eZ-2x
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:57:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.blinov@embecosm.com>)
 id 1oG1P3-0002jd-9G
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:57:58 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id z132so2326167yba.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=DriQn3oUNtY9KztAGS0KsFuBc5YfBmykMcm24BuA1yQ=;
 b=ZW+peu6caAHM2QqStdvCPisu6stK4U4IWoxtEX6sRrag8Bi+FtaUiXYwvMpPLfx+iT
 9wIQYYp4or6uCLmyXyLiaeYqBtuqM48wm34IClitS+rPWKz5zvduDxo2uxVXr1G/Ned8
 Vcxwlx4ZMLzw9M+qCJ1qnENF6WLSxT50llySPOYOXj+66tZP75fvxa3HcfUvSyKD3k/K
 MaBNKjRX8hkvsq8NbNHtg4Aj/F6sQOqEgf2jgCwh2NckJWZKVXkXMv0q2HgbTMDCBsYF
 NTd5VLR5CGNCcqhvK7cOZWg82T/fRShjQ9mwttc5oxb/O20MwRzSTfh3V6w+5ww4gofG
 vvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DriQn3oUNtY9KztAGS0KsFuBc5YfBmykMcm24BuA1yQ=;
 b=XApru0HQYXIHewahpokxeV34Ot3NW3VPeBgaJF9KULdYqc+FQ+lt38O+ZNAZbN39Wu
 /b/tW7HjHU47YEX6ZQju1LDuv09K5sgLTkCJ/AOB4eMxfGGroaLpZGvQU2gpMHAOgf+O
 dlAR5hd+HeCDbh0y6GT9Fg14CW1LsvdoIThwxbxNbpI1OAuC6Es3u60xFCKR58f69zH6
 7Bh9Xk3wgEV7evNtHmsAgi4paAAlMmYse+8AxSsp5VuaBlBjZd5flr4vwkmgdkB3W8Ql
 GNaKfdpBpLnHxP+h0F5XcBO/I4K5NsyfgDKHmEXN17hkD7oJhSzFmx8TS6Mox0oM7NQz
 J8tQ==
X-Gm-Message-State: AJIora+eqpLk5SXL8epLsaFL2Wvq/lmnhFXyFyae9KifMowXbKn42FjN
 xvi/RuSidS02GSV4Aka8ek0iKLQAt9jQqIQfW3DB3AQGtN6g3w==
X-Google-Smtp-Source: AGRyM1vna0EzJ1fGGzIgIm07JkuMAsb1BoGLPWFsmN6rGuB3/QzKtteSbNpCgCzOcMV/LeVz+/zNh0xkSyZdNA1xFHA=
X-Received: by 2002:a5b:1c8:0:b0:671:5d14:5974 with SMTP id
 f8-20020a5b01c8000000b006715d145974mr1799440ybp.123.1658768275765; Mon, 25
 Jul 2022 09:57:55 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Blinov <maxim.blinov@embecosm.com>
Date: Mon, 25 Jul 2022 17:57:45 +0100
Message-ID: <CADmoyEiUoULvn76UXcS0DaF2-Us4CTL=SyXf7PWYqfPTF3PTtQ@mail.gmail.com>
Subject: How to read RISC-V mcycle CSR from Linux userspace app?
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=maxim.blinov@embecosm.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all, stupid question but I can't for the life of me figure this out
even with all the docs open.

I need to get an estimate figure for the cyclecount of a busy loop in
one of my small Linux userspace apps. The app in question is running
in qemu-system-riscv64. I've compiled QEMU myself, and the full code
is like this:

#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

uint64_t get_mcycle() {
  uint64_t mcycle = 0;

  asm volatile ("csrr %0,mcycle"   : "=r" (mcycle)  );

  return mcycle;
}

int main(int argc, char **argv) {
  printf("Hello\n");
  printf("mcycle is %lu\n", get_mcycle());

  return 0;
}

Now I get SIGILL when I hit the `csrr` insn, which makes sense.
According to the "Privileged Architecture Version 1.10", page 32, [1]
we need to set mcounteren, hcounteren, and scounteren low bits to 1 in
order to get the mcycle csr to become available in userspace. So I add
the following function:

void enable_mcount() {
  /* Enable IR, TM, CY */
  uint64_t mcounteren = 0x5;
  asm volatile ("csrw mcounteren,%0" : "=r" (mcounteren));
  asm volatile ("csrw hcounteren,%0" : "=r" (mcounteren));
  asm volatile ("csrw scounteren,%0" : "=r" (mcounteren));
}

And call it before I call get_mcycle(), but this triggers SIGILL
(unsurprisingly) also, since these CSRs are also privileged. So
there's a bit of a chicken and egg problem.

Could someone more knowledgeable please suggest what the course of
action here is? I've got QEMU revision f45fd24c90 checked out, and I'm
staring at qemu/target/riscv/csr.c:71, which seems to deal with
whether or not to raise a SIGILL upon access. I can see a condition
for when we're in 'S' mode, but nothing for 'U' mode. Does that mean
there is fundamentally no access to these CSR's from 'U' mode? Is it
possible to just hack it in?

Maxim

[1]: https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf

