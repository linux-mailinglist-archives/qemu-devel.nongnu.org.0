Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB425E8FCC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:22:41 +0200 (CEST)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCbg-0000Qx-LP
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCZW-00059w-EX
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:20:35 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCZV-0001Rs-3K
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:20:26 -0400
Received: by mail-qt1-x82a.google.com with SMTP id h21so2069497qta.3
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iSqBj3BFzeD1weijaxVYyCacaj7quxogllxpSXvQTyg=;
 b=X8wW5RodtY73zntNfeaaKsOpWVwB2twQ4SSPNB7H1+jg45w+0HUapVMmZzRflIIUV5
 yV3tPh0suH+SY0sJdZmW4hDrtL+u118+qEJm9+b2yjkYgIreF+IvqgpA7wC7CJrOFYZj
 +iPYmiV9QRjqmXJOcVjyGbRFnsx/ojLTVyVaJDR5a244ULAo3bmRvh2mWWorC92CV7Fw
 UnnFANM4/moidvcgOAM6KKH3YsBGxfswRjxpq1ujr7dB2TH3npOlv3LxsyXE+bduewnn
 9nEKxAV7pOdDDsdsj3m3RyzoLVLmQ1ok0p9PqFqqkIUakN6U+GSaoWcHTIPP7zLnQZTA
 DOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iSqBj3BFzeD1weijaxVYyCacaj7quxogllxpSXvQTyg=;
 b=ma9X51b0D4AdDKX1LAoiBe97Jlb2taPqKZKkT+CNS8+w4nihuf9M5XhP9TNbG+Cpv3
 +el/nJnCgNP4vYK8l0SFLqZc9Ie+7QXO/LUiSGfKOGASuNeSz3oJS0Xm210lwtf4+71Y
 0iCX0p0drt9R2RS9WMlhlhCWkQoLjciUFxqy45K438zWvoFfKNYx8F4hXFDZMzMDSbMJ
 MsuDMuAIpgUkbPS5qpC7rX+FSDZdVNn9TZWiCNrUL4vJkj8icXKLADNVXG4LmOpw5S6c
 2LSpKq8t2v/iAomG9ccYftrgUEFwxP4LeEfy5niXk/rbpeu8ru/azFvrfM52MNq0QF6F
 Tcig==
X-Gm-Message-State: ACrzQf3cRt2aCM8qMpeeXvkkuKabswdFWt/yeIGXme85Wen4lxlWFTcA
 RK3XXj53Ud1lNCgDA2phUPFXjvR7tibeegd5
X-Google-Smtp-Source: AMsMyM4ZzccpRQbePDaqHQ4uHb7DFvU0IrxcgxCHbyXweKFWlZrSIlkNEeeuCy/r7StqN3dRlGwAmQ==
X-Received: by 2002:ac8:5702:0:b0:35c:bd2e:9cdb with SMTP id
 2-20020ac85702000000b0035cbd2e9cdbmr12552716qtw.159.1664054422627; 
 Sat, 24 Sep 2022 14:20:22 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a05622a004200b0035a79e18410sm8912633qtw.48.2022.09.24.14.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:20:22 -0700 (PDT)
Message-ID: <8a331e7d-4f82-4345-8f12-db2972713d5a@linaro.org>
Date: Sat, 24 Sep 2022 21:20:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 33/37] target/i386: implement VLDMXCSR/VSTMXCSR
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-34-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-34-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:25, Paolo Bonzini wrote:
> These are exactly the same as the non-VEX version, but one has to be careful
> that only VEX.L=0 is allowed.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 25 +++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       | 20 ++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

