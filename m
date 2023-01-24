Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B4D678CB6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK736-0003vy-Fe; Mon, 23 Jan 2023 19:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK731-0003vb-TJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:20:26 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK72w-0004uS-Hg
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:20:21 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so16870600pjg.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUd9nFA3GIgQlMP5IMjs6T0NTOPKmW20F4EGMXravUE=;
 b=yoQo1dSYOPllcSRlTNsdrRULILoKyw8RB5YMQ20RPRkpcewCwYshb3JgMbeQxTBdi/
 1za+CVvqojamj+LveHBRN+n8Z/t9aokXzliLs7bTi/xpW4bx+DFgCEuJWpMvM+BcVw8q
 viZ0IWN7ISNiOg/v7HdEVpUzyPgCV9ZMpoETVkGhs+DL2aGZ6uKJFilCu/v1MQKMghiv
 z+p5WusmC+HcUBb9+fCmmxNPIKj9FYDX/OWOnfv/0LTviGjc+8fovSSRC7t70Z+Fi2Tu
 3iIsn/ruqLLUeLut2Q3z89vtdCXT5UUI/ambz1PXEsHTopXddX0fetaEjZIhKMUrVrzM
 0sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WUd9nFA3GIgQlMP5IMjs6T0NTOPKmW20F4EGMXravUE=;
 b=32tGmL0i4+WSeYQyXm+d/TuHKUJlRgHdfG7jyadjHhQ30sYo92VtroMI9+By0sdGFn
 iLH+Ba1Y/vMRWhdt2ch0F7EnNlyTXujjpqerCw1sSyfka3fGeg9n6YQtVzS7V5ow9TEW
 6y4S1jRDgrVjiwIGTwt19F9tbxx0qZnHP6c07xe+9H4bl7YEquDiiczMAtueqLyvRpj7
 JPdh9+dMAKghgHdail0egAWkkgGUKBpx3wLaYygQslHz2jnerjLX0kSFpYb+UjI7gYVz
 ft8NVtkgtQldr2TRx5HCg9DyikD/eU4M1gMdYSayujORzohh8+oM5y9dPTR0DDGHubIV
 ieag==
X-Gm-Message-State: AFqh2kqx1oHQOrroJr0dset+TPaTmHf9Mtb6yd9rx6W3szoVI12SA3By
 GJnQX8kbETRN4W1EOIfeELa+1w==
X-Google-Smtp-Source: AMrXdXuEDrwiNvC969WSzpFFL4GlHV8Vvq9PQslvmVgApPgnM+UxwyxXx0biIGkUNT1hpplgLyknvA==
X-Received: by 2002:a17:902:7c15:b0:191:3ec0:9166 with SMTP id
 x21-20020a1709027c1500b001913ec09166mr26072737pll.6.1674519615342; 
 Mon, 23 Jan 2023 16:20:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b0019498ee0cf4sm291359plt.109.2023.01.23.16.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:20:14 -0800 (PST)
Message-ID: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
Date: Mon, 23 Jan 2023 14:20:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/23/23 02:53, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 19:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Do not encode the pointer as a constant in the opcode stream.
>> This pointer is specific to the cpu that first generated the
>> translation, which runs into problems with both hot-pluggable
>> cpus and user-only threads, as cpus are removed.
>>
>> Perform the lookup in either helper_access_check_cp_reg,
>> or a new helper_lookup_cp_reg.
> 
> As well as the use-after-free, this is also a correctness
> bug, isn't it? If we hardwire in the cpregs pointer for
> CPU 0 into the TB, and then CPU 1 with a slightly different
> config executes the TB, it will get the cpregs of CPU 0,
> not its own, so it might see a register it should not or
> vice-versa.

Existing assumption was that each cpu configuration would have its own cluster_index, 
which gets encoded into cpu->tcg_cflags, which is part of the comparison used when hashing 
TBs.

But including this patch allows relaxation of what constitutes a "cpu configuration".


r~

