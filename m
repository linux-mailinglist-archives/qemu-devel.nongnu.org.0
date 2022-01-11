Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6448AF3D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:14:44 +0100 (CET)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hv9-0007AI-0I
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:14:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hsy-0004PQ-Vs
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:12:29 -0500
Received: from [2a00:1450:4864:20::32c] (port=44911
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hsx-0001sD-2L
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:12:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so1898514wmf.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NAoJdw7b727xkhuistKwkp4G25ZDa0USpXQduTtHLQE=;
 b=pHAcStTxA2ooFuNyhdJo29Hd723FZ8WXf2AtBuUGl7ZHX5RvI6Hdste5xP7J9gUEnM
 kgjVIYl0q770TIWfzA1FaqayIOxuMD9wAxjM3KVj7bltEUH0W9bJ+gMVc4aeTmo1p8XU
 CaPl6CSUA5VjeTjTZYrF14CT12368NEoq4fM0vWCJVB7+SfJJ+JDBHUpvAwFCRVtGAvc
 p7kFJnmhTDB1K1K5A23xazMXBiE9xMMX8f4QxZpR8T9r14H2unCaHokiWIKUbSr5y7fK
 HI6ozfDG5NwkTISwX0b7gdxPUlbocY15PVIbYAcgbbC+qNfDl51UdCXI4UqdQapEE1PD
 8RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NAoJdw7b727xkhuistKwkp4G25ZDa0USpXQduTtHLQE=;
 b=c2VVRr2WFU0a0QpNhBUbGLgJEHuHbY2kbl/Jc3LUsuL9pn0tTKMbUg689woszhBVvm
 eKL5hyScZ/ULkOBXaQGmV6nImG6zEiZW+/X0pMzLD+n3n7KBdbxLTgOHpF3vpB1EOQaH
 rTet+TmWsHYq9ljFzrRjGc+SdGVgOjuLII729ioAOdU5nX58DiZ75LQ0i0mrokuMfjAj
 UiUw28nXt0TGqybH/64nIqgMK7Sshg8xcyiauB31Tpml5AObzGnBb+KB53txbR8+dOAk
 kWqpAXWn2TMY+dNrHG1cd8aPgXx8rXiCQUv3m3OqBVI34xDPW46s8n8GfOAHC3bJ2Z7a
 QelQ==
X-Gm-Message-State: AOAM530AXKKY2LIBstPp2FfggqQVlR0Ah1fB7+xhUauc7ZyGhFNj4fXM
 3haBC6n/LqMdsxxjVXV+nTYAjOIFXfgQO+Gp79VlvQ==
X-Google-Smtp-Source: ABdhPJzHwxolX6W5iWYB4FsBgFObYXKkI0YerC1NIpo/XHMfURR/9UBiFYKm7qlisorBZLvqvj77UTH15kvQX5cRCHA=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr2358566wmd.37.1641910343108; 
 Tue, 11 Jan 2022 06:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20220107184429.423572-1-f4bug@amsat.org>
In-Reply-To: <20220107184429.423572-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 14:12:12 +0000
Message-ID: <CAFEAcA9LiMoUfCugQMPU-aXAWkHm_n1qz5PXa07nPzS2hXFsyg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 18:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This series simply extract the MV88W8618 device from the ARM
> machine in hw/arm/ and move it to hw/net/.
>
> Since v3:
> - Rebased on latest main/master



Applied to target-arm.next, thanks.

-- PMM

