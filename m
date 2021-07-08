Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BF63BF885
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:42:57 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RUf-0001DJ-0D
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1m1RTW-0000P1-VT; Thu, 08 Jul 2021 06:41:47 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1m1RTV-0003NE-Ej; Thu, 08 Jul 2021 06:41:46 -0400
Received: by mail-io1-xd33.google.com with SMTP id k11so7607591ioa.5;
 Thu, 08 Jul 2021 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gN12DhfP0LCx/yR3YccZjgmPJNZWBEkMj3+yQtFSX0w=;
 b=eSJseK/f6GXVxvn1xUMotKtSnS9S9C8CodV0Ja2qq+bj69o2ZqV+suWjnUFfw5WDeJ
 ohEA0XaAD7fASq6mRnFKXAIlsdv2lHvWYCUs8Z7SRnf9IFC+BJnaQ2ZnbQAEeI0Hf9OZ
 3atcenboW3h8hZsKgXLOGTUr9xeUJZLPrcA2G1i9FtoB1zpinvHdurQnK0EPyw3IRsHL
 rXpMuO30LQCc/Hzo26RDE5Ahr5sEEh76df4uhGApxzfNBeC9g4HzpaP4yhiHgXkIUaCF
 SgqbVVI9Psv88tshjmBsrWM9BN66GH6DEi4OI6rqk5Ogljpd8ZpOPlSJ3CF6OXPmX5za
 YmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gN12DhfP0LCx/yR3YccZjgmPJNZWBEkMj3+yQtFSX0w=;
 b=qvQihQU2Lyb+sG/7FhgtQLXIngDhqqbfk/Uvevu2Oq3P2aSdOn9J2SWEC886Fbuifg
 2gn/xJpoBo3B4HtLDVDpwBPeyW+URr9UcdnbvXJRSU0gXm73oZac/RdqdcUNH/r4Y15B
 X+cjsgvRUGDN+Q/oVim9hSChqAQM/1Unv2vG4G0DsR3rKtNsDfiaYqG7z3NTZZbrvf4b
 B3J1JgZqmmevY7WlcebsAn5t+6O3n4/UiuANdet4WtUTm3wRimfRr2aJ1UDzsV5gBT13
 6ZDadhKDfOspw7RbttJ/7ADiEuUI6+k1I6Gx23ZEKiHwuknDFm5iiHEisutIz/sBSZuU
 7sOg==
X-Gm-Message-State: AOAM530FQvbfxpS3NqxUqjSGJwruT1tcc5if4ApV5ug60r7me99Y3vrd
 g+naGnjMEYmUvhh2fsiAhIwwIkPY23kQKHgoz6Q=
X-Google-Smtp-Source: ABdhPJw2t0364ks6aB88uoZomhO/lNil8NWpGtS6aCSwkKes3a986l6ikN5UyiZ5ZdvvLbIHhkD2XM7t7/1HrlG7g0Y=
X-Received: by 2002:a02:a14d:: with SMTP id m13mr26493948jah.51.1625740901346; 
 Thu, 08 Jul 2021 03:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210707180449.32665-1-pl@kamp.de>
In-Reply-To: <20210707180449.32665-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 8 Jul 2021 12:41:14 +0200
Message-ID: <CAOi1vP-ybEw0SW6wQC-1WJ2em_t9Gm6yN+jx-rw2jnEWMDk=JA@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: fix type of task->complete
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 7, 2021 at 8:05 PM Peter Lieven <pl@kamp.de> wrote:
>
> task->complete is a bool not an integer.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 01a7b94d62..dcf82b15b8 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1066,7 +1066,7 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>  static void qemu_rbd_finish_bh(void *opaque)
>  {
>      RBDTask *task = opaque;
> -    task->complete = 1;
> +    task->complete = true;
>      aio_co_wake(task->co);
>  }
>
> --
> 2.17.1
>
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

