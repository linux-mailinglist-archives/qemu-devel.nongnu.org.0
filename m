Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873EC3068D6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:52:38 +0100 (CET)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vY5-0007LD-G5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vUb-00067F-AS; Wed, 27 Jan 2021 19:49:01 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vUX-0007Aw-IV; Wed, 27 Jan 2021 19:49:00 -0500
Received: by mail-qk1-x72a.google.com with SMTP id x81so3808333qkb.0;
 Wed, 27 Jan 2021 16:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HUC/1fjg07UbSP9RAoA40k5EZrQB3OgDlB10WbcOGwg=;
 b=NbqBhXlhJeXVT7Cfm8FBbfDZSDGtGjXVp1k1gSa2KreB4eVlZwaz+J4MDlqcmVKilZ
 qhnzCnMPFvgEq1PS/0c5dBGECyaXtyhXUk+79H/kHCnH5lsTpON3tq/aHvQLP6JzX9IH
 OcIQc/XRs4YEAwy7GQR89pdwU9ve36zu+dHU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HUC/1fjg07UbSP9RAoA40k5EZrQB3OgDlB10WbcOGwg=;
 b=gOZKmTN6j2U63qLtj/hiFxAIwcIPSjDJpAhoivWPilsMmTEFZMCx2gCePXyWCXiPzq
 GtbzaNwN3uUfCFTDhQR4HxQjYiFaAs4YrJxlJjVXBxGLInPbS2xVNkTwgFPoDg7uk/84
 3sAf6oHxVyuLc4HZfZHs9qmF1TOAQFCLSP9dFYSes0VK3qy4Qx8AfbXDsyVvStSIkQ7d
 9LWmtuTIjclp7jwb/gd+aKBGFHuu+SJtpdKc7CLgmSCFrUpfiW3OsblJe7jvO0VjtGmL
 De4qK/qlNuUT4rVvoxCgYkgj9GL0FcnmPyqC9/g1oQbua7GsSi1LPjf6ZQ+pvX1K/Rlp
 zALA==
X-Gm-Message-State: AOAM5304VIgdl+RLPJWhRr0UC9+zRc2Xx1MWq+m8xcJp8NTqH0VSa6tu
 Jasv9SWzRix8VdObKq5ZnrnpHy0akcsuLwbP9k8=
X-Google-Smtp-Source: ABdhPJzvotcjFLqtH6GMo0EgBlCjAi9YnXr74Z7054jl804vIw5C/Ah/8v5/U1cBz+ho8bHI3wSRGM5qlCECsE4FZH8=
X-Received: by 2002:a37:ac10:: with SMTP id e16mr13353480qkm.465.1611794934932; 
 Wed, 27 Jan 2021 16:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-6-clg@kaod.org>
In-Reply-To: <20210126171059.307867-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:48:42 +0000
Message-ID: <CACPK8Xd1oLKDB+zox3MwzqTbwsm0o8xULUKXFNCJeBG2tH_6+g@mail.gmail.com>
Subject: Re: [PATCH 5/7] ppc/pnv: Discard internal BMC initialization when BMC
 is external
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72a.google.com
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

On Tue, 26 Jan 2021 at 17:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The PowerNV machine can be run with an external IPMI BMC device
> connected to a remote QEMU machine acting as BMC, using these options :
>
>   -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D10 =
\
>   -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
>   -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 \
>   -nodefaults

Should this information also go in docs/system/ppc similar to the
descriptions we have in docs/system/arm?

>
> In that case, some aspects of the BMC initialization should be
> skipped, since they rely on the simulator interface.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  hw/ppc/pnv_bmc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 86d16b493539..b9bf5735ea0f 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -51,6 +51,11 @@ typedef struct OemSel {
>  #define SOFT_OFF        0x00
>  #define SOFT_REBOOT     0x01
>
> +static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
> +{
> +    return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
> +}
> +
>  static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
>  {
>      /* IPMI SEL Event are 16 bytes long */
> @@ -79,6 +84,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
>      const struct ipmi_sdr_compact *sdr;
>      uint16_t nextrec;
>
> +    if (!pnv_bmc_is_simulator(bmc)) {
> +        return;
> +    }
> +
>      offset =3D fdt_add_subnode(fdt, 0, "bmc");
>      _FDT(offset);
>
> @@ -243,6 +252,10 @@ static const IPMINetfn hiomap_netfn =3D {
>
>  void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>  {
> +    if (!pnv_bmc_is_simulator(bmc)) {
> +        return;
> +    }
> +
>      object_ref(OBJECT(pnor));
>      object_property_add_const_link(OBJECT(bmc), "pnor", OBJECT(pnor));
>
> @@ -286,7 +299,7 @@ static int bmc_find(Object *child, void *opaque)
>
>  IPMIBmc *pnv_bmc_find(Error **errp)
>  {
> -    ForeachArgs args =3D { TYPE_IPMI_BMC_SIMULATOR, NULL };
> +    ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };
>      int ret;
>
>      ret =3D object_child_foreach_recursive(object_get_root(), bmc_find, =
&args);
> --
> 2.26.2
>
>

