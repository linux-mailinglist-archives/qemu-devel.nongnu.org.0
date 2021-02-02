Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F146630C226
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:45:04 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wvP-0005Tp-EJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wiR-0005mo-7y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:31:40 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wiO-0004uI-5d
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:31:39 -0500
Received: by mail-ej1-x630.google.com with SMTP id sa23so13988342ejb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCSBYa5OrnpG/GnplPjOrWlWr/fnsKBSmKfgGhp8Fv0=;
 b=hCLUShtyqAIiBwcikRYQsiO2mfXEKwGkBsVSAkx7bF93JRx5VYsnzUmz294WiAlk6F
 SKiyUi2NO5rORLLzAVDXuoGCMjfw/bOE5y0dlKyvp6TrmN8ZeKk8Upv2+0f950aas/8S
 cwIZTYnPZH5G0GJaWgKA4Va+gHXXocflbcgAp8phMEFcV2TJEhzeRucq7fxoUvXESt4s
 jikY7pP3w3KCu5BT0E4Dhx2EZFON1UFG2LC8wnHmFd25e+bP9M5dyqFZ0RiKafrEx+e0
 S+X2uAPpAF+YJKmkfxlYxrslWdUqnYByk3U0NDoKPlFuOnXwtSQ2/WQ8YFDibtyuBDdD
 //dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCSBYa5OrnpG/GnplPjOrWlWr/fnsKBSmKfgGhp8Fv0=;
 b=OSKVedEyvCedOYlKtcUBV9MF4t2LuRBP/4Z4IsjY6DZrNAL9Z4iuFmaVAxAf6pHf27
 WWowqLLECgNgU7cJhXjC/HyKyqky5VbCDf1320QstGxRVdGptbgrb1MxgwBeLzWeMi3o
 WVXcNYPFsLHrXpdFDRSIOcM5PgInlhTnZueGcGiVF4jdL7llaBzBn1o4BebawP033KvT
 Jddwfwb6AjVbdkSb3mcQ6bv+bMIYBYrhAvstqD5hC0wQEwyXBHHDc/Iwmrd2S80dRs0F
 o9yfix5qKoJ5HRNKaDrkXBt3OKSs6PPhvCvpsfXPG8Lo2mF6TS9KuAxHSoiaZjgdqVAn
 dJ0A==
X-Gm-Message-State: AOAM533SHZK+89TvMqkvSm3JLVpViCw2KkFf0LOiAQbyKZ+zGXgviuQr
 ezwLzlVAjFcrH8smZCbNILgFqkmKXYZoNwNOfS0xUCwpAcI=
X-Google-Smtp-Source: ABdhPJwYyvGR+k4oWeqWIXQOPzYPm4H/n8W+vtxVpfYRu9eLNIL91flusxKLNe0QOVL0FqrAITpkavzGW+mMthDTb4c=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr23478606ejd.250.1612276294207; 
 Tue, 02 Feb 2021 06:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-4-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:31:23 +0000
Message-ID: <CAFEAcA9_kTEdKqjfTJu3hCBkk7s3Uwme_O18WUstU_5Ki3Ri=w@mail.gmail.com>
Subject: Re: [PATCH v4 03/23] exec: Use uintptr_t for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

v3->v4 change: also make the places where we print it
use %p and (void*)guest_base rather than 0x%lx.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

