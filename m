Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD44387B13
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:26:19 +0200 (CEST)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0fq-00068X-BP
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0dx-0004wf-10
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:24:21 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0dt-0007Xf-PV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:24:20 -0400
Received: by mail-vs1-xe34.google.com with SMTP id u188so5006733vsu.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fD5+JH+z+nRULNcjEPnUgqYNSG6uLIih6Ts1AftkTjI=;
 b=v0ptJDPaKklFXh7650xYxdpFM24ldWgYMtDeOjZ6S937XGoXPgJgALiazirWIf3UJ2
 diEAuZC/fJKuuTeJtT+jKmH1PAttSFo+iT5ZG5VgaOlPvovkmTvi4ICLtz38Ltuyqm5j
 O784EEisMEoQi0ALPwFSysZN3i4GHi6psKCg/ThxXsPpkpRdi7UxZabeRE9V/bvgZMg2
 qvbi8i8rjAbR7Wv0eVikiPg81qMTEUyrkDVcqmmIBCkg9qbURKBGqBHOhDzZUNImp6WO
 InaCdV+r2Skq7GgXOgzOi7kitxd+rs5uwRjQ3XtNtq3f+OZkhTwV5W/IIKN/fi6VMx+w
 rDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fD5+JH+z+nRULNcjEPnUgqYNSG6uLIih6Ts1AftkTjI=;
 b=hrXt8Fwy8pIRjc19QBqxI1KV9dG58TCvmdslNP6ie16lpfNcK1HeJsPWrRFDQH5o0F
 PS8zuGvsvIb2sUKTRJ0398G+pqQva58fsN2zRShnkTdJx8MlRdWS+5aZUw3CHzY8kPQx
 OTBzAD8TU7s5qc1Y4AZPZ7AoFBbLBOvSFp9AsdbD2TyICRPsEmLpJeBZzGZKanMoU7Ez
 eBYIkzn4VQZqTQRV3pxeptn1FWpE0ZMGiNzLKnCp+0tUWv0LPiEqGxwka1cl5bOWfZhm
 cazA3ZPg+KdDDx9D85fmagK0Tvxrqp/o26UGI2T2LuLONi5sB0dZkxLTGE6EUPydHkFD
 aj1A==
X-Gm-Message-State: AOAM533e3DqcoW10S0EHj9cJTN5lSikWEXlC7sWbFCL28Y2gpUVperlO
 hQzAZvo+sAHaf/NgFDVEBoxkvA==
X-Google-Smtp-Source: ABdhPJy1gm5e4RILC5NlPX+++OGqt4aFqQ2xuWIyQ892JNpXtaa9nDL+2u4K1emBRDwbcLNDxnba8Q==
X-Received: by 2002:a05:6102:2322:: with SMTP id
 b2mr6622470vsa.52.1621347854300; 
 Tue, 18 May 2021 07:24:14 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id h129sm2951555vkb.36.2021.05.18.07.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:24:14 -0700 (PDT)
Subject: Re: [PATCH v1 05/11] fpu: Add float_round_to_odd_inf
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-6-richard.henderson@linaro.org>
 <CAFEAcA9_gDgL=QJASxS8ysDbFaNXYbMXAqg7X4jkYyM_5JTo2w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a7f0d3-dcb2-1436-52e7-666cf9f4f9ba@linaro.org>
Date: Tue, 18 May 2021 09:24:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_gDgL=QJASxS8ysDbFaNXYbMXAqg7X4jkYyM_5JTo2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 6:20 AM, Peter Maydell wrote:
> This code change looks OK as far as it goes, but there are a bunch
> of other places in softfloat.c which switch on the float rounding mode.
> If this rounding mode is only supported for a particular subset of
> operations we should at least document that in the comment.

Once the softfloat reorg is complete, there will be only one place to add this. 
  I didn't want to go overboard on that here, or necessarily depend on more 
that just SVE2 for now.


r~

