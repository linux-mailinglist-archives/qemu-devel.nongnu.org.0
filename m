Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DC39C817
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 14:20:55 +0200 (CEST)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpVIL-0005au-R4
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 08:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lpVHR-0004vz-Ta
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 08:19:57 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lpVHQ-0006bx-EU
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 08:19:57 -0400
Received: by mail-qt1-x831.google.com with SMTP id a15so9155639qta.0
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w8FRYKriO16FgneEOyc6xqsWBq+JeKRA3AXSdAbGyhU=;
 b=JN2zhEpYniExW9wgOKZdW/HGOd/eC95I2S1gtzGtleQP5E+XNIoNkq/Jyq6REqLjd+
 hkGFGeKer7hCF0J/UoEAPHZlE8fcvu3dTUH5s76njdDfB99Ake559N1uENdi3xpyQvGM
 iRqBPaDiLCAp+U/htP6Cl8o2ZdDlTF6i/uOZ5b7s9BvWtdQSQ5NyFPdsDDJ0zNgnTROb
 IpS4hz5TFFMQ0Rb8G8c4FbPU0T4IepjSqwJQBBMD7bPTD1v/+ayJE/dOPiC6gueXX8gz
 29rr0LiYivkfRJVXhEZmETzdT8Uwhvunq04AZwvVMq2eWCtrq/EOsKO8ijNf4AfLlB8s
 vOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w8FRYKriO16FgneEOyc6xqsWBq+JeKRA3AXSdAbGyhU=;
 b=GJ51b03DDhQ9YHpYWMEDRfH3FX27tupM/78WDH+nvmZI2dW6qdZaPcPKelm9Zr1wQV
 osQ+wV5/ZYJfw1k3ex9+XrbPs8sS7N6rdFO3qEj3fl0FH9lWufVAYrSF1KSzlA7tO1Sy
 BSrLH4yKrYuEkpgj5Qh7m3Ue0WmRki8SnD9uwSuMV9LfIh2m4ta05sPGeUsz19kfVcWf
 P3HhTgXx7t2qPJdGwG5wGxpnxiyvuZFRmYHMw3DqZ7pKXkPCeNQanjCAttxQ1ZoxO7vm
 s3vySr5w1dE/F7QQk+dtfyodWClShQLe5pKK3fT5Cvvh+LfIbAzOE8YAcc+RoBjmjlkF
 ecAA==
X-Gm-Message-State: AOAM533AAwjetKapOy1aWClnR0f7YX3H2o39SKUeBdkCeciVGC44anvV
 0jkxHJ24IWzQTB5a8DBSAG6NCWqPzuJAvXOVKx4=
X-Google-Smtp-Source: ABdhPJw8Fh6dOI875o+Ug4oKQiDkLek+feKh6PNx74867yrjDBSkUs4va/PLGWSDLnSKYM3jWYOV5pEMQB94IOjrPYo=
X-Received: by 2002:a05:622a:1d4:: with SMTP id
 t20mr8685701qtw.110.1622895595072; 
 Sat, 05 Jun 2021 05:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210604103714.1237414-1-kraxel@redhat.com>
In-Reply-To: <20210604103714.1237414-1-kraxel@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 5 Jun 2021 20:19:18 +0800
Message-ID: <CAKXe6SKNrTbN8bRwCE_C3TcEDtMdkuHyDQWLBw03xbKJzo-E2A@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-gpu: reorder free calls.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:37=E5=86=99=E9=81=93=EF=BC=9A
>
> Free in correct order to avoid use-after-free.
>
> Resolves: CID 1453812
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


Sorry, my fault.

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user=
-gpu/vhost-user-gpu.c
> index 6dc6a44f4e26..611360e6b475 100644
> --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> @@ -350,8 +350,8 @@ vg_resource_create_2d(VuGpu *g,
>      if (!res->image) {
>          g_critical("%s: resource creation failed %d %d %d",
>                     __func__, c2d.resource_id, c2d.width, c2d.height);
> -        g_free(res);
>          vugbm_buffer_destroy(&res->buffer);
> +        g_free(res);
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>          return;
>      }
> --
> 2.31.1
>
>

