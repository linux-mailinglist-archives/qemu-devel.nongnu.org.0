Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796AD3F2A3D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:42:46 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1z3-0004mD-Jl
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1wT-00026F-CJ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:40:05 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1wR-0005Wk-0Y
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:40:05 -0400
Received: by mail-ed1-x534.google.com with SMTP id i6so13373573edu.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mvyuc1OPUZASQYkqPbog/fKw5L3heM2UML2e1rGfFPY=;
 b=voDp/OBDcml5vMLyHB/yXph9rjSM/d9YU1FziW3yeexnlnq7Vasmjjdn87OclGdpHf
 MQPOjfLyoCliubSw1sYLRxSIDMuuZzYyiTO2H4N0JYEbL96LaXBjyRZ27s+uOFp7ag4J
 qpDLN1HT6KHCIp/p+AuY6qcQU6XcTw+oFIx07yavhIrcMB7cwsdb+bTLcNy5wp3lPawj
 E9xqXNdWSwCrb8zmMfp/SbYYCE2zWJmklQdkSc8OmHN76M9yZfIcKT6hmdNxekSAb3zu
 gtSUrEf10yJpdqJV13CifrHwv/2eMzAqlL46rJQoe0XF3xiSMDHeeEgMnbRGKP7xr+YX
 hxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mvyuc1OPUZASQYkqPbog/fKw5L3heM2UML2e1rGfFPY=;
 b=XorXcw0adWVYaxnJRCvnHiNzAkuNEhSZjhlCQEvNeG8+nEX2p25q+OBbEMLsVlSAHs
 mpEYTJn1xdN40ykZzmgv+QO6ITcN4NyHn6eyaSUmZqoCW3hadtnOfozP0hm9usks/e5p
 fNbMl9USfy7HuK6wMPKSMU7PrSlKSNgU21I7xZ9XZi7O2ILs7UPMYcjMhu2OsOEIPQSS
 cax5jJE8EZo3f/kSU7syfsib+FGF5rYdB88u26Xoaidsva1/HPo3XelAliqPxTedhCvp
 pqjRpb/FM13Bri7ZEvlQG6PH/Lu8WDnOK3srbgVDullnH3Q2u576tbk0BQch6KjbOqbv
 aIqw==
X-Gm-Message-State: AOAM530j9DAkhA9Npy2Q5RO/9DeaSozATSOHQed8jXoqVrYHjsI57c9g
 RINvnpYM/54IV5ceDZovQU/3OWebfeExrtMlnKUnXA==
X-Google-Smtp-Source: ABdhPJxII0jgTCZnG3CNrULRSYifGngdgUwEREHJ0nMQomBXbw117e+sWGFj/rqrCmbZtddMcXUxfOkz3VqLAuBQCgc=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr21560123edc.204.1629456001409; 
 Fri, 20 Aug 2021 03:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-3-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:39:15 +0100
Message-ID: <CAFEAcA-9vpVHH10HiDqQa2nYz1e1JrwsjBuY_JnSstmPHejojA@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] tcg/arm: Standardize on tcg_out_<branch>_{reg,
 imm}
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Some of the functions specified _reg, some _imm, and some
> left it blank.  Make it clearer to which we are referring.
>
> Split tcg_out_b_reg from tcg_out_bx_reg, to indicate when
> we do not actually require BX semantics.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

