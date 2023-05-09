Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418926FC93F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:40:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOVs-00060B-Gi; Tue, 09 May 2023 10:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOVQ-0005vh-CQ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOVO-0000A9-Kg
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:39:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315712406so211868755e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643193; x=1686235193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fzF/NOSvcLFtyQQODs7fWyaje/ROyR0iYVv0QhR4UpA=;
 b=BtBBYjNJOM3Ece356IHyQ8XF5kEBbpiuCXO/LQJF2f757QhgFbjzUKx1Kc1I4hxVhx
 9nYa1fPccYPxifWV7ZrAZdff9TwxqY4BQGzbhFHB1Y/SMV+fP3/16IDvlI+tDTUnnW12
 QfJ/X8YCU7/j96ZCpml98TunECzECPiJnfuHIQcRw5ZSd83VZkwl32C6R36HR9iZl0hb
 P9unxtfe5op6JlsiYRMqOcCrLeqMoVXRE1wndgo/3SHlzy6qZcsynbTKv/n0xjwVVbH9
 6SJt7f2ROSedO/nYz+STCvCC0KSM2631+Gj8RpFkAgklu/TPsvTHuwqD3ggv/SYGV4un
 88/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643193; x=1686235193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fzF/NOSvcLFtyQQODs7fWyaje/ROyR0iYVv0QhR4UpA=;
 b=NXZxJFcuVMFzoh5D1CkX5/Gunox5U69Ho2jaaVsUZAfCz994ImpVecbms4sxqwBJIN
 b22jtkRo49765WHoWvKHTqQpAn7OYav+u5BUyHD+yxCJQ8ZsdYjRNk5iblLVnTHsMq08
 PpZZEqlnLmfCvDB2rqZmmHJH8boGPto88DHfiY8WLOYgGgAHGdMWUePY/EyEK5M8OG0K
 14yS973ceorS4B91d/NMgYmE52C44fdqzd+SK7EVerF3Nkyt6jj72eEetWs1xb+B8pVe
 4bKkt1OO3m9C+rp/ttbJ0+PV3t2iWNEgKGw1MBYYc+WY09VX7q1BnyKSYyaFUxqaJimA
 sr6g==
X-Gm-Message-State: AC+VfDx7hTgL+lSECCGK5ecYJ9R04HaRf30gPK9gv/spZd3UfP2XfbLj
 MjjXM1iL+OgIpKgZf0C18uaHlg==
X-Google-Smtp-Source: ACHHUZ5cIHAuPNv2tW3THsA1wl6NAjIcV7txrwsSBZJsKA7gCMjiRGsf1B/EJdVeqNC3JL2uJlFaUA==
X-Received: by 2002:adf:e904:0:b0:306:2d81:341d with SMTP id
 f4-20020adfe904000000b003062d81341dmr13765060wrm.24.1683643192845; 
 Tue, 09 May 2023 07:39:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfed8f000000b003047f7a7ad1sm14631056wro.71.2023.05.09.07.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:39:52 -0700 (PDT)
Message-ID: <059dbadb-c7be-2491-e644-1118c2cd8c76@linaro.org>
Date: Tue, 9 May 2023 16:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: ssl fips self check fails with 7.2.0 on x86 TCG
Content-Language: en-US
To: Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <CAO=notxJzdsy6S_f64f1nXGMGU-ZSr01iRDwc1-EyT5Lj9p1Dg@mail.gmail.com>
 <CAO=notw3-Hhqyr=w-zRbCn=_yNp+r5WYeMd=-3JP3j+MJvfg0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAO=notw3-Hhqyr=w-zRbCn=_yNp+r5WYeMd=-3JP3j+MJvfg0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 9/5/23 04:08, Patrick Venture wrote:
> Verified it was https://gitlab.com/qemu-project/qemu/-/issues/1471 
> <https://gitlab.com/qemu-project/qemu/-/issues/1471>
> 
> On Thu, May 4, 2023 at 12:03 PM Patrick Venture <venture@google.com 
> <mailto:venture@google.com>> wrote:
> 
>     Hi,
> 
>     I just finished rebasing my team onto 7.2.0 and now I'm seeing
>     https://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/self_check/self_check.c#361 <https://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/self_check/self_check.c#361> fail.

Should be fixed in v7.2-stable:

$ git log --oneline --grep=1d0b9261 v7.2.2
c45d10f655 target/i386: fix ADOX followed by ADCX
6809dbc5c5 target/i386: Fix C flag for BLSI, BLSMSK, BLSR
8d3c9fc439 target/i386: Fix BEXTR instruction

> 
>     I applied
>     https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html> and it's still failing.
> 
>     Is anyone else seeing this issue or have suggestions on how to debug it?
> 
>     I haven't yet tried with 8.0.0 but that's my next step, although it

Should be fixed in 8.0.0:

$ git log --oneline --grep=1d0b9261 v8.0.0
60c7dd22e1 target/i386: fix ADOX followed by ADCX
99282098dc target/i386: Fix C flag for BLSI, BLSMSK, BLSR
b14c009897 target/i386: Fix BEXTR instruction

