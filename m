Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D30473528
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:44:13 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrF6-0000ky-E7
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrBm-0006C5-SD
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrBk-0000Ly-SC
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639424443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQ6WbwZusKjbdH9ZT0k1HdKCEN/KspLOaEfLVWPMP9A=;
 b=Zq/afEpG4h9SbeZ6s0xLwyJForsaIcGf8RA3L2AtCMItmdPgtBG3blbJ16iOM/G0wVrEEk
 z8m6fAA4ZoaThS/k3UN8jM/kfICa7xskymUrMGArCCx0CNO+DWG+EQmpEci7mxRLZsrUN3
 0dgCrqOPqFWpxt9Uc6tgIu/yB6z+O0o=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-zlmqmFuPN3ySadFGhWhsjQ-1; Mon, 13 Dec 2021 14:40:42 -0500
X-MC-Unique: zlmqmFuPN3ySadFGhWhsjQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 gf15-20020a17090ac7cf00b001a9a31687d0so9285540pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 11:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DQ6WbwZusKjbdH9ZT0k1HdKCEN/KspLOaEfLVWPMP9A=;
 b=VIR/67q5rVhPqm7sQ5dhO7MaDIdgGPNtD1Vp0GbOFUuxggykH4Rfppt6nrdbegsubd
 4FdXg3klYrsxvRIbzMrJXCmGsWPhhYQk0oRlubRf9Ru/6Hpm5btk72CcszZW/cHiq3+r
 7KfBe5EidVCGznCx1Vq2Phs2spMo8XdsipK5N8SfMPD7DGKsVl89dHh/iVAPrbAOZ864
 DRYyxkvPczvlS56Conhvtt9Nt1tEVKtYf6cxABQLJ5QyPYhT16veOi2fYoRxSAKgQCsp
 9OzwqS5RcYo42KAp1fFGHxf5ioQVdjUXwU9fByMMxmyqxnQLVNm+if5PKvd++sFT2rnW
 bQjQ==
X-Gm-Message-State: AOAM530AeOkeJWnzHliX8rShe7P2cSVr6OAooruGDKIGkSLNUxbSkuqi
 J/wvUFv0LJzlv25RMbvlzzotmzKtvfL0INQ/01migd+pYj8AXtRNiQGOiU8j6RgSLpiw0SNOTxK
 DGeZLVAQPvo8EZFDN2+LUSdojLfs/Lyc=
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr404936pjb.36.1639424441028; 
 Mon, 13 Dec 2021 11:40:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA7Vi7Kotpf9WjM+QkNwqVVKuq+/5AcAeGFoSkRxSA2lKhVQXIFeY0hrPzFnVvJv8pUi5ji5nO+NB3UjeILoM=
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr404910pjb.36.1639424440825; 
 Mon, 13 Dec 2021 11:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20211213111554.62394-1-konstantin@daynix.com>
 <20211213111554.62394-4-konstantin@daynix.com>
In-Reply-To: <20211213111554.62394-4-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Dec 2021 23:40:29 +0400
Message-ID: <CAMxuvaxFNq3bfew1gqoxRB5eWvqK9yUqCBZPU9MfeBCVvuRreg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gqa-win: get_pci_info: Free parent_dev_info properly
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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

On Mon, Dec 13, 2021 at 3:16 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> In case when the function fails to get parent device data,
> the parent_dev_info variable will be initialized, but not freed.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/commands-win32.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 12f7a88078..cef14a8762 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -515,6 +515,8 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
>  static GuestPCIAddress *get_pci_info(int number, Error **errp)
>  {
>      HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
> +    HDEVINFO parent_dev_info =3D INVALID_HANDLE_VALUE;
> +
>      SP_DEVINFO_DATA dev_info_data;
>      SP_DEVICE_INTERFACE_DATA dev_iface_data;
>      HANDLE dev_file;
> @@ -542,7 +544,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data =3D NULL=
;
>          STORAGE_DEVICE_NUMBER sdn;
>          char *parent_dev_id =3D NULL;
> -        HDEVINFO parent_dev_info;
>          SP_DEVINFO_DATA parent_dev_info_data;
>          DWORD j;
>          DWORD size =3D 0;
> @@ -744,11 +745,13 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>                  break;
>              }
>          }
> -        SetupDiDestroyDeviceInfoList(parent_dev_info);
>          break;
>      }
>
>  cleanup:
> +    if (parent_dev_info !=3D INVALID_HANDLE_VALUE) {
> +        SetupDiDestroyDeviceInfoList(parent_dev_info);
> +    }
>      if (dev_info !=3D INVALID_HANDLE_VALUE) {
>          SetupDiDestroyDeviceInfoList(dev_info);
>      }
> --
> 2.25.1
>


