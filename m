Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADB4E90D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:11:51 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlPi-0001b8-9k
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:11:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlO0-0000m6-VP
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:10:05 -0400
Received: from [2607:f8b0:4864:20::b30] (port=46650
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlNy-0006Qn-Li
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:10:03 -0400
Received: by mail-yb1-xb30.google.com with SMTP id d134so14007560ybc.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dmVR/cArwIRAAvoL2QXOMCPBia9mQjKSUtAuBGxQZnk=;
 b=Ss79/s89ue3vnobpArIcfx26g/ZfstaKmJJSXgiqNjR1YEfXxJKjoYRax0fuDbKjbF
 E8cdBaq6e4X2+zMud/R0eyAE852JHf0HEze2oBlXqnM7H8RdThES4UNE10bsNCG3Btor
 YMWPe5bTVGbyJ4X7qh8Znk1s2uy5HxrpxhKtb7sGrDg2pvYVlzUjqL59hr8O+szMewBt
 NzD5K2jX1BQrNOSxEErArdVGon/EcU9F0xV82d/Zvwo2UcpoC1cL+QkXHJbdqTd9vg3K
 hb8py/CQTCACoAr5ZXm92OrDCgOVT0QJ8UkpDAiwOZCnyBK3Jqbml5+3/uKXQpbLk0e5
 zEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dmVR/cArwIRAAvoL2QXOMCPBia9mQjKSUtAuBGxQZnk=;
 b=ecHoDNRae4pEOhHzsHGhiLB66PJLlu0ueBUjsYNkIxBJ/Ikb070jcaG+D3p4zp24hB
 XAKyEFz+u8AXPpDVhM6rS0f40OjuBe0oupYpG1nnoPf8rJu40oyQWzXbiVYSXnxeFy7y
 2Mldc6oPhFdxIqrGIdu6MYZApX0JtkJEELdyFEcBamZwBewYEVt1TlObq0lpL5HdyaR2
 jtPtYdInesK68NmzblxOOc4KCjBbZshtvyLIs9LO1MMOobiljuRt3e92v0T7xPxTs25K
 nYa1GBa8ku2ZARbEeIbr1edDdpftyj2abebRk3sc0M1ufMLPXw6pxni8sgoXoZ/d5JQ1
 lqGg==
X-Gm-Message-State: AOAM532zixw8j76iaVOn89eGkRM/M9Hamg9g5kj/K4OjcMbKyHP1lYJM
 f2WGg73zSGcFEFTkBRu7VNzvdlBqAi7rAFayhP1DMw==
X-Google-Smtp-Source: ABdhPJxmtHTdt2HFftBL0EzENvRDlqn1K/uuDCD+/CY7YHpk29qvJMpGc6CQ8YqTrtL5acGAOALWpBe/SkaTHdKN3cw=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr20809046ybc.39.1648458601260; Mon, 28
 Mar 2022 02:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
 <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:09:47 +0000
Message-ID: <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 03:10, Bin Meng <bmeng.cn@gmail.com> wrote:
> IMHO it's too bad to just ignore this bug forever.
>
> This is a valid use case. It's not about whether we intentionally want
> to inspect the GIC register value from gdb. The case is that when
> single stepping the source codes it triggers the core dump for no
> reason if the instructions involved contain load/store to any of the
> GIC registers.

Huh? Single-stepping the instruction should execute it inside
QEMU, which will do the load in the usual way. That should not
be going via gdbstub reads and writes.

-- PMM

