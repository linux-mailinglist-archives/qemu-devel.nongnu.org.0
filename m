Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF0414E6F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:57:27 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5Yk-0004FY-FH
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5St-0007AC-24
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:51:24 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5Sr-0001Mr-9i
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:51:22 -0400
Received: by mail-pg1-x532.google.com with SMTP id r2so3308072pgl.10
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=A3zE+oL9mgaMO2xZIZsXiF1WIR3x20XhlwgBoq9cl1Y=;
 b=whhrZ2ZvX0NeAQPWMbyB+NdumSONxs5nujBtf6ojs9i7LqypBkYqTLuY6KGRsAsuoq
 W2McauYIy9FzUo/erLAbwT7cT53LO+Te+/Y7f+lKpw8cToyHfjg4MjuCvDZ12kl6Y0s2
 Wbv+A/Jhno6mgf0Z4jYhXhKwj4z4y6BqsLQYISU01Ql9wtyZmKZhWpGfctFD1rTdQIaR
 8+Nbw9ZGC+IJ418SuVcJlXHKDtnxShNUZ7dAZmRapYP7h1enIxoLACRv7yoGkEsQMkrx
 1SB2cCqzp+Bl1N2/DrL4WpnUuCVkH89sbxzBZInS1iln7NV2Pn4I1DwEE1JCkRSVAX5q
 Azgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A3zE+oL9mgaMO2xZIZsXiF1WIR3x20XhlwgBoq9cl1Y=;
 b=tZBdMJT3XAFe0o5W+ylk/rtMh7C7WKgTNsJcoj5S1JXRNqIwZxf7HaVcQJHoah+jXm
 evyYJlQvTxvfb2T74Bd8lOsqJ4EMEyefBfWmTkoyJq2Sr3EK8v8oNOvb9baRE4XD2QjS
 NiYgwAB+n64JqBdJRDbaRU+qPPh1UvUJ8ILo4WMK6fqe58lMckPwM+rG2P4fiRi+ZbJG
 GE2KRs9DoMUyEBJMgsxh+j87RixmBTCr/yESw33YrRtZlRPiSZ0tLq/7KLxH/JYOXLSJ
 UT4lFXq+XV9HoxN6NpIqfeMGnvXaHIU5QJ8PkaBXTKhEKoUGZV7LDvhakFOsOFoV9DD5
 u+9A==
X-Gm-Message-State: AOAM530VmHjhLT3uT5Jbln+qwLkuBYvxibvLQ3NUTTGkTplAX7ptOj5m
 Uu6DaRDEs8YJq05G0lkUNYEY+5zh+ZKF/A==
X-Google-Smtp-Source: ABdhPJwyvi4h0lEyOQgRtLl05EegTf3zl/dxL7EJOqQbakuRzgcpHSmAASaS9S67o9EA0VC3erouAw==
X-Received: by 2002:a63:1e16:: with SMTP id e22mr573597pge.153.1632329479783; 
 Wed, 22 Sep 2021 09:51:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e8sm102079pfc.153.2021.09.22.09.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:51:19 -0700 (PDT)
Subject: Re: [PATCH v2 29/30] accel/tcg/user-exec: Implement CPU-specific
 signal handler for loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-30-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e95577b-3c91-5ea0-fe0d-d14dd0bc079b@linaro.org>
Date: Wed, 22 Sep 2021 09:51:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-30-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> +        case 0b00011111110: /* stle.w */
> +        case 0b00011111111: /* stle.d */
> +            is_write = 1;
> +            break;
> +        default:
> +            /* test for am* instruction range */
> +            if (0b00011000000 <= sel && sel <= 0b00011100011) {
> +                is_write = 1;
> +            }

Probably better to fold the range check into the switch with

   case 0b00011000000 ... 0b00011100011:  /* am* insn range */

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

