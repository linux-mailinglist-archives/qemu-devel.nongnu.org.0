Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AA6BEC63
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBeP-0006Yz-NG; Fri, 17 Mar 2023 11:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBeJ-0006Ul-GD
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:05:45 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBeG-0001M6-9Z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:05:42 -0400
Received: by mail-pg1-x535.google.com with SMTP id h14so2853493pgj.7
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679065539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ElBIBPnA507Qjr0FwsA+7fMArTtc8Y9mdcZyL91eCc=;
 b=KZWWr1GbdpcFasdTjh8D8Y9VgmtS31GzkPVm1gEWCayUAPiRKcFZMfsISOyluO/vSw
 aDwIp3jFkKAQFM0y5T6xV98mkH4Kr5rN3kY3XILZCwoQpXnM1QP37fgyc7mLk8g/rAFC
 6MaGDcQ7fBccSDp9oRQIl1YAe34nmt5FdXQJQS66Y8ZAMEWkCyiLL5PQbnNEDCYax9Ca
 mxZBaaW5tsZkxbplRyj1+WkgQ/3LF4Y5d0QQJ1BJdopFgVJNoslCl1h1iD2Qjoe0wesG
 +E7j+jf3hgcQM+ZAo5bAxeiM/uwY6x67B+wxDcXqHE2f4khzfqFKIA4Tp0+StTHcWQz4
 U3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ElBIBPnA507Qjr0FwsA+7fMArTtc8Y9mdcZyL91eCc=;
 b=7ovLu7sayCLqvMp0qyFh/qUbMRDz80PtUIcWsce9rLd2fGZMEtKXHBptlQR8Ncs9/w
 tp4WO0w37W6VojJodLWA12a3uLJ7P5mMmtztlHueQTm5ZHPh+9xPgKl7HA8UV6WF4b5O
 NdW0HIbUwTIUofCnI17zYqyddFx34lX/35Tn3GwUjbck1fjeIwT0ycVP5fw01QlE0RrG
 wmnlD23atgZxdKLdwQ9H8REjltezhibMQT/+lxdp7dx02ge/m1dwWwwR7XUmjCrlSJhU
 yJkFrvFGjMG3yBXjQmEVfLTH/99kwPAaZ3BrALfpUXVz5Gj3QGy8L1KvQdTW7XP2cd7k
 yU9Q==
X-Gm-Message-State: AO0yUKUnoXWwPCDkjhvrJFBiX9k4CHMiOFBuDMWnTz4MS7Z+4A4cecoz
 3BqRs7+yXhfb/AFmXljFloyOLSMseyKNfTEzf3OZeg==
X-Google-Smtp-Source: AK7set99Y9eZ3pWdGFCj8gt7afjXdZpwafIyjDBo4opuJTspPuQGYt4Mr0bmWaKf0DAvdKhJuPwFH803xTsrrN03OsE=
X-Received: by 2002:a63:1723:0:b0:50b:de95:af77 with SMTP id
 x35-20020a631723000000b0050bde95af77mr1073818pgl.1.1679065538642; Fri, 17 Mar
 2023 08:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
 <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
 <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
 <CAFEAcA_dYmf-6kF58CvrcvL+NjpXYaau+_=vRJPuOXEuNYmEeA@mail.gmail.com>
 <2c4ad288-d805-c130-f1c7-0a42d1125d12@linaro.org>
 <CAFEAcA_B6hWtrQr9WCm0J5iWWg7nQyYCGfhcYX8UM4wKGJ1FLA@mail.gmail.com>
In-Reply-To: <CAFEAcA_B6hWtrQr9WCm0J5iWWg7nQyYCGfhcYX8UM4wKGJ1FLA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 15:05:26 +0000
Message-ID: <CAFEAcA8CE335C3LHArDrGpanAL-y=tCQbwc-ewu9xX-aymr6_A@mail.gmail.com>
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 17 Mar 2023 at 14:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 17 Mar 2023 at 14:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 3/7/23 02:17, Peter Maydell wrote:
> > > It looks like we (inadvertently) broke "-R 0 means turn off"
> > > in 2019 with commit dc18baaef36d95e5; prior to that the
> > > 64-on-32 default was set by the initial value of the global
> > > variable and could be overridden on the command line. After
> > > that we ended up doing the default-value stuff after the
> > > command line was parsed instead.
> >
> > (Not 64-on-32, but 32-on-64.)
> >
> > I don't understand how 32-on-64 would ever work without reserved_va.  The host kernel
> > would otherwise place mmap blocks anywhere it chooses, which may not be within 4GB of any
> > given guest_base.
>
> I think most of the use cases weren't doing mmap of any
> kind. The gcc test suite is one example of that.

...but in any case, looking at the linux-user/mmap.c
code it doesn't let the kernel give it any old host
address, even in the no-reserved_va code path:
mmap_find_vma() calls mmap() with a hint address it wants
the kernel to try, and it refuses to use addresses which
aren't reachable by the guest (as defined by h2g_valid()).
So as long as the guest program isn't a really heavy
mmap user it will be fine even with a 0 reserved_va.

thanks
-- PMM

