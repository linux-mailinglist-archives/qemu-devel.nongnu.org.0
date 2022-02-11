Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968884B273E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:34:25 +0100 (CET)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIW48-0005go-AR
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIVPn-0004J6-B8
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:52:43 -0500
Received: from [2a00:1450:4864:20::429] (port=34364
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIVPi-0002bU-VO
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:52:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id s10so1558751wrb.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZZkVQt9cNPfiNjE6LEU/I/S/34h6LKQaHp9nVjyl/Y=;
 b=oR5LomUeyeNvP+sAtE1u+h+tTLCRs7MMIGYvTZuSwo3GhIz9rU8SQQ6pITVajv6cYN
 7sPQPA9tRmAWSoOiWCoU8RhnUwXUHj9NfO+66vZz9+t8o4WkK8U1JctRu+26Z+bEPy37
 c3SBGzNP95mthxGIjmJWRMw2QBohhnocQ0kIbcDvc27P4VyDoC+WdQExStXXzzlDZs0p
 Ct3r/Ft6+C82k4j9XcnuUFCEDh8TC1znEl+2jSWHEudGqdEhbyGEbBevjXElSLPU43sD
 j5LTdmTO09aslLNvArowWAvVI0pzLJENsoPi8qh5R3QV5QT/h5esp6MouV5y3YlKhhYr
 2sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZZkVQt9cNPfiNjE6LEU/I/S/34h6LKQaHp9nVjyl/Y=;
 b=MpUVxcVzzUB1umIEFsfMjUnMvoi6NHEjxioym4EqkQ3QShokdKsp1Obcinx60LyuZx
 0eeUZH0sMAfcan274RnCAzJvViYrhh32g2JHVK2bv55ZPwgHvPshtLi8gBK8s/G5n62d
 ORWEJ+Sl2TG5HxbqBR2yxjBqTc7Xeef2a04mldOp0zMF6zqGeLD/nmob+WY0bcQSZWqC
 DzDY0Vr8CfjZ5KVUyPXEQMIBIEiDoqc7W3wPbdE+YXL2fbjIUXRJmCGhMGXAPX//kTaQ
 QVtqLW50aMWRbqqn6T/9EN1ntmGpCGQealVmMY27NWKtqkqgiAoeuG0ueQzBmts7G3qx
 2w1w==
X-Gm-Message-State: AOAM532eoNBEBMX/iq4Om/mGEWWolv0jRPamr/cu0VwA96M8Gpkj3GMQ
 qTjyj0/nKItzXYHX0Jgs7yoAt0N+cgDDdpqYVaC4gg==
X-Google-Smtp-Source: ABdhPJwv5YdorEB37/2e+sVJfBQSTxqEMhc3S7uzxLpB4QZXxXq49AVhUjICjDCQd78pikjpec9Jl1Vu7ljsymAB2/8=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr1293405wrv.319.1644583956446; 
 Fri, 11 Feb 2022 04:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 12:52:25 +0000
Message-ID: <CAFEAcA-12iJfa7F-zGBb--V3yehi3iV2A6u_BPuEFb-9kjHBVw@mail.gmail.com>
Subject: Re: [PULL 0/7] nbd: handle AioContext change correctly
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Wed, 9 Feb 2022 at 14:03, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2022-02-09
>
> for you to fetch changes up to 1bd4523c2ded28b7805b971b9d3d746beabd0a94:
>
>   iotests/281: Let NBD connection yield in iothread (2022-02-09 14:15:29 +0100)
>
> ----------------------------------------------------------------
> nbd: handle AioContext change correctly
>

Hi; this pullreq is OK content-wise, but the commits are missing
your Signed-off-by: line as the submaintainer/submitter of the
pull request. Could you add them and resend, please?

thanks
-- PMM

