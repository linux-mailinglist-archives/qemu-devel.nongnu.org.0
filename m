Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B860B4EB335
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 20:16:50 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZGOf-0002R6-6V
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 14:16:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZGLH-00017d-U0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 14:13:20 -0400
Received: from [2607:f8b0:4864:20::b33] (port=39728
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZGLE-0001l7-SP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 14:13:19 -0400
Received: by mail-yb1-xb33.google.com with SMTP id t11so32988713ybi.6
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dW5ecDfsg3T2Vz3z/9ws3A2F2SytmNimwwo1UjGrdZU=;
 b=hd3pSdA/HFKYiXd0M/2/kJ4bT/lNEZQmKlaVPE60hTWp9OUYvZfx2UpLXHok/h/lqV
 y9lky3DmFrloot51hNh4zhj65eF62yEglnnKz7AKaaClIPPF0Z/Mg3Vs9MGKI3JLPEi8
 poK0R+10UUz/ODqSz0AYNFO8WUY6I9ehitpeP/wjplndAuklLQuShYVIu+bzovvKvLp4
 Wl0i/s5DalEUTzoS+Wblmbo6//hoQJLmmuA7sN98EZS5VL3avr+dWBs9ymyIewlrdWqQ
 iQavGOR81X1DQUN2iuq1C3UUf1XWYCpecFZLEz/Rv41gw/KJu1liijkDRGe8KLvOGxEe
 8AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dW5ecDfsg3T2Vz3z/9ws3A2F2SytmNimwwo1UjGrdZU=;
 b=KTmciyp08QXMEhZU/nXrac7CPEO8xs5E9gmyY0IVinvXZ5Wxx0h5oZaZFwBp8tTffO
 6haoLIbOsxMrNN75pXjKXi0wwX3NsMlrN8z2PSrDrsIxKw2exT23j29HoKZC6cgrm/7z
 sR8tCIGqCvGObq4RmjQXzuFx9caw2EV7cu1BYSDNnuiDucbZiEysZR/4aie9E3Sh+54J
 QpO57Yp11lf552bs0IuGDNI9LW6cqmfojzBa1Dd/6zBsoX24At1X1gMSI5uyHYLARnbw
 nOz9Vd09i5KBj9VYHrDkIZxR2a7skYlmtM1YLXa8R18sq0t4AzRYq+fdI+Ap5ZZL2dU2
 ++UQ==
X-Gm-Message-State: AOAM532U4jEgXXOx6t4Rx8ilQJkB7qqFRlxULtQDcKDzklMyE6x2Rdyc
 keWRboz5pIP+jErEzUDj1Zg+cGm1ikryXZjNCeMbfg==
X-Google-Smtp-Source: ABdhPJxDx5KqHLRPp8xxnoYFp0kevwWl76p/0MqU+xf2wo29UAsycjQIB1/RRnWY/1Ijcz9bI9Pk/wgmfKGUKQSz/68=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr28372092ybu.140.1648577595450; Tue, 29
 Mar 2022 11:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220329124259.355995-1-lvivier@redhat.com>
In-Reply-To: <20220329124259.355995-1-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 18:13:01 +0000
Message-ID: <CAFEAcA8LY627KGKG3eb9mt=m15KCJZoF5A7UEUe8aJOuDP7Bng@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 13:43, Laurent Vivier <lvivier@redhat.com> wrote:
>
> If the migration is over before we cancel it, we are
> waiting in a loop a state that never comes because the state
> is already "completed".
>
> To avoid an infinite loop, skip the test if the migration
> is "completed" before we were able to cancel it.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/qtest/virtio-net-failover.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)

Applied to master, thanks.

-- PMM

