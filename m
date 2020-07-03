Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85899213B0A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:32:17 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLnc-0005xU-KP
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLmh-0005UV-DG
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:31:19 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLmf-0003jx-Qa
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:31:19 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5so26740615otj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fcs/DnolAyMQnVPDUbY6cHLRB6bDyuYOPPHgUE7BU18=;
 b=CJ6JzVVkuyaid0GNZ0fP4LclIVtzdZXOminDof7WfV1+aR5gwgebJ9mrC1kOhjgE32
 +ii1cYVPeRfSzoc8C7K2jQ93fS+0l8jH4zhLTvABbRub86TmUskwWdRiyvLTdTwYeVna
 1ZbDD/HNJGgBpX8q2yPFfid2OpX2sNCuADiktTlTsQdJuhMAfHENXEPyn4O/XhiyJSjw
 d33ov25aKfwXjgQwhz+72e9SIf4yJ6ejeqEaLVuvEOQlp52q0Vl6guxH44p0VMPl1+ts
 EC/oqDyr/hB0ASkvzD4NdyAw9+begmrl5mXAMcXVIy2eeCEhN/kYZwSueo6OaPDa0fbq
 et1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fcs/DnolAyMQnVPDUbY6cHLRB6bDyuYOPPHgUE7BU18=;
 b=Ikz4yKTCwjZbSLefrbA+4le2Lb/hFKXmiQLufM9JlCDj4z7MF4jh5th14fBJw/J41I
 MSVnYY+Uio155eyS3aWMxJ/Bdsz377k47h8b0SWdBhLWdErM5MiifpvEK0lIaq97ZGQr
 GMJyahe02EMf7j+cvR1YB3vOrIObUHmD/TBRNjHCV43ECnciE1Sa4bR/4LCB13vT4Fq3
 NXS0AtvHcnTL/UAMzJPcJ05qNNmXkyFRBwueuXmdwMMyhd22ezgQiHKj/7DbBSCBG6yB
 XS26wIOXTyR2m/fWMkKC6dj0yAeNaF4H4j1YsLODsPNXe6S4JsyaNjYBM9idRQSNBmXm
 jeJg==
X-Gm-Message-State: AOAM533vd7aole3d3qNvGUF0FumbKT96sFiep4TvAyrsTZc3S9zsQr0q
 84ndl0ZMGw7v+dW8SRSwHCYsbJ124KTdgj/soJuYPw==
X-Google-Smtp-Source: ABdhPJxF3TqPNvSEM/vdbRSfEKFWUgyoss38/QdRWv2uukhxCPelELdLjqT1PZTCb/EGi1/TeCwYmUfrVYj191nB3lM=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr23210824oto.135.1593783076011; 
 Fri, 03 Jul 2020 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200702175605.1987125-1-richard.henderson@linaro.org>
In-Reply-To: <20200702175605.1987125-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:31:05 +0100
Message-ID: <CAFEAcA8Oi0ERnmAYhfMvZdo2wbXGSrADX6-wg0u5cF5y3uo1vw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix temp double-free in sve ldr/str
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Thu, 2 Jul 2020 at 18:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The temp that gets assigned to clean_addr has been allocated with
> new_tmp_a64, which means that it will be freed at the end of the
> instruction.  Freeing it earlier leads to assertion failure.
>
> The loop creates a complication, in which we allocate a new local
> temp, which does need freeing, and the final code path is shared
> between the loop and non-loop.
>
> Fix this complication by adding new_tmp_a64_local so that the new
> local temp is freed at the end, and can be treated exactly like
> the non-loop path.
>
> Fixes: bba87d0a0f4
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Applied to target-arm.next, thanks.

-- PMM

