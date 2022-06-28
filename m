Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEE55ED07
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 20:49:58 +0200 (CEST)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6GHd-00027X-Fo
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 14:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jTXH=XD=zx2c4.com=Jason@kernel.org>)
 id 1o6GDL-0006iL-SK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 14:45:35 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:45102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jTXH=XD=zx2c4.com=Jason@kernel.org>)
 id 1o6GDJ-0003hr-UP
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 14:45:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 686BCB81F21
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 18:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E884EC3411D
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 18:45:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ej9v27/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656441917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSIkTw384/B+vutTJWpLz06aCGmL2eVAmb6+o0D5jHo=;
 b=Ej9v27/w5+eUKwbJ81ebVOdZr4cDUK5kqqwllCezxfpWi9sCrv1F0Wt9Ikg9vvb6RfgyPm
 Wc5vr/tYoDVP/IJKA996tGX6Nr8NJNwce/QfwOn7V+CcfJjBFo9hUk2RyJCq+NuzEyxRLt
 hzFE2sXK+Lv4YZ6tf+zji5t5loHNOoE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69d38287
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 28 Jun 2022 18:45:16 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id y18so13793076iof.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 11:45:16 -0700 (PDT)
X-Gm-Message-State: AJIora/Cy11AvjZ7tmcnSS+KSI3k3g4Py4l75NUzydMEcpPGIm4QL0RO
 QM8HAhIu2cr3JrFpfyCpJfENMlUQIEde+C5HV0c=
X-Google-Smtp-Source: AGRyM1vaRVt41/puZAQ+708vQxEw2WZoEHJ8WPft4bX/jS3kRFPNrwDNB06nr5PkcFDLQdYwwbzO4N/IkL3zKL7a8wg=
X-Received: by 2002:a05:6602:2b02:b0:65a:fea9:c715 with SMTP id
 p2-20020a0566022b0200b0065afea9c715mr10475293iov.142.1656441916205; Tue, 28
 Jun 2022 11:45:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:16cc:0:0:0:0 with HTTP; Tue, 28 Jun 2022 11:45:15
 -0700 (PDT)
In-Reply-To: <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jun 2022 20:45:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
Message-ID: <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=jTXH=XD=zx2c4.com=Jason@kernel.org;
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

On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>>
>>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
>>> kaslr-seed property was added, but the equally as important rng-seed
>>> property was forgotten about, which has identical semantics for a
>>> similar purpose. This commit implements it in exactly the same way as
>>> kaslr-seed.
>>
>> Not an objection, since if this is what the dtb spec says we need
>> to provide then I guess we need to provide it, but:
>> Why do we need to give the kernel two separate random seeds?
>> Isn't one sufficient for the kernel to seed its RNG and generate
>> whatever randomness it needs for whatever purposes it wants it?
>>
>
> Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
> After the kernel calls add_bootloader_randomness() on it,
> get_random_long() can be used for kaslr'ing and everything else too.
> So I'm not sure what's up, but here we are. Maybe down the line I'll
> look into the details and formulate a plan to remove `kaslr-seed` if
> my supposition is correct.
>
> Jason
>

Was wondering if you planned to queue this up?

Jason

