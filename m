Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496A34A91C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:55:01 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmvU-0002EH-3S
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmu0-0001G1-HS
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:53:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmtx-0007Ad-KX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:53:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u5so8529053ejn.8
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/r300invH1PxVN8CzcSV7i0rK0ckr+0Jw88XFtPxus=;
 b=F+8uJDOPupUnRt9/VZOne9JIiNxtck51oz/MNYILNmqkKnwWqf3vnIASnFo9AnIhQu
 old1xxZfojLBdDUpE+7ydhF3vKQD0DjHhikGJQZxm30qPfeTQoFieafDHGTdqotgTWAm
 kKzDn7oW34O0YhefoPKoYfraJS4HM+bHF5SafpTH3SQT3m6i+eRTrMU1EI7r3uu0+Nj+
 eQ3N+wnIF5c4wk3vQTMcW64tEK83cdM1DuMTuU1m9iIlVgXxxkiteLw22vVeMsEsThUU
 /DdLIp9PyEmGBzbSCcfmjLQ5gQ5lm6vAdFQhbobu9E76YwA5XY6kNvOJSuaSor63oXS5
 GOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/r300invH1PxVN8CzcSV7i0rK0ckr+0Jw88XFtPxus=;
 b=AQHXKPz8f1Ih9S/FwtuXL7uQ0nPHGoxM0U8rilrCByiMJy765Lu6oZopPYYzarQqyi
 KOdffshldg+m72JH3HD3VAeIm+r6o0PvBW8ANq4HRXVH85BaKnyPVY0+QSS9lINAy478
 PRtdLkKkprr/iJ/EYXMdGxpBbBDR8ku/TQudLUixGlzW9Ikroarqz8LoXVX37vBiroBm
 xoJ1zSKhz6/mniAlaflv4X2WctmXh4auI1HhwCx1e+jd9TaAwBA3eU5zz3TqDWlKv0Wi
 vetAzrk2chdoZhheU7bhNjTPGdTHQCedzeezjwkjaY7C4npkXvKBm7oAGwVH203hpA4C
 Gryw==
X-Gm-Message-State: AOAM531D6UtI8EU9ptW9GYIGk48Yj5Js8/L2Fhyh/GNtazCs8C3cfoZr
 qp/9ITc66a4HLsg22CZ54odh3vGuUYB/EvDC7Asvzg==
X-Google-Smtp-Source: ABdhPJxgpJLkZjXWfrp0XRhxL2Wsw2gtRUf8uf+MmrEnYskEcJkVBQ8Q6SYnGKKxMWZ6XIao0ppo/aL7EBa3WJTZdlU=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr15809177ejb.56.1616766803962; 
 Fri, 26 Mar 2021 06:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210319195044.741821-1-dje@google.com>
In-Reply-To: <20210319195044.741821-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:52:55 +0000
Message-ID: <CAFEAcA-qEQ37qN_apNAFK_iKAYY2xMKCpMvU7DpxdcYSY6vNLg@mail.gmail.com>
Subject: Re: [PATCH] net/npcm7xx_emc.c: Fix handling of receiving packets when
 RSDR not set
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 at 19:51, Doug Evans <dje@google.com> wrote:
>
> Turning REG_MCMDR_RXON is enough to start receiving packets.
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  hw/net/npcm7xx_emc.c           |  4 +++-
>  tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
>  2 files changed, 24 insertions(+), 10 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

