Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9445947E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 19:07:08 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpDid-0005jf-Gu
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 13:07:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpDgh-0004Cx-F4
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:05:07 -0500
Received: from [2a00:1450:4864:20::42e] (port=34600
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpDge-0003yI-Sl
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:05:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d5so34323921wrc.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 10:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsiAKJlKsguZpsdNMTI1cutUkKwCWY61D/RBqGw3BCY=;
 b=olFzDbEmarzN3rtl2pzCAtYSK/u87+OEA2DaiArd6NpG+F0fFwamtMPTXy8g+wO0tN
 zvQuVSDMA+UTOflCcvEixKYkPRhEugWr1ulw+lOO1D55ABJoOmL8+JTdv7IGVo7WWb52
 eekg6+fDOS4cAyY9kZvCW5RFFxp7WCvSvK/YtXzr9H7Ulqj687ns/1Ynft+v2QzHqKlw
 aHdr+nTl7hBsNcPo+zWhE/1o82+2NOruM7rzomIRnL202hIJAJMcEzLLw9q9hsweYCSC
 yz8/+3dl/sMkk/FuM8UBVRc4B1Ra39T8GQFi76mNFqYNIPOgoC4uLsz0YjYNP/dbPsOC
 0BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsiAKJlKsguZpsdNMTI1cutUkKwCWY61D/RBqGw3BCY=;
 b=S9PGrOQj3HRO5REXUT3u1WckHGDLiOYaQkAq4RAtZomShDHMqzUHbI8I8uej7bZzQX
 4Ga6KRYCX2i80CrwEBnfLukjHhLqKyXZssvChGZ4vZB331gTuB1ca+TS7pBNdLOwX1pn
 NYqz75eV58zqR1nxUdGw8ygwi1O3ky14J0OiEE36S2tYcpVWnsxUIlWi7EQqomXIA1BK
 PLruvdzm+5xcF7vjzEwhghEmiXv7b51HuKaNLuPEvmgvDady1nt4ttPXaZd6r5I0R5/p
 0Dw1EsUWXpmwVI4RGjJFBlcFLC0osSonwU052jplHRZcQMkDCvFLOW36o9OPMveym5kv
 OmaQ==
X-Gm-Message-State: AOAM530fsxz8CIWbyEzVXNXW/LY8ZcK57eW1eohEIcld+EvM+I9G4vPl
 blpkmY6x+w+99iG6/M6vHr2rLbBvoOep5KsUhtZkBQ==
X-Google-Smtp-Source: ABdhPJzV76nxRHimGMneAxxy+9cjF3j2nlfxTtEq8L1fAmdVYcwgjnaps9N2qSiYugtbC6qDA4YEpgkPPyirvL7iiJM=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr39836018wri.376.1637604303259; 
 Mon, 22 Nov 2021 10:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20211122171020.1195483-1-eric.auger@redhat.com>
In-Reply-To: <20211122171020.1195483-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 18:04:52 +0000
Message-ID: <CAFEAcA-g9yjdO24cs+FSD0tp-Sw=RMe5_v0aVyFfWbY8zZp=Sw@mail.gmail.com>
Subject: Re: [PATCH for-6.2] hw/intc/arm_gicv3_its: Revert version increments
 in vmstate_its
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: drjones@redhat.com, shashi.mallela@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 17:10, Eric Auger <eric.auger@redhat.com> wrote:
>
> Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
> incremented version_id and minimum_version_id fields of
> VMStateDescription vmstate_its. This breaks the migration between
> 6.2 and 6.1 with the following message:
>
> qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
> qemu-system-aarch64: load of migration failed: Invalid argument
>
> Revert that change.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_common.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 7d7f3882e76..90b85f1e25c 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
>
>  static const VMStateDescription vmstate_its = {
>      .name = "arm_gicv3_its",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
>      .priority = MIG_PRI_GICV3_ITS,

Oops, I didn't notice that the version bump lines were still
in the patchset I applied :-(

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

