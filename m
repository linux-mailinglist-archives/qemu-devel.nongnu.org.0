Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610966C0A3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQ4E-0005Zq-0v; Mon, 16 Jan 2023 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQ42-0005VC-9M
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:02:19 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQ40-0000Vl-J1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:02:18 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jn22so30388084plb.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=02UejPRtuLIpXQ0aArH2+dK6f6nXSapbtCorg1f7ZUw=;
 b=YEIJFeQMcxbqWLWuZKJ0iM9cjdzqaXsRLfFHQ+AcoxNaxtGlHRIm/6k/YqKd04xWTX
 SP/B/po+mQnxJhv224/a07nNVicq8N/UOv84/fNiZvj8uALrrbokb9f7voaRTfTMhT8R
 vAzxIewZkVtQJs67DVtlyVYhB9Q8Ua2DHG3g+84t7YOguWDIT9+QGZqdBHukEAh5iw71
 q4akUThaZrFQPx9sMp/VcG2SHxUl5ZUb5AMoz7sf3/5gASnuNjJZPifz3aJnj/J6Cn+b
 FBmvqdANf80y1uLNlxVNMdCnmq9xDdmOSQ0AaBMgcTrC64Ta/v6crUJ1OcimZZUX38PB
 q/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=02UejPRtuLIpXQ0aArH2+dK6f6nXSapbtCorg1f7ZUw=;
 b=KxL1VZ8cYU/1lG4SN6mZM8TmOOsnPq/ejldkJoHs7iL3aCS7qxVbkX4jQj8fWn2Oxz
 /xU4jKMJSSXapovguGr9Fk0pmU9tTOk8Yj85tiBhP0QjcTCazfnSdnvndFqhcByaXxza
 ysmK7n3Wyqbgyhb1+bQfzwA11EEKmz/yu4dfiznpGGSjw/sEJvaQeRDF/m+Omh0zBRIk
 C0AeSN6dIoMmOj0HndS+L/dXGElbG+/uzWum5PtgKZC/LFQQn75F6EOH/o050dfei80W
 N7mq3d6UYs7YAihJYzyEAYXfBnRtwvDvsLlZKsb6/5gkmJDSk3VnzdWWjSC3mP/NHqsF
 dI1A==
X-Gm-Message-State: AFqh2kokdzesF63z6/QWLVN/oKL9XPXYQt7/I3JFaY0Cq2jmRJdjPoz6
 BqPLvy6zWO1CoXc2TmrrVadTx2ZBr8jdL/7ZF0cNdg==
X-Google-Smtp-Source: AMrXdXvsXl9Uks3hE43ojWKPKivl8Y8mXAbrs/UbA5mzoZfDAsoBgwWHbOX1YQhEfIELbwUCOnfKvskvqFaSC/FHg2o=
X-Received: by 2002:a17:90b:2304:b0:229:189b:6fee with SMTP id
 mt4-20020a17090b230400b00229189b6feemr1168255pjb.221.1673877734746; Mon, 16
 Jan 2023 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20230115171633.3171890-1-richard.henderson@linaro.org>
In-Reply-To: <20230115171633.3171890-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 14:02:03 +0000
Message-ID: <CAFEAcA_U=XyEFW0CkTweEL7ET2wHLM442H0Kfqdb33-BzonBDg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Widen cnthctl_el2 to uint64_t
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Sun, 15 Jan 2023 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a 64-bit register on AArch64, even if the high 44 bits
> are RES0.  Because this is defined as ARM_CP_STATE_BOTH, we are
> asserting that the cpreg field is 64-bits.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1400
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> During my perigrinations of reorganizing cpregs, I've been thinking
> of ways to detect these sorts of errors -- preferably at build time,
> but failing that at startup.  I think all raw usage of offsetof has
> got to be replaced with something like
>
> #define cpreg_fieldoffset(field) \
>     .fieldoffset = offsetof(CPUARMState, field), \
>     .fieldsize = sizeof(((CPUARMState *)0)->field),

The other cpreg sanity check I've vaguely wondered about in
the past is whether we can somehow check that all the fields
that we expose to the guest as a register are migrated. This
definitely isn't true currently because for a 32-bit CPU with
TrustZone we messed up migration of the Secure banked state.
Incorrect use of alias flags could also result in that kind
of bug. I guess we'd need to have some way to tell the check
about fields that really are manually migrated, though.

Anyway, for this patch, applied to target-arm.next.

thanks
-- PMM

