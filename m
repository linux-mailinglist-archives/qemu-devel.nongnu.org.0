Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D629441E42
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:34:24 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhaGN-00050D-3O
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaEK-0000kd-Mr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:32:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaEI-00066N-Rw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:32:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id d13so28934053wrf.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kUc48pgGdjx0LCDFytqNzCqwRBy6mpu6DAgXQ77Mu0=;
 b=Gmm7rOwFU7yZjFLSIXQzlDlA996V9IrAfwiCUbp6sXtG9hSUA6fNbzKDzVY096HeTU
 r56RfLVPrRdRtFhtrNyOHbYpF4IAMWDTy8Kdafk+kcrKNQE0vNeIJLttqZDBeTs8RpVl
 uf4K55j6nNUg3DhZsfvPDPIzx44mcj8No5FUCOeLu65RZuVKviD71FJT1AmUeioDtB74
 hp8k6VVQoKzy+E3GZidwu2Wta84BSXHsqLk/tnSdvD/5ZY+cwh12RevrL8Bu08huUMt/
 3zKyQ8xRHRSHch7tAdCOVE5i5u3Z7eCVmlWAzeqDPzJ6TqPMZRh5iFe4V/uaJBCtjhK7
 fZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kUc48pgGdjx0LCDFytqNzCqwRBy6mpu6DAgXQ77Mu0=;
 b=lG0Z2U1mSGMnFv+9BLC2kRONBmbLJboH5hkg1Tav3gtWKOodO/+1Q0NT1maSXDFQGU
 r97HZrMqDfbqynZ7fda7KDIOBv+yzvP0ijnhH70MMeuKZZ8+cX5CnF3oUQmCCmCp5sHE
 oWoBk0HjCGITq7Z40A0J22I/z7Lvjhnw/t6BamS1HNNT8kbuF2WiU+8hl5eR9gpqHeP2
 rJ5ul5Mawn6u2rb9VuhIqdGJjmf4ZogvmEmDVrwJf+rYNO5115h1gJGFmSTHPzHCoYQY
 bVHW+yQ0dpHWtsFUuUyV9Z/LrxlHOAkhHjf6FeLP6eoI57jmTt3cWvZOZmBh0eT7Obhk
 mgjQ==
X-Gm-Message-State: AOAM5334ODSbN+JA2dLeAlR1vJuowz43PlriGe6fpBuQBz3ave77nUhT
 sGOo/iKNm8waPRW7lgD7/S5VGDJmn+k4o/EC2UcMy6QBVVA=
X-Google-Smtp-Source: ABdhPJzeh53PyB+wplqMb/XQYsn/XRXJCPn1+vBEQB1Hiv39POHwKx6QwrgHLNO9RdmThf7NugNPBiRY16koq2YPq/8=
X-Received: by 2002:adf:e984:: with SMTP id h4mr35348976wrm.149.1635784333089; 
 Mon, 01 Nov 2021 09:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-46-richard.henderson@linaro.org>
In-Reply-To: <20211030171635.1689530-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 16:32:02 +0000
Message-ID: <CAFEAcA830F9Dk1ZjRfa_KihvUgMF7_nvYq4scEd8+yxYUP+3Kw@mail.gmail.com>
Subject: Re: [PATCH v6 45/66] target/arm: Implement arm_cpu_record_sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Oct 2021 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because of the complexity of setting ESR, re-use the existing
> arm_cpu_do_unaligned_access function.  This means we have to
> handle the exception ourselves in cpu_loop, transforming it
> to the appropriate signal.
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

