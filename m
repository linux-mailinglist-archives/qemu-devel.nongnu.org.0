Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256783F2B82
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:48:40 +0200 (CEST)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH30n-0000MV-PO
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2yK-0007t7-2p
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:46:04 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2yF-0004pj-EE
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:46:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bt14so19692731ejb.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urfjKg84D4VniCkMZyWU6Sem6QSThkbLgVIRZIZR8DU=;
 b=XSAaRXpFyejfWxZd4/ZoAb8z4kr1ZjdpXKg7i4lQNM0wKG1kU2uFNq+OR+WHeMxdKj
 i8kn6js+upu0jzlii82Jp9rX/mRfAHQ54mphlUZMc0qVHQZnpIHui8SfaUvUPZwdQJUW
 lodKgmLEGsYn4SCByPP/Zld8u+ShRYXoTaqOp/xE8XfeOfkI9DXTO7CroM8t2YLXq2+J
 dKkufAZ6JVubPrichIOwg7VvYiABfeV/TWWhomY3A0aAC4a11F4s6aPhQX5bOUfGqlyP
 FEShuWmmT9pIRI6HvIhgPMPUItIIv0FUz9H6E0aZZ7ulVCjapbuxitizhGdCto2Us8mh
 Co2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urfjKg84D4VniCkMZyWU6Sem6QSThkbLgVIRZIZR8DU=;
 b=nap5FMtSExUiQkBrOMizpKsi4NQ2Cg+b7MgH0FYAbhfIvIzNs6w8cNSFSbFp/bsBid
 ZqVj1lvwQgPhQCb7x7LDf7buqT6a9/kZarmzbirjeCTFQaXGr17UaOc3F3DZeQPqODf+
 6Sv+COQy0p+nHP04Pkwg0P1LxyZiJU9rb72jTRRA/8uruxplgLXpU470L/OR6i0SUvvJ
 Kayy5Ok3oglcF9MbZVpJRongztqt/+iKhPueU5sIedm+HXKaAZOTbUQ43pnKa+kC+95c
 brdcg5kTR1dzQOoVGlrmhb9BnU2zZuKhQoXYccnQLD5sLr5iKx4CZFevf8pCP6ZqbgNQ
 +sHA==
X-Gm-Message-State: AOAM532a2ayKmKQ+Khuq/u3406T6haDfE5z2BsDL7MweNMoFAwS2R4im
 YHD1A2eHNjs06grXG0vNQcDAP/m4yqb6gHp/7snj2w==
X-Google-Smtp-Source: ABdhPJwFhxIRvQOYs9Gf8vTEFayMtfOYGbtF3PgPV1V9xV5AFRe9xCoqAJS1zvpPkVK6wINnBX/YceAEO35BLRcsb7g=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr21511846ejf.85.1629459956970; 
 Fri, 20 Aug 2021 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-8-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 12:45:10 +0100
Message-ID: <CAFEAcA9xuQqVjdyXkRHNhvTinaCFkDBGai2yoqF1Jv=mMFFfdQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] tcg/arm: Split out tcg_out_ldstm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Wed, 18 Aug 2021 at 22:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand these hard-coded instructions symbolically.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

