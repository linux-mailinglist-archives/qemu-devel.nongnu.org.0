Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9C69D1D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9Xu-0000xW-LN; Mon, 20 Feb 2023 12:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Xb-0000w2-CB
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:01:27 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9XY-0001ZQ-9O
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:01:26 -0500
Received: by mail-pf1-x432.google.com with SMTP id e24so1042071pfn.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676912483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xdnSO80s9Lo1AhhJseZCBinl1FyMdJNato++Uz9jCbQ=;
 b=Wn4QTfDFtBpOwpCUiai1WgHFvRPWjWvHc8pYgxVf/CxXjkAM8CrcsB1l8OMvwGo6Ok
 mkJaTwnvWkyDPb4UEDOHTJn1Pmz9uqirVjG+vIL61IxMlWtrXdgmq2uYAcAeQvvCmap+
 GN6xHxBIy4WYyOP2TMmUgNOsxFVPVncAmAIBw5b2Pgw+JtoFGzEffC5UokErPNqNBCEy
 FoPjEIP2ThNCndN7xMtHp4b1TsX94lgL4ZTfoK4w7T6eW0AUKRx+ybiBSosT79fU/lEe
 rgXLT86/kdUhm9mAN4vDzUwdVjt+vmqQhWNj1CFWSLcDB2oPUUwx/dFtSnEG4KxWgsZ4
 hmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676912483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdnSO80s9Lo1AhhJseZCBinl1FyMdJNato++Uz9jCbQ=;
 b=JTwQATRdAHkNJ4kMVJAe24N3dR0fsvJY9UBEppyMW9LKO6k6JC6kJQYbvmyCIOXGd1
 LJCzb90vgrv1wT6wNa8WV1Nq8MtP1OIRMuHpbOnOwRXpzcjGo1RB6xJ/QQYfNhdjO7Rt
 LBxVvLMNEyT3W0tNJzxy+T3OZab6c1QY8DgkudR3cIxY+4LTeZ+AE3KqIZIz9mAonW70
 1iJ+ghp1A2A2ThjZUilMCrfJFjSN5mxHJ9zHqVYI6UJaGFivfZbx63kUngv3iLcyl6HE
 ehxm2cmNuLg896blG7pLagdS50gOxzItsjIeYGk6zSLAUIVG9bYG7nAqlhv9cYjOwayh
 1o8w==
X-Gm-Message-State: AO0yUKUS+TeyVLUTZRXFY0CaAvjvmTDb8aiSzZtPS8PWaywmj0PwYGP9
 qtI0add2JLCEfizyyqd12DyGuMkq8S+FgxW2SbF/vQ==
X-Google-Smtp-Source: AK7set9pHmXTaIzM5oAAcoAf+J27VyzMJizquGZC4Vp5qinZ/FqPYBk3gfzfuzehlsGe1S5CTEcUVJPNGbC3nqZu4YU=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr415903pfw.48.1676912482807; Mon, 20 Feb
 2023 09:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20230217150829.283583-1-kwolf@redhat.com>
In-Reply-To: <20230217150829.283583-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 17:01:11 +0000
Message-ID: <CAFEAcA-6hq=70fQvWXEU4D0_9g6p4rrSxiXZ2-+yZa3fgb9jxg@mail.gmail.com>
Subject: Re: [PULL 00/22] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Fri, 17 Feb 2023 at 15:08, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:
>
>   Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to a4d5224c2cb650b5a401d626d3f36e42e6987aa7:
>
>   hbitmap: fix hbitmap_status() return value for first dirty bit case (2023-02-17 14:34:24 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - configure: Enable -Wthread-safety if present
> - no_co_wrapper to fix bdrv_open*() calls from coroutine context
> - curl fixes, including enablement of newer libcurl versions
> - MAINTAINERS: drop Vladimir from parallels block driver
> - hbitmap: fix hbitmap_status() return value for first dirty bit case
> - file-posix: Fix assertion failure in write_zeroes after moving
>   bdrv_getlength() to co_wrapper
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

