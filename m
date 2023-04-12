Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEC6DF3ED
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYqa-0003N7-G2; Wed, 12 Apr 2023 07:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmYqQ-0003IL-2i
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:41:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmYqO-0001xC-BG
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:40:57 -0400
Received: by mail-ej1-x629.google.com with SMTP id ga37so28356006ejc.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299654; x=1683891654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bqq39GfxfJVjW+WjJ2DeCJgQIS8mj+nD1uqB5BgS1Uw=;
 b=LNNI2A1Z1an8ECBh/RWjzuMhE+OIMEQ1pVwv67XEJS+c6J26iyVL8fKsHD8Qiex4zQ
 DXDGa3yyDeaMqPe8610MvoCXEWubK6gMr/vZJtk1ucqNvwSA5OwzR3cJ5t0XchH/d9CG
 751bU/pHkjKPyDktKZLfg9LAT8DihNZJQjVZNuHOfONlgns4fnDye6gmqOOlbWWYpGOL
 lXpRGN5vJ0rnifT0Ex31klGA+CmYhGFqB9PMbFSN0uTw6aPjeD29YHrWW91zST3AMPz1
 38jcwgpBxQmhzy3ZqPe+HdJcu1Chbcu4ygDjprkvP3R0YR6hbIcsdcYPTC7RRYp32yvW
 rCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299654; x=1683891654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bqq39GfxfJVjW+WjJ2DeCJgQIS8mj+nD1uqB5BgS1Uw=;
 b=6ry3qVU3XP4UJrX9v+GnESTO77pijrkOgDMDQQCAIiwvA3q4NhOIFpM5LOQi9a7CjO
 aMM6pLd9VHT+Cy5YGnL6wvsuEnxHDoMOdbQp7NeFDzLTHSm8qIlngCT6uGGTVtd++vS7
 LsmpjSrzYX6Jh+g3T8Dp541yZIttej0y6CKiNwgrbrdNPOeh0Gn7SqxxVoniIhxToGiv
 VAqfuRgpzEmeUTOv8EovcKXTiCgC5z3eNq8UUHMPwcAB+w49xfjMrnzkHTsPUv7gaw4p
 xd0G3BKqNBHv9c3CxqXEf/tekfB2NOkraJ9Odc7OQWct9u+9iRcX86JqW5PgdFTwCKvl
 QG3Q==
X-Gm-Message-State: AAQBX9czPGJXUyvMXSzWvzHluo9gra5rBpFHcZgq5ogRA28oMATs24cv
 zaRqLRLNSuqZq9vP1qYRWlh/3pscWMZKo+8JL5iyZQ==
X-Google-Smtp-Source: AKy350YC2rZL4E9pgkc9HeEFpjOr1g3VUXNsEDNG+Kv3ibPRfdPo0nzK79RKT+gNdW+UChS2b8U0oyByh8n/YwznHrs=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr7300589eje.6.1681299654171; Wed, 12 Apr
 2023 04:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150147.318637-1-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 12:40:43 +0100
Message-ID: <CAFEAcA8W9NFWnusqeXqFZ8a4igzgKO5DgWCQeT7x16vNysQdow@mail.gmail.com>
Subject: Re: [PULL 00/10] Block layer fixes for 8.0-rc4
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Tue, 11 Apr 2023 at 16:02, Kevin Wolf <kwolf@redhat.com> wrote:
>
> At the first sight, this one probably looks huge for -rc4. But it's
> mainly because Paolo split his fix into many very small patches. As you
> can see in the diffstat below, it's not all that bad (and half of the
> insertions there are for a new test case for the VHDX corruption bug).
>
> The following changes since commit dda860b9c031d6a2768f75e5e622545d41d4b688:
>
>   Merge tag 'pull-tcg-20230410' of https://gitlab.com/rth7680/qemu into staging (2023-04-10 19:46:09 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 81f730d4d0e8af9c0211c3fedf406df0046341a9:
>
>   block, block-backend: write some hot coroutine wrappers by hand (2023-04-11 16:46:49 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Fix VHDX image corruption bug
> - Fix for performance regression: Remove bdrv_co_get_geometry coroutines
>   from I/O hot path
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

