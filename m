Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A373A449894
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:39:56 +0100 (CET)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6kV-0007vx-AU
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk6gq-00055L-Kk
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:36:08 -0500
Received: from [2a00:1450:4864:20::430] (port=45886
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk6gl-0002Pz-Ls
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:36:08 -0500
Received: by mail-wr1-x430.google.com with SMTP id w29so16040672wra.12
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EMZ7EECikOvT2TbTMZH0qREAomZCGRKfWgmiYWSDBUI=;
 b=mdSWwtLS7S7vyjJezf3bq3yKr4tQi+hetBbKXOHcEQ3qHkwAxrii+x4IQuNoEu2COF
 BB9rdHwkRko2PkdWTdm037H1g3npDNgsMy3Gkif1Q/U5fegIozwmhNKPKY5viDWBP5zY
 9KbUPxxxFnts2Sn/RORGfBXnsNmwqTYcje5M5H8E4R6XVPbG2HpoFAEk9jdvqFm7PsaT
 3U+W0fn2Wmhz2fSbtkbUaDvPspUNaS6iasR3u+KnpjjX1+z8i982KcpweITQisFpZp8F
 7kHEstvz320h8T2hGJB6fD+NdgLeoRKI70K4KZ9NT3mAiCDhUHmh6HUpzglkJKIAv2VU
 4uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EMZ7EECikOvT2TbTMZH0qREAomZCGRKfWgmiYWSDBUI=;
 b=ySKUKNu5r94DibQM/4mkrqMMONKUn59r5FA6wxA2kUBddkYlbSmTYXGlYyJ+Juf1qL
 gLus9n8ClnqIrcEL0lAyJTlAopkgf87M+6jakmr3At3z1AN3aP8jxX5lwRy++1LUTxq0
 ygqSSxl457ifFnfSxP+Qsymij0SdRrIsBMoH9XfvEY0KpjTjD7X8bq0AQFTkl12NWNx2
 ArRUiC9gSZ8N0O1FaTqxgey5Z8TrGqZsUcuVSP7zJR+mp03+Vj6inIq3wPBlQQCCh3s2
 a9kZ+S1BMIGjPpQJgdE7e2vmPHN8iKCoqNcLHvJ6Wje/wiJKZI657CdFPrTcJAx6veub
 0yJw==
X-Gm-Message-State: AOAM532+m3quFOEY6VySbf1B7nG112j0yopZbhiSypr6GHKVyVkFDzqJ
 8Px5OqpXeeniqy0IVfPr8MuEW/CWpHaGwSGuSgcflA==
X-Google-Smtp-Source: ABdhPJyMYd+OUV8/qzhy6nHcjlm+rxtuYD77M8HszvJlQNrLt7boBfdKZGLq4jAqlpclvPm7yD50waW9wMdxECJjZZA=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr51478wri.376.1636385762325; 
 Mon, 08 Nov 2021 07:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20211108130718.840216-1-kraxel@redhat.com>
 <20211108130718.840216-3-kraxel@redhat.com>
In-Reply-To: <20211108130718.840216-3-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Nov 2021 15:35:51 +0000
Message-ID: <CAFEAcA9h7FsqcG5L4abq=n1fRW6cZZHGJqH1de3e3R7OE+Aj9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] microvm: check g_file_set_contents() return value
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Nov 2021 at 13:11, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Fixes: CID 1465239
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm-dt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index ad4e48e5fe60..774e0bc7fef3 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -334,7 +334,10 @@ void dt_setup_microvm(MicrovmMachineState *mms)
>
>      if (debug) {
>          fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
> -        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
> +        if (!g_file_set_contents("microvm.fdt", mms->fdt, size, NULL)) {
> +            fprintf(stderr, "%s: writing microvm.fdt failed\n", __func__);
> +            return;
> +        }
>          int ret = system("dtc -I dtb -O dts microvm.fdt");
>          if (ret != 0) {
>              fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);

Side note -- rather than invoking dtc from QEMU like this, it
would be more in line with the way other machine types deal
with debugging of autogenerated dtb files to support
"-machine dumpdtb=file.dtb" and let the end user decompile
the dtb themselves.

-- PMM

