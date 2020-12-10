Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BA2D63CA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:40:53 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPvv-00075t-KR
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1knPdH-00055N-9U
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1knPdD-0002um-5p
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607620889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfj1puOpiJL6VjR02uzkC4xoC7j8c4k8TsJ1EKm2VO4=;
 b=d4ekcO55EykaliswuDX5UybCXQosNTrYT09FxmZXSeWW8+ugjj0C1/F38u9Ow3PSVek0m4
 qQYFt/myYk9aJMMN/AWKMY9EPvSTivr0Tr+qcZE+oxBm6ShfzOhDHvEQ74CGC85JwGGYYX
 R9YoITXupfu+WjqI1D+Sb/Rd3UuQHq8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-fUsRGemaPru9_efoqwTFZA-1; Thu, 10 Dec 2020 12:21:25 -0500
X-MC-Unique: fUsRGemaPru9_efoqwTFZA-1
Received: by mail-ed1-f72.google.com with SMTP id h5so2742203edq.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pfj1puOpiJL6VjR02uzkC4xoC7j8c4k8TsJ1EKm2VO4=;
 b=PuXaH1ZS3xXH7AFM9ocUrYc+VOj3KFCZb9kWKiJU9w6kHN6JRL7jfirGeyumn7fd8r
 QeRNEyyzL3mx+SkdF+j8Hb3VmpI67khOUltHcx3IIWofZmPyLjHh9L5NxdOoO1JlmHdp
 NLBgakwIyPZg1utGHaXokr2YbqguSEDLXDZU4s/GbHICFWNs+UTtIZ3I58w7YUlRFcQ3
 QAOSsJFVkAwY7nU6C3KEmZ6mwvYNQlWdq6ct3v9k/Amk4RxG7MxLIDtoNBcFkGsgm4IX
 ZBIBre2110YHxlmhJm3+T9HZRepi4wHqKPrHiI32ehszdhX4TfPRpVqHyo6NYKiVjNfM
 gyWw==
X-Gm-Message-State: AOAM530XvBfPps71+3ub3q5eBdcrSok3iEuiA8vFmuY4VbPIqZb4UHH8
 Gg8oGB547IP1SDSFsQt2csDfFfcY1sF5/G+fTnfUqdrowK0GcgAJ2zncjtsgfmDUYS/owCShuGa
 LVq2D5Q1pUnRMzHICssX9epxWv/8MVLw=
X-Received: by 2002:a17:906:c087:: with SMTP id
 f7mr7374239ejz.492.1607620884404; 
 Thu, 10 Dec 2020 09:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYYEpx/R/iydy3Xhy0N5pUkv270SFvoP9bX27yBOSPFH7XFrip7Iz8hOrtgBpw2+bAkXoRN9wJdr7BVDSoIQY=
X-Received: by 2002:a17:906:c087:: with SMTP id
 f7mr7374225ejz.492.1607620884230; 
 Thu, 10 Dec 2020 09:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20201210141610.884600-1-f4bug@amsat.org>
In-Reply-To: <20201210141610.884600-1-f4bug@amsat.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 10 Dec 2020 18:21:13 +0100
Message-ID: <CAA8xKjXOgSHh+MQnnLRaPCtkC-but0-Y4oi9Fi607o3iOjiiCw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 3:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Malicious user can set the feedback divisor for the PLLs
> to zero, triggering a floating-point exception (SIGFPE).
>
> As the datasheet [*] is not clear how hardware behaves
> when these bits are zeroes, use the maximum divisor
> possible (128) to avoid the software FPE.
>
> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>     B.28 System Level Control Registers (slcr)
>     -> "Register (slcr) ARM_PLL_CTRL"
>     25.10.4 PLLs
>     -> "Software-Controlled PLL Update"
>
> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Alternative is to threat that as PLL disabled and return 0...
> ---
>  hw/misc/zynq_slcr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3c..66504a9d3ab 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -217,6 +217,11 @@ static uint64_t zynq_slcr_compute_pll(uint64_t input=
, uint32_t ctrl_reg)
>          return 0;
>      }
>
> +    /* Consider zero feedback as maximum divide ratio possible */
> +    if (!mult) {
> +        mult =3D 1 << R_xxx_PLL_CTRL_PLL_FPDIV_LENGTH;
> +    }
> +
>      /* frequency multiplier -> period division */
>      return input / mult;
>  }
> --
> 2.26.2
>

This patch fixes RHBZ#1906388:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1906388

Thank you,
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


