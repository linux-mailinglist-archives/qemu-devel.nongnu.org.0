Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA505AF810
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:43:07 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVhHY-00075z-T1
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVhFt-0005Ap-Rs; Tue, 06 Sep 2022 18:41:17 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVhFr-0000xP-QB; Tue, 06 Sep 2022 18:41:17 -0400
Received: by mail-vs1-f41.google.com with SMTP id n125so13148723vsc.5;
 Tue, 06 Sep 2022 15:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9V9eN6eZyAd98kZftvD7GKNFbUTlR0JLcHYSS6xaD5I=;
 b=DdYy9c4ql0g6mnpQf+qHwo9kCwdSjLbx5wKOA6hJi+LpooRHzhRcn6REvDw2qkVp61
 BuBO3JFK/HM4L0fmo7H+1krKgvL85BfqnzrwS+rSjKN/tFFvOTJK8PXfMPdLyJyHLbhC
 m2BT1H/DIDTZe/Mh4p5EnHtaGq3dPtbcSGVgLYs1zIEsnkR6AEtkJqfO/6PQZgm5mtFa
 3E30HJ4go5g6v7BSf7+xiGuIcPzU3z7XuTdPS4D2QzoOl67E8OWfxoJ7QwAor9X5EAU0
 VJXbD3QGGcsUChjSzfLRJDbH4wMg+WuXn30zJ/qxTyg2J1I29/08kiWG8KM+Z05AKr6P
 nqww==
X-Gm-Message-State: ACgBeo2lT3Wvbq1AuDN1JTrL+cHqNJilrCrtLytpytSj1Ifgbariyjcn
 wYYHG2X9uqpbYd5BvLhUeX8y03qFANvFxMxUVIs=
X-Google-Smtp-Source: AA6agR5XWEY+GG4nf9neyQwSH/gdzb8c1Hkwfyh6CgpRSayVJEwb59/+AbzQANS+eKoyG19qQADaibEEI1lUwpZG4Lk=
X-Received: by 2002:a67:e083:0:b0:391:df54:ed3c with SMTP id
 f3-20020a67e083000000b00391df54ed3cmr221378vsl.45.1662504074146; Tue, 06 Sep
 2022 15:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-3-arwed.meyer@gmx.de>
In-Reply-To: <20220906194755.98090-3-arwed.meyer@gmx.de>
Date: Wed, 7 Sep 2022 00:41:02 +0200
Message-ID: <CAAdtpL7OkN2Dr3bvShem1wzB4kr4Hi3M7h+wEaNUqjj0zc7cvg@mail.gmail.com>
Subject: Re: [PATCH 2/4] chardev: src buffer const for write functions
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.217.41;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Wed, Sep 7, 2022 at 12:07 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:
>
> Make source buffers const for char be write functions.
> This allows using buffers returned by fifo as buf parameter and source buffer
> should not be changed by write functions anyway.
>
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
> ---
>  chardev/char.c          | 4 ++--
>  include/chardev/char.h  | 4 ++--
>  include/sysemu/replay.h | 2 +-
>  replay/replay-char.c    | 2 +-
>  stubs/replay-tools.c    | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index a319b5fdff..44cd82e405 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -186,7 +186,7 @@ int qemu_chr_be_can_write(Chardev *s);
>   * the caller should call @qemu_chr_be_can_write to determine how much data
>   * the front end can currently accept.
>   */
> -void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
> +void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len);
>
>  /**
>   * qemu_chr_be_write_impl:
> @@ -195,7 +195,7 @@ void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
>   *
>   * Implementation of back end writing. Used by replay module.
>   */
> -void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);
> +void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len);

Doh this reminds me of this series:
https://lore.kernel.org/qemu-devel/20190220010232.18731-1-philmd@redhat.com/

