Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D265606B30
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:22:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldvJ-00073J-4H
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:21:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldmd-00024z-BR
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldmT-00021r-RJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:12:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldmR-0003V4-Sf
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:12:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c24so594840plo.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Hi400Q9hsuotVkeAs6qqzVmuLdSesifj8//dcBaycQ=;
 b=BgxRM8a8e98b+bF00eONUgPKeH0qcw1tyTElWsBZ+368HzEuUfQynHbLDewSsGvlHi
 CebWItZRAhwzxTPs1p7Jt7PinCd/87axysSVkYfnov4o2VLfGyvQNG1+BjTkMwXNI1he
 A1DuFb1fahworxuCHjXHBPEGSQJAtNlMT2pdN9E9Kt+qvBRVt9sdtKCL4lNqSKh+ypkH
 oGDJ8dZ2gktodkD2QIpkazdfSIcbkhGZLRglGigp93NjO7BZ3S2mEdJsAlUD+hznGudU
 15MdRm8zQNRU0F4eEXeZfMchnxUiiMFZcBHXgRR8gNYBJDhuu3zpwF3ZNVZxq7VFfR3C
 0qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Hi400Q9hsuotVkeAs6qqzVmuLdSesifj8//dcBaycQ=;
 b=PHRXQWJFa0pPxxTm9SZ6yIz4jPmkJwcH90el2vizdgs9T0BLuV6MEOnjn4EmkdZ46w
 clzDwtCJirm0sJ/m977uuIonQPNB3LCDdxSWesjgozQfoF1D7jzvx2qFfzmR8oIEarMm
 B+awYFbhDKxwulRvbQsH4A3Boikq7e31YJRmiV6qxZclG9e8zzUGAcdi8C8mIdLEi8Je
 f24ksE2tD6ar5ugbBuLyTQqIo4n2tmBV/h9mkc+XxFCPWbtiXoiqozCqppYDu1T5rMKz
 aGwhnwMssaVBSrEtrRzfj6f6aogoxErgN00RelLK8ab+xa00gogC2NCI+TEp6HfueAZU
 ZkZw==
X-Gm-Message-State: ACrzQf2nW+VFlDMTZQMt34Cw6O9OdeqXWsWKHtUq4G0FZCHiEaMj8hIR
 PMhl8n0vWw9nM3KjeUBJkNXpVw==
X-Google-Smtp-Source: AMsMyM4LPiiPyJTnPbGfcXpEeNNHnZfjJ9tSarcIc5f2xAlii+09N+/YXe6uwuSbA0S/PNAAN2q75A==
X-Received: by 2002:a17:90a:e548:b0:211:2c0c:cb74 with SMTP id
 ei8-20020a17090ae54800b002112c0ccb74mr8130948pjb.69.1666303966232; 
 Thu, 20 Oct 2022 15:12:46 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa79dcd000000b005668b26ade0sm13459297pfq.136.2022.10.20.15.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:12:45 -0700 (PDT)
Message-ID: <277cd3f5-2dd8-1eaa-c1a5-0982fdfe0da6@linaro.org>
Date: Fri, 21 Oct 2022 08:12:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 08/26] tests/tcg: use regular semihosting for
 nios2-softmmu
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/20/22 21:51, Alex Bennée wrote:
> The nios2 code now plugs into the common semihosting code so we can
> use the same redirect invocation as the other boards. There is however
> a bug raised for the fact the tests don't seem to be completing
> properly and silently passing anyway:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/1258
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/nios2/Makefile.softmmu-target | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

