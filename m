Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146323A7A66
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:23:17 +0200 (CEST)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5Hw-0003vG-60
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5G0-0002tk-Pe
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:21:16 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Ft-0001xM-3g
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:21:16 -0400
Received: by mail-ed1-x529.google.com with SMTP id dj8so50122308edb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vanXQharyz7xIFSnoYJr8DMwoWsFpk2t3JK+LO7FrWU=;
 b=effw0CoixyZfBeHM0B5I5XFZGrdgEh9C4mwse5hvdpBcmom8ekNVvQObVTGP59Gdp/
 m7iFzK0e+CU0A9LAapdWDJA/9gogj0h5vyPBaKTOJMHJZDlk6B5k6U0t5o3V/RW6RSAm
 aqeAp+nHq2t1cojNbpW2PRQbNY39qLMN7Tm7CIV+RnsupQSOwKFBL3auEhLzoNcVnpMn
 de0uXPnNRT7whoDhoMQsDOCMzowKodoJdTIeXEqJ3V/xCB3xi62hUIRoDv6UlyVBSVGA
 1TdfYwI+GIvxb4PGqGCuUU12Hqol7oe00vNFgYsSx9o/bKjZvvju9ZF07gP7rM6u9tov
 h+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vanXQharyz7xIFSnoYJr8DMwoWsFpk2t3JK+LO7FrWU=;
 b=RwAjW0bYbaSo3klSavLjxSC20eH47kUhQCtb2bUU7ReOpAuMj0tZvMKXX1QNND4ME7
 qf6Nhf1nz3EN2zEAcKrBGJvPzhHSnoAPmr9jqAWFCeq2u0LNvYjibk0DK00rmw4asm/0
 4UAx1QfTvQTpAg4ggKwPbOQhV1dcSp2j2ERFOnCelWK3OgI8Dr6o7W23Cyc9QKhxOY3b
 r/YfeZ20meMC2GgtujgabUW4TuFgi8RWPEfeWkvFW3RzUnXjraEJWxcVc+0gmF6s5Hoe
 id/QV8mgMNkoVQ5EbCwwlPPuVshPLPihQcHqQaIHdzqBoVp10zHdYtGI01j6659glNSd
 0sDg==
X-Gm-Message-State: AOAM530HJ9FRMpL0tdZOoSv+ccOxuKPT8x17umqCm9vPGAe0LI131HKu
 Vz1vOfHvU0Hnw9gJnzOQqbg1YsCEulYF9oVrRTUQuQidG+E=
X-Google-Smtp-Source: ABdhPJwG+/st6fLD2cH8dAEUDQuLcQxA0jMaePXPvXgP7vkNw0LUMgx934E5I2tI+24Mhg6EJJmZOEGrnhKPZdd1874=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr22325543eds.146.1623748867604; 
 Tue, 15 Jun 2021 02:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210612195707.840217-1-richard.henderson@linaro.org>
In-Reply-To: <20210612195707.840217-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:20:33 +0100
Message-ID: <CAFEAcA-RJmExKHp2HNJMtgeKR3O+AOapJgqdZ4dVW55GqXjnpQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix mte page crossing test
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Collingbourne <pcc@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Jun 2021 at 20:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The test was off-by-one, because tag_last points to the
> last byte of the tag to check, thus tag_last - prev_page
> will equal TARGET_PAGE_SIZE when we use the first byte
> of the next page.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/403
> Reported-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

