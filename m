Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89C31A755
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:10:53 +0100 (CET)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgeK-0007I6-Gp
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgbg-0006FZ-Dy; Fri, 12 Feb 2021 17:08:08 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgbe-0000YB-UE; Fri, 12 Feb 2021 17:08:08 -0500
Received: by mail-io1-xd31.google.com with SMTP id u20so727206iot.9;
 Fri, 12 Feb 2021 14:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D7H6kVeasYN/wd1RTE+1vNUc42p999mTFROM/g9IYzw=;
 b=P1fUnmRupiyVIPj5PF8RHVLrVYvkAYofTVZikuyVHYZ7MVfvR4upnOiGGb8sS4pA6c
 FyT5ahBMCrHjbTrRgGCBg2U7zUkjWJpTIHNexFNifsIghdj2CJ3Y9bNqr2sMJoufmvxy
 NtnICSw6Xlgup4otkXnqAxAlzrCx0Pt9bIQomEBNlvhhkKyJ9OXzGxz/Rs1SP3lGa/n7
 cw75bThic4WHun2DAvq16tMeBPQZIYXNKrKBiJvYmdl8kXES3cZoqH492SvabWXvBTE8
 26NSc7gPy5kLN/laLaTbUH3x+fdk/c8naBPianRECYA7xPfwNCKroi2t2zSI+9FrbtLH
 hT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7H6kVeasYN/wd1RTE+1vNUc42p999mTFROM/g9IYzw=;
 b=tzjc21Zbk84JeOvY78l4OidheywCqSOWEzItRjPPrsdNvnPGu0MQBQ4L2q9uUH8nIE
 qz5Brrqh5du/TeoftekObv3/RFc0Q7c289zoyOv9WE7DSX79qBo0MqdNadOhTgEYPwVD
 nml09NRv3whmmEsEOnDWwgG/Bx0VjL2pgMUAoQZyYKN4kzbmhuU9wvO6iaICmRvKXnwR
 0Ekmrj22SxVamGH7rUWjRQFlvCkvP9vizfgFR+2PzoZDdNqh6i+3ecWRUX06DoG16zla
 V19Q4IFO2+nDFATwmLRM0CGjVVoqeyEc4rkmKBguE+vqdN/whRFwaqFdSb/Il4Dp58e/
 ZWZA==
X-Gm-Message-State: AOAM532+jnLQw3DPkAnFeCkAcV8B9URjordUManjI77Z1z6ZnupPIe6Z
 zAFyi/ykaY3hZ54ZkcEASSWVzEenKmXsmNXnuHs=
X-Google-Smtp-Source: ABdhPJwUQYnV82RoMsW+LCn5WjjniSjAk+BeMXnMMJPW/RSpryBHi39hnF0bs+/fwXFf1xsbdvFK/jqSiVk8h2tnhX0=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr3822488ioq.176.1613167685374; 
 Fri, 12 Feb 2021 14:08:05 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-6-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-6-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:07:24 -0800
Message-ID: <CAKmqyKN_RE4BNUgCzdq_T7vniFBL92RM80bPuGrD1kdbVsk0LQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/15] sd: emmc: support idle state in CMD2
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:18 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> eMMC is expected to be in idle-state post CMD1. Ready state is an
> intermediate stage which we don't come across in Device identification
> mode.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sd.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index e3738b2..69289e0 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1051,6 +1051,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          if (sd->spi)
>              goto bad_cmd;
>          switch (sd->state) {
> +        case sd_idle_state:
> +            if (!sd->emmc) {
> +                break;
> +            }
>          case sd_ready_state:
>              sd->state = sd_identification_state;
>              return sd_r2_i;
> --
> 2.7.4
>
>

