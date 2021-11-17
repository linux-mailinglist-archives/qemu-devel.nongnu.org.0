Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23445498E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:05:00 +0100 (CET)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMUd-00063l-T1
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mnMHY-00084k-LW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mnMHW-0001KQ-SB
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637160686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjRJ6lldJemyZgZOtiYGs3pK+XjAHeyoYXvEdaIeYgQ=;
 b=ZnTt9VrNSvA6zN13s+ijGmGoJMN+i28tcEChzacln2vkQAwVuIC3DUmw+evZmUbs2BRrEF
 gusaTSefvFtLmLR70sYAfoLRUsB1jT3XTmC51T0LPk9u4YkQ/GZr94e9Ab7kvRSIbf8urV
 i5FSy1k3/JFYwOTBeSpz9KSK8mosX8Y=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-sBb6-mX2OoyCzyOXtTeumA-1; Wed, 17 Nov 2021 09:51:24 -0500
X-MC-Unique: sBb6-mX2OoyCzyOXtTeumA-1
Received: by mail-pj1-f71.google.com with SMTP id
 p8-20020a17090a748800b001a6cceee8afso1187819pjk.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 06:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gjRJ6lldJemyZgZOtiYGs3pK+XjAHeyoYXvEdaIeYgQ=;
 b=QLx3hcgWmlbpj6XtdLJWa1NZsqsukFd44yA+CriPrNAFDIk9Ue727HYktn7Ef0MF4C
 dLOdZDHbnEvjIy3F0cv99S/ygARw1KBITg9158AXRGnhPyh9Swy/gs63nXDenMCLKGKF
 IQB7MsHJp8Fh1WTwJja7ghB9KmZPAWsGP0RuSE3A2XTlz4egVoPR4Dkhow37hLVeRp9e
 SFwti0FRPzDEZ128onOebCWYIq7r8nIihc4WW/O5eFE2gNMprPwStpwvOWzXlY8anOg/
 odzBrSl9Q1AaQKZl+b1Qh9ouPu2lKEDIlyUuFJLAvrhRZZfvY4MIq5HsPToCtSTVJ6Q8
 M94w==
X-Gm-Message-State: AOAM530cfZdDYP2uOTzn/Ohceeu6p7cOIexYfAMh+ut+NllayV2e5P71
 Sxw6RgNEl43XJwFpG7z1oaYW4hdZ35UHnHq4/crMiccfVswtnPsDz+a9giuEnVT+SSOdsV+msGj
 uO/wbatdazhOtFeQDuUcvzFSh6zjWNHQ=
X-Received: by 2002:aa7:83cd:0:b0:480:9e79:fae5 with SMTP id
 j13-20020aa783cd000000b004809e79fae5mr7560573pfn.42.1637160683772; 
 Wed, 17 Nov 2021 06:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlm14Rs+ebQYDnqEeaQOy0iAKsq68yAMjGAqHtLE0H60hVmkjFcvAo58VoBK+m7JfshUvWgnL/Ztpm7xDYSP4=
X-Received: by 2002:aa7:83cd:0:b0:480:9e79:fae5 with SMTP id
 j13-20020aa783cd000000b004809e79fae5mr7560547pfn.42.1637160683526; Wed, 17
 Nov 2021 06:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
In-Reply-To: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 17 Nov 2021 18:51:11 +0400
Message-ID: <CAMxuvaxp0x805rOPA8YsQfGEPHBz=pTVvwiHot5UGVwdbEOKFw@mail.gmail.com>
Subject: Re: [PATCH v1] chardev/wctable: don't free the instance in
 wctablet_chr_finalize
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 yc-core@yandex-team.ru, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Nov 17, 2021 at 6:25 PM Daniil Tatianin
<d-tatianin@yandex-team.ru> wrote:
>
> Object is supposed to be freed by invoking obj->free, and not
> obj->instance_finalize. This would lead to use-after-free followed by
> double free in object_unref/object_finalize.
>
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Fixes: 378af96155d62 ("Add wctablet device")

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/wctablet.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index e9cb7ca710..fa3c9be04e 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -318,7 +318,6 @@ static void wctablet_chr_finalize(Object *obj)
>      TabletChardev *tablet =3D WCTABLET_CHARDEV(obj);
>
>      qemu_input_handler_unregister(tablet->hs);
> -    g_free(tablet);
>  }
>
>  static void wctablet_chr_open(Chardev *chr,
> --
> 2.25.1
>


