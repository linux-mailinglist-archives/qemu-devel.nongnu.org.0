Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753A392A46
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:09:41 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmC1L-0003MJ-Px
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmC05-0002TY-QG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:08:21 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBzz-0003qh-3D
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:08:21 -0400
Received: by mail-ej1-x633.google.com with SMTP id gb17so6863080ejc.8
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVEuB+h4KzEXpphTEpF4JDFUcpRvqaV1m8M0c2d/CQg=;
 b=b9cGvjIhM/4M5iBjBK8Wrk8wEhAl87luaQZSqlMPtKTfHvP2Sx0MULIY1G+ATDniT8
 or2frEBy4UMrg9adjd+4hyPJyFNOYUAH3rfIQm7BSFGn1EmE3FSKApC5EFYf/RzDR7OP
 At/IBhst1xIE3Qx31AMWKQWmafaqBAtPr0kUp5gRE2S7DJ/frVjbnbBcaPyjAacRBCUb
 Bvn0L2DUXfrRSrqZv0oTbpotEWf+zz1lr1pY4kxI9Y3KuCH04gJ4H1tc+3+DywLrlwQz
 oguPQKnghw6IQP1a6WwZ3s9iY623QxO35M4RFE+Y57pms/4Igy1llBejT4+M3DWkH02l
 ojog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVEuB+h4KzEXpphTEpF4JDFUcpRvqaV1m8M0c2d/CQg=;
 b=bgm5sse+tuY0WVJVqQKMUyVLt9YKiSSAR5dKs+PasmLbNBbHXWyu1/lLWHsHyv8/J+
 2ByztpBraNjbvojwQ14STjJqYdZNw9Mc6PePGp5AZ8Jiy6suNQwovHp11Ak57H/W+CeD
 bCl/McSkEMW0Cs/w8xCuqWamYxBpIYUJcjRPLvd+eX7fYpuv4Fr4z4adF3zdIEggCYTf
 CEQ90tlrq4Px8jsq3znhNya0ExAuuW8PnwO9ONAEl72PXS6T/HOXhACa+fTmRJZAWyWM
 k11V4fqG1k1/VTkmQtUftsf8bEp37NNiBigk3ZbNo1cKCdwI2U/s7W+sdBTwToMB3hCA
 XP1Q==
X-Gm-Message-State: AOAM533ZV1WosxVvkXMNQo5adG+1L4VT2LVNy1fttcSzLvjw6WyHm0dA
 SKicJGRtvW0IK52GOKcjYgzufKRzaewws1gmu9T2+A==
X-Google-Smtp-Source: ABdhPJwfClvk7nk1oZiBCgT/eJFAjemawtXkTvIEmlqiVtAf+6gHqTtAiPBS1zeEfXHunv9tem4vHpujlkK+BCFTQV0=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr2703345ejc.382.1622106492986; 
 Thu, 27 May 2021 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210520051542.2378774-1-f4bug@amsat.org>
 <20210520051542.2378774-4-f4bug@amsat.org>
In-Reply-To: <20210520051542.2378774-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:07:46 +0100
Message-ID: <CAFEAcA-JLiP2OTYzhiWH1sNOW4-z+LF+9xWN73h=CzuVWx1iQg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/core/loader: Warn if we fail to load ROM
 regions at reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 06:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If the user provides an ELF file that's been linked to a wrong
> address, we try to load it, fails, and keep going silently.
> Instead,
> Display a warning instead, but keep going to not disrupt users
> accidentally relying on this 'continues-anyway' behaviour.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/loader.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index b3c4a654b45..37a2f2c4959 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1147,8 +1147,16 @@ static void rom_reset(void *unused)
>              void *host =3D memory_region_get_ram_ptr(rom->mr);
>              memcpy(host, rom->data, rom->datasize);
>          } else {
> -            address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPE=
CIFIED,
> -                                    rom->data, rom->datasize);
> +            MemTxResult res;
> +
> +            res =3D address_space_write_rom(rom->as, rom->addr,
> +                                          MEMTXATTRS_UNSPECIFIED,
> +                                          rom->data, rom->datasize);
> +            if (res !=3D MEMTX_OK) {
> +                warn_report("rom: unable to write data (file '%s', "
> +                            "addr=3D0x" TARGET_FMT_plx ", size=3D0x%zu)"=
,
> +                            rom->name, rom->addr, rom->datasize);
> +            }
>          }
>          if (rom->isrom) {
>              /* rom needs to be written only once */

address_space_write_rom() as currently implemented cannot ever
fail: it always returns MEMTX_OK. (This is because it completely
ignores attempts to write to devices, and writing to devices backed
by host RAM always works.)

But perhaps this change is reasonable enough as future-proofing
in case we decide to allow address_space_write_rom() to write
rom blobs to devices in future?

-- PMM

