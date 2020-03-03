Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9D176D86
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:19:59 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8y6A-0007EN-Nd
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1j8y5P-0006iw-Ph
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:19:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1j8y5O-0001QU-83
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:19:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3257 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>) id 1j8y5N-0001PJ-TW
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:19:10 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5AEF32D1D942B21D584E;
 Tue,  3 Mar 2020 11:19:04 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Tue, 3 Mar 2020 11:18:57 +0800
Subject: Re: [PATCH v3] hw/smbios: add options for type 4 max-speed and
 current-speed
To: <qemu-devel@nongnu.org>
References: <20200303010158.52994-1-guoheyi@huawei.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <997b0093-6820-0c27-0d73-55afb97019f1@huawei.com>
Date: Tue, 3 Mar 2020 11:18:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200303010158.52994-1-guoheyi@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.173.221.228]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One comment from myself after going through the code...

On 2020/3/3 9:01, Heyi Guo wrote:
> Common VM users sometimes care about CPU speed, so we add two new
> options to allow VM vendors to present CPU speed to their users.
> Normally these information can be fetched from host smbios.
>
> Strictly speaking, the "max speed" and "current speed" in type 4
> are not really for the max speed and current speed of processor, for
> "max speed" identifies a capability of the system, and "current speed"
> identifies the processor's speed at boot (see smbios spec), but some
> applications do not tell the differences.
>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> v2 -> v3:
> - Refine comments per Igor's suggestion.
>
> v1 -> v2:
> - change "_" in option names to "-"
> - check if option value is too large to fit in SMBIOS type 4 speed
> fields.
> ---
>   hw/smbios/smbios.c | 29 ++++++++++++++++++++++++++---
>   qemu-options.hx    |  3 ++-
>   2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index ffd98727ee..4c5992241c 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -94,6 +94,8 @@ static struct {
>  =20
>   static struct {
>       const char *sock_pfx, *manufacturer, *version, *serial, *asset, *=
part;
> +    uint32_t max_speed;
> +    uint32_t current_speed;

How about defining these two fields as uint16_t, just like "speed" in=20
type17? Then we can also drop the range check against UIN16_MAX.

Please advise.

Thanks,

Heyi


>   } type4;
>  =20
>   static struct {
> @@ -272,6 +274,14 @@ static const QemuOptDesc qemu_smbios_type4_opts[] =
=3D {
>           .name =3D "version",
>           .type =3D QEMU_OPT_STRING,
>           .help =3D "version number",
> +    },{
> +        .name =3D "max-speed",
> +        .type =3D QEMU_OPT_NUMBER,
> +        .help =3D "max speed in MHz",
> +    },{
> +        .name =3D "current-speed",
> +        .type =3D QEMU_OPT_NUMBER,
> +        .help =3D "speed at system boot in MHz",
>       },{
>           .name =3D "serial",
>           .type =3D QEMU_OPT_STRING,
> @@ -586,9 +596,8 @@ static void smbios_build_type_4_table(MachineState =
*ms, unsigned instance)
>       SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
>       t->voltage =3D 0;
>       t->external_clock =3D cpu_to_le16(0); /* Unknown */
> -    /* SVVP requires max_speed and current_speed to not be unknown. */
> -    t->max_speed =3D cpu_to_le16(2000); /* 2000 MHz */
> -    t->current_speed =3D cpu_to_le16(2000); /* 2000 MHz */
> +    t->max_speed =3D cpu_to_le16(type4.max_speed);
> +    t->current_speed =3D cpu_to_le16(type4.current_speed);
>       t->status =3D 0x41; /* Socket populated, CPU enabled */
>       t->processor_upgrade =3D 0x01; /* Other */
>       t->l1_cache_handle =3D cpu_to_le16(0xFFFF); /* N/A */
> @@ -1129,6 +1138,20 @@ void smbios_entry_add(QemuOpts *opts, Error **er=
rp)
>               save_opt(&type4.serial, opts, "serial");
>               save_opt(&type4.asset, opts, "asset");
>               save_opt(&type4.part, opts, "part");
> +            /*
> +             * SVVP requires max_speed and current_speed to be set and=
 not being
> +             * 0 which counts as unknown (SMBIOS 3.1.0/Table 21). Set =
the
> +             * default value to 2000MHz as we did before.
> +             */
> +            type4.max_speed =3D qemu_opt_get_number(opts, "max-speed",=
 2000);
> +            type4.current_speed =3D qemu_opt_get_number(opts, "current=
-speed",
> +                                                      2000);
> +            if (type4.max_speed > UINT16_MAX ||
> +                type4.current_speed > UINT16_MAX) {
> +                error_setg(errp, "SMBIOS CPU speed is too large (> %d)=
",
> +                           UINT16_MAX);
> +            }
> +
>               return;
>           case 11:
>               qemu_opts_validate(opts, qemu_smbios_type11_opts, &err);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ac315c1ac4..7a2f7c1f66 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2233,6 +2233,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>       "                specify SMBIOS type 3 fields\n"
>       "-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3D=
str][,serial=3Dstr]\n"
>       "              [,asset=3Dstr][,part=3Dstr]\n"
> +    "              [,max-speed=3D%d][,current-speed=3D%d]\n"
>       "                specify SMBIOS type 4 fields\n"
>       "-smbios type=3D17[,loc_pfx=3Dstr][,bank=3Dstr][,manufacturer=3Ds=
tr][,serial=3Dstr]\n"
>       "               [,asset=3Dstr][,part=3Dstr][,speed=3D%d]\n"
> @@ -2255,7 +2256,7 @@ Specify SMBIOS type 2 fields
>   @item -smbios type=3D3[,manufacturer=3D@var{str}][,version=3D@var{str=
}][,serial=3D@var{str}][,asset=3D@var{str}][,sku=3D@var{str}]
>   Specify SMBIOS type 3 fields
>  =20
> -@item -smbios type=3D4[,sock_pfx=3D@var{str}][,manufacturer=3D@var{str=
}][,version=3D@var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D=
@var{str}]
> +@item -smbios type=3D4[,sock_pfx=3D@var{str}][,manufacturer=3D@var{str=
}][,version=3D@var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D=
@var{str}][,max-speed=3D@var{%d}][,current-speed=3D@var{%d}]
>   Specify SMBIOS type 4 fields
>  =20
>   @item -smbios type=3D17[,loc_pfx=3D@var{str}][,bank=3D@var{str}][,man=
ufacturer=3D@var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D@=
var{str}][,speed=3D@var{%d}]


