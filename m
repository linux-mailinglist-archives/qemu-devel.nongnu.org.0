Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E376DF768
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaga-0002uz-Rj; Wed, 12 Apr 2023 09:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmagY-0002uk-1u
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:38:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmagW-0004ja-9M
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:38:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so3660413a12.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681306730; x=1683898730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dzMlssEei5ipCwGgAf5bATt684NRlZaMeG08WMBJFGw=;
 b=XnrY5Jw9F4EEtbnt5oe7ez8brSVYrMw6v8SHSP+BD2MLv/NuSPxZKKkN2C8w/IJBtu
 X7D0kUBMHbA4IDubRupH9CHTnv0549Yos/eWeqM9Ce1g4xJpBcDzDgmoEoD9sV3ma0q0
 EGYXvt+iGkuOuH8uWegtZzD22ai/qFauVbbhQTQBQCN7nLLuDJp+MQFG/uRoWJKdk+Ck
 ErQypFTrlk37oAKOdVRDKInAzqEz50gzzTt/dBP6ffX0MHq5r1epnhL7g8CRvLTJa+Mq
 0+TUGr9/dMa5b4OCaOESIFJJFTgGGK43O9CE+H29fQbyQ/zcAUzidYaoI6g5VGcwD6Sp
 Yk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306730; x=1683898730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzMlssEei5ipCwGgAf5bATt684NRlZaMeG08WMBJFGw=;
 b=baZNnW8KEnlkke6+LnYRw55vt7cSytL96cSuX/rSoBV/p0Er2Mu7UIF1odCHa2fKy0
 Hdu2KJO5z9ntjVnNtltZfcg6V9tZN+8v7mgmVvuRJaL9NRJiJ8V0d9ZrgeNjC8rSshhZ
 TrjIn6b/E01GLMXJnqqlYOk997eJHw8IGX0L6UKwZsGJPX1rKJ5/ZHjY2kIgA9xMNqt0
 aT8kRULSuEx8ZnawqHXGSRXHKqZRxRZrlMdryRh1T4+6DDAAJDEpYDC+m5sW8n4gJDt6
 cRcaslJf0Q/WegghcppIe1eA61Qa3lw2jlMmLVmXa/6ujb0Eip+OgBJMK6FXH6B9zKi9
 +3ag==
X-Gm-Message-State: AAQBX9cAfdfd3yY9Gvs9No1rCiTufi0OYwUe8ftiHOOuonOMTlqRmSdN
 Ud6MArvdQsB9rt/ZxXzvJC7B/hdOQw4b0KLL5aZqSg==
X-Google-Smtp-Source: AKy350adrt7Qjs1K9wCI18dly45wlASszmzS19ap1u0oBotTmekBqHT3aXuPXrZkb6AkIhRJLvLqGrA1QnYRx5mkgj0=
X-Received: by 2002:a05:6402:3605:b0:504:b6b0:87e3 with SMTP id
 el5-20020a056402360500b00504b6b087e3mr1803398edb.3.1681306730369; Wed, 12 Apr
 2023 06:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
 <b3719755-4a28-b493-0a56-0b8d14835586@weilnetz.de>
In-Reply-To: <b3719755-4a28-b493-0a56-0b8d14835586@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 14:38:39 +0100
Message-ID: <CAFEAcA94JVCx1PW4b0wDagfjHwBfcuT_HrU=6FTZBvAW_3zyfg@mail.gmail.com>
Subject: Re: source fails to compile on msys2
To: Stefan Weil <sw@weilnetz.de>
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Wed, 12 Apr 2023 at 14:21, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Am 12.04.23 um 15:13 schrieb Howard Spoelstra:
> > Hello Peter,
> >
> > My source was cloned today. I just cloned again and I still see the
> > tokens reversed:
> > git clone https://www.gitlab.com/qemu/qemu
> > <https://www.gitlab.com/qemu/qemu> qemu-master-clean
>
> The official URL is https://gitlab.com/qemu-project/qemu/.

Yep. I have no idea who that other gitlab repo is, but it's
not us, and the repo could contain anything...

https://www.qemu.org/download/ is where to start for the
instructions on how to clone the official QEMU repo.

thanks
-- PMM

