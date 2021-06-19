Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3203ADB8E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 21:59:08 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luh7T-0005r7-5H
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 15:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luh6J-00052B-SC; Sat, 19 Jun 2021 15:57:55 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luh6I-00010s-Bz; Sat, 19 Jun 2021 15:57:55 -0400
Received: by mail-io1-xd2a.google.com with SMTP id s19so4448640ioc.3;
 Sat, 19 Jun 2021 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3/jjb4F1LaMx82s9RlzjY49KcNpbM4CdJUAfohmWFg=;
 b=YzqlvA7ZAfSSQHwg1Q0vy/zEf9M7wwsa5V0SCqtOTEQC31pE1ad6Kp5wpwrMdgtZFr
 f1Y9tJy004OQMf8q52L1F35cWngiUgOR7w21DseDIRLeW1FNlVX0ak4xP1kz4hNMcrnj
 eDaNsB7RrCCBVDf5i0NQ0DSzlhI/Xs2hh8OfUcJnsvP38xvfu/vk7+310Qu6J+06rqwa
 zgqixMAGbiw8+Akcu501X2IauTT+atOJakHYEfW1v5vlsKMjOPNgFf6BB2uBwO4mLqnC
 QdEWJ5MrNzwTJjZJcgevv3Ar074VOKRRWM6yeK8K4LC9TJSvV4Qed6Tz88/sRNhp/l3J
 kwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3/jjb4F1LaMx82s9RlzjY49KcNpbM4CdJUAfohmWFg=;
 b=HsPwJArs5m/IjMKZG2xWuAz1irW3u3/pjcsdVOcZdbL2lLMg2powOYXeZVgLRr7nvj
 0zixKpKbsm5jBj+Dkrt0YMrJMGYxfZ3jLHH7xkXa4odtaRCDeE2lr7S637OavFrWDvvQ
 Ogbd7Djg7TdUlRS18d3bvKChQt3m6Qr4PnLrMm4MFhxU47inHSyx8iLH+KBgffe/m8Oc
 BmjX3pp7cngyRerxkybE9JM1mRJzkf56BJv8gdwzNpUFdgtyS44me8ftq5MmJilPb0Rl
 pA823hagcM0LnS8+NOA2KfsPzGPp8RIinF198HBm8mFi5jLN9gPdlCL67TzgYnWMDeZM
 rY1Q==
X-Gm-Message-State: AOAM531LIDb8U0h9rnm4qLQEzvXItHqtpGmV/otAFZzqIl2MENeeu3K1
 e+5l1aBzFmOlvgVXbcXHREvSYvfg+ipSeEkmvJU=
X-Google-Smtp-Source: ABdhPJzgOIqE/NWvaaqGuMVbb4Q7n9g1ymTvl/RKCa+3FV3FLx3wwxLiqqljzqRBdk6Sf773Lva3BC4IZrayJKp7gwg=
X-Received: by 2002:a02:7f92:: with SMTP id r140mr5877041jac.51.1624132672922; 
 Sat, 19 Jun 2021 12:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-4-pl@kamp.de>
In-Reply-To: <20210519142359.23083-4-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Jun 2021 21:57:42 +0200
Message-ID: <CAOi1vP_C7QVGGNe7Yjpmb6ZoyMW9satjntGUuO39p56_qwdG8A@mail.gmail.com>
Subject: Re: [PATCH V3 3/6] block/rbd: update s->image_size in
 qemu_rbd_getlength
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:26 PM Peter Lieven <pl@kamp.de> wrote:
>
> in case the image size changed we should adjust our internally stored size as well.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index b4caea4f1b..97a2ae4c84 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -976,6 +976,7 @@ static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>          return r;
>      }
>
> +    s->image_size = info.size;
>      return info.size;

Since you are touching this function might as well switch to
rbd_get_size() to put size directly into s->image_size and return
s->image_size, skipping rbd_image_info_t.

Thanks,

                Ilya

