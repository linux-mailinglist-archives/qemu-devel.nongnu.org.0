Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48490529B18
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:41:45 +0200 (CEST)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqrpv-0002Z5-T6
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrmS-0001in-0b
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:38:08 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrmQ-0001Iw-FL
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:38:07 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e78so9970014ybc.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L4jGsTrgilJcsmmAETlsCBp9/k+NL5ciuhl4WOGelGk=;
 b=mkmGJmzOdbGErJu8UH9nWLpsruFhxe6Zblwt87mIkua09Wgj7eWnFb9zg5AEgq+7OB
 bgVS2m9//8bFTSB5bGPT6dDhBwLx9dkCnDJYv/aORKyTLI4MqyWD+5a/0hXX4hNP8m6D
 KSLzGv8zZGKINkImHUQO5uwo/LC1Vu7D5M2Ux6/Sm5LOT611zrnriWQX1TaEbSuhxtAm
 45j7AWQEtgQ/IoDohdLAe/Fyx8/n3WNq7Vmh+2oBLr/LwfEUa6TINUEE0SSf6hEkzo9m
 MQ9r44kWePi5++bzhpbEj7K239hdW9tDN5rGsX/4eGxgb4JcE/dQZgbIp5XwUZll9L9u
 zsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L4jGsTrgilJcsmmAETlsCBp9/k+NL5ciuhl4WOGelGk=;
 b=QrCF5HRyvTCvpB+9ToR/70keMpbWsrmwdPGlYlDtZarB/O+Zt6ffElD4r+P6ygajBw
 QkRXk/IAiKnmLAMn94lNSzRQYklRJH8zrAfWbL5+Hx+p+RPQ/WGL5qaSp0H5U0eO/BZY
 GOPwGd4/deAJVXNUuuVvxnpUEF2FEZzckPFYZ7jrOgwFQODRUo4AbEO1BT0/Wx+96kZ0
 wpEjNjaZoZhC5iO2E7X1ak1Ch2o28uBY4El3RrEp4px1lVGd2hWcmiSZuks7Y/doRRPg
 q93YG97/ZwaRDh2o9Egb/UmGG/cnWfo2kq4LoXJiOkB9tQfi5crUuRamZu6hWGFPwL7J
 Hv2Q==
X-Gm-Message-State: AOAM532jg+jo+RgUjAOc83ooIO21XH6KAkc2L4Zt+JgLdlcPJibtA+4N
 enGcl110fFmUMPDi9zVjC3nAaMjKZ9WIv0EIsTNxpw==
X-Google-Smtp-Source: ABdhPJyO9uJMVuwDunzJuv82Fs5YL44oV6QNAOA2+Wv5KL8jL4PEr3AIZgLyzXAjxxT8EWrY0ptiShd8+oQiwhoOccY=
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr21076033ybl.479.1652773085499; Tue, 17
 May 2022 00:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220516210519.76135-1-eblake@redhat.com>
In-Reply-To: <20220516210519.76135-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2022 08:37:54 +0100
Message-ID: <CAFEAcA9o=XFX1zE_u=q_kUzV6wP_ANtMem02Oz3Ces1XLHemNg@mail.gmail.com>
Subject: Re: [PATCH] nbd: Drop dead code spotted by Coverity
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 May 2022 at 22:05, Eric Blake <eblake@redhat.com> wrote:
>
> CID 1488362 points out that the second 'rc >= 0' check is now dead
> code.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 172f5f1a40(nbd: remove peppering of nbd_client_connected)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  block/nbd.c | 8 ++------
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

