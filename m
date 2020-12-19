Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1342DEFE6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 14:54:38 +0100 (CET)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqcgv-0006yv-86
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 08:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqcfW-0006Ma-7T; Sat, 19 Dec 2020 08:53:10 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqcfU-00072q-Ea; Sat, 19 Dec 2020 08:53:09 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id b64so4220281ybg.7;
 Sat, 19 Dec 2020 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ax30wj6bzo99/WdCT4BVrqr+NylIZVJ/stk8yKc6bBs=;
 b=jgNvJp62MOES0NSuinbvM30zx1T19Cjs7DEJdvtVbSNsWGkY3qQulD2hTqFXi3+ct7
 vuSgeffn2sd5yzbVZ1xYmjxWQiwMGz0baoFSRGBiNDdM5SQkQ4HGuaEcERPFP2TXatT0
 QuwNi8v9hxQuBmqDDXoaOkGj883/Aer6vIBjGeob4PzfQ2zYtfkC3BeBlDxmrGpNFGoY
 thUOqMaCdbZ6KG5+nUfUOX1XkJpBfWaVbwaft/vEgI1mniMHc3KzqkJxxHeHHP7825NQ
 htsSEvQdNZDJy3NkkxdZlD4aHg8QfUYgyRsieW+5RK2t0lpcTcyoeZbZYt27hDOAOKJC
 upHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ax30wj6bzo99/WdCT4BVrqr+NylIZVJ/stk8yKc6bBs=;
 b=qAfx/EMC2dvD94ws9xxN+jyWYwGA/tq7JZEjt3mbj41KEu/ZLMIaBlcLLPw9vZjTNA
 QldVbI4MCHe7u8fc+zqKhoF2NaguNkJoD6X47ZUzkAxloOWHuh5N1jPmPYCtXe1MVtyt
 Cbr+NB3RCfbXNJ2AMgyg9asVSWSDBM95cw99X3b6TkZPbO+MjiV8ltkCLgIs6596wlXe
 dX+LIMet8qWZmHVZLEEv9T2EVFykiNBwoz0L2Ie7inQYcwgjjJ3NCRVFZxd/GrA6ttMB
 q1aHCipi9x9uvH0N2ogPjcfssYMv6ynLDzoPjTOdTI0xERlOxdgatM3fzGwvmF3/fv6v
 P7hg==
X-Gm-Message-State: AOAM5310+nABWm3V6Kkq8dLTc42dmZ+bM3Ei6fQoDt69sc2lfI1HO5//
 TCFG63uolkdi6KnJs0N8Of4sft96K4e8KaKIqBA=
X-Google-Smtp-Source: ABdhPJxuFLbp1QaliEZZ0e92zLqVch+zhfTpyXqeuBzVxlr58SiXCdZZK8tWSE+9tqbLtvWTXslQ6AeCXnVW2KsQXUw=
X-Received: by 2002:a25:be87:: with SMTP id i7mr12166341ybk.332.1608385986450; 
 Sat, 19 Dec 2020 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <1607668640-33970-1-git-send-email-bmeng.cn@gmail.com>
 <1607668640-33970-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1607668640-33970-2-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 19 Dec 2020 21:52:54 +0800
Message-ID: <CAEUhbmUHLNsDZPmKvxW+MvNryA3A=QBn0vMHFDoYCKrgzzayrA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/block: m25p80: Implement AAI-WP command support
 for SST flashes
To: Alistair Francis <alistair.francis@wdc.com>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Fri, Dec 11, 2020 at 2:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Auto Address Increment (AAI) Word-Program is a special command of
> SST flashes. AAI-WP allows multiple bytes of data to be programmed
> without re-issuing the next sequential address location.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v3:
> - initialize aai_enable to false in reset_memory()
>
> Changes in v2:
> - add aai_enable into the vmstate
> - validate AAI command before decoding a new command
> - log guest errors during AAI_WP command handling
> - report AAI status in the status register
> - abort AAI programming when address is wrapped
> - make sure AAI programming starts from the even address
>
>  hw/block/m25p80.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>

Any comments for this series?

Regards,
Bin

