Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AC5A1DF0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 03:07:31 +0200 (CEST)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNoo-0005Gr-BU
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 21:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNkg-0001OY-Sp
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 21:03:17 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNkc-0002kI-6w
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 21:03:13 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c24so30515pgg.11
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=5x6WxA9X/I0zxp34MXDSWB3IBALPUMZV+F9T9U7ks9c=;
 b=P/xSDSz3j68B/PESoV+e7Sl7nNjOp2+IL6GYEyiV88V5VG9DaXTE5pW+fkDTHiH78t
 g8uBoBZlsJx6m5+yTeGFTLSJ63gaaSYgtFm2LAkjerur6lMzZ3S2R2M297G0x7KpIeS5
 qIDUIC7ZBJ7f0qjPu8vyI7cZK1NfyXDff6+sYwwYy4hHVgXyE8yszQXta9rOKyLRGy/O
 bjuiFjbaqTwbFkRjHcPzOjY5EWaKh2dADhmn5VLkzkK1r9hipRwfo0Y2Vw1ujjGOcmkS
 6NbNWgsOttyC7vRmUYjVd1OMkGjoeSnBGaQagIUktQKC52x8NtN0qpU492lxw25d1Lb4
 WwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5x6WxA9X/I0zxp34MXDSWB3IBALPUMZV+F9T9U7ks9c=;
 b=hFLytAP56E3Erx8cCPGoaWVII36J+HQDqkpvAnUTBmEyYiG/0wuWW8Mhau4KHf7EJ7
 b6Hw+6Jzh8leCGwL2P87mMpM+3VUhki98nc5PPKugrZhlwEKPQiEsHGPM+3EAW8sEh3E
 DVT1gi8R4Z8cdkKgJpfBNApVYg474dzUTvv31R5aPADK46HStArHXMws1kDnF1umykYN
 KKXnWrIY/ymUXIiAOPGXuoXu4hmHUBleGgpfAsI67ct+dxZKcJyErfZelAZA0uMecdx6
 sG9ZL2UdoKKidNIsoqcWUGaUTfScszB3eIP8R9yjPg54sEYHofp6byw3Py3cllRrVHb+
 gkAg==
X-Gm-Message-State: ACgBeo3VKhTAh/wTACbULseRaaGZkSJeate6LNqlsv8R5WPYjU8aCVhc
 R9vivCLbZXwYpB1tVq8jD9IDug==
X-Google-Smtp-Source: AA6agR5fYnO3L6eaO5xh3uyn/QDItqOvpAvobO37G65ABjEqdS7W47t8tF480fPPaBg4p9G39sVnYQ==
X-Received: by 2002:a05:6a00:b53:b0:537:7f7:63a7 with SMTP id
 p19-20020a056a000b5300b0053707f763a7mr1569359pfo.2.1661475788354; 
 Thu, 25 Aug 2022 18:03:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 n27-20020aa7985b000000b005379e480445sm277732pfq.94.2022.08.25.18.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 18:03:07 -0700 (PDT)
Message-ID: <da84c6e1-b404-5e76-4f25-343dc395ea55@linaro.org>
Date: Thu, 25 Aug 2022 18:03:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 14/18] i386: Destructive FP helpers for AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-15-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-15-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Perpare the horizontal atithmetic vector helpers for AVX
> These currently use a dummy Reg typed variable to store the result then
> assign the whole register.  This will cause 128 bit operations to corrupt
> the upper half of the register, so replace it with explicit temporaries
> and element assignments.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-18-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 68 +++++++++++++++++++++----------------------
>   1 file changed, 34 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

