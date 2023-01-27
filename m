Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F567EDC1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTh2-0006CI-FU; Fri, 27 Jan 2023 13:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLTh0-0006Bk-HT
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:43:18 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLTgw-0001sV-SM
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:43:16 -0500
Received: by mail-pj1-x1035.google.com with SMTP id 88so5403396pjo.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OV86ZUc92F8TGquSUbq6R2EFmppWugmMY+6/djCBBqA=;
 b=KGgU1YdSiEASgUIKBpdKm9vuX94+Av2o9ZAAYeMp8AK4kjJMFcdBoDIurb1kwjRJJ5
 8/5473tRALXPQEzK7B7JdKvxUlDeQWOeNQog2+PP4+mdLWV5qq2dDNZA3tSFHlcv6uRj
 zhJZcpDbZBhWpkQSJeHZ+RkQkctsGtY6Lp1kNZf7HbV4lZ1SHULJxub3OboGTxQVIn0y
 gDsEycjJfhHFlU7dL1HQ04/J2g/YxZhVNaPCRGvg9o5jYAJo1Lh8M8B03lR7tBX+KkcQ
 Ss4KLBd4mUt+/BxMDIyLl5JdN/2YBOWV+ozaPJhLAdQ2OnwxcnzG4Y7rWF2jeyKYRWNa
 MIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OV86ZUc92F8TGquSUbq6R2EFmppWugmMY+6/djCBBqA=;
 b=CeSkbCIP00wo6O1ewohUQnLHgpPcvp+NDtWTKfM5JDymFo2po/L/bhsorLR+PkesRO
 xk71Dh/qeVoocmFj75Rdenx1unwIx3kcGXKDoWIMhyONuzwAG0Q/UVQ7FqTPkDoG0QOt
 TDw17QHHQgcRFLDMyCubWNBcokzl5kWk0hcmgLon9DWkvnYc+psmHHLzb1rtkrIfXYdU
 4glFQ17gm5My1uw9AjZJ8A0laOz0lBa4K2ILLrZ1t0IWR09WZQYVZjOzr+iWWHywhJgh
 H64zLr7CbQkDaCHRuxwT0P3wANiuVZOyVxyYMml2ioSiwwXrRKnhitV6gDacx91FzyB8
 62RA==
X-Gm-Message-State: AO0yUKV2rLC8PG46C1ZfeMpi/RBYtjmYZi8q3Gyx5IpCJPowVGe9l7nH
 LsQArFxFw1yAmOMLF2ZhF5xFs8vObN9m2LHTIYXbag==
X-Google-Smtp-Source: AK7set+oacjFfgqd+hVKFQt9Chl9jdmA20ezZ7i3BhnawbnzKGKof4/x3uOJ2F09pAFWKepBkVI2tThUFXSOK2sd9iU=
X-Received: by 2002:a17:90b:312:b0:22c:37a4:6ae3 with SMTP id
 ay18-20020a17090b031200b0022c37a46ae3mr762717pjb.97.1674844993402; Fri, 27
 Jan 2023 10:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 18:43:02 +0000
Message-ID: <CAFEAcA_u12_+x9Dd2mEx9=PuXM6ZbdmhjDat=XAsWoP4jHM0sA@mail.gmail.com>
Subject: Re: [PATCH 00/23] target/arm: Implement FEAT_FGT fine-grained traps
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Fri, 27 Jan 2023 at 17:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> The first seven patches are various cleanups and bugfixes that
> I noticed while I was doing the FEAT_FGT work. In particular, we
> weren't getting the priority of HSTR_EL2 traps right -- these should
> take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
> The rest of the series is FEAT_FGT itself.

Missing character here -- should be "take priority over UNDEF-at-EL1"...

-- PMM

