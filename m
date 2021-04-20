Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD23364FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 02:58:33 +0200 (CEST)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYeim-0000Hp-AI
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 20:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYeh3-0008I9-2S
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 20:56:45 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYegy-0007du-3R
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 20:56:44 -0400
Received: by mail-io1-xd33.google.com with SMTP id s16so31534159iog.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 17:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gMt1JOn3iDf0tXs75TU/DcUosAB1eJg5xTJkWQ+rogc=;
 b=bck2cIw3pii6yhbRpVAiMLyTxYwBNpiRJHmphBdTmIbliaEMtQnQohQppDRsSXcIws
 x66wwCDGjwE5EPt/lIn4XlqRnjNsK9myoaqsnlnqJ4xDnwbPrtjo6pRwDfcrugqtAtEJ
 hTFXU0oq6Z+X7GvbzYOJhCXXGpOGO+LJzifSdaDmS03ai4OfaGaoMd+wsjKsm9S9hL7z
 PCFd1ELjhNjJrEo+V/h1JfuLXS4ltbBb5ERjNF5BpWeQmAbW+DAB32cBIIiNBovcLL6+
 kIl+1lq0P0vV9X/XOG5JN4/NYpFGnQmnbWk+1PdQ2dhnDCijHZQ6J4PmYNHb/Pyp3azv
 g4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gMt1JOn3iDf0tXs75TU/DcUosAB1eJg5xTJkWQ+rogc=;
 b=G05s4LeC2YYb2cW66WeUGHdx+N2N2UgFQBnotywSruBX3RJ8mozpbCxvj5NgDsME2q
 mSVEP7WEWM5E1/BqKmyIJ4EbnGcUi41imu00xHFzn8igwdGk3qjop6tgx0xEN9a7Qjpi
 ix7H4aMIdbqEqzbh4k8pXyuBgzBnTsWG96mq2CZ5ISQCdVkSlFz0P0q9BRyXZG4E/QDJ
 vtZ8LkHbyoCzteMkcPVGZ4ZQCby9f1eYpGNfhsoqmGJKuPB0xDZrMNMS2KqKRNLY7gLr
 cBoEua/Ko7C2IDHnbgtFXgMX5Y2td1OP6fEK/snMndjms5jH0/XFsu3eg/Bw8cifhIBa
 wq7A==
X-Gm-Message-State: AOAM531CHNknrdS/dfWAby+p8yRdoPuCFmNb+KfZc4MwsdErj4DIs9zh
 k5e+yLLY1b5QlcJOVCFG9feTVt7ZWj5iOYmUBL4=
X-Google-Smtp-Source: ABdhPJx+B/QUGDwCtK6usMVnTdM5ESmPg+7LDI4FZRpe3y3OjcIOUB6k2hzqfjdq/DUUyYOWwshjWSGgNfvgCn2gYDE=
X-Received: by 2002:a02:94e7:: with SMTP id x94mr5343373jah.106.1618880198992; 
 Mon, 19 Apr 2021 17:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210415134128.32670-1-emmanuel.blot@sifive.com>
 <FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com>
In-Reply-To: <FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 10:56:12 +1000
Message-ID: <CAKmqyKNxMWpfQDGxxXLk=reAwv8+ky72YrrX=m5-eF_p_848Hg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix exception index on instruction access
 fault
To: Emmanuel Blot <emmanuel.blot@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 17, 2021 at 12:48 AM Emmanuel Blot <emmanuel.blot@sifive.com> wrote:
>
> When no MMU is used and the guest code attempts to fetch an instruction
> from an invalid memory location, the exception index defaults to a data
> load access fault, rather an instruction access fault.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>   target/riscv/cpu_helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef5613..4e107b1bd23 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs,
> hwaddr physaddr,
>
>       if (access_type == MMU_DATA_STORE) {
>           cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> -    } else {
> +    } else if (access_type == MMU_DATA_LOAD) {
>           cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> +    } else {
> +        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
>       }
>
>       env->badaddr = addr;
> --
> 2.31.1
>

