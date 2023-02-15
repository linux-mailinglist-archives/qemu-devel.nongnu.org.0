Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C482A698699
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:52:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOkn-0003HG-JD; Wed, 15 Feb 2023 15:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOkl-0003GU-2b
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:51:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOki-0002Bv-OY
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:51:46 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso3604175pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OneQExBF34mz2V1VGicYNzZHW2idLzZivbbvwJLJ/N8=;
 b=D5KKJa8oMjS/vMOdkydBNGUseC+QQEbKHRHVtAnJSqKwsSMOxxI1bqAsWg/fFe/e/A
 pXkPqpFwyNOFqYWciIEfUw2bwfg6+tJgUcvIQkoPYRwnQZNy6Wz70iU5Vjy8hp9betd2
 i8dx5KqBZf1M0F1bp7WEzlH4tzs6uSWk/VRRicFEiI3CitCnXJnI5Z4Ijm0anwHEVsjG
 PppER/8kWXODxfblPWPRp1mMOEk7YdklIlkGDptEXHoQuIkL+h0l/A9tzCKpMtmYjo8V
 h7GOAGabwOAmLotqO+vBjQO6+inBw5RNKdrrVVp+jXAscUaI6nQy031XpYbwnJvrjIBk
 rEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OneQExBF34mz2V1VGicYNzZHW2idLzZivbbvwJLJ/N8=;
 b=gI1EkibTtvUYMf7NX/3IbxT6CEYEI1LKXmZ4oAD9n8QozC9Owf3ckESJJCvKChPjQg
 5wylZ3sAb/ehLTa5wbku/mbRWlwswGSYzY8HqsIa68M7ZjxAxR5p65pUhgS2dqpD51Gr
 OThWFTD3Sufo5rBCy/tneDTLVAnakCB+yeEm04nHuzQArzvx8Wa20fWh9EnfLFPFELok
 TmOKKldiza1GBgQvBfMWWyl4zUvNpIOvXZTY45hibIvfSwmBFGRJXRhtHhvmA8ZIctjf
 fN5Ch3nqmeg29zIrFoyGRh9cEiQlOvjM/ncX61gM3aXdtsPnVGz8pn8VzTRu7E+e4RW2
 gTPw==
X-Gm-Message-State: AO0yUKUe+7Zn5VmOsJ443BQKokFyWT6eDyrITe+zDGVODnY5XFgcS9Bd
 J25U3uYYgErk6VKRl6kLs/HkGA==
X-Google-Smtp-Source: AK7set/0JPk07Yf/+lNI7O/8gQYYDl4TYOO24cnvvJ7epOIOwtCOlGWOH8Og98tPq3kwPb5HU9awaQ==
X-Received: by 2002:a17:902:cf51:b0:19a:80c2:4396 with SMTP id
 e17-20020a170902cf5100b0019a80c24396mr3173445plg.68.1676494303439; 
 Wed, 15 Feb 2023 12:51:43 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 iz11-20020a170902ef8b00b0019a6cce2060sm10104787plb.57.2023.02.15.12.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:51:42 -0800 (PST)
Message-ID: <2e503c21-6893-3d88-f853-babe48c20ed2@linaro.org>
Date: Wed, 15 Feb 2023 10:51:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215192530.299263-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 2/15/23 09:25, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

