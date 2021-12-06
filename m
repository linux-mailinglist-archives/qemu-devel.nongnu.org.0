Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3C469943
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:43:20 +0100 (CET)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFD4-0005pV-C4
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muF53-0008K3-23
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:35:01 -0500
Received: from [2a00:1450:4864:20::332] (port=33416
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muF50-0004Si-HQ
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:34:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso20782wmh.0
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 06:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOAQHQv9gYhkBHTVYb03YQnSazDrypo8Y1xJfAQpau0=;
 b=DZiuFZoA5EXyF5PC4QQ/0dj3J3m3fkYILJg3zgtWlywrVOqhdGchMXN6YA3tw73hB1
 KAWJw8IsDMJrGzGg61c8eme0HzsP+cIVisr+CUMpZNP800fplvOT34V0eNTfA3LqJpII
 xZeiH9nXTYSftqr0N3cUeBhjcD8vIgIqAEeSDI9NqMiLY4VUCSsdKY43P/MZ5S+qncNf
 l95s6f49F/RvDGsVjCNS07mtK+QOjODYej+cH3PHni94UMSwI/B4uZeVWnvvvP543+Xb
 rOyqcqMtasQsZsenhkS0s8hUXDyrlVI8kdmlmA4LbMnL8ZBATVr+CuayIljFRvW1YLmI
 AHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOAQHQv9gYhkBHTVYb03YQnSazDrypo8Y1xJfAQpau0=;
 b=c/iTmzgFgbubEtrHFKj7GNwguTCtH+fag5T9slJEQRbeB21xfSgZ1Q7CawMydmzxDW
 GPJbPxppkQelKUCCZDTWLclph2+Z7xBolZR9dWsLG0fvtke+6Ys7I+hS9KEOcwliQ+0I
 AH3cr+9sHkEe94vV7Ae1lxYb3kQZMDBS0bnpyogEpCecoiYhN3DIBqcQ3DQXp1haQP6K
 eFBo79uwwHdSqCxGwuXlcT/GplTTVJCviCuPoPuTkiZKgGkldDxafDZuUbaCP7pbD7iV
 cF1EHc2mHkfVnqdt/PsBZs1JQA3e60wPcc3uZwO5KUo3iSxllpPh78Ob7a57IrZCVwXu
 PiBg==
X-Gm-Message-State: AOAM533bKj0/S71MciFniRAx2qRLamSnZTx0GlUeOhpehZS3RYRR4itV
 fl3PAGr2g0kCk52cVkOzZDkDbq8tqnn+mKwcpjt4jA==
X-Google-Smtp-Source: ABdhPJzgNKi0itghIXpFnmigAYea4+EtyzKg9318lqI7TkiM1Gq6gITXug23w59ZsK4S492uU9Xf6NCMQSexUIcV+lY=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr39784581wmq.21.1638801296003; 
 Mon, 06 Dec 2021 06:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20211206142632.116925-1-stefanha@redhat.com>
In-Reply-To: <20211206142632.116925-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Dec 2021 14:34:45 +0000
Message-ID: <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
Subject: Re: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Dec 2021 at 14:33, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> v3:
> - Added __attribute__((weak)) to get_ptr_*() [Florian]

Do we really need it *only* on get_ptr_*() ? If we need to
noinline the other two we probably also should use the same
attribute weak to force no optimizations at all.

-- PMM

