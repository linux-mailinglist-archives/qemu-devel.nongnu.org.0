Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6723BB86F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:54:15 +0200 (CEST)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JQk-0007HN-7G
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0JPN-0005Km-68; Mon, 05 Jul 2021 03:52:49 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0JPJ-0003y4-AN; Mon, 05 Jul 2021 03:52:48 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r135so27838611ybc.0;
 Mon, 05 Jul 2021 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Hqbs3KRhqjRCJsaijycq6nUWKXJvIidvXiXW3yAjP8=;
 b=CD1BwWI23B6JB4AZr1og0YJkR/X0jEMyF4b5wKAQuj0S6uDbWCHvPm1+Ywp9MZw2fS
 J/2SbSla2bstubOevUm4z4OPphYzdp9aMX/Mgz2u30yW4xaaZUf+gKMiQz1SvGhFmicT
 HXpsmCoWNo/VvFUz4eOjpqRdluV408BXgUr6Zf7KWsIFikuvYaBI4U0qFphJXoBRiXC2
 a5dO/TVCsfgpaTlSuvO3xil7bvTczFuM/XVSPTbHuAG1dFfivFRBdeT2pLVKMiKVS9p3
 UTtmRSIVdtjZT9OZeqLMglIshOF3eIuQtqGQ6Tm90e6kNrJu8rfdCGR9vvM8zBhJ1+X4
 FR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Hqbs3KRhqjRCJsaijycq6nUWKXJvIidvXiXW3yAjP8=;
 b=Oji66Y7fJXp7qTGw5fJx5UwmwsvNT5rlibmb9bw+Q5WKqmx+iUrlGuoT31vvbZxYKE
 XuXB65ELAbLjnzOb54TW5fyXP0huRMd/dONmXNKnnjO40pNOKRJ131kQGgsZJJfbwT5x
 O9cVro8bHQTfFltAd1d90g+W9PNA9urb1oo3YE8hTY1WEq1VCs78dOwnW1uYX6zuGj5/
 85yE77/kMP4QDSXnh2KsUfL0A3uOovMFuMbKmATXhBH7SMTH7QikpVJECtr/iEKEjCpK
 9Q/Ycjz1ZmPVbFCHWtLRZldpKfn1TRSCXlT8X8VWuzAr+9agEi0JRvHHykFx3BU/8qFl
 ttjw==
X-Gm-Message-State: AOAM531GWu8xmFcxcMMeu6MPpytvze+VZ56XAqlzQhbq8IKeHWDZfh3N
 RLhIIW7p+rm3a66CQVBmtK8yQHT28tI5iFOr1pA=
X-Google-Smtp-Source: ABdhPJz49kg/+NM50oJzpCOz6eBaEna6gwO4p/xyx70SJJ8UJPSR8OS+HsidrAMAx/WgmxoTR6m7tB23W1QmQXZGJdc=
X-Received: by 2002:a25:df11:: with SMTP id w17mr15834969ybg.314.1625471563875; 
 Mon, 05 Jul 2021 00:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210702155900.148665-1-f4bug@amsat.org>
 <20210702155900.148665-4-f4bug@amsat.org>
In-Reply-To: <20210702155900.148665-4-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 15:52:32 +0800
Message-ID: <CAEUhbmXziE=8tfK1z06A_H=Q+j5tJ7QkqVJQK+Ye1HH3jc5xWw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/sd: Check for valid address range in
 SEND_WRITE_PROT (CMD30)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Michael Olbrich <m.olbrich@pengutronix.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 11:59 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers an assertion:
>
>   qemu-fuzz-i386: hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t)=
: Assertion `wpnum < sd->wpgrps_size' failed.
>   =3D=3D11578=3D=3D ERROR: libFuzzer: deadly signal
>   #8 0x7ffff628e091 in __assert_fail
>   #9 0x5555588f1a3c in sd_wpbits hw/sd/sd.c:824:9
>   #10 0x5555588dd271 in sd_normal_command hw/sd/sd.c:1383:38
>   #11 0x5555588d777c in sd_do_command hw/sd/sd.c
>   #12 0x555558cb25a0 in sdbus_do_command hw/sd/core.c:100:16
>   #13 0x555558e02a9a in sdhci_send_command hw/sd/sdhci.c:337:12
>   #14 0x555558dffa46 in sdhci_write hw/sd/sdhci.c:1187:9
>   #15 0x5555598b9d76 in memory_region_write_accessor softmmu/memory.c:489=
:5
>
> Similarly to commit 8573378e62d ("hw/sd: fix out-of-bounds check
> for multi block reads"), check the address range before sending
> the status of the write protection bits.
>
> Include the qtest reproducer provided by Alexander Bulekov:
>
>   $ make check-qtest-i386
>   ...
>   Running test qtest-i386/fuzz-sdcard-test
>   qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->=
wpgrps_size' failed.
>
> Reported-by: OSS-Fuzz (Issue 29225)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/450
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c                     |  5 +++
>  tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  3 +-
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/fuzz-sdcard-test.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

