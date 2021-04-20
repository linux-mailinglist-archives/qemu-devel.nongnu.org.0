Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B7365902
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:35:18 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpb3-0002zW-9i
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpZR-0001cY-KC
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:33:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpZN-0004HD-VQ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:33:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id mh2so36460855ejb.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqJVR5+rIPOod+Xo/PUuTHSPfdvDM4/KfxB399n8ExQ=;
 b=w4/KXM3RZjMEJ43zlW/401cWA/jt8c5hKjYrL4+DcfnRt5QhUavjL9qQcx2asxpWca
 tW24IDQA4UJ/DqxE4FBNj+AEK+l3uW5ttH0QeXNQNRarSb0rvm0JQI/jB1PmefYMvWaQ
 z+gElfOXEio9YTMi+7QrzpOGQvtRdzZNTS8F244hOcI9m3P3aLlmjCAqy+Kg/pAW3Ne1
 0YxnJLXBqS8aM6a51GFSMxM4BnoUR94Xt5ppcpYOARdePDhp+3dw1/e1kEr5d3P5n/1E
 nNIigRmwVrtZq7JHDUFUnzITNc4u30A5fPOqdjyweH6hVaNGcGk5UqsdqOBbrup3te63
 XcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqJVR5+rIPOod+Xo/PUuTHSPfdvDM4/KfxB399n8ExQ=;
 b=cl+JsLA8dUAW9JCH9Ea9Rdm3DQMgD86b5aTBVERRLavY06R3T4QmdxJpuj7oKnJbct
 je8+KS75idpd5M2dKAhqNFiYoxNgplPY/Nc0v0Ej7u8WG+BOSex0mrAdTyLx0qgqWEFJ
 6BbqT8iDZw6qei5fvGOEygxv6g8O6OKTYrnUv8ZxffoBQ2GuxkOvcigpeFUNN2owPGmh
 u9ypGXYRakSmRQNr/khv1dVo1G63GlJjBvKnfZ+SwJpu/dMettXr0JjCy07fZ+nTJwDt
 gvhg+Em7t9b0dprvsVz+BWJTC1idqUN2eSjRu3ZpUEReBtD9OrVjDFjx5ODYKjHT0Mdi
 Y0/w==
X-Gm-Message-State: AOAM5325fFFDta7n5bsKwV+dquIH7UPZu4XlwWe97QTJqNu7KYiEc6LC
 MqW9YA6WCxaBVKSPJ/53VMsRD21J9WKqzWC0ZdsZdA==
X-Google-Smtp-Source: ABdhPJzPSv4ai7h/YF+pY9kh3dMb13tN5V/JuT+Z+WtgIt7O0+Y4v20bTB5ckoywf6agI5EjzNYbUd/OR80+8luZiKc=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr27294940ejh.4.1618922011212; 
 Tue, 20 Apr 2021 05:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210420123106.10861-1-peter.maydell@linaro.org>
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:32:39 +0100
Message-ID: <CAFEAcA-q2paH4Cf6SbvMTN6TvQGEK5UPSZ5tYoPgPneYH-3z=Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 13:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In tlbi_aa64_vae2is_write() the calculation
>   bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                             pageaddr)
>
> has the two arms of the ?: expression reversed. Fix the bug.
>
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

3 seconds after sending this I realized that the subject isn't right:
we flush the correct TLBs, but we might consider the wrong number of
bits in the page address to be significant if the TBI enable/disable
state is different for SEL2 and NSEL2. Better subject:

target/arm: Fix tlbbits calculation in tlbi_aa64_vae2is_write()

thanks
-- PMM

