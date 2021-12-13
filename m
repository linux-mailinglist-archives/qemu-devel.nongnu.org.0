Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A342473545
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:52:09 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrMm-0005BO-Ej
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrL9-0004M2-EM
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:50:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrL3-0001zc-LP
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639425020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejQ1mhLsjEhHV+ubUTmkqy0BY6mtDq18a1eNe5x1gm8=;
 b=ObUftmbNxd+quVcIYpmx9ueeW1MLvPoQRp6TZIdsXEk/cEthZ9z0/EGL78/KL9lgAhmuR9
 GOugU33W1ouvTL0K4JeUXOKAOrJ39WTsub16tRc8syKU0Figbt+Y3GfGI4dOdgvlTuR89x
 m7tnPgmiwOZAJzx+K2EPXwP7bC2Pgqs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-OUDqUOzpOmCKKdBVuhZuHQ-1; Mon, 13 Dec 2021 14:50:19 -0500
X-MC-Unique: OUDqUOzpOmCKKdBVuhZuHQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 c131-20020a621c89000000b004a343484969so10695964pfc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 11:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ejQ1mhLsjEhHV+ubUTmkqy0BY6mtDq18a1eNe5x1gm8=;
 b=bfgLJ9Vb16nxb5Dve157SuUGsM5CRdmkB8dzOi9Z4oPnemRSizrCxy0zNK+KO9Xiy6
 DPn2VNktgNBzgKBG+t9kYdeA7SUmj+zq56RngXuT1VXlR3oqzAkNP2qr8DtNyAX9Fxst
 vDSJe9r6xV8ifUuPL8L3o4AAQ9GMbjFkTUPKbWSLUjWUiPJClE3X1YCmwYLvqF+Up4Lk
 1xtAuyilbobtl5leAmu/jeMiw0tfvSZ4wmr3QFriZHUvWxKE7nmqQHV6DNHm0HRqkcLf
 lNe0Q/Ubdwdg2IKqSp/ySWKuIcPaWUJYBnjxK+ncy7M8YTh6xiwayPMNFpnA7Qqm53t0
 fTyw==
X-Gm-Message-State: AOAM533NO/FlKuiX9GojEYFrbXWfBmrE70HiTdQNWXF4VhvrABVObubN
 rGAhtJgq1D3uCYUO8gfbfexY+StVAMWjRAyOY1DKUQcNam9p8pPsrZHPyWOuZo+wD56kTPPspAE
 qxf2D61Zybc83mhB/NZndVKrR//fwQBY=
X-Received: by 2002:aa7:8891:0:b0:4a5:58ad:e2e6 with SMTP id
 z17-20020aa78891000000b004a558ade2e6mr325747pfe.42.1639425018099; 
 Mon, 13 Dec 2021 11:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyECdOhDUcDvNnb1BWUgrKT0w/fvXgzJEdOZfxuKTm0PeT2L72Lzgdisp9bHSyp2BJlHe+VopnslVRmDChiZs=
X-Received: by 2002:aa7:8891:0:b0:4a5:58ad:e2e6 with SMTP id
 z17-20020aa78891000000b004a558ade2e6mr325724pfe.42.1639425017809; Mon, 13 Dec
 2021 11:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20211213111554.62394-1-konstantin@daynix.com>
 <20211213111554.62394-6-konstantin@daynix.com>
In-Reply-To: <20211213111554.62394-6-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Dec 2021 23:50:07 +0400
Message-ID: <CAMxuvay_=-q8qWsjsh8ED1AbL9w6C7mTQ-5d6eO2Ju2U50jbCg@mail.gmail.com>
Subject: Re: [PATCH 5/5] gqa-win: get_pci_info: Add g_autofree for few
 variables
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 3:16 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(250loc.. the function would deserve to be refactored to not be so long..)

> ---
>  qga/commands-win32.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 6bde5260e8..96737f33e1 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -541,9 +541,9 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>      dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
>      dev_iface_data.cbSize =3D sizeof(SP_DEVICE_INTERFACE_DATA);
>      for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i+=
+) {
> -        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data =3D NULL=
;
> +        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_da=
ta =3D NULL;
>          STORAGE_DEVICE_NUMBER sdn;
> -        char *parent_dev_id =3D NULL;
> +        g_autofree char *parent_dev_id =3D NULL;
>          SP_DEVINFO_DATA parent_dev_info_data;
>          DWORD j;
>          DWORD size =3D 0;
> @@ -580,7 +580,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>              dev_file =3D CreateFile(pdev_iface_detail_data->DevicePath, =
0,
>                                    FILE_SHARE_READ, NULL, OPEN_EXISTING, =
0,
>                                    NULL);
> -            g_free(pdev_iface_detail_data);
>
>              if (!DeviceIoControl(dev_file, IOCTL_STORAGE_GET_DEVICE_NUMB=
ER,
>                                   NULL, 0, &sdn, sizeof(sdn), &size, NULL=
)) {
> @@ -675,7 +674,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          parent_dev_info =3D
>              SetupDiGetClassDevs(&GUID_DEVINTERFACE_STORAGEPORT, parent_d=
ev_id,
>                                  NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERF=
ACE);
> -        g_free(parent_dev_id);
>
>          if (parent_dev_info =3D=3D INVALID_HANDLE_VALUE) {
>              error_setg_win32(errp, GetLastError(),
> --
> 2.25.1
>


