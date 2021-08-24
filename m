Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8E3F66F0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:28:25 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaDo-0002Zg-4Y
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaCc-0001IA-DT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:27:10 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaCa-00043L-Si
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:27:10 -0400
Received: by mail-ed1-x534.google.com with SMTP id r19so32795815eds.13
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EiEVojWDM4A24s2SfzOeKseM2pXJnNQgoig5WmP2eI8=;
 b=t/BL44c5gNZ/z2c6dEn5al3zmrZ+ByFKwIw0QA3M75WmD0T+zFw66QcxwxQWoUaIOw
 M9bS1W1i5Qt6dbhvgrsjlSNlM8fW+usEu2bUpe945bvVOpY/l6bWsOq7SSKvDfM4nYPi
 STeaxSg+zl9Qni3ACkD1sH1Fhty6ElEpxalGXl3e/lfxF5/qHXN4u6qEoLagCnZ5Eyzf
 WW4bEof/AXKwWM41Dti9VYoCSJmxSdTPYmFi/wqplyvqfBYPA1zlp4kkVQWg1ou8Fumw
 K8BOLWo9duk2T49G94VXk/oRYuz7H/oagagl8iGah2WpR++uVu9GTZw1OHEFSyZViJHH
 Cgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EiEVojWDM4A24s2SfzOeKseM2pXJnNQgoig5WmP2eI8=;
 b=WTPXZ9VH2WfsFg6q02HfzSr7BZkxHdCTInAIY73+MkmLDDLYHhOUze/GjZrk9f4aNX
 hEASM45Crt5fV/68TZEVY5g4P1lQlSC8xLsRp6yCtrbVxAP/wPKQd905KVEJYqalsS9/
 Zioe+c1avDv9XhtYnywAGxSZoZZ3HzQyLd9lmvJifvXmZhPtWgxknUKLBRApapJMWEj8
 wLGUc5GRL80UXPwywr7ptItv0O9nIdz/My0Jk4usgQSD9pJAjcO5ZcwhxSx9atm8ywmV
 2EQB9yFU6Z6x1vk6ZQz3wrAjdSS6DuzDtyJzWyR9qR3224yBgtEYenhbb9XCxiNoeMF3
 IXqA==
X-Gm-Message-State: AOAM5319yvg4QGh2yteO8tAwZ1x3DmISxKv1/BQ7gHw9edfbuqk+SaY2
 tmc1Ob2URsv8WZ5acNiP068fHJ+uuWxdh+LRkVJUuA==
X-Google-Smtp-Source: ABdhPJxUANp13b0aPg00ETNMWMn/m9OIkG/KLhHzr4fyWYqcP821ogVL7T7DKXKAQ1PqmHU1bJ4twFTtO0SnkRpxjjs=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr33279652edp.146.1629826027436; 
 Tue, 24 Aug 2021 10:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-31-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:26:20 +0100
Message-ID: <CAFEAcA8c5AsrS5JQr2ckjhnR=j=c7_aBpHd-DY5Zp_oyk0iG=w@mail.gmail.com>
Subject: Re: [PATCH v2 30/30] linux-user/xtensa: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/xtensa/cpu_loop.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

