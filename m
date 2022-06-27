Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C555BB38
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:02:08 +0200 (CEST)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5s7j-0006tv-Aj
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org>)
 id 1o5rjQ-0006sq-5c
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:37:00 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org>)
 id 1o5rjO-0005IP-Ha
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:36:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41EE6B818DC
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AE4C3411D
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:36:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="e9XzVsQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656347811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Umjv2uPXwck43nyYw6+/9hoZ0oq6X4n8I6/+4N+o7+o=;
 b=e9XzVsQcATDiDH70sp8qUun0OYIHdcF6yY8n6fjR47BtAHEb1WFB93Ckj/0TsRVnPeGB0+
 8JS23zn8Sd9j27fSvVrPAzcqDovbNd21Ej3bk/hCyN0sFA0h1k496IfWYnAsaMPKWWfdQN
 c8db0a8XaioFqd6wpdf2ZJVF2D+yPGQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 850aa0e7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 27 Jun 2022 16:36:51 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id h85so10144444iof.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:36:50 -0700 (PDT)
X-Gm-Message-State: AJIora9AeuoFuCmRIwmJCBvV/DbipA/rG2YR1pbAOUlNsaeJTYCN9VSc
 GwKNf21aKA63aZFr/FQcBQWRN1dIK+ndWlu4YSM=
X-Google-Smtp-Source: AGRyM1vdblyOKY4DwVLSWqz25uoyaPlu4UENRO7hNfaAeEpDyXmjHEi2D0LbcRAzr1CXn0G0CQM0pqPOM/1gpm4aec4=
X-Received: by 2002:a02:8568:0:b0:339:c51c:867 with SMTP id
 g95-20020a028568000000b00339c51c0867mr8411747jai.170.1656347810287; Mon, 27
 Jun 2022 09:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:16cc:0:0:0:0 with HTTP; Mon, 27 Jun 2022 09:36:49
 -0700 (PDT)
In-Reply-To: <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Jun 2022 18:36:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
Message-ID: <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
>> kaslr-seed property was added, but the equally as important rng-seed
>> property was forgotten about, which has identical semantics for a
>> similar purpose. This commit implements it in exactly the same way as
>> kaslr-seed.
>
> Not an objection, since if this is what the dtb spec says we need
> to provide then I guess we need to provide it, but:
> Why do we need to give the kernel two separate random seeds?
> Isn't one sufficient for the kernel to seed its RNG and generate
> whatever randomness it needs for whatever purposes it wants it?
>

Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
After the kernel calls add_bootloader_randomness() on it,
get_random_long() can be used for kaslr'ing and everything else too.
So I'm not sure what's up, but here we are. Maybe down the line I'll
look into the details and formulate a plan to remove `kaslr-seed` if
my supposition is correct.

Jason

