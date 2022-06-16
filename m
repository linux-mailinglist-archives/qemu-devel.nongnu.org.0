Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38054E061
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:59:10 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1o9V-00027z-Mh
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1npR-0007l7-MU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1npO-0004ij-7C
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655379500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ggu7SGLAmUcoYZU6O8+e0/Maz+Cc8kjqZBjUnwyklo8=;
 b=UXg/dOs4NiEzBJExXas4JOJyBV8IogJHr/4fKN6chtjP6fHBbLcfxhr9+CO1/3jPU2gjXy
 juNx5625F/JJR5/A43oRrG+tNDwxVmUE+GygAnfZYRZMpEnp+ZFUNzq4sYNKUczi9WgZmZ
 yqQjDH21u4TBmp+cIrNfz9BgsESypgM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-IC_k8lHdPv-gGRqtuB-ivw-1; Thu, 16 Jun 2022 07:38:19 -0400
X-MC-Unique: IC_k8lHdPv-gGRqtuB-ivw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m23-20020a05600c3b1700b0039c6e3c169aso783168wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 04:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ggu7SGLAmUcoYZU6O8+e0/Maz+Cc8kjqZBjUnwyklo8=;
 b=MQYXUKVgbr4JHZZU1d3iWiarUcwCMe+sISu3bMRZ+22wXZbeWhdQNWfX6UZKn3w8ke
 jJA9CuR4yLghmdJq2BHtIYIxqatzqu4tyOQHQ2w21koWc91lTx2WDrVg8TTKg74kT3OD
 SvixV+osyJZaNuChpEXMSkYCew2ksoABtyYhdSCSgrXX8oUj7NpO3eHTDNjo8EOBTyEC
 S1vycz49nf1yaTG2XvJd1oKw1/5Pzdfliyzo7iLTrIm5ZMieSm/0VfJ7DbxlCRlv2hk2
 nSHhl7Zwsl6X4QoPbjohYXDuWkrMcKppcEEne+xUjLIOWJQ2f7WJpTvmf0lfdbt5Jyp6
 SPNQ==
X-Gm-Message-State: AJIora9m9Vl0YOVHcTzoIEC/OUiVqwqbZHuqSZdLL4Z4lDs4QiKRg3xr
 WNlgIE9SavbQrfS9vvi8XwXB4o+i/B7cePxD8tcvU9zwO7tT/nmY79m3KnW77mvGuufXfc3JhGc
 tOjA5rduyH5FYCZA=
X-Received: by 2002:a05:6000:248:b0:213:bb11:2fdf with SMTP id
 m8-20020a056000024800b00213bb112fdfmr4348427wrz.250.1655379498592; 
 Thu, 16 Jun 2022 04:38:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/qGusH19bBJkyU/VZrxIraNfqmO2EUOckhfie2zGj2CUq01RdtKJKMKSYhPbw9doaNgk6hA==
X-Received: by 2002:a05:6000:248:b0:213:bb11:2fdf with SMTP id
 m8-20020a056000024800b00213bb112fdfmr4348404wrz.250.1655379498375; 
 Thu, 16 Jun 2022 04:38:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b0039c7f790f6asm5522809wms.30.2022.06.16.04.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 04:38:17 -0700 (PDT)
Date: Thu, 16 Jun 2022 13:38:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 3/6] acpi/nvdimm: NVDIMM _DSM Spec supports
 revision 2
Message-ID: <20220616133816.74cb2eb7@redhat.com>
In-Reply-To: <20220530034047.730356-4-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-4-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 30 May 2022 11:40:44 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> The Intel Optane PMem DSM Interface, Version 2.0 [1], is the up-to-date
> spec for NVDIMM _DSM definition, which supports revision_id =3D=3D 2.
>=20
> Nevertheless, Rev.2 of NVDIMM _DSM has no functional change on those Label
> Data _DSM Functions, which are the only ones implemented for vNVDIMM.
> So, simple change to support this revision_id =3D=3D 2 case.
>=20
> [1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

pls enumerate functions that QEMU implement and that are supported by rev=
=3D2,
do we really need rev2 ?

also don't we need make sure that rev1 only function are excluded?
/spec above says, functions 3-6 are deprecated and limited to rev1 only/
"
Warning: This function has been deprecated in preference to the ACPI 6.2 _L=
SW (Label Storage Write)
NVDIMM Device Interface and is only supported with Arg1 =E2=80=93 Revision =
Id =3D 1. It is included here for
backwards compatibility with existing Arg1 - Revision Id =3D 1 implementati=
ons.
"

>=20
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  hw/acpi/nvdimm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 0ab247a870..59b42afcf1 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -849,9 +849,13 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t=
 val, unsigned size)
>      nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revi=
sion,
>                   in->handle, in->function);
> =20
> -    if (in->revision !=3D 0x1 /* Currently we only support DSM Spec Rev1=
. */) {
> -        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
> -                     in->revision, 0x1);
> +    /*
> +     * Current NVDIMM _DSM Spec supports Rev1 and Rev2
> +     * Intel=C2=AE OptanePersistent Memory Module DSM Interface, Revisio=
n 2.0
> +     */
> +    if (in->revision !=3D 0x1 && in->revision !=3D 0x2) {
> +        nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.=
\n",
> +                     in->revision);
>          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_a=
ddr);
>          goto exit;
>      }


