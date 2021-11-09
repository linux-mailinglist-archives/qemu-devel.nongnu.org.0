Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B044A7AC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:40:18 +0100 (CET)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLjt-0002e1-MR
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:40:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLW5-0002Nw-Qx
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLVv-0006sQ-Bj
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636442749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wc8YSvWKejoB+4eiI7TxQzjT6oH9Ijl6efdaxvB1haA=;
 b=g2nHnZvt4p2CA4U/OupENgNTnpdFCdQsphYyNRaoiYy4H5zLHJLqu6KgVoXwp9z/Jc2gYe
 wMlBkaimoqqJEDAOHnHHmBdpzCJvxvFAhKMi8zUBZFDhCyTU5hnH1+4tKjpwWcwfwNqBnZ
 JzFcDWB2U2E+guZuzI88rcxYNT0ZWe0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-zwuggOxuPRS4wwqc089bmg-1; Tue, 09 Nov 2021 02:25:48 -0500
X-MC-Unique: zwuggOxuPRS4wwqc089bmg-1
Received: by mail-pl1-f198.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so8190637pls.11
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wc8YSvWKejoB+4eiI7TxQzjT6oH9Ijl6efdaxvB1haA=;
 b=qWhQgr0XhORzu011kBSpZ7okTdJ6sJjSo4X4D7tAPPYkz9iGk04uo6+Xyxi1aynym2
 m8cFuzmDziwQGCS3uAlEn8WD46KLYHrD1DfCW/pqFPfUxr+wHwrbjJxHOBkx0xCSnwlo
 yeL0YH/MicAj0AE1Y9BbJCSE+FhC49818T8RB6evGIoleYXbJ5SrHEGWaRGyMTJ+cZ6W
 0aHgcyiARTz2XLhdNmTzVbFw2JieKpF3QwKczPeRapdssdUnJrznU6qkWkyXDnEMrKo4
 eXPxIUsWNhkwoyEeGrz1KEr2ruLeazAEvNlq7aGew3U8mdGNxzRk14Vb8x6rR6ELpZne
 r9+g==
X-Gm-Message-State: AOAM531hzmwvlS7Y9RoCxBFJ0YJ6RFhfuVwh2G/+HThh7SzMDseuTTml
 IzKrz/p/oOK6GkQV17VYYXb3lv3SJYT1WamqTZJc+g4ajzTK2fxe61LKreXgFCxKJLiKP8sfy0m
 t2egjF33lE8wZKXG0l61LUQP9nqmKafg=
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr5304010pll.21.1636442747134; 
 Mon, 08 Nov 2021 23:25:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu5t68JdtqX02hdU2UNWRnvw9Z1OZpNG4P4y7RbSomo65kJnHecrr0YoG/ZkpHxSn6yi5z30njEev1IzhaAcQ=
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr5303984pll.21.1636442746821; Mon, 08 Nov
 2021 23:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 Nov 2021 11:25:35 +0400
Message-ID: <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 4:37 AM Stefan Berger <stefanb@linux.vnet.ibm.com> w=
rote:
>
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: #708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(on my host, for some reason the UID is 1, does this matter?)

> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..09456424aa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachine=
State *vms)
>
>      Aml *dev =3D aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")))=
;
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>
>      Aml *crs =3D aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..d6d3541407 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev =3D aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")=
));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device"=
)));
> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>                  } else {
>                      dev =3D aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
> --
> 2.31.1
>


