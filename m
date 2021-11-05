Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A744679C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:12:04 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2l1-0007lF-QR
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2g4-0001NC-Rz
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2g3-00069w-5s
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c4so14739721wrd.9
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VqeUxz6IogvV4pFJrCA00Z2D5aQn4JX5w71IQfKuhr8=;
 b=WUymZBfG9sbDUlvCuRxN92mjKYJol9X9X0dLM4pfmzYznpY6BjIJoEMoiklAbBpNCm
 s6+FKUqQZ0z2NPvH4ceAM7X21BC7Cf3gzjkIAvQniJBxMFlt/gyHFFnBVdB5T9ys9WcR
 Ocf7+Pnu6q6v1Xm1z5M/NECCLoNKAMRnpz7zNX0wC3bpNDY5Tzb29629tch2HzFKma0s
 QKRJX9n3NoCB9lqFAHxAWlnabtKucu0j4yxapbK4DHQ9OCETU4s1MVSoz7L63eXNSREQ
 rsIPeEOcIaTMeKAAROTMu/ONHnMags53WXQMjc/B3s4Nkc9RWzBa2ZSxdk8I1HHzNY4d
 0cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqeUxz6IogvV4pFJrCA00Z2D5aQn4JX5w71IQfKuhr8=;
 b=iXlOxnaaIcnUkkcGUSToytKNyuJ3cNpRvhj9vlpYsy/KFtFQwor437/tlNFJcwfzci
 lTov1bWQD9gG4SUpym6OYoO1XJdzFlDerLutfa01fedzB41ga5KrB0yRNWspDkYJt18l
 31XPIPlWRpgtFe8zvNQffR1kBadc23m5HtgBOPL7hWJXdgxKftH3Ejw2LNgrvx04qBNc
 zpMsF1CLSicOt4MXbPqfTpCJFieZTgf5YIuRRfSG3/Cl5bJzFgxxFwBPPDu1PRxiNvaP
 VqsoWcPO/uGSS3jJ22hj0ykIHnkbGlKSUE9YaGuMMUN/RQvQAGEr9FNt9sJOegP8UR7t
 ZRCg==
X-Gm-Message-State: AOAM530Ez47maVEeADH0AlKyjvnsjN8F3EsAM2mt242rZnaV9uEgS6LK
 T1HasJhJzrluyQbIyaqcUOWh9Ms0QS37v+6r2YbRAw==
X-Google-Smtp-Source: ABdhPJyARO+cTGji8gBs+iMzn9NmRppStsw+DLkQ2SodFAs1aAArCixETtHbz0NQaHefsYpWluKbIiUp11bTiMkYI00=
X-Received: by 2002:adf:e984:: with SMTP id h4mr71610612wrm.149.1636132013421; 
 Fri, 05 Nov 2021 10:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-5-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:42 +0000
Message-ID: <CAFEAcA8081OO6TO8KNwJwjxEOOK0qsYo9JDmRtm2mpT3YXjL7w@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] target/arm: Split arm_pre_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create arm_check_ss_active and arm_check_kernelpage.
>
> Reverse the order of the tests.  While it doesn't matter in practice,
> because only user-only has a kernel page and user-only never sets
> ss_active, ss_active has priority over execution exceptions and it
> is best to keep them in the proper order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

