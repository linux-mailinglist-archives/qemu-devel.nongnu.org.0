Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAD3995F7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 00:31:07 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loZOF-00082G-0n
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 18:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZMe-00073X-QL
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:29:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZMc-0003zg-Gx
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:29:28 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 27so3515714pgy.3
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m9Qk/w7QvXXu+r3NEX/SBHk2WUgXUqzciiy8CjIp6zk=;
 b=KH+O3c849kBCZuoTwNvXR1OfLSjunljJk4iIUgf2priNohRWCSPywVMChVJ+wrug/F
 9FA6Gvh4Z6GNpVTaxrNTP6GI/FqQwj4HMuqUsrxPhaHhifhN83SMvDkLSijjKqFp8amG
 J87WGO7C5RPrFqHLFw3XmwubscjVgQv/Dbu61SOFjm3/7UvqrF28N/8KkPWU7P5xMGhp
 QQnIwG3PjbsxOL/4jfhO/9jp0AaaR9KVuY9wz/3MDBD0tK46JHx0IsipAQSYshJcNd1s
 MMDa+6oWYiNfhQQJ/IlrJDr4M29YoxUEeY5d+59E3A8z+ow5dFey/YdAh0uorTaVwhCk
 rgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m9Qk/w7QvXXu+r3NEX/SBHk2WUgXUqzciiy8CjIp6zk=;
 b=kMavJYL6+6YqzBTtQ/QvFUgNuEXeID8/+57vS0oamA8FAee0OAZTPtHrCLGnOkKuQ2
 yTnqTEVxjN7OPkR3YQO1aygVTN8BKxI6+5OBPSbmhrP1QuIkdcGncxUY+T+VSSreLkAC
 icKhweND8XIeMtPnNygyCxRowlqhLc2ecSyzHWzrMap6PQWocPnORDx/K2mNgRsvBcr3
 im9/Wla8NFgem8g8soNwtGBweWY3Dr1XD7VlORqeakrFR29mF9/xXeDp0Kk/uFIuw1i/
 sGoTpdraBIkXn1CNhtfA+DbohrtLrtrkzjJB0ox1J1nDrKkYHWO5amvBjMwVWSidqeZf
 i+/w==
X-Gm-Message-State: AOAM530o99QNyWNxhNujdthFhrFeT0rJl89DVBmRCVNRoMS0Zd7LHF4T
 Tw4bXDL6OaVqvhuSZvSRboP12g==
X-Google-Smtp-Source: ABdhPJyM9XCKop5ib+rcQ8UqGaLwW1FWP7lj/MYZWJ47yP5WVDqmB1t23T4vK3mOSnLH++BxInw3sA==
X-Received: by 2002:a62:7acd:0:b029:2e9:debc:e813 with SMTP id
 v196-20020a627acd0000b02902e9debce813mr15515592pfc.35.1622672964953; 
 Wed, 02 Jun 2021 15:29:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k7sm386442pjj.46.2021.06.02.15.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 15:29:24 -0700 (PDT)
Subject: Re: [PATCH v2 04/28] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-5-richard.henderson@linaro.org>
Message-ID: <272ddf56-38fd-c5c0-c5fa-eec31dc7cd86@linaro.org>
Date: Wed, 2 Jun 2021 15:29:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525150706.294968-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 8:06 AM, Richard Henderson wrote:
> +    which = parts_minmax(&pa, &pb, s, flags, &float32_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return float32_round_pack_canonical(&pa, s);
> +    }
> +    return which ? b : a;

I've just realized that if flush_inputs_to_zero is on, then the result should 
reflect that rather than returning the denormal.

Will fix.


r~

