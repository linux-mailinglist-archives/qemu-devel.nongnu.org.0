Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF33068D0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:50:40 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vWB-0006PQ-Fy
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vSh-0005LT-Bz; Wed, 27 Jan 2021 19:47:09 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:33065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vSf-000722-Ew; Wed, 27 Jan 2021 19:47:02 -0500
Received: by mail-qt1-x82e.google.com with SMTP id w20so758738qta.0;
 Wed, 27 Jan 2021 16:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q5t9SrhUzhXIFMz7nE7WvY/Ui8eCXNqBPAIEzTYQq1Y=;
 b=LH8iYH3OhfCk6mW/PQI3brvsLD9EiuvKrA2nFUyJc585puIbBNubxLlFVXAci1MvOs
 jurpIEYotmdKmXK693tDjD0tyJH+aXbharmOvEp50JACu4sfvUILWcApmKNRGifG5fPl
 fS8FE77405shH2n+dceRJry77t/c+TB1/vXyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q5t9SrhUzhXIFMz7nE7WvY/Ui8eCXNqBPAIEzTYQq1Y=;
 b=Q01f7zs69b7weqbvVIrcifeCkTliLQclIplaKHXMiD8SPFdYQttGX74iiD/Z86z/lE
 Wy9pmQCpQE8D4+OqiwvxVqYEg1cbq9BroR8BxuDGfJhRwAnMEMX39XVATUzEg09NE8X8
 RFSG/B+osy+wzJ60ZLEZ8+Plf8SvwOsrODYwWxbl1VqdH4ajnDXPmsCytuw/ZxrNSnu8
 3Z/ZpH2LJFm0s+XpAzzjeAbJlgVu3FhRRRfS+nfTYVduk4JhF2U2LMyQJKvulpvkw2Qv
 u0rIh4fdQeFfJcCMk8od7L96TQmpY+w1tzOPJsuhwPzPID+ap+zzXS1YIXRSRc04UaHu
 sQCg==
X-Gm-Message-State: AOAM5325zACEPNyAVMO26UbbXmwyJ2Tc/qVqhXt2rOx6mrFoS7j+ZwZz
 LDtY5ZV2LDTMANeKzwVkPldMoNYqT2jNJf1ofgeBkd+Y
X-Google-Smtp-Source: ABdhPJzeLr+zaD/fKjtlWY5c4tHQCbJqUjPuURcNnPCpKWf07w/ABlGRs9rtva/AUnc7MSs9GeB5QbJA6l5z88A2cs0=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr8968712qtw.363.1611794819961; 
 Wed, 27 Jan 2021 16:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
In-Reply-To: <20210126171059.307867-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:46:48 +0000
Message-ID: <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 17:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv_bmc.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 67ebb16c4d5f..86d16b493539 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>      Object *obj;
>
>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> -    object_ref(OBJECT(pnor));
> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));

I assume it's ok to move the link set to after the realise of the BMC objec=
t?

>      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> -
> -    /* Install the HIOMAP protocol handlers to access the PNOR */
> -    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
> -                            &hiomap_netfn);
> +    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
>
>      return IPMI_BMC(obj);
>  }
> --
> 2.26.2
>
>

