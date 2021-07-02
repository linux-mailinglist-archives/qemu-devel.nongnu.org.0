Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82373BA05B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:24:27 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIDa-0006gS-Dw
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lzIBH-0004x9-TH; Fri, 02 Jul 2021 08:22:04 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lzIBD-0000xE-FL; Fri, 02 Jul 2021 08:22:03 -0400
Received: by mail-qk1-x742.google.com with SMTP id 19so9096259qky.13;
 Fri, 02 Jul 2021 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M/hF982I4L16elpL2pkfgT3y3SGCMPCc5MUfrQ+h2js=;
 b=qpYEyMDycCPe82A6r5Oj8CzBkWRQp0XRPeZQOPPrGdTqjnZl2Gzhpo5qtxyJrPgODn
 rIOXMz7VG3cdJUTlI0p3L8iYpSqnXn7yV9xPxHdPOaBG6BcHOx8kg4l8/CHoalMrOB5G
 mt9OUvPMh2mW6lS3MRtI+2WET1/xw/L8SDsTifeF9RN/gjxhSgVrfvr3Z7fFEoHaO5NK
 BmxR9b/Bg2rbCsPdZAgM1rSTUeH8RSWnOjeqsfbShPX0nAwMk4Hql8/DRb9DzQaLCJ1R
 pXKf2cuJ7vgB1716tZ9Wz3KyBrODAeS9dBIkBxE46XATbHx62j08YUI5QnkyUxUXw9Z3
 SlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M/hF982I4L16elpL2pkfgT3y3SGCMPCc5MUfrQ+h2js=;
 b=CDoVoNtrX6/RV7h3gCjUP11UHnTUamvcpfmmBM6nzepf6rnpnV19wEeV2xny1Hl7vy
 g6O8cVsXzPBsoXvmfLaNITGA9tclH8jxtb4WkS1iOzwlFsTdVAvZ49k8abVNEjwzdrTf
 n/9Cw3aejKDDuZW2XFUk92mwhmOe+xOqx+Tr7yBZN5l9/kEM7V3DOzCbcFrmRkgVsW+O
 Zy0yIf5MDIZiGq/wcWx7SOMrfSjRqaIF3mKckusE7+8cH8xfelFCQMBAVQM32FHjHKw8
 QSimYL67X19B+1OMXW6U3jksu1qbdbT6rRuZgaQ1MDH/D9vMh6m7SkOWs8QzxT974HyZ
 k3EA==
X-Gm-Message-State: AOAM533utD7dA+4lJi4j+ioeCUHjRNE7hmSGghXysxhMuqfKBZB5CWb8
 LtDER2G5wW9TGv4HuhSVMKCDAjSLQXTqgUcJUyE=
X-Google-Smtp-Source: ABdhPJzO+omrlC34mb3/ltrnCcqTBsiYP2RAceJo8hQzvTytD7SIvCqMgViJL43KtrEe5uwyV7l5uUJZWiKcBa1EyS4=
X-Received: by 2002:a05:620a:12f3:: with SMTP id
 f19mr5215813qkl.306.1625228514425; 
 Fri, 02 Jul 2021 05:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-27-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-27-imammedo@redhat.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Fri, 2 Jul 2021 20:21:43 +0800
Message-ID: <CABSBigTx-pyaiscw7AzUVOMWbbBv2Hq5EiiJYq9vkQuXvOriyA@mail.gmail.com>
Subject: Re: [PATCH 25/53] acpi: acpi_build_hest: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qk1-x742.google.com
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:19=E5=86=99=E9=81=93=EF=BC=9A
>
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> CC: gengdongjiu1@gmail.com
> ---
>  hw/acpi/ghes.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a4dac6bf15..ae577c08e4 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int s=
ource_id, BIOSLinker *linker)
>  void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id)
>  {
> -    uint64_t hest_start =3D table_data->len;
> +    AcpiTable table =3D { .sig =3D "HEST", .rev =3D 1,
> +                        .oem_id =3D oem_id, .oem_table_id =3D oem_table_=
id };
>
> -    /* Hardware Error Source Table header*/
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_init_table(&table, table_data);
>
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, =
4);
> -
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
>
> -    build_header(linker, table_data, (void *)(table_data->data + hest_st=
art),
> -                 "HEST", table_data->len - hest_start, 1, oem_id, oem_ta=
ble_id);
> +    acpi_table_composed(linker, &table);

     Thanks for the change, I think this change is reasonable to use
common API acpi_init_table() to replace build_header()

     Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>

>  }
>
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> --
> 2.27.0
>

