Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9D60E567
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 18:22:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onj7h-0000FS-KK; Wed, 26 Oct 2022 12:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onj7f-0008Qa-UN
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:19:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onj7e-00062O-83
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:19:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a14so24448899wru.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22ESIzwm3U8Y8FxEG3qGdFMQGfeG9gttgOxmfW2ms2E=;
 b=vhETb0hUzCT6KEClCyMzbvAYs7MjiS0KcQKlo6PVpL7WAxcClNlDKAY8FINgS4w4uT
 kZ5KJu5eoycrNwkn7Jt9he2xl6Ax4YtFAXCYWbvG4Fm/t85ZAIAGDP7Otc829VaAG/Wx
 /kS1tKcqgVlcKbNcwLtQqmbqU3Ivoa9DofTWTKxBMcUkHNgobgfk5o+ubxpkgQ8Ihi4s
 FM60MauAE7ImzCmqSRFiv+0/87+JMkOyppKcVpOnduHTtrh7cqzGKu9rSXDvjq+kIct9
 ldsyU5RQ0bNthOpV+UDcxEBRAErP0PnCSJDkXxCIjoYVDRmTLiKuLvrjvav1et3YwgkB
 mV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=22ESIzwm3U8Y8FxEG3qGdFMQGfeG9gttgOxmfW2ms2E=;
 b=E9qYIUb3U9JgF23g/WiZBHKT90QMFY4v0Pk/rtYguSDfuJCXsADh+axsyeDpLZyFYH
 8ZzkFnfa50+51Na0PzDQJ9c2w0gaS6Avxt8Qb+zcc948C294sT98Mb5FH6qwYMlrn2/n
 obxAQCm+8sUzgqQ29J1SybVVcWfx3c+F3KM/42PQACWO8ODmk+q1fKjtohcmj9KndGlT
 8DFcppA4dARNfYYGKlLHHuMuzvePwLKNqsivqC0BBDdYz1lTKeW40ZX+2OSmrZcdfVPr
 91DHUJPak8Op81aWM2b5SN1UHiMetKdoJSOvZI6alwmkDxK7eCVQQOtIEvnpNX35upy2
 BMpQ==
X-Gm-Message-State: ACrzQf3toaRyEeYJPzNEHUq1znd5JhA1QHX3jcusXae1gMIAyzDgSZ9s
 fM24fTbeBg9tR6w0qdLorKsrVpQiUL0XWQ==
X-Google-Smtp-Source: AMsMyM7kLql3VBlKdUaNltj4t0UOVgJT9/b209gejq6Pom9ltIyy9EgWfgyiRB6dcwzAiu8TJrHZyw==
X-Received: by 2002:a05:6000:1d94:b0:22e:34ef:b07f with SMTP id
 bk20-20020a0560001d9400b0022e34efb07fmr29910583wrb.272.1666801155931; 
 Wed, 26 Oct 2022 09:19:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adfef88000000b002365921c9aesm5794163wro.77.2022.10.26.09.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 09:19:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D810A1FFB7;
 Wed, 26 Oct 2022 17:19:14 +0100 (BST)
References: <20221025105520.3016-1-quintela@redhat.com>
 <87mt9k6owd.fsf@linaro.org> <Y1ff32V9WXYH/hva@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Juan
 Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Create fifo for test-io-channel-command
Date: Wed, 26 Oct 2022 17:18:54 +0100
In-reply-to: <Y1ff32V9WXYH/hva@redhat.com>
Message-ID: <875yg64kxp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> CC'ing Marc-Andr=C3=A9 as original author of the change
>
> On Tue, Oct 25, 2022 at 01:57:23PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Juan Quintela <quintela@redhat.com> writes:
>>=20
>> > Previous commit removed the creation of the fifo.  Without it, I get
>> > random failure during tests with high load, please consider
>> > reintroduce it.
>> >
>> > My guess is that there is a race between the two socats when we leave
>> > them to create the channel, better return to the previous behavior.
>> >
>> > I can't reproduce the problem when I run ./test-io-channel-command
>> > test alone, I need to do the make check.  And any (unrelated) change
>> > can make it dissapear.
>>=20
>> I was chasing a similar problem with this test although I don't see it
>> timeout while running (I don't think our unit tests time out). I'm
>> provisionally queuing this to testing/next unless anyone objects.
>
> It won't build on Win32 since that platform lacks mkfifo.
>
> The test normally works since socat will call mknod to create
> the fifo.
>
> I think the problem is that we have a race condition where the
> client socat runs before the server socat, and so won't see the
> fifo. This will be where high load triggers problems.

Ok I shall drop the patch from testing/next - we need a better solution.

--=20
Alex Benn=C3=A9e

