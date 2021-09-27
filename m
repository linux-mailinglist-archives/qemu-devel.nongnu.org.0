Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7D418D32
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:04:55 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUe8c-0000Jq-U6
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe6J-0006lF-3P
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:02:31 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe6A-0005ND-E1
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:02:30 -0400
Received: by mail-qv1-xf35.google.com with SMTP id jo30so10123347qvb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZQNl8y+FN5hvck98x5s9fgNUO9y2KfHbAl/FXyvMLco=;
 b=kRu6m3W01nhoGujDnw08P3SU0S20mOnNLOpNezKvtxqbZZGW5y1Buv+bp1bvTc18Lk
 rq7bwde7YXt+jzs7cttsGA8GJkFYoK0M1IPkK6GmU7WS+xPS4iqNLg4ES8BKE8wZd/Ra
 JGb0Dqo4IcayaYLTV+nSqVaG/1/5inH/5r4Vj7Irl1VH7OgRVutcEMrqMX+RPq8DVMXb
 495aCqVCwGmsq2WblaKYdCMdM1wu29Z5FqoEcjLaeygDd7UuAWIPE2fSu2SUBwpY3qt0
 1BY2l4axhezMr295/8U/0FEMW4X14LREqjL3gUPwNnSOuqhuO5bGBF2cmdbDh5d8H/zL
 c7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQNl8y+FN5hvck98x5s9fgNUO9y2KfHbAl/FXyvMLco=;
 b=lC9+XmjiUxTRe/Ga9DUMYboAxaKe6yirp7NZ0cCOIUWXCYzNM+xbTES7sai9TEh3Ys
 ekqMvKjJW50YaAsRHFJXOdtyHvu/8D0aPMCkx76f/Kpl2J9EtETWqnzkqomjj+cNSbVa
 O+wdwl2Y06ioyaciLabbAyrs/uaRdusLTrYLin9bULvHIWc1hy+9HNr4S+EDhP76+BER
 52Rh/dfYmW1rjn9KolCO8SYQN4f1GHsFCbr3AIc84c0429JIMbaLvMMWmbjy/Gq+AvJO
 N/g52MYFmSmiA47HAFDXlmnP6AuCT07pMqjPDc3cZc15SeA32NhJyrYiogpQUdpC3Kqs
 S2Qw==
X-Gm-Message-State: AOAM5326nOl2q3mJ3X/jCHQXE5cnwYleJL1+EyQdn0nXg61EjTH2Loeb
 VDJsmzAS3AA3B8SkAB1aHIqW89xxwDS2MA==
X-Google-Smtp-Source: ABdhPJygzTRSruIJr1trB42kJaiAOk2lw4OMoVD/OrVCuRLjY2wgd/BHH2M+VLc4QhGtKogx/4Uffg==
X-Received: by 2002:ad4:4aa2:: with SMTP id i2mr21335870qvx.0.1632700941206;
 Sun, 26 Sep 2021 17:02:21 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id l19sm5703659qkk.12.2021.09.26.17.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:02:20 -0700 (PDT)
Subject: Re: [PATCH v8 12/40] accel/qtest: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60208ce4-bf9f-e6c5-c2af-efade5a9869b@linaro.org>
Date: Sun, 26 Sep 2021 20:02:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Since there is no specific QTest handling for cpu_has_work() in
> cpu_thread_is_idle(), implement QTest has_work() handler as a
> simple 'return false' code. Besides, QTest is a "dummy" accelerator
> so not much can be done on vCPUs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/qtest/qtest.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

