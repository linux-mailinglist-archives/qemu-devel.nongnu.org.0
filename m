Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C241D4AD649
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:24:24 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHObf-0002CS-7v
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:24:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOSH-0000zK-3R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:14:42 -0500
Received: from [2a00:1450:4864:20::42a] (port=38740
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOSF-00068q-Cm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:14:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s10so27462955wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A18QmYUKKekg8Ta5NgP/8tLnpllhS2JGapA0CXXahWk=;
 b=faciiNpFlW233a9eN0RZo501AB2m9QuN9Fz0D9iq47Mpcm+Y2qhkrGSNh4hx5QKC+x
 yFaikJe/xp9AF64Lg1SCXwWSscn24GRQu2NHp2ytXV9bBOYVJeHKZ/11Gi+7v8H3cZRc
 Dm/9YrDVK0IlpXgc7KZtSuzWQ41IEMm1XyQiahfPFRKERQ1B9860hqgrdylDVmMnTQFX
 RISvjG/fwD2OC4w9Kg+6oTZw9jXsXlvRmTBJnGU/BuoXcPxEB7fDk5Z94cSfXe+YeX+g
 pYs1bgOIz+z8PctukdpHWtSPQVbGa8+XYZVI2suiCGKsGusV4PMJ4pJL/Sw6PUspBMBC
 irig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A18QmYUKKekg8Ta5NgP/8tLnpllhS2JGapA0CXXahWk=;
 b=QkADeTxjioosHF+KUVil17BuYsxmT5SBqpcHG9dTRl5j8JCw4WIVa9FZCDLzRYJJ0c
 LzczZvRUj2MtN+Rr+2LN2SYd8UHMNQDEHthhArnoIR5kIzpQ9tZahnCEfJfoSDc2a2n2
 +UMOpf3r7ehRZLqyRxRK01BXb9mC+eUnSFgGlXMsWoCl9CkUJy+4MQhIO1oCsi+mGQwv
 Mwurv1eK91duPQj5uA958rVgDst06137K6J+FpX33G7RnbmhWvWkboOQcvY6AsJ3Bkci
 Fm/98I5OrMiqzMPd8yVhsMHYc97Kshyl6BsbvAPRfcPsNqbuAvIu97pVujvFhI4FAyxs
 hA7g==
X-Gm-Message-State: AOAM533ps2ZXIcOucyRFXIw3LOHa9DLz09lWWNNXeqN/XMoOsvnYCzZB
 lme4/M4VmK63UlElojJvqagtQ6ysOqDCqFWputc2+g==
X-Google-Smtp-Source: ABdhPJyQnxdXGhCZ0jy8AqhJE+8fh+rWSIcEu+aDlh+wRwlC+6LB9TifRWlqCyxq8hcYRaIo5fApyE8LcJ6lWLEMKhU=
X-Received: by 2002:adf:a50c:: with SMTP id i12mr2040205wrb.172.1644318877743; 
 Tue, 08 Feb 2022 03:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-6-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:14:26 +0000
Message-ID: <CAFEAcA9ZOh4Qy7kJFpgA4oWstLCc=aUYcRrX72fzY_AudksmpQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] linux-user/include/host/sparc64: Fix host_sigcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 07:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Sparc64 is unique on linux in *not* passing ucontext_t as
> the third argument to a SA_SIGINFO handler.  It passes the
> old struct sigcontext instead.t log

Stray bit of text at the end of the commit message here.

>
> Fixes: 8b5bd461935b ("linux-user/host/sparc: Populate host_signal.h")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/include/host/sparc64/host-signal.h | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>

Otherwise


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

