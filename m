Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0405E6FC103
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:55:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIB7-0005CW-69; Tue, 09 May 2023 03:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pwIB4-0005Bk-Rk
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pwIB2-0006nY-Dl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683618867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWVkETvqxui2L6JEGelYr7ZQK6Q0j4GyfaZIGcMpQ1Y=;
 b=f8LqaWxJ2cN6ftH7uHrNZxfZLehjCOYeDDaEeuWWQkf4CZWrT3y3s2r+VmpaLWjUcMTMS3
 vF3OQGyyUEpGxpw/p5x1S954KGg8LU/jJjDvvcy3561R8YVlGpR+gtj31llo54GWCC0uvx
 09HYT2iqYySYcoebNmjMQe9o6lfrrdY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-2dpbk-23PjiwIslf7u0-hA-1; Tue, 09 May 2023 03:54:19 -0400
X-MC-Unique: 2dpbk-23PjiwIslf7u0-hA-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-77d4add38e0so1348630241.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 00:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683618858; x=1686210858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWVkETvqxui2L6JEGelYr7ZQK6Q0j4GyfaZIGcMpQ1Y=;
 b=dlTAskAZwNXQU6RrZ6lgll3eVN1tuvcHRilzGnyoaMM7BP3bnmaOej8XL4W7fJZjDl
 /rVELLoCvDBsWQGTe9ypUX6PoeY9kAFoA8Lo0RXWYx+qqRYzKqghbqoV806tYlyIie+X
 UkAKykqE/NV7JAS1bC1kwRXhK9JC0h3cfxGKKhHX+eAkBVQ2mdoSiVJTh83KNyDL4WfE
 MEIs+mAxWPJC+ojoUdrQQVeuvoPg7j+eBUpfOItTWFZsYAyN9GEwsTwkdW9dfWWL72UY
 3Az+6Qon7l6IzSx3+jvOwkKp1qEGqz5+ZMrXdIsyw3NVhpCicmEuLpBsW8Ycomooka5M
 559A==
X-Gm-Message-State: AC+VfDzypvxU9v6iDN85cXd8/M0uQrnUP2ebkFJYLTsDWinwCLjfzkHV
 jJgMgbCShRlsLhnZ4slolzDk5bVG2qj4ozzsW5r92z848wws19m64auv3MFg38TTZcqdQz/BXhB
 L+P1s11Y1S9uqLKlvv5N4yMcP8Hcgq5w=
X-Received: by 2002:a67:ec47:0:b0:42e:65a6:d445 with SMTP id
 z7-20020a67ec47000000b0042e65a6d445mr4138971vso.5.1683618858559; 
 Tue, 09 May 2023 00:54:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VrrrZ4RZm2d49L9E7A7I/GWfBE+eApgwPqLiv0FZyg9inUoKtGdKlxUB78Ad7AJLJ21PysKzSuLIW87KIa9o=
X-Received: by 2002:a67:ec47:0:b0:42e:65a6:d445 with SMTP id
 z7-20020a67ec47000000b0042e65a6d445mr4138966vso.5.1683618858349; Tue, 09 May
 2023 00:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230508150146.1092355-1-mcascell@redhat.com>
 <f443c6c7ec2d4d2e88afeb586d5653ed@huawei.com>
 <8b7e9ad5-b4f3-8b24-c4a6-5ae6c4fcb27b@bytedance.com>
In-Reply-To: <8b7e9ad5-b4f3-8b24-c4a6-5ae6c4fcb27b@bytedance.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 9 May 2023 09:54:07 +0200
Message-ID: <CAA8xKjXnX26cfK+yyiCGinHRP0PhPWQ_S8r+VA3axXMpa1bgDQ@mail.gmail.com>
Subject: Re: RE: [PATCH] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "taoym@zju.edu.cn" <taoym@zju.edu.cn>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 9, 2023 at 3:47=E2=80=AFAM zhenwei pi <pizhenwei@bytedance.com>=
 wrote:
>
>
>
> On 5/9/23 09:02, Gonglei (Arei) wrote:
> >
> >
> >> -----Original Message-----
> >> From: Mauro Matteo Cascella [mailto:mcascell@redhat.com]
> >> Sent: Monday, May 8, 2023 11:02 PM
> >> To: qemu-devel@nongnu.org
> >> Cc: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>;
> >> pizhenwei@bytedance.com; taoym@zju.edu.cn; mcascell@redhat.com
> >> Subject: [PATCH] virtio-crypto: fix NULL pointer dereference in
> >> virtio_crypto_free_request
> >>
> >> Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM
> >> algtype.
> >>
> >> Fixes: 02ed3e7c ("virtio-crypto: zeroize the key material before free"=
)
> >
> > I have to say the fixes is incorrect. The bug was introduced by commit =
0e660a6f90a, which
> > changed the semantic meaning of request-> flag.
> >
> > Regards,
> > -Gonglei
> >
>
> Hi Mauro
>
> Agree with Lei, could you please change the Fixes as Lei suggested?

Sent v2.

Thanks!

> --
> zhenwei pi
>

--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


