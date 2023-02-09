Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC19690CEE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8pR-0001CE-Bt; Thu, 09 Feb 2023 10:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ8pP-0001BL-78
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:27:15 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ8pN-00018K-KP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:27:14 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 78so1786284pgb.8
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AS1SFGoXSos+cRRaQn0ay1sQASKHE25/DIyHQn9ZoH4=;
 b=T+eHY3gOPCZXB6o6eKhuncGIGFfrEana1oEIAAfB5SikGtNs0/1FZieRteeDPiNXo7
 yDjbhdM+vNzflxjU+4L7c2HSXszzUYii6myIHoAaexrTenY52qf7Byk1AYGO1BRZExMQ
 leVapf2AltMcHlVvn7gJfPXYeeMJBfFyYLfGQssnqzVyTACuUPBDvhx2s7wDxwgS5l57
 RlkR9KgE17+p9U4PotsZpfzl92PFaZk9d4vrQYhPkA+sI1vAqw7h7krdoGa2wWORXKdg
 lLmJa/wFI/JaG7upi2F6hf69WqzsXYrpmDku8HEXiaLG2HQWP0Utqq0hptFwjwXUIWPR
 U1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS1SFGoXSos+cRRaQn0ay1sQASKHE25/DIyHQn9ZoH4=;
 b=NrXjdEcvsofPRDQn2jc0lpRkSdyOLGnxjmHFiewcrJYPXFC+NehOp1yANYUSbEdAPI
 dFxPX9+SuOH1GLrpo0zbkUQRXgPSZKt7iTuWcZXW+gwnxIWlBPbTydhIOCfMYh0qx5pS
 2vchEmOqrDwzazTzwYborQM8eyykdR27FgZ4SIWCo+Et+g1TLTa3vUfpVX+oEtY8PUIl
 7J+MxxcNYip2vEgXEHmq0hKwMWFKl+xeOvBjJzFvGLLTsxnaOfZF1i+HM8FGdKJsSdVr
 r29D+2Lp80iMwS5meCRv04pRIVa38mQSBSHnGt3ieeZ6tXUq512T5AK1kR4p8e7+vjKJ
 4JrA==
X-Gm-Message-State: AO0yUKWLYfb6AAbPCCq+97/tErkhR4S1xlyuVUL2KJQo4FPxp6t+iRE2
 SbGGlEVkJ4iukOb6PrjM5qTC3g3yGGyFZ/jtEAmffw==
X-Google-Smtp-Source: AK7set9a/A+y0ypK3IEy/g9F01j2Q3G15V9Aqr3wHhR1GRadHshPyqppz/NOKcsHCU3GHizd968mOm6OacZzLu9Eiiw=
X-Received: by 2002:aa7:9e5a:0:b0:5a8:482f:c328 with SMTP id
 z26-20020aa79e5a000000b005a8482fc328mr1253014pfq.39.1675956432071; Thu, 09
 Feb 2023 07:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20230209152301.33111-1-quintela@redhat.com>
In-Reply-To: <20230209152301.33111-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 15:27:00 +0000
Message-ID: <CAFEAcA9gWXLrWuS2d4ic60_k7-cjOVutDqRtAq0+m5UjrVKuNQ@mail.gmail.com>
Subject: Re: [PATCH v2] migration: I messed state_pending_exact/estimate
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Thu, 9 Feb 2023 at 15:23, Juan Quintela <quintela@redhat.com> wrote:
>
> I called the helper function from the wrong top level function.
>
> This code was introduced in:
>
> commit c8df4a7aeffcb46020f610526eea621fa5b0cd47
> Author: Juan Quintela <quintela@redhat.com>
> Date:   Mon Oct 3 02:00:03 2022 +0200
>
>     migration: Split save_live_pending() into state_pending_*
>
>     We split the function into to:
>
>     - state_pending_estimate: We estimate the remaining state size without
>       stopping the machine.
>
>     - state pending_exact: We calculate the exact amount of remaining
>       state.

Given that this commit has already gone out in a
release, it would be useful to describe in the commit
message what the consequences of the bug are, if any.

A Fixes: line would also record the commit being fixed
in a more easily processable way.

thanks
-- PMM

