Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169665A1D5A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:48:05 +0200 (CEST)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMZw-0004lA-2m
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMVo-0001ig-Kd
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:43:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMVm-0007zK-I3
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:43:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id e19so85929pju.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UW2s3HVCiRZsjFv7FE1mJvUjygqiOwtSF/LvI7R0qQo=;
 b=b4OclZmcGrEeIY/GCsxTGGqTF2v4z9x0Yj24Q3KSBn8r7lDF7c5mHK+PTtJu7E0RSv
 bt1dZqKVetbvzYJnwND3NrubcOGpGKkO449DmGfTQ4bc3r/mWTU335iUf4JD0XLBJabi
 DP6cIYgnlQh21RSC2Py6udYlsY31DxBdvc1Ajn7H5lnaKAYsRjV9mZe1g6W8mkuCzdQM
 v5rNIvJybHaPGw7sizp0tR5+lur/jSzkXxEF2lkGPHGXK513I1vPpm2oyFWEl1SdptcD
 V01GHUwBB+8rjinYPwKcp1+uJ+LbYIwmCThef+eFqkmKagNWbUAF3QAah2GnBveT4WKO
 FqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UW2s3HVCiRZsjFv7FE1mJvUjygqiOwtSF/LvI7R0qQo=;
 b=ALiFtwhSzDJZ/5xF2CoZh/tCpNgNPHZPmfUxFtc1TIAhdFsiE78yCABz66GshCWlZU
 pUzboGdtpp8zSA++4RXXk9zco1DQaYHvmB6aBLm0Z8IX1bfTZjCL0FnFGrnBPlHuLnk5
 nAPpS/+BwkoTcSa9pNL5OWz5YbKfGoKto4Kfm+leojeqYSMDQ/UQLU4QIQfEuVYmKaWy
 MvzxPAukc7Cs1rk5zftd8I+DsWQ0jhrxssyFHOjtpzFRs6FRr5ACutD5WtJWA2cz/top
 G3BfIKT8Eyu08SRkeudVNu+ZttIFMtEwtuOg5Jt9x75wSAuRFdBqdH8lXxs0dy0jOpo0
 iR9A==
X-Gm-Message-State: ACgBeo1mRztsCaE2pza+8wJfiuPEMoAZlPu+XW2GPpDzRbORAdjYLVMu
 vvB1j9dA22ac8UCV/qUR/rb45i4DOIHikQ==
X-Google-Smtp-Source: AA6agR7yzRGoXYwL9brlKuf9hOMU6MUYrZIw0Lq1fFTG/tvbFTrs8U9RftWNjt6/czirA3f7HES2+g==
X-Received: by 2002:a17:902:aa47:b0:172:ef81:782d with SMTP id
 c7-20020a170902aa4700b00172ef81782dmr1322698plr.173.1661471025120; 
 Thu, 25 Aug 2022 16:43:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b00536b3fe1300sm225059pfq.13.2022.08.25.16.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 16:43:44 -0700 (PDT)
Message-ID: <f46c6afe-8444-4eab-b038-aae24b1c4756@linaro.org>
Date: Thu, 25 Aug 2022 16:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/18] i386: Rework sse_op_table6/7
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/25/22 15:13, Paolo Bonzini wrote:
>   static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>                       target_ulong pc_start)
>   {
>       int b1, op1_offset, op2_offset, is_xmm, val;
>       int modrm, mod, rm, reg;
>       struct SSEOpHelper_table1 sse_op;
> +    struct SSEOpHelper_table6 op6;
> +    struct SSEOpHelper_table7 op7;

Likewise wrt struct copies instead of pointers.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

