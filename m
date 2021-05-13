Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B790A37FE17
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:28:24 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhH0R-0003AD-RH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGzb-00027I-Qb
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:27:31 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGza-00087L-6s
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:27:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r11so8158974edt.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPnPXZ0YHJp6YkeGsmM3JguXdK/Y6nMelQAfs+ufzrU=;
 b=CRD5TgQ83CVVp14Zh6Lpoj+3aB1CtjAKoFm1Msz/jqNV5WKIou/OheP7pDXPZrbXbq
 oneMEVPfdPQkwnshLfjx9aQZ0LtfXLyERpF0qkkzVsnhN3P5ag9w+htefGX1s7XW/uqZ
 xJAuSQx3IEeZGNX82YvTGdnpka1bF/jtLgImvW7Szn8JVRXEbw5VrO2sxzugxznE/FX0
 iB5MqFcq8PYuiXqmcj7FKFMOcqck/9Awjtp2/wX9R9nU2F77S/aiv3cSKcbzG7ttkuIV
 ai5vwodajKaZ/d/JguCJy4GAcsUVekV4JkI6UnRYPuNkoyPMixPtH3usqw2hfAcIRjtd
 hgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPnPXZ0YHJp6YkeGsmM3JguXdK/Y6nMelQAfs+ufzrU=;
 b=jGoANEKU1qiii8CF0+uCSBw8OQ4QkAS74KvSYKFWtzAeG5n/OZjeGaRsmGlfwSWcwb
 kEz4kY2CTynsT1j+puTa2VZx4ANApa+SvOjLQMZ3B7qAyTnjGD9BwKKZFyOxsE0eAzns
 D0JmxCb4rjvdG3si7kHW3uAeHWFtq1ud+NEQlEgoAtWIpKWbJ9kIvYpjZlhqZwQQG2Dy
 17pgtJHPCV2pX9CfyJ0Jv3Zs8xrM2NLIycugqG1KN1DoJ32Po2zD+wCfyn2Sy1bmNFgO
 hJm7PO40kBiIdQWlFVfwsHqYRSAFhmsZPkeEjjSs25n9CxlxaiQw+lShGDjNAk21o5AA
 lkmQ==
X-Gm-Message-State: AOAM531NhSHJCQY5S8bveVsK0reHHnGQVATSN7fDxZRxlguuMFlH8ka3
 aeZ0JbtDOANla+a4Ru9RHV6HHcFay196O03FwVwJrw==
X-Google-Smtp-Source: ABdhPJzgWUXGaKDH0WLvkH7kx5eY51ZjYBOhG70gECofzqzikZAZ0uGZ5JsWeos7URi2PSR0OtPrUn8Q2FynoDiYGuY=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr51338435edv.44.1620934048764; 
 Thu, 13 May 2021 12:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-79-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-79-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:27:17 +0100
Message-ID: <CAFEAcA9tscqNj0Z9u0Tm+zCa06XDu7KG6=m=gfCq3tM84-j1Wg@mail.gmail.com>
Subject: Re: [PATCH v6 78/82] target/arm: Split decode of VSDOT and VUDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have a common helper, sharing decode does not
> save much.  Also, this will solve an upcoming naming problem.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/neon-shared.decode |  9 ++++++---
>  target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
>  2 files changed, 28 insertions(+), 11 deletions(-)

It also deals with the issue I had while reviewing the
previous patch of trying to find "VDOT" in the Arm ARM and
failing :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

