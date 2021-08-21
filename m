Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A13F3A14
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 12:03:23 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHNqU-00078C-A1
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 06:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHNos-0005xJ-PB
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:01:42 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHNop-0007aT-Jd
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:01:41 -0400
Received: by mail-yb1-xb35.google.com with SMTP id p4so23657103yba.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9LZNW0KZy+PppSJ6GyhFzHBTGIE3XXfz5BX5KzzxRWU=;
 b=dPfwsmPrEWmfVpipMQ8tRUAFTrqm3gMYqEEvM4othFfXma2f9dIs8XLbAS3vv0crvs
 orYV71dxF8YSMd2GWbt9zOdSirml/ZnbYQH9SMiIes1iazUMuSh9cvektgj2T7orGbxt
 CUSpe3xlWM6PIooqtJ4/LRV46cme+quN0HxVoZ4arWWxV9hIY7/2EgE0OnraIbRa+uZp
 aLo3sbbltnBR5GSSnqPbC5O2FfhcWsRTl4LQn+yGwPRR7KFTzewmeHx7HB8oJ1lWyR0J
 mW8Ns3mZdYCRUwKpn+lJzlmp5fh9doVI0fOkZGBMVH8xZUMvfEKAhCGcTEitz9396DmB
 0kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9LZNW0KZy+PppSJ6GyhFzHBTGIE3XXfz5BX5KzzxRWU=;
 b=L18htIJSLJOwF3p2VleXZzWz36yk0l/J4AByEMeoDVBWzs7fIwQibMi0J7OdJS0KTQ
 fjnQ53l+ymXEZ6yPI1fy0VkjSsNh4eDJ9fDD8W7+2Yl7BAo6IMEqocaAkD0P+jgdrpID
 v5RyT/yu4BD4dDrN27ip7Ajk0Pcmr9hfFZKb7PWpRxWibdBzVabKAGomv7wjCXmq0Ksd
 2THs1GCqEGKW56dqurU1Ojjh2W71W6mVyo3X7zZUBZkSrsbRPN2lflWZQL52XJJ7Phxg
 cUIeDH+98SUhEi5ENqMR02u47MJWAv9iVYV7v+G4CvvDbLkr2o0mtqkRiOa4pSFMVYoP
 KGQQ==
X-Gm-Message-State: AOAM532ij/bt0ba7zMTY1nwL8iUgt2in4e3ocuw/GExmQqp4lFh0FuyG
 Nbpe59m6QGDJaLWmf1fOH0KQfyn3TvYVCEDNzkc=
X-Google-Smtp-Source: ABdhPJyIXcjF+gXuIbm8/hH2dQwASIjEml/JcG7mABH7JsHd+Qyx4LdSLAR69EeYsyksIIR5fet2TR3oG2oLBF29P8I=
X-Received: by 2002:a5b:304:: with SMTP id j4mr30439638ybp.314.1629540098135; 
 Sat, 21 Aug 2021 03:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210820155211.3153137-1-philmd@redhat.com>
In-Reply-To: <20210820155211.3153137-1-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 21 Aug 2021 18:01:26 +0800
Message-ID: <CAEUhbmXP7=0j10Kf3w1DsPb-ByCTv+dSGbF=0ARQXd44soyv6A@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20, 2021 at 11:52 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> When Linux refuses to overcommit a seriously wild allocation we get:
>
>   $ qemu-system-i386 -m 40000000
>   qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate =
memory
>
> Slighly improve the error message, displaying the memory size

typo: Slightly

> requested (in case the user didn't expect unspecified memory size
> unit is in MiB):
>
>   $ qemu-system-i386 -m 40000000
>   qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram': Cann=
ot allocate memory
>
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 2e18947598e..2f300a9e79b 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block, Err=
or **errp)
>                                                    &new_block->mr->align,
>                                                    shared, noreserve);
>              if (!new_block->host) {
> +                g_autofree char *size_s =3D size_to_str(new_block->max_l=
ength);

Does g_autofree work with every compiler we support?

Looks it only applies to GCC and clang?
https://www.gitmemory.com/issue/linuxwacom/libwacom/142/518787578

>                  error_setg_errno(errp, errno,
> -                                 "cannot set up guest memory '%s'",
> +                                 "Cannot set up %s of guest memory '%s'"=
,
> +                                 size_s,

Nice improvement!

>                                   memory_region_name(new_block->mr));
>                  qemu_mutex_unlock_ramlist();
>                  return;

Tested-by: Bin Meng <bmeng.cn@gmail.com>

