Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103E45B00A1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:37:51 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrVF-0000RN-2O
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVqnO-0006Up-2y
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVqnK-0003Sk-DS
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662540744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrdgRzO+9vuuDVrxe9Vg3KClkEjhrgjJV8KIscv2ido=;
 b=L5Dcj8QeLwnUODmf2LLdEumiKQBRd6KYn/7+GjjcaYRJZ3Hn4uC4ZAIGePfQMV9oMuBt5V
 g0mZ7ix9DKweIQEGLwSTnaIfCAqOc1iyFjeQd5PH5XGh7umMwIcuy+09Zp3Bn9zRhhzpVt
 WyM261YuU5IWwmnlof6XhQiMKh3T860=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-TnqWtb9MN-alHL5gxXaHZQ-1; Wed, 07 Sep 2022 04:52:23 -0400
X-MC-Unique: TnqWtb9MN-alHL5gxXaHZQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020a05640251cb00b004484ec7e3a4so9230768edd.8
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 01:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RrdgRzO+9vuuDVrxe9Vg3KClkEjhrgjJV8KIscv2ido=;
 b=GXJ/Phn4BkLGtlAfx3tycTvCL7xge6sd07VX2raZLqckxB8DNdW9vB0/BWRlSAnOWA
 Caexm+y2RlRPiyLPlMdKO0qu0wJ1rvT9aIM1oFXeBboAzQeZrRRGneoE1c2qK5Pk8SeN
 MRtxfOtHt/YstZsKZOkbxvQdisE76IG478wMwIr8KqiTzDvo3SThmDMqn1pNbqfj4U5j
 X7pkDnt1QeFCqN0yDld0gBM9ClXTqKuT8e1TolGG/udLGOOn259cw/aDudWKHFUyISa2
 XjP2bhnwr3L3q7rtPPiYTG97939T7kkjsJmuPFmXp6421rifz4bpuTxmZVdX3hrKd912
 Hvng==
X-Gm-Message-State: ACgBeo18BmhinxECLYBI+QMt/MwAhNQ9NuHHUAXsvFSSSqQpI6p0pVi7
 cI+cgGY61v+VmYdFJ9DAWJtjIlQ5ifz28yhWv0Zes7td4fuSxW/pzkFI0EfZrl3GLwmHRV8znuy
 naJbRfG6a9ZfgKGg=
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id
 e13-20020a056402190d00b00447ed224d0dmr2253205edz.309.1662540742646; 
 Wed, 07 Sep 2022 01:52:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5XseyNVmvYC0eqM4LbC+USbJVsVi/4g6L2qI+PA/BJeuNTQf5ZmbQ+Ejk5pPNoB96bQqvR0A==
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id
 e13-20020a056402190d00b00447ed224d0dmr2253180edz.309.1662540742305; 
 Wed, 07 Sep 2022 01:52:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b0044e9a3690e0sm5077099edb.9.2022.09.07.01.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 01:52:21 -0700 (PDT)
Date: Wed, 7 Sep 2022 10:52:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <lersek@redhat.com>, <linuxarm@huawei.com>,
 <chenxiang66@hisilicon.com>, kraxel@redhat.com
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Message-ID: <20220907105220.3f54efb3@redhat.com>
In-Reply-To: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Aug 2022 17:18:42 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi
>=20
> On arm/virt platform, Chen Xiang reported a Guest crash while
> attempting the below steps,
>=20
> 1. Launch the Guest with nvdimm=3Don
> 2. Hot-add a NVDIMM dev
> 3. Reboot
> 4. Guest boots fine.
> 5. Reboot again.
> 6. Guest boot fails.
>=20
> QEMU_EFI reports the below error:
> ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
>=20
> Debugging shows that on first reboot(after hot-adding NVDIMM),
> Qemu updates the etc/table-loader len,
>=20
> qemu_ram_resize()
> =C2=A0 fw_cfg_modify_file()
> =C2=A0 =C2=A0 =C2=A0fw_cfg_modify_bytes_read()
>=20
> And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> the "key" entry to NULL. Because=C2=A0of this, on the second reboot,
> virt_acpi_build_update() is called with a NULL "build_state" and
> returns without updating the ACPI tables. This seems to be=20
> upsetting the firmware.
>=20
> To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read=
().

Fixes: bdbb5b1706d165 ("fw_cfg: add fw_cfg_machine_reset function")
Acked-by: Igor Mammedov <imammedo@redhat.com>

CCing Gerd to have a second set of eyes on it

> Reported-by: chenxiang <chenxiang66@hisilicon.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> I am still not very convinced this is the root cause of the issue.
> Though it looks like setting callback_opaque to NULL while updating
> the file size is wrong, what puzzles me is that on the second reboot
> we don't have any ACPI table size changes and ideally firmware should
> see the updated tables from the first reboot itself.
>=20
> Please take a look and let me know.
>=20
> Thanks,
> Shameer
>=20
> ---
>  hw/nvram/fw_cfg.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..dfe8404c01 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -728,7 +728,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, =
uint16_t key,
>      ptr =3D s->entries[arch][key].data;
>      s->entries[arch][key].data =3D data;
>      s->entries[arch][key].len =3D len;
> -    s->entries[arch][key].callback_opaque =3D NULL;

>      s->entries[arch][key].allow_write =3D false;

As Christian have mentioned, this also looks bogus.
perhaps another patch to fix that as well.

>      return ptr;


