Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5369D11C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8i5-00061H-Vz; Mon, 20 Feb 2023 11:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8i4-00060z-Ga
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:08:12 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8i2-0007aZ-VK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:08:12 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z2so2113484plf.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJSaxpz4H1Ctw0NLzcKRlF9OHtzUjBzt2NscbSC5xvY=;
 b=bFazjslLR/wfW7mdFyOMAgbX8fjNfzxHPSKWIMevKOglinXUw8qM8jNvdtz3OzE5iD
 DZLG/kDpfrKD2e6ANjwtXBptrt5T/nQvAvn+4y5oETQrvJobxCOhxiZlw1y7PYr1wVRR
 ZgAQClAXS7+TPb8IQ+wrAwW2RO3zYDHLl0dtz5CQasHC6OuXuPeRggMRD4mrLtgECe2M
 3gRER7FgWt4rSGwEMj+h5F/mHs+N7u7mCN/yjsgFWEv752yE33FRr9viGjmuDBXMr/CH
 VtKSrxPbhbzwM4Yqt8wJRaokFuFN8CJwZu6m7Ra9Q5De4hlTZ+sRQKdDN/rgFJGyQudz
 hqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJSaxpz4H1Ctw0NLzcKRlF9OHtzUjBzt2NscbSC5xvY=;
 b=inB09efUAp8oFhN00GkE/wknk1SUHMgPD8/aUmZEEgJ6+q06FWWAETp0RpXqLc5AfK
 o2LJVWI73mQr8yYOIMAsGTabKpsVRO8cnqRxQ2AsdgFs6mjue/KxT+yAtMHelnT8+GaD
 jA4POqMITqqIV62pjo4efVCCXdh0iJ5IizbrD6Kdkp5mwqhzvV6H8GtEljG+N9sEuZa7
 gNVt1+2TokKBS/SOvvQ2hnjM+qftkRTWpmcRT3HGWA+VxGoY9RIyT96nogOA1DazGcQj
 jfNzydB1ZwFxj5/HiT0/t2l4HFv93M8kpwjvcskgTXtxVAb9JLQrFud6FpIgoXGGfP3g
 wlDw==
X-Gm-Message-State: AO0yUKUMLBOEZL7QgXMWHwbsiLBytN0abjWSE/qt3Gt1O4BlQ0Yq74KB
 ShPPjnPgBd2kuuaFKZ+soSUT3OhmPjS1JR2qycyNFA==
X-Google-Smtp-Source: AK7set8pJ0U7hgbIajxDLmgR6DPtWTtecsA7XMEZZ052YDVES3qfGbFN+KffcfFI8/SZT6+KBk/OjPc3ad4+/zJA2cU=
X-Received: by 2002:a17:903:2c1:b0:19b:5221:4f7 with SMTP id
 s1-20020a17090302c100b0019b522104f7mr265181plk.9.1676909289407; Mon, 20 Feb
 2023 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-5-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:07:58 +0000
Message-ID: <CAFEAcA-ctD24O86wsojLpiMU5yd+i-pZ8xegf4pq-Yzh4NCg4g@mail.gmail.com>
Subject: Re: [PATCH 04/14] target/arm: Split out output_vector_union_type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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

On Tue, 14 Feb 2023 at 16:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a subroutine for creating the union of unions
> of the various type sizes that a vector may contain.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub64.c | 83 +++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 38 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

