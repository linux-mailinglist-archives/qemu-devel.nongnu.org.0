Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B043143B2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:26:15 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fv4-0002FX-51
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CKb-0006Gq-T0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:36:23 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CKa-0002Z6-7r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:36:21 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lg21so27074611ejb.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HcQ8u0aEB3tt+acz3VXoGul/5ToUFFZgrMibdilQU+c=;
 b=voSQWQoaGjtjhbuXkCzC6Q1xAGxXQeHES9YNS90p3iWI/hRefyk2BUoQDmnRSfWYNn
 6r/XaHQ3XktKxhUg0+n4JGjoKxn+nvXyfXP2TnH9RR1BswoyYOS8BV+QX23ZuO7pNGJp
 U09GcMaz/mQyqeKxbzyzVHbH/zgBkd/w8leib/R9K9LmAL/2toQMgCCKdivwzNUzt4QS
 OtWZtrLZr+ehKVS4c45vw9dB7v51kk7T8N0PDMylluZhle32jVpZiVSnJt9UMor3v6VK
 2f6b82RxDckAyIYSTJTfoWM8zpO38QFVISRNuS4ogEJDIUs22FI8vMXDwyakJOYN+x4w
 m5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HcQ8u0aEB3tt+acz3VXoGul/5ToUFFZgrMibdilQU+c=;
 b=YHA4sN0DRyfqMdWAatScQiNUgsmV0jSnwuZZ9M87CUGu0kv7WNyZxRYEMAejmcNIgm
 nGtiRxgQJnyibbmY3Sr7wxsdi4oxkn/ztBNOeyFgm0yShDssTMsugOgwni2jDQFCWQQM
 Z1wtCxq1cXj6oUFrv3jb6KoZ+YCoZrByTfoiaiVckd/r0pzM6OnzfRP1nKSS7W6TAK4Q
 kXsR4JEpdhigkjyd0xCwi7HBWoU5DE4LQ5kBs+lEf+GfP5LXg4MX5JlYgyNQs/UlurOs
 8trjk3QaGdx446r7kg6O92CHEZyZHZE7AUo5SyQwlQn+jKnQnvycFIKjbrMz39Ykict4
 6GNA==
X-Gm-Message-State: AOAM53005rT8PeYU9m3liuDLmHwsHS0TiMkw/HwPks5GWic/TB/WdQbM
 ZpGJBPiR9I3jnVlryl82qXfX6WKfeXd1gibd2xuAbg==
X-Google-Smtp-Source: ABdhPJwaFqgyduo/BMhROwA5qo3llsnhS3WBm1AKMPbbrycOnUubT2jidjvr0UPmhokwO/gJoU5PhX28A/8DHHADu80=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr18444981ejd.4.1612812977849; 
 Mon, 08 Feb 2021 11:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-11-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:36:06 +0000
Message-ID: <CAFEAcA-gUte52pkntLwok7KQy1c2KetjbNTL--jU7AYD6ZpsXg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] tcg/arm: Implement TCG_TARGET_HAS_sat_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is saturating add and subtract, signed and unsigned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     |  2 +-
>  tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

