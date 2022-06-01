Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9953AE85
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:32:51 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVxS-0003Pv-If
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwVgA-0006r1-76; Wed, 01 Jun 2022 17:14:58 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwVg8-0005if-Cu; Wed, 01 Jun 2022 17:14:57 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 h9-20020a056830400900b0060b03bfe792so2106927ots.12; 
 Wed, 01 Jun 2022 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ra02+27G9ueEtq01sMrWGS/wIPBuGE4/oa5XUqciaOk=;
 b=dZ2JzZ9iew1sH7CPi8mm+F0dPH76Llv3JdofEAlAKh0e6+V0K9TIbqrnbRNA0q7SAR
 HZPNj/+hVeqjrPdXlBIQ/KqL2CwA/aoyUEInUet3r7MyPiEoXtzI8pkhZvmbyScLZpBS
 wWFAaHQ9e0J45oBxP3AmeEdF/qZ7uMr/39W60opanwGhiR4Wrl2VmqFxSSz+BH3MMEwl
 NK4bXHOlQaD0LBKkPRI4QCulj+Dj8nZeAAvCW/T1QAVgJH+1w3aGF+rLzmFSYfirO0BA
 SP6Y+2JaTDCJ5wpVwRuDktvVYl5htRqa3eyaRT5JzZxcnTynUWvJQkDExJKR8c7XkW8c
 z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ra02+27G9ueEtq01sMrWGS/wIPBuGE4/oa5XUqciaOk=;
 b=LQOF+pTb9OqNKGdk25610cGceuV6+j1HTO0eaffzgGqE1pAjsxyZg7otyHrjXz5iEe
 CXBAbvbwrz7ahl9bIxlU+8kstSYKQSFIPNBzprBmmCvotN/5n5duCgXaANu0EeoSPqxz
 3z3lcdJOC2RozFgDjQnPaB32UaYp8Z3c3cLmVM24xLGBjnDQlpiqR/j4s9XSeK9dJU3Y
 YjJuxVunLZ61jXPknjsFUnuCDlxfiANLcL4FR/NrRM5S55QJy7idXZ8ux0+IC1BOZFIN
 K7SSgifCJsALi1lpYwKERrn05i3cx1VGR9FK1kihvkdY8IVbVIDU7AbktEZoPXcbRzTU
 Tf1w==
X-Gm-Message-State: AOAM530tu5KN7UfSH77QCR0NOD12Q3YHNZiwQBdgYlxnn9DYDHvqcCax
 jG0LaKvBckq2NRzsbOxKOxcJtSt9FoeDnhrBdXk=
X-Google-Smtp-Source: ABdhPJyKZDeOJqaPKvMRY+YfbwL2PN0g2P/eBEIVaR0hIafyu+TOOKDvLh/d8+im5al5lDmu5udD11oroqJkxHrHJiQ=
X-Received: by 2002:a05:6830:18dc:b0:60a:e7a3:dbe7 with SMTP id
 v28-20020a05683018dc00b0060ae7a3dbe7mr769379ote.186.1654118094020; Wed, 01
 Jun 2022 14:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <20220601172353.3220232-2-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-2-fkonrad@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 07:14:27 +1000
Message-ID: <CAKmqyKMUnYrb4o40WCbjAJ4igAjw0W1=S=D1WQEBGU7agba_CQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] xlnx_dp: fix the wrong register size
To: frederic.konrad@xilinx.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>, fkonrad@amd.com, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jun 2, 2022 at 3:26 AM <frederic.konrad@xilinx.com> wrote:
>
> From: Frederic Konrad <fkonrad@amd.com>
>
> The core and the vblend registers size are wrong, they should respectively be
> 0x3B0 and 0x1E0 according to:
>   https://www.xilinx.com/htmldocs/registers/ug1087/ug1087-zynq-ultrascale-registers.html.
>
> Let's fix that and use macros when creating the mmio region.
>
> Fixes: 58ac482a66d ("introduce xlnx-dp")
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c         | 17 ++++++++++-------
>  include/hw/display/xlnx_dp.h |  9 +++++++--
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 9bb781e312..0378570459 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1219,19 +1219,22 @@ static void xlnx_dp_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      XlnxDPState *s = XLNX_DP(obj);
>
> -    memory_region_init(&s->container, obj, TYPE_XLNX_DP, 0xC050);
> +    memory_region_init(&s->container, obj, TYPE_XLNX_DP, DP_CONTAINER_SIZE);
>
>      memory_region_init_io(&s->core_iomem, obj, &dp_ops, s, TYPE_XLNX_DP
> -                          ".core", 0x3AF);
> -    memory_region_add_subregion(&s->container, 0x0000, &s->core_iomem);
> +                          ".core", sizeof(s->core_registers));
> +    memory_region_add_subregion(&s->container, DP_CORE_REG_OFFSET,
> +                                &s->core_iomem);
>
>      memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
> -                          ".v_blend", 0x1DF);
> -    memory_region_add_subregion(&s->container, 0xA000, &s->vblend_iomem);
> +                          ".v_blend", sizeof(s->vblend_registers));
> +    memory_region_add_subregion(&s->container, DP_VBLEND_REG_OFFSET,
> +                                &s->vblend_iomem);
>
>      memory_region_init_io(&s->avbufm_iomem, obj, &avbufm_ops, s, TYPE_XLNX_DP
> -                          ".av_buffer_manager", 0x238);
> -    memory_region_add_subregion(&s->container, 0xB000, &s->avbufm_iomem);
> +                          ".av_buffer_manager", sizeof(s->avbufm_registers));
> +    memory_region_add_subregion(&s->container, DP_AVBUF_REG_OFFSET,
> +                                &s->avbufm_iomem);
>
>      memory_region_init_io(&s->audio_iomem, obj, &audio_ops, s, TYPE_XLNX_DP
>                            ".audio", sizeof(s->audio_registers));
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index 8ab4733bb8..1ef5a89ee7 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -39,10 +39,15 @@
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
>
> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> +#define DP_CORE_REG_OFFSET                  (0x0000)
> +#define DP_CORE_REG_ARRAY_SIZE              (0x3B0 >> 2)
> +#define DP_AVBUF_REG_OFFSET                 (0xB000)
>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
> -#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
> +#define DP_VBLEND_REG_OFFSET                (0xA000)
> +#define DP_VBLEND_REG_ARRAY_SIZE            (0x1E0 >> 2)
> +#define DP_AUDIO_REG_OFFSET                 (0xC000)
>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
> +#define DP_CONTAINER_SIZE                   (0xC050)
>
>  struct PixmanPlane {
>      pixman_format_code_t format;
> --
> 2.25.1
>
>

