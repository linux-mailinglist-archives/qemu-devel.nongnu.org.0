Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3744A992D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:20:45 +0100 (CET)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxa0-0004PE-I2
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:20:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxOZ-0006Br-8k
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxOW-0008Iv-2l
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643976531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxQUgMDGFiOGc5zxQ84sYOmYzeIAP7OkQPa9cHXCR6k=;
 b=eAdiPxEc0do0ojXDtLvKAxkz7TmT+0XGw9k1qEoLYKSQyGLj51VUp5K3OyN34agOlMHHD9
 r+SOhcGugNbGZeLvsR0flbgrOMBKdLw7v7RTJedlWbWoVf7EEcE/xDjT7uAVHdFmRrrsUI
 6SvljkSnPd20bLyh3VM+7L3/tLF3Awo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-arNklqiRNKey9e7wa16m5Q-1; Fri, 04 Feb 2022 07:08:49 -0500
X-MC-Unique: arNklqiRNKey9e7wa16m5Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so2483123ejd.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94QqmsUS2m+7bCWaXAY8eekvGvwXb9wZCcuBCY6ef2w=;
 b=H02VQMmcbA0K98+NkM/srSVgkRgojXkCVshf0OBSpLAhPASEe73AarttH3y5GZ28nm
 0kzqFFwTOBNrRl0+zQlvNbeMpfb8jaul5P2cmrnXU6Ua9INuVsWE7TY43ewnwa+X0Pti
 +CdjgbkawQ15CGvkySNynICak1tBMvXMeN0h08AJGxvh6ldi4/dKLJFFRTHarg7Eah7W
 akXT9Gd/A9c8gKzUmCgh8Kv0EYS+xbsoZiwf3+wxQxWg3tQoQIDdKTaziWOfjas6hm4A
 ux0P5A2beu7eBk8+FO74jpk5Y3SoZDsAhdAK5agNRn9ydsK6qboqScByv0gVD1IJKf3r
 YTIA==
X-Gm-Message-State: AOAM533/1J+QdMs5FwXILeqYawUWvPV3txiFYerB9T9b8eUwQWLkysqz
 KH2XdzP6HF7dWP7XbzVWUN0EE7iwNEmWltHhRUzvN7AOjt0LeDzgFEqer+D5BzJCPkMpN67jjQf
 s/khNWPROZ+mTN9k=
X-Received: by 2002:a17:906:7f0a:: with SMTP id
 d10mr2195970ejr.397.1643976528663; 
 Fri, 04 Feb 2022 04:08:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrD26rJI1fMknXF8cjlR9eX1l5DysZSMCX1WJbbhFuqIxQB6QLwKJ+RxHan+PeQ3CupsEedg==
X-Received: by 2002:a17:906:7f0a:: with SMTP id
 d10mr2195946ejr.397.1643976528378; 
 Fri, 04 Feb 2022 04:08:48 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a26sm594206ejy.105.2022.02.04.04.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:08:47 -0800 (PST)
Date: Fri, 4 Feb 2022 13:08:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PULL 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <20220204130846.31f5b396@redhat.com>
In-Reply-To: <164392772418.1683127.9746374099330960813.stgit@omen>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <164392772418.1683127.9746374099330960813.stgit@omen>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 03 Feb 2022 15:35:35 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> From: Eric Auger <eric.auger@redhat.com>
>=20
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Link: https://lore.kernel.org/r/20220120001242.230082-2-f4bug@amsat.org
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/tpm/tpm_crb.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c35..be0884ea6031 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
>  #include "sysemu/reset.h"
> +#include "exec/cpu-common.h"
>  #include "tpm_prop.h"
>  #include "tpm_ppi.h"
>  #include "trace.h"
> @@ -43,6 +44,7 @@ struct CRBState {
> =20
>      bool ppi_enabled;
>      TPMPPI ppi;
> +    uint8_t *crb_cmd_buf;
>  };
>  typedef struct CRBState CRBState;
> =20
> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error=
 **errp)
>          return;
>      }
> =20
> +    s->crb_cmd_buf =3D qemu_memalign(qemu_real_host_page_size,
> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> +
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>          "tpm-crb-mmio", sizeof(s->regs));
> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cm=
d",
> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf)=
;

> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));

Does it need a compat knob for the case of migrating to older QEMU/machine =
type,
not to end-up with target aborting migration when it sees unknown section.


>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE, &s->mmio);
> @@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error=
 **errp)
>      qemu_register_reset(tpm_crb_reset, dev);
>  }
> =20
> +static void tpm_crb_unrealize(DeviceState *dev)
> +{
> +    CRBState *s =3D CRB(dev);
> +

likewise, should vmstate be unregistered here, before freeing
actually happens?

> +    qemu_vfree(s->crb_cmd_buf);
> +
> +    if (s->ppi_enabled) {
> +        qemu_vfree(s->ppi.buf);
> +    }
> +}
> +
>  static void tpm_crb_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      TPMIfClass *tc =3D TPM_IF_CLASS(klass);
> =20
>      dc->realize =3D tpm_crb_realize;
> +    dc->unrealize =3D tpm_crb_unrealize;
>      device_class_set_props(dc, tpm_crb_properties);
>      dc->vmsd  =3D &vmstate_tpm_crb;
>      dc->user_creatable =3D true;
>=20
>=20
>=20


