Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C52397029
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 11:17:35 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo0Wk-000498-Ui
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 05:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo0U0-0002Wn-QJ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:14:45 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo0Ty-00012f-Jn
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:14:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lz27so20528079ejb.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jmpkarM9OseZRg+smRPLoGKw/mKPXHD0YJmZEPjqdvo=;
 b=OrVw0QEXkDiyIOPyZxLxGCmZjygjUnMA4A1QovxGHhcUTrRP66VAq6gyj5urLc3vR9
 Ad6FcFIHvSy//+UbKXPNkTqJQmcoWtbw1zduiyQFFD1+CQuJaJT0M+RjB71k2rZ3fXqj
 NYnfiuLu8SCbX5dgIYr1aTLuz8llOIXsmYSHyDBOVYZ8s+HIQt9dUr0rAx5J7456yL8Z
 CbioeJUrcwQ1ufkD+7CbkrJJNU7+vYRf2loB1WQAarb7EBahv4qNRbPWbrNz39Gpwxln
 vBZO5w2o5jgdjzkdhvZSmbTnw+dKcsHJuqU1M+4t1ufIhQ2dQq+930NyVaGweXn8Jkqc
 2vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jmpkarM9OseZRg+smRPLoGKw/mKPXHD0YJmZEPjqdvo=;
 b=dcL5lH3Ook9B8kAIdg4VwdDfDg6TI76mZAWiTEvdoxv4rX7sueeLoOLkq0ZMIFW/YI
 /J/c1gtiOU+yk2r2bwv+dHrv9VQhT/vCQfCx905A4RdswT4Yu69zbRDZBobbm+dyCRMX
 Pt/cph08sKCTQPIPfWprXbWm5/Qd+fqSIyiY/7MD5LH0SP/fzmulFpQbLVVrSkDsxPwh
 bpvcvkiXYxshaUszi5nceuMiwj+HT8y331xYoOGjihdBuS2/Ki+D4z8O0ahixS4FRBtQ
 DkgwSxvup5mlQNYA9/BjL27CWn4jj+O60aaMQmf4s+cDeA2htfz+ecIRIIElfT3lj+VR
 a3eA==
X-Gm-Message-State: AOAM532LNX2d5dylo5vUUdjFFVdT5tebQJQTmcxhpmoaV0KAe+7rbHec
 gRPKr4jNYaCGCU3Pyq3KYzO/6lXUdVAkxzNfH6mElA==
X-Google-Smtp-Source: ABdhPJz6wUDA3DI4CTOLiVzbLSewD3gFQ74SNhBRQmBCKWXTybTC+43J3erpwUF4RROkfcp/iM33XrdZFqoOVdetGB0=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr6193447ejb.482.1622538880716; 
 Tue, 01 Jun 2021 02:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
In-Reply-To: <20210601090715.22330-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 10:14:10 +0100
Message-ID: <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Andrew <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code has access to the same symbols in run time to make a
> determination of the location of the heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew <astrauss11@gmail.com>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

This seems like a pretty good candidate for breaking existing
working binaries. How much testing against different varieties of
guest-code-using-semihosting have you done ?

thanks
-- PMM

