Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D173A7CA6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:04:30 +0200 (CEST)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6rt-0007bR-K4
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6qZ-0006gF-2j
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:03:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6qQ-0003vM-Qt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:03:06 -0400
Received: by mail-ed1-x52c.google.com with SMTP id ba2so48736656edb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djBlKwioWVzQDGT311lG8sXwZQ13ZtcbvYrvrLZ/zZw=;
 b=LJaxDjO3oZ9dYwLSTgq5n/f9jWcM8msQ77DKmO7p43EudZpLD90ontAeB+AvFF7NUG
 xJu9Y/ALL/0aeNQ2CSEmIZUnRwK/uisN7LgaOhKlIPXhwYaG1k1Ol6TtqWsAyhqfdo2k
 lga11aei8FGJe9vrq7ZDy8z23Zj52ZeHvJrGjoecEYhmd4EE1yQ+cCKGv5WmIzXlJt01
 jzUt/DNjmfjbO/1gGYQ3N5d33Qo2P/j4pRHQFqfKdqctshhvi626+SU8hzf2ltpPhfB8
 vSv4xCcK6+UtJAHh95/c8MTCktXsgvoiC19c6tinjpA/BDNNSniOvvXJUyHl5J5GT4sn
 TPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djBlKwioWVzQDGT311lG8sXwZQ13ZtcbvYrvrLZ/zZw=;
 b=E5W8GZcQY7NwGxtyFad6RvtDakKjd1+Z5Dr48a/I/9Lz5k8l/rzXvypMuyxhmSLtZb
 yfyzqmsPQuWCGjd/tnPoxtrmH5xIVRlg+4XJCxs/IdoTxzcjs/UrtV93sXm67tS3a7tw
 JEifyX9KZ2q37YWjXl9+b6r1zOSqDShmM6LxxE9TPmkoL0lBZYF9kkDGu4/Y2xG2OkfI
 k7VSChYUfPj7GwUon/OSUSP6r4dl3CysKF/7w63MeJHiUlbXNj/zVkI7BDzj2zOUXc0Y
 ILmcvGOHblo+l0ri6hPKz1LvzMqsZsBJyQWitjsQxaM8Oj6U6u0B3Rv29BD6FPQ9zrHX
 jq3Q==
X-Gm-Message-State: AOAM532tCe5El9TbMAdNtppHQ8u37pO6qLpQFO3iaCgp1unKLvMnSMtY
 KhjAgaGycx4M9Y3xi4vc44oFOnPAWJftkUrQ+IYvBQ==
X-Google-Smtp-Source: ABdhPJx17B2uFwxrYXbNuJfbutyUmfUqeJH2d+5IdEf2zmFm4o8x2iAuseMZHXUixX7GRU99UUFmOFLWbu7VYqT0K6Y=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr22210125edt.100.1623754977331; 
 Tue, 15 Jun 2021 04:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-19-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-19-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 12:02:22 +0100
Message-ID: <CAFEAcA825LDibg_4rnBQ8TmE8fZNauDkKzKBMGbnfY+j7bSjWg@mail.gmail.com>
Subject: Re: [PATCH v8 18/19] arm: Enable Windows 10 trusted SMCCC boot call
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>
> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
> including this one. However, Windows breaks on boot when we do this. Instead,
> let's return an error code.
>
> With this and -M virt,virtualization=on I can successfully boot the current
> Windows 10 Insider Preview in TCG.


Same comments apply here and for patch 19.

Either we can:
 * find a spec for whatever this SMC ABI is and implement it
   consistently across TCG, KVM and HVF
 * find whether we're misimplementing whatever the SMCCC spec says
   should happen for unknown SMC calls, and fix that bug

But we're not adding random hacky workarounds for specific guest OSes.

-- PMM

