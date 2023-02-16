Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C68698D67
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:53:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSY8d-00067q-Iv; Thu, 16 Feb 2023 01:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY8b-00067e-5O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:53:01 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY8Z-0008MJ-IS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:53:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso4879545pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dlf0LqVC5h3B/dRXevRNFX4w1yBkPGrHPMQiO9mBUlg=;
 b=j6ButwEiUbtKjNsWPdHZ/Z03HkgIP7d+rVlrM3CK1w7SXaO0qmpOOUOgigxdJSQ46V
 kyMUEPzYFY77aJek3+8PbB/EgTtoaRqw7rJ7CdHK+d8JYWpOkfXtLCu6UD4vVBt4loaQ
 B50R/I+PmtrKcf3aV5gLHnnY7MMlKDbYMz0Hzna6COn95OKV6TCE6igCn9/+1qntSso/
 eR6DbukOMbp8HMELHQ5zwC9RcMEn9Jx7XmLlS2M7QUyMVZHPyYhvKmlxz/66IfT0Y8op
 Y3SSHR3lcYkhZ3MLEeN8nFKK6RvJgoCFcCaBTdiD5xDgNH3LZW0LvQi9HEq0q4N8qTJG
 js8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dlf0LqVC5h3B/dRXevRNFX4w1yBkPGrHPMQiO9mBUlg=;
 b=LLpjmQaCnVzRVjOBg6AQ09fOlfE56jFJdwiD/u+zOGxJFnPK4vWAfRv66MwcWvQBt9
 RojMZYMWlc/VcRvI4K4F3asdxMTTmliREaqn+DjM7JxWaOPbn5bC6gwUcCqLxs0P+nC1
 yEmk1u1nlnrzf7g5B40WsH5XZGnrtAR8ebua9/UuXn1dS3DwlzRc1ISyf05ac5fac5W2
 N42RBxWz8II0qNpk0uZDrRZMzCkFqdCWZeiwhwRq5OT08CTiL7+le6wCbNH5YZLohyvd
 FPHfAbYtgJeeFpKWwmoFgxG0Zk8tKbrYPCoFYokbRkDjAOtXe5rThth2iw1KqRLW+hjQ
 lCxA==
X-Gm-Message-State: AO0yUKXGZQ+OM40X/UMWhCfciqXVG9U3FvK6zpbTUAMWt0enm7nWW2su
 7CBQJwrdEVFa5t4DFaYwON74LwGcMP1hCw5ZC/c=
X-Google-Smtp-Source: AK7set+od2X6awpzAyG8QmViomV6J43llavaOlHxeAssMzhk50etyAhKohOYSb09+mTTsRpw6qjGOA==
X-Received: by 2002:a17:903:84d:b0:19a:8c8a:13f9 with SMTP id
 ks13-20020a170903084d00b0019a8c8a13f9mr4062287plb.47.1676530377867; 
 Wed, 15 Feb 2023 22:52:57 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00198b0fd363bsm496013pls.45.2023.02.15.22.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:52:57 -0800 (PST)
Message-ID: <c120dd00-6e91-36e5-63fb-0c045119ac6c@linaro.org>
Date: Wed, 15 Feb 2023 20:52:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/1] accel/tcg: Allow the second page of an instruction to
 be MMIO
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: sidneym@quicinc.com, mburton@qti.qualcomm.com, bcain@quicinc.com,
 mathbern@qti.qualcomm.com, Jorgen.Hansen@wdc.com, Ajay.Joshi@wdc.com
References: <20230206193809.1153124-1-richard.henderson@linaro.org>
In-Reply-To: <20230206193809.1153124-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/6/23 09:38, Richard Henderson wrote:
> Curious but true: two independent reports of the same issue within
> 24 hours, one with an x86 guest and one with an arm guest.
> 
> Neither report included instructions for reproduction (and both seem
> to be with complex setup), therefore this is untested, but seems simple
> enough to be the proper fix.  It matches up with
> 
>      /*
>       * If the TB is not associated with a physical RAM page then it must be
>       * a temporary one-insn TB, and we have nothing left to do. Return early
>       * before attempting to link to other TBs or add to the lookup table.
>       */
>      if (tb_page_addr0(tb) == -1) {
>          return tb;
>      }
> 
> in tb_gen_code().
> 
> 
> r~
> 
> 
> Richard Henderson (1):
>    accel/tcg: Allow the second page of an instruction to be MMIO
> 
>   accel/tcg/translator.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 

Queued to tcg-next.


r~

