Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEE3DA3AB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:07:00 +0200 (CEST)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95kZ-00043b-EN
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95jZ-0002n0-TB
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:05:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95jY-00042E-BY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:05:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id v21so10635183ejg.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LtndFMb1Y+WUREYFxrzTg1ynlChw+q3bvZlJaLYdleo=;
 b=VclmTZt5sncPS2GSiLalRCRMWdzuHekrltUR5HlihYr/IBkeTtfsD/t+oEci4e9efR
 zGC1Jmug8b8ZkopCUkHLmwKn+VH+QvTpCrLB1E9NxZTPar54I4qNwaRMZGKCGwo0ukb+
 SK9og0HS09WGYN33WwaI7j1kKGHp966NyvhFLxXfLF0fvBLbTCHCtAflDHcGQcAWWdit
 XQdX0JgGTelmHMh3YYHHJ/1khgIayPeFMkUlJ5NpK15TVZLUtjQ9LK4jLuPatDQToVmE
 TcpevM1fY0poLmbBF05CvS1+TgfBCnDjRMArI18QwKy1XS8CM6RTVLcIGt8L/PKaket2
 ukqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtndFMb1Y+WUREYFxrzTg1ynlChw+q3bvZlJaLYdleo=;
 b=MDM5o5kxb/TL29xUjMtFXDpE9EBCFLmedgYVLVCkiMsIYV38W3cGL6w8if47lXcr00
 t+t/g9pcbMvHzDP2eZIXMXjKjRzIgrAgrIhe8HLjevj84puz+ltMC5JOTYC4S7kDHhrN
 H9nNb+ESGUJz/hkF1drELZ6Vs8c6/yE0cVi+3AJ5k1PtJonafVapTf+PCDTY8SWzfOf2
 trjW1EEyIKiwb855M+PqiMmE8g0qF1DWLKAvGuSGyLC7qEPAGL1fKfgJOP2iOiUNLJTe
 CIZLj2IXoHw4alAdffMKQbg+D2yo8pJ8jca0vSrVeRaNgi16+bpFofj+P2Fjv/+Pqp3B
 lpQw==
X-Gm-Message-State: AOAM530wso4N9liJjPfN48kR08BpiL8z3Uop1beczilIyFybOW5s8EvG
 agOrPMBvZLo1oHSt40Ru4txtcmhSzduw8zSyhsVX+A==
X-Google-Smtp-Source: ABdhPJzTI6WIJ6YIOf8f3NgrEUX/Hq3j+TeYpcM3gdhjjI7tRZ1Em+QSs86wQgLlRFbJ94fbct0M5QIM14DkD53hfHM=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr4565666ejx.85.1627563954772; 
 Thu, 29 Jul 2021 06:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-2-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:05:12 +0100
Message-ID: <CAFEAcA_8evZ0D7=hmwQ6xvbt+hMX96mbXWjzWJYbtQJHXn9ErQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/43] hw/core: Make do_unaligned_access available
 to user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Thu, 29 Jul 2021 at 01:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We shouldn't be ignoring SIGBUS for user-only.
> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

