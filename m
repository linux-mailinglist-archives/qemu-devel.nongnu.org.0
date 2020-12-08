Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD612D367C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:55:04 +0100 (CET)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlst-00052b-RM
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlRx-0002ru-D0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:27:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlRv-0002Vd-Eg
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:27:13 -0500
Received: by mail-ot1-x341.google.com with SMTP id j12so299613ota.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JdV5HFH1CsNDl8vIK1ZMy6muRFwgCtO/GfwxqVPAO6k=;
 b=dme4hkrQJfiveN1lvkRdeWn40skS4aHHpI8VfYAvn86cZs35lSVRHqksAtSNtW/OX0
 lXEe8+Y0/U/qbuwiJPpwpDo+rfTEtm+Ngq3+IjfBZm8DHI7cA9vM6T4tE4sL5QdfPA1u
 W0ZT5t/5apfRuymh4Utt231BvhrKzcqecYDrp7qqchPuLKa/K8N6xvzLKRniKgktHGuA
 fBiDIhnGU5663W7STpmboEmAUGJ62SKXBsE/RFDTktu73rkqMUh3D7iE++FH3AosM6MD
 v6HwISR3yrDIwNq6sLmEgiIZ94ZCdg2Oiw8wPhAa8sMpcLdmf3IsAyXcYALS6MBvFvKn
 tyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdV5HFH1CsNDl8vIK1ZMy6muRFwgCtO/GfwxqVPAO6k=;
 b=sLIbmOFKG1+A1Bhh9L1M3hYatLK0CsxYlUfmNUwq72dgfuQuzuYMe5U2w9bvriENrA
 Hty5quW5yIkQZL+WGCLyjLU1nSgvYXGI0O4LBmSa2wKKcTD3AkkUYJhBVJL4cYEKv14G
 un+F8gqGwBRv9ezVdbbpvVeqfnvDIkwG26SnwzBRumqrRTZ8meDe+/rnLb4mfOY/KZAb
 sOfv/2VS/kNXVhiXQzhBW86fTf8mHK0+VUW16ZxSvf+5GPok3+SCeh6OJNA6k4H72Bnv
 HIfwN+RdrBJumY2U2xdiajGbFrY3n1jzfyiYCWjCa1ISDpZZ01MvRXHEficUp1LUO777
 vW1A==
X-Gm-Message-State: AOAM531NJNSHAV4HkeDk2SrtMceFp5asYLulIMBgT9fn7k7ma+OtlL9D
 +FT58hQyQxqvCxcKqcD/0hGY2Q==
X-Google-Smtp-Source: ABdhPJwCzNQPWH8lhh+t1Zw+YvMtu6ySnRpW66Zw4EkvBTtFFLjlC2hJLH/tvUSamr7kWfKqLghI8w==
X-Received: by 2002:a9d:7a48:: with SMTP id z8mr243937otm.146.1607466430169;
 Tue, 08 Dec 2020 14:27:10 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l132sm32412oia.23.2020.12.08.14.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:27:09 -0800 (PST)
Subject: Re: [PATCH 15/19] target/mips: Move cpu definitions, reset() and
 realize() to cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <849b84a5-ee3d-daf1-4de2-cb5942eecbd0@linaro.org>
Date: Tue, 8 Dec 2020 16:27:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Nothing TCG specific there, move to common cpu code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h  |   4 -
>  target/mips/cpu.c       | 243 ++++++++++++++++++++++++++++++++++++++++
>  target/mips/translate.c | 240 ---------------------------------------
>  3 files changed, 243 insertions(+), 244 deletions(-)

I see translate_init.c.inc is handled later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

