Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505D2E85E9
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:21:58 +0100 (CET)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTk5-0005vP-9n
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvTiA-0004z1-OP
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:19:58 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvTi7-0004H5-R7
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:19:58 -0500
Received: by mail-ej1-x62d.google.com with SMTP id 6so29222174ejz.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 15:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eZ3QSTN4QxfV/GqUtlwWUBM52za3ZrdHoMyooyuOTXk=;
 b=kRVLvPmswiDV7objgXkMUduKuYqGA7NR97mqL7RKxOVZACSW8gxHV2owuVxwjtaKdV
 SOUE4sXTOCK1te/wzywTLijGdbJ0BtqbDe1l9FnC4UomaODFOWIW0BYtdMg2b8pGRVQv
 bLYbHKWM7pzuvPZoTSAmAGQPmQwhXCGVytjkuQqPmkB1aJakwJ4S3MC/s9zfxVi2KiBT
 iF6pnSPf8QVg5Pt2BYfjAF2G8Tmqq4wmE8lSiiweIagolFTEbQdMO+aXYcbaJl6x6eCI
 WQe9gF9fNfEHyiGtioAfjx1D/hMIWpOqIaEHkD7LbTIUVUORd0fIux673AzQ6ndzZlet
 ZQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZ3QSTN4QxfV/GqUtlwWUBM52za3ZrdHoMyooyuOTXk=;
 b=ZiuvaZrjNdItVUdx0tj9mbWnT5oCY47Usn5nmijOkcq9FBQxLsAohTZzatNhu5BTu5
 5nvCzY6m+y0B9QXgSYGNbQIFH7poxLcEV1LxVbAgdchhHB27450NlrQSzxmV5C07MlZH
 zQRl+qhiP1ieXoru1F9kVN4Y7sIEWQC3HaJs2mp0Y6gOmyVoHpIifMqfLMLDyuUjsuwg
 Md81V2Nux+Od2cpW3stEj5qNTGsloGp/tMxIW93EGnWqOywPiN/7nGeInNhmt/lDKMBe
 eqGlauT0kwSp+22hLeAv+ZoRaYEl8t4un94ePaRNLW7oOGmYGtOF76lxq/B4Ibd8gyhC
 Nl/w==
X-Gm-Message-State: AOAM532qspXth2Eb3sfXP2GHegMUFUpJRp7ON5N9wsPiqXvy9fM9fLbw
 t6jsJEfBx1G/mttR3xkw+c75fMjv9GNetBp35hZqyQ==
X-Google-Smtp-Source: ABdhPJyP6EDOPDF3jCtM844nesYdbkE7wr3rMCBiLTNF6IOMCvyeR2zdHLew9P7Ao78of6Q3nbEJi26qX5k5MBh7d3c=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr60000631ejb.56.1609543194208; 
 Fri, 01 Jan 2021 15:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-4-f4bug@amsat.org>
In-Reply-To: <20210101231215.1870611-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 23:19:43 +0000
Message-ID: <CAFEAcA_Hi+4BAPL+0BhDgbsXtzDQjiCs0SAs44mKgUbcSE+XCg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Qemu-block <qemu-block@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Jan 2021 at 23:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Per the datasheet (Chapter 5.7.1. "PCI address regions"),
> the PCIMAP register:
>
>   Map the 64Mbyte regions marked "PCI_Lo" in the CPU's memory map,
>   each of which can be assigned to any 64 Mbyte-aligned region of
>   PCI memory. The address appearing on the PCI bus consists of the
>   low 26 bits of the CPU physical address, with the high 6 bits
>   coming from the appropriate base6 field. Each of the three regions
>   is an independent window onto PCI memory, and can be positioned on
>   any 64Mbyte boundary in PCI space.
>
> Remap the 3 regions on reset and when PCIMAP is updated.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/bonito.c | 49 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..c58eeaf504c 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -137,6 +137,10 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>
>  /* 4. PCI address map control */
>  #define BONITO_PCIMAP           (0x10 >> 2)      /* 0x110 */
> +FIELD(PCIMAP, LO0,               0, 6)
> +FIELD(PCIMAP, LO1,               6, 6)
> +FIELD(PCIMAP, LO2,              12, 6)
> +FIELD(PCIMAP, 2G,               18, 1)
>  #define BONITO_PCIMEMBASECFG    (0x14 >> 2)      /* 0x114 */
>  #define BONITO_PCIMAP_CFG       (0x18 >> 2)      /* 0x118 */
>
> @@ -237,6 +241,7 @@ struct BonitoState {
>      qemu_irq *pic;
>      PCIBonitoState *pci_dev;
>      MemoryRegion pci_mem;
> +    MemoryRegion pcimem_lo_alias[3];
>  };
>
>  #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
> @@ -245,6 +250,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_H=
OST_BRIDGE)
>  #define TYPE_PCI_BONITO "Bonito"
>  OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
>
> +static void bonito_remap(PCIBonitoState *s)
> +{
> +    static const char *const region_name[3] =3D {
> +        "pci.lomem0", "pci.lomem1", "pci.lomem2"
> +    };
> +    BonitoState *bs =3D BONITO_PCI_HOST_BRIDGE(s->pcihost);
> +
> +    for (size_t i =3D 0; i < 3; i++) {
> +        uint32_t offset =3D extract32(s->regs[BONITO_PCIMAP], 6 * i, 6) =
<< 26;
> +
> +        if (memory_region_is_mapped(&bs->pcimem_lo_alias[i])) {
> +            memory_region_del_subregion(get_system_memory(),
> +                                        &bs->pcimem_lo_alias[i]);
> +            object_unparent(OBJECT(&bs->pcimem_lo_alias[i]));
> +        }
> +
> +        memory_region_init_alias(&bs->pcimem_lo_alias[i], OBJECT(s),
> +                                 region_name[i], &bs->pci_mem,
> +                                 offset, 64 * MiB);
> +        memory_region_add_subregion(get_system_memory(),
> +                                    BONITO_PCILO_BASE + i * 64 * MiB,
> +                                    &bs->pcimem_lo_alias[i]);
> +    }

Rather than delete-and-reinit-and-add, it's probably better to
just create the subregions once at device startup, and then use
memory_region_set_enabled() and memory_region_set_address()
to manipulate whether the subregion is visible and what address
in the system memory it is mapped at.

thanks
-- PMM

