Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDD310449
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 06:02:06 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7tFt-0003is-AB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 00:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1l7tDj-00032D-UP; Thu, 04 Feb 2021 23:59:51 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1l7tDi-0004T3-5F; Thu, 04 Feb 2021 23:59:51 -0500
Received: by mail-oi1-x233.google.com with SMTP id k204so4707225oih.3;
 Thu, 04 Feb 2021 20:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ps5ErN2IC4d3feM32CXbLkM9FMnanAcwmZcZxFMm3YU=;
 b=cpgubWnTWZWIaBbbPUFoSXJEORMjxXIFM3YhPxUD7vFaOEKUPWh2konbLG5Yuf+vh5
 xIWAPHpQqUi6hvHC/bAlr4rYMl1AHn9RVoQR3BdqnFbqDVzzM7a1CcqB0R8kOl3WD3Rh
 ph+cFbVVFSccx+t3J1Wtqke5XGq+W+ymGc2mo9S78henIVcejycrcFq/oSm4x3EZhafq
 KRxrGYiKzzdq3Yz4MrK3KyMSMn/NPW1jpJKGQE/y0LBAbIBRqR5XjefN3xqWWsWnkHWt
 axTarYCLmmy97zIO4goBpU+W4u3zFKCcCuXbSMcwgbiz3fU2wojAnrBIdD3YhSgUyFyx
 8tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ps5ErN2IC4d3feM32CXbLkM9FMnanAcwmZcZxFMm3YU=;
 b=BnGm2r6YNGE2Ncu3E0KrW+0XmtD55fjNqQjTiyLG1LXY4BiRCdwitNWA23ZOXY0QLF
 Mg/CUqqublNX2YvDm9npuIYul2Q+PYtr5sutJQoYDkg334Ugh1jLDUMBb+X2/h/OLm1M
 qwqLYDfRekwDgopL1em6RgD+y/XqRh4go/B0XBhqP7ByXL/lz80hZ3XgLvls6zitk602
 Wsy9xr3+3yeJXOUUS+Z9YTxZzN2EQBoR0XejJ2RmrXE/wAEHXHv1Mm7iYu00hmGwcERL
 SdDe3ZBn+CZQsBwnifdyAL7G6hoj5anuBcsT4MRCUP37ky7rjNrsBVXzsGpPjXmasZF5
 5PmA==
X-Gm-Message-State: AOAM531UdpE2edYlTpJimmUIXgmjN3X8g6LwW6mf7iOYMvwp6Ej85xlQ
 jl2wB+9E3Frvoa7419oYg9nTHqZOk/J5OYEthpw=
X-Google-Smtp-Source: ABdhPJyzz9jjCMIFSYlGQdPqWuzRnkg1HNxC9LW9XWYDCezFtgTZjBk0gI1QzVoRYnzkCWyOdbGXfvJ1mS38o4ZeeBQ=
X-Received: by 2002:a54:4706:: with SMTP id k6mr2010266oik.56.1612501188301;
 Thu, 04 Feb 2021 20:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20210204225041.1822673-1-philmd@redhat.com>
In-Reply-To: <20210204225041.1822673-1-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 5 Feb 2021 12:59:11 +0800
Message-ID: <CAKXe6SKTj0GwLzR7XTTvtgRhAA3mcXDw1NP_pkmmeeUvqq69DA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/scsi/scsi-disk: Fix out of bounds access in
 mode_sense_page()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-stable@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2021=E5=B9=B42=E6=
=9C=885=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=886:50=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Per the "SCSI Commands Reference Manual" (Rev. J) chapter 5.3
> "Mode parameters" and table 359 "Mode page codes and subpage
> codes", the last page code is 0x3f. When using it as array index,
> the array must have 0x40 elements. Replace the magic 0x3f value
> by its definition and increase the size of the mode_sense_valid[]
> to avoid an out of bound access (reproducer available in [Buglink]):
>
>   hw/scsi/scsi-disk.c:1104:10: runtime error: index 63 out of bounds for =
type 'const int [63]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/scsi/scsi-di=
sk.c:1104:10 in
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D1813911=3D=3DERROR: AddressSanitizer: global-buffer-overflow
>   READ of size 4 at 0x5624b84aff1c thread T0
>       #0 0x5624b63004b3 in mode_sense_page hw/scsi/scsi-disk.c:1104:10
>       #1 0x5624b630f798 in scsi_disk_check_mode_select hw/scsi/scsi-disk.=
c:1447:11
>       #2 0x5624b630efb8 in mode_select_pages hw/scsi/scsi-disk.c:1515:17
>       #3 0x5624b630988e in scsi_disk_emulate_mode_select hw/scsi/scsi-dis=
k.c:1570:13
>       #4 0x5624b62f08e7 in scsi_disk_emulate_write_data hw/scsi/scsi-disk=
.c:1861:9
>       #5 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #6 0x5624b62b2d4c in scsi_req_data hw/scsi/scsi-bus.c:1427:5
>       #7 0x5624b62f05f6 in scsi_disk_emulate_write_data hw/scsi/scsi-disk=
.c:1853:9
>       #8 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #9 0x5624b63e47ed in megasas_enqueue_req hw/scsi/megasas.c:1660:9
>       #10 0x5624b63b9cfa in megasas_handle_scsi hw/scsi/megasas.c:1735:5
>       #11 0x5624b63acf91 in megasas_handle_frame hw/scsi/megasas.c:1974:2=
4
>       #12 0x5624b63aa200 in megasas_mmio_write hw/scsi/megasas.c:2131:9
>       #13 0x5624b63ebed3 in megasas_port_write hw/scsi/megasas.c:2182:5
>       #14 0x5624b6f43568 in memory_region_write_accessor softmmu/memory.c=
:491:5
>
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914638
> Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> v2: Mention reproducer link
> ---
>  hw/scsi/scsi-disk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index ed52fcd49ff..93aec483e88 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1089,7 +1089,7 @@ static int scsi_emulate_mechanism_status(SCSIDiskSt=
ate *s, uint8_t *outbuf)
>  static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbu=
f,
>                             int page_control)
>  {
> -    static const int mode_sense_valid[0x3f] =3D {
> +    static const int mode_sense_valid[MODE_PAGE_ALLS + 1] =3D {
>          [MODE_PAGE_HD_GEOMETRY]            =3D (1 << TYPE_DISK),
>          [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] =3D (1 << TYPE_DISK),
>          [MODE_PAGE_CACHING]                =3D (1 << TYPE_DISK) | (1 << =
TYPE_ROM),
> --
> 2.26.2
>

