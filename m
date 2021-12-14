Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AA4743D0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:47:28 +0100 (CET)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx89P-0003sr-Ll
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:47:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7rB-00065C-3J
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:28:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7r8-000303-6C
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yutm8Y14ADlXPmYt5UdXHuzag3KFaLf9vQ88AmPlfO0=;
 b=AS2AHM9Oe3Ld4mEoq7UnYPRhs08iyYDr9Q2QHTHL8tJ0bEXF34L3UgpTmFU+KfAzis0EQ/
 uFgqzd4TxYe/eOMfAFGjB2VRsAGCpI+V9XC/EWcwuQI1l37LAJZ9yahOQvKV7XSTedCdpM
 FYNkEP671RaLhzSoQpJDwp2ydO0+w3w=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-RCbs_rlfMfaWNBRDx2ViMA-1; Tue, 14 Dec 2021 08:28:31 -0500
X-MC-Unique: RCbs_rlfMfaWNBRDx2ViMA-1
Received: by mail-pg1-f200.google.com with SMTP id
 k11-20020a63d84b000000b003252e72da7eso10506076pgj.23
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yutm8Y14ADlXPmYt5UdXHuzag3KFaLf9vQ88AmPlfO0=;
 b=NP1vYlCjBXBJyECDn31o0NxUi8ri2zclrnlvwFPAeownJsVNqst8yIzoPRITvDLxu5
 wPXjVo9CHOv4sKL0czrOUhnGNIufoiOoJMo1r5KfJcOXKv33cqeQRF4pLK5RN9ZVH0lc
 jnPOpHp6rzW3U69HqOZ1HgI/ReKRu4lCRhTX8ggUZBEJ2wmUVGtq8Xemqw/QEsHAgly5
 0Z0ZkiGDvmcPOCjJds41/vvpsxQKR2l+sWXXmGZeoAYu7XeOLpiDMOxPHS52RaUHr8Qf
 5v43NJeB9RTXDz4XBqQ56ATQJLitGGdTjhQ26/gtxRBSjpTNwo7IL+2u37oJ44m1vA91
 oyuA==
X-Gm-Message-State: AOAM533OOLo3nmmfKCpjhgwMZHN8jifVDmqlRStmwPPNC9ekcMDPvste
 su2G8eRI6dnoRLhd970QtOwfpWwpnQ/LkujxykziLzN86Lr/2lGtrrDWS1q6Ce4h1mVNjTinW2x
 9ffq70BjY7Iy/GfAEgiiQb7eLw9wUhcw=
X-Received: by 2002:aa7:950f:0:b0:4a2:54da:3a73 with SMTP id
 b15-20020aa7950f000000b004a254da3a73mr4213567pfp.18.1639488510499; 
 Tue, 14 Dec 2021 05:28:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaLRYEfO1ZnZWZbiHvw1b5wAbyCnsC9oT7yrK/7FFldM67KIyh0Za+Mho6GOhDj2TvdXIq03hNCdak+PTgZHo=
X-Received: by 2002:aa7:950f:0:b0:4a2:54da:3a73 with SMTP id
 b15-20020aa7950f000000b004a254da3a73mr4213547pfp.18.1639488510220; Tue, 14
 Dec 2021 05:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-6-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-6-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:28:19 +0400
Message-ID: <CAMxuvawbuyseQbz2oUz_uT5UyX-ae1-03ZfmRs=LL1m6z83yCw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gqa-win: get_pci_info: Add g_autofree for few
 variables
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Dec 14, 2021 at 4:41 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 8588fa8633..3092566313 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -626,9 +626,9 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
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
>          DWORD size =3D 0;
>
> @@ -654,7 +654,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
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
> @@ -741,7 +740,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
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


