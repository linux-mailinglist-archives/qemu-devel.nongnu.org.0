Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD6274719
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 19:00:41 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKlei-0006W2-2A
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 13:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKkw3-0005yZ-L8
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 12:14:31 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKkw0-0007X5-Ja
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 12:14:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d6so12887828pfn.9
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZfUDnVGIeTxZ6003lF3aK6uP9F+0y/NxRIoWLrUBePU=;
 b=ajU76ZMbDzVP7L0BbjNtlVavZwMuSugkBFsYAdwYk5RctclEf6ocFD1SsWQdG9x1zH
 EqUR0Zmh/bdjxTS3DY+ko/Uc1dWBBKdiTAVY59iKCL8oM8zy6uB3NfbKzdzSfQPtqQru
 Xv5sjhq2Hdrea7jwoInQ0BEgd3tlsWjrRNflGyZcg/awx4AelVDrWPSMfY/y2eeA1Y7g
 yZnnLKu57WJ5gthaJ+ui4YVzX0G3BOVkVayk56J+Y34ceQDk8jCuQGPVRBKFqHWxl5IX
 MWPiEzccgB1XC0kKQBWic+Q7nLT6lFh2dp2ofjXEWjzGmdq/QK+RtbQ3DZbFpQKfXnYf
 C0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZfUDnVGIeTxZ6003lF3aK6uP9F+0y/NxRIoWLrUBePU=;
 b=MbqiDzop1lwUkxJeqyn9CA84A0bO6/2cpWEBwflW8le9PEETbgDrkCQ8mJCdX+ktWa
 +dBUbpnp8M9fHRIYMkdhS9ob4R98gUwiYPY1NIcUwK6zuC4LcOOZP49FBIidzEP9BUM/
 ya1E45F5faVEitluF9hPtsdVZU03a6d1T9uMRGbkX9TRFFim9/2Nz9rAnCpXZhOAI7La
 PaMmkEx0BS4NfMDenOQATvNX6EqVR97BuL0j3/sYzHkoXKNfDBVawHsrtZN9QhuTL6sy
 7OKUWyo/oL6/35seOEyCSe+DDIe90H2bDYl6HqvwJn0mt36drnPJpDRzYMIRGhUuU25H
 yOGg==
X-Gm-Message-State: AOAM533g2+WbwugtC/W+H76poe9ZCuu07en/IX3zb8YGDkn1XGaa+4fM
 WxbJ3OPYViHa4uO8ogjVNWawsQ==
X-Google-Smtp-Source: ABdhPJy3vVgxbAwlLoD9W7REN6BWjbJiFmbwSvtnBseCG5mv4akS49XNI0Zq/Qf5a3gSYC7gji/KCQ==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr3976104pgl.171.1600791263658; 
 Tue, 22 Sep 2020 09:14:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i25sm15969765pgi.9.2020.09.22.09.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:14:22 -0700 (PDT)
Subject: Re: [PATCH v1 6/8] s390x/tcg: Implement MULTIPLY SINGLE (MSC, MSGC,
 MSGRKC, MSRKC)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200922103129.12824-1-david@redhat.com>
 <20200922103129.12824-7-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d304a2c-0dc3-8690-acce-4fb2bfa6e7ef@linaro.org>
Date: Tue, 22 Sep 2020 09:14:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922103129.12824-7-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/20 3:31 AM, David Hildenbrand wrote:
> @@ -512,6 +544,8 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
>      case CC_OP_COMP_32:
>          r =  cc_calc_comp_32(dst);
>          break;
> +    case CC_OP_MULS_32:
> +        r = cc_calc_muls_32(dst);
>  
>      case CC_OP_ICM:

Missing break.


r~

