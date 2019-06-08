Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31133A19C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:51:47 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZhNQ-0000pK-Hu
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3Z-00011z-6r
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3W-0000gn-3n
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:13 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3V-0000Tc-HM
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:09 -0400
Received: by mail-oi1-x241.google.com with SMTP id g7so510773oia.8
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jxC0whbcZyna0ZKfC75qO3iWm5GcNCiXEvH7s34glZk=;
 b=sDArnVMZBpifwttICdvTDb/v1vGZeoLv6bCIKUlBeNvDOkCllPklxBHNi9DYfYpvpm
 JtyJojR9AD2mKDBwoQYfBDBsUD3eX25fujqyEgK/LV0UKnOBb4MFyG/1OUUaiW1pchA0
 xq46goiOL+oVGdMBU/ktCBPvxEmWSwKdffsUZoO1g2H13ybyAeNsP11cEvGTMDyR+JkL
 44hKP3e9jLPMNoelqpx7AXArOij8+3WfJ8tuLsTQih48L/idXyCnioV8PDqaojBpaorU
 eHPlIY9UU6UhaX3pnn06EZw5BCGJiCQkSsjKIP4BUxaqGmx6tymnSuPx6qWMMuyR7GOo
 wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jxC0whbcZyna0ZKfC75qO3iWm5GcNCiXEvH7s34glZk=;
 b=mtiflwNToWcvN+35A3Ls+ENS35yrWhOzwOiY0tnrhRRHzAnM8jRYQoZyyracO999NI
 0JuKeaAvrzunmZkFlZs/hig4/4W0g1YVtj7ERlM42CsS7E4uO1Z+5n5Zja7XeLEoKcu+
 OtrhLfP+tX7FCcHsTF/JqfbKqjx3r0w+WtgjpdgQPu3irvhoTZ29I615i0oZEQPyQUzN
 zFeT2nLTECvdS133bf/WPlGKGeW/epR5LAyBQE0+MrWUrMiiXWvsd+lTy3Gl2VczDJvT
 GXLQj/sTsN08seNhVTnX2NbDsfbpJRO/oIHDpZ4vFF6uG+Jhjuz99hiiHrJN62H1uz8n
 FbfA==
X-Gm-Message-State: APjAAAWf06GqUHNP4DFII5MrlYkaIPaTXKe8R1+ynkJn5Yqp9RxoPFEZ
 QWNvIrBaRYF/KrSae+UiUwMcJpmCQM7zDw==
X-Google-Smtp-Source: APXvYqzhTyNH0bHiiY6FvW7fsTsSUyLJtlP5Da+Aex5sCO69of4paSPGp5f15oJAO6u6/6LMVOUl0w==
X-Received: by 2002:aca:de04:: with SMTP id v4mr7296853oig.162.1560022250474; 
 Sat, 08 Jun 2019 12:30:50 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id s63sm2141419oig.11.2019.06.08.12.30.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8afc1c6a-2675-0208-fbd6-7ef9ee646b29@linaro.org>
Date: Sat, 8 Jun 2019 14:16:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 39/42] target/arm: Convert VJCVT to
 decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:46 PM, Peter Maydell wrote:
> +static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
> +{
> +    TCGv_i32 vd;
> +    TCGv_i64 vm;
> +
> +    /* UNDEF accesses to D16-D31 if they don't exist. */
> +    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
> +        return false;
> +    }

Lost the jscvt check?


r~

