Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE86F4061
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:47:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmbJ-0000s7-S6; Tue, 02 May 2023 05:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmbF-0000ri-8L
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:47:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmbC-0005ZR-I5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:47:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so6010496a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683020824; x=1685612824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMKrazW8sILQReKUpzrOaZv7JAe2Iym/Bp6J/et7XJ4=;
 b=Caxcv4kTH7v/ZqTV0au/4aVpEYqqkGsgyufry5xAbWCv6YOZmKIyVHDfTiyY8brWSV
 ru4PVyJm8C+QyOPVzXjk73nc4erM7reoA5ymTefDrLYnbheAX2NLQOvmT/DdQCfFZCYk
 x1VHFXsT4ymf3Fipm5Y3JZ/xokv04jcPy7WBha52wx+BaZRV7f5rmh4N34LfHTjPlk4O
 wlkjVJQZbtlZ++NErvy7giGMSD8oYXTIcZBdu0TCdCEjmMmnjXudy+o4UmVzN5io04w0
 hTACPj/2K6xyTyA5qBM7A0iYY9cyYUJBwKPPr5SPVK2WX4ylDukkOhdjayouGCZ6/slr
 e8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683020824; x=1685612824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMKrazW8sILQReKUpzrOaZv7JAe2Iym/Bp6J/et7XJ4=;
 b=WzQ6Jbu0cBfBVq+iHe+XcWXa0j4vSuYFg8qjRmnwZxPvj4N5z9oiu5XhTE+zT9ySh7
 OrLI8K4MVi72ooUKJa2tCzhE1s5SJgLibqc0soH67Jk49Mxlek8e2PIxOuKmKC7Ku/E/
 hIs6jddw7/ZxCbFQ0lFhH15P8riHkBEnl5o7XEG6AjC/MzqEynMthJQoT5SqswQRjELu
 NtLedZgCCguoGWkEh4hpieiutYRvE1fSzX1nTyQm9MoVTOzONpFLUbO6tbo3Si1IYmnw
 90/I5qCxhFyYwONtNhd0jbhWDNsLrK9Jw17eScoA07FucxktBOeKGqj1VawPjHKldrOQ
 fHmA==
X-Gm-Message-State: AC+VfDxObHGP+RXXcxlnx3b6uaXU4FYoSsewTrVNNoKdJNjZ8Lo0xPA8
 903fRq27Rddv3M96jyQh8Tam2F2iBPY0Wk/NRyU3uQ==
X-Google-Smtp-Source: ACHHUZ6KtZ4JA3EzXD1VW5QaGQw0idIoMnxxWCEX8yLiDd2HN9rOZiSIYEaNZAAOYn/dNZ7Obtyw8kLbWh62PXSgV9g=
X-Received: by 2002:a05:6402:648:b0:50b:ca21:a85e with SMTP id
 u8-20020a056402064800b0050bca21a85emr3619653edx.35.1683020823919; Tue, 02 May
 2023 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org> <87a5ytpirj.fsf@suse.de>
 <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
In-Reply-To: <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 10:46:52 +0100
Message-ID: <CAFEAcA8EmJcOiy0hR36wonBJDLEDuVBakYYK=cXEmQ3J-TtrTw@mail.gmail.com>
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Apr 2023 at 08:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/27/23 14:16, Fabiano Rosas wrote:
> > Richard Henderson <richard.henderson@linaro.org> writes:
> >
> >> On 4/26/23 19:00, Fabiano Rosas wrote:
> >>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> >>> query-cpu-model-expansion test to check against the cortex-a7, which
> >>> is already under CONFIG_TCG. That allows the next patch to contain
> >>> only code movement.
> >>>
> >>> While here add comments clarifying what we're testing.
> >>>
> >>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
> >>> ---
> >>>    tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
> >>>    1 file changed, 17 insertions(+), 3 deletions(-)
> >>
> >> I don't see why you're changing the cpu model here.
> >> Neither cpu will work, of course, but why change?
> >>
> >
> > Because there's already a patch in master that puts the cortex-a7 under
> > CONFIG_TCG, so I can have the whole if/else in this patch.
> >
> > If I keep the cortex-a15, this change needs to go into the next patch
> > ("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
> > which was supposed to be only code movement.
>
> Well, I still think the change to a7 is wrong.
> If the two patches need to be merged to break bisection,
> then so be it -- just mention that fact in the commit message.
>
> Peter, do you agree?

I see your point, but on the other hand this is only test
code, and the situation it's checking is a rather
uninteresting one anyway. So given that this series is
already on v11 and it's an awkward one to have to keep
rebasing, I'd rather take it as-is than ask for a reroll.

thanks
-- PMM

