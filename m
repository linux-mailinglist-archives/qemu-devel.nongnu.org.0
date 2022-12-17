Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868364FC6B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 22:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6eca-0001qq-GQ; Sat, 17 Dec 2022 16:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ecY-0001ll-0I
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:21:26 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ecW-00080G-BK
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:21:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id a14so3924573pfa.1
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 13:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=REytSkDAhclRxE+xXTf5WGP2QKFFXdKfWNNwKhxiT1o=;
 b=L7CSHLBIe8RUlJUNfRVScTbZaPh05Bc5i3CtA2xDxDgH0o1TdWyoaIxq5tYPwrFeq1
 /xEPNZGgGHGG7lcMjnlnQBDMHGdz1Tx5P7HOrsYDnGdeJfSw/VICzgVd+M8YiYSUxCmI
 TaO0R4f2Cp8IOWtHw6GJchsZi81675Ivg2cAlxbZcsF2XXZ4gmuFubuprgSHkJRHPVot
 Zi3G6FzLPB3hmybIxncRHn91xiEreRFzQhOdm9vd7pKnPUROQQ1WwNtpS0AhX34O3waq
 uazO6gPhsQEo6dwkK5ttVid//oab5aM98R+Xz589CaKOvyEuU3krRyohvQobGhH3rdje
 TEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=REytSkDAhclRxE+xXTf5WGP2QKFFXdKfWNNwKhxiT1o=;
 b=m1cb3j0HbWF17rAPmUOUqXzJjQpdMA5K49Wl8trac+t/u2HtGFruKAm3qWJ4GUs7yj
 Ei1wEZhSKzLL1OSY6qRXMWH06QFpvZD/0fyZlJJgBdJiFJM70kp5KfK2by/nkAn6crDE
 1y5yxa2XFwPRA3y16sXZ7EvW+HZoHV3DsOVJANhlvN60GbA+UF8kTfY7wg4qfI00vThV
 wkK54xpQ8hNLciBGpO1Up8Yfrn0omiQn1jFxnJnarfLoaCkz4b7sgOKJM+iddNZT4W9B
 P8dNDHPeDxOxVAow72imNtDYOjBTdHT2xmJieZkPuBhz9/bpL2MUqczImdSNKkZqftmh
 0qBw==
X-Gm-Message-State: ANoB5pl4Ki5wIfqqoafz6+Mvgbj8IZmxweQVvXZdQTL5BY1ceR61INg5
 MXdG7F/xH9gP469FWQe0KFcQ66X1HLpn9NBRUTNCxIEz7IVVqw==
X-Google-Smtp-Source: AA0mqf54Q6JGCDZEiYCJZ/KBx8EK4Jl6FOUZa8o0mQENcJHsVS0cDliAb/aKlPKsNR4aiFoqoiwsSXx0C8FBeCQbhiM=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr80542582pfe.51.1671312082773; Sat, 17
 Dec 2022 13:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20221216204845.19290-1-tsimpson@quicinc.com>
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 21:21:11 +0000
Message-ID: <CAFEAcA-U1jAteU7pt1zHTTdk1tB2mdT4rHRBp_GOqpdtqXrDGg@mail.gmail.com>
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
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

On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>
>   Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20221216-1
>
> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
>
>   target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)
>
> ----------------------------------------------------------------
>
> ******************************************************************
> *****                      WARNING                           *****
> ***** This PR requires updated CI containers with flex/bison *****
> ******************************************************************

Does that mean somebody needs to do something before I can merge this?

thanks
-- PMM

