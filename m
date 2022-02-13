Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA724B3AEF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 11:44:19 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJCMc-000887-5m
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 05:44:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJCKI-0007Dn-GX
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 05:41:54 -0500
Received: from [2a00:1450:4864:20::32a] (port=36483
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJCKD-0003Br-Sv
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 05:41:53 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so9934387wme.1
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4FP1CG2yE20G4+GyIyq6sKPv/mTkPfiLWDdxNi5jwm4=;
 b=XyzuwZ8B+l86K+cu6akfQnhf9Wjc0Y2wwuTpm0zhCj2itW+6KyQKwFtQ0UIIimIbl5
 bAIDmQ6vRwg+S2Z8a9Wza4n99HMPQgMUGMpQ2zst+f/27X1ir0rhedEif3dg1HhLVzYU
 HFGkFoEpRdpCESG+S9COo4YHMl09i659zof7vzAVbtAypGTw/7o54zY2d01+wcWbgoWL
 y+OUavUE/X+VbBd4o//qUgB3A0l8Q8wVKxIlsKw0DwMXr4yWteERWy+mdjwwC90YGYdc
 c/b3vnlCM7HlpavIJJTqaULdNxnI7gUkXMfWItx8HLuHo4I7SAxH50F/1aFLj8X0Ki0K
 46gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4FP1CG2yE20G4+GyIyq6sKPv/mTkPfiLWDdxNi5jwm4=;
 b=WOpXJcK/lEgwh707YjPSje1slVpDAcevvvuNUNrm1irWIMLpI+PjFZ6/szY64Od1g9
 HTvjNbVy+nLzxHg6qHEabRudtBaENNbT9sPdmF1XMEidSkL0IPNi0at2UDnKDETc5E7h
 waD7bN78XJulC9Nxmx3BCjw9ZgdQVBocWFwtTtwQH98PZDR/YbTgUBd+PbVRCMbyj8hQ
 70mLCaBUWRExKXvaaBObfxJ4yLwOv8TUmPvQQsRJjZXK7f+XfFBrQ4kb+LWLfGDI+0Et
 8s3ste8qVLyOgP4ldecShQzjZUevB5BN3pzudyUhXtdDsNUknl2rGoz+Sz7qP/eS7FF7
 axeQ==
X-Gm-Message-State: AOAM532W9k4WVwfu6Ovd5rzOOiN3n76/t+3V8U8ZLbkZaZlRSQoaIA7X
 4DT+Ev8UX0kZ+nLOC050MsJS82oTCtyPaAEYF4wmaw==
X-Google-Smtp-Source: ABdhPJyCGZCXJB1YJ/7aOz0AotMViR4hZpu/DNjzrT2loYPOi0v4+e75iWInjYhiFunbtb2FWo8tRvukFsouB8g5Uxg=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr6991329wmi.37.1644748908169; 
 Sun, 13 Feb 2022 02:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Feb 2022 10:41:37 +0000
Message-ID: <CAFEAcA-yBhqRVqa78s2EnFX3zP4U-xPtxpHH7eLwkPNizXXhwQ@mail.gmail.com>
Subject: Re: [PULL v2 0/7] nbd: handle AioContext change correctly
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: eblake@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Feb 2022 at 13:22, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2022-02-09-v2
>
> for you to fetch changes up to 8cfbe929e8c26050f0a4580a1606a370a947d4ce:
>
>   iotests/281: Let NBD connection yield in iothread (2022-02-11 14:06:18 +0100)
>
> ----------------------------------------------------------------
> nbd: handle AioContext change correctly
>
> v2: add my s-o-b marks to each commit
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

