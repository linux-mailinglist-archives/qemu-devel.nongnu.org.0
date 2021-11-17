Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED424545B4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:31:12 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJ9j-000896-Jx
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:31:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnJ7r-0007G2-FO
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:29:15 -0500
Received: from [2a00:1450:4864:20::42a] (port=41558
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnJ7p-0002Ma-La
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:29:15 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a9so3984940wrr.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 03:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cUrlBZmiyNrpbJm5/JfIJrbJfwN0oJT9y3uFT5IK0z4=;
 b=k2B7N2azBt2egen/MmKh9tOqKNOKQNN1vuMXdlbpa8OmNI0pCLAL5JThnypXYxB/Tv
 E+byh5HZpADRZarpWxyBn9aO4u9gbRvAXVkhgNnrRb0GI/Bi9JOGmQnK72RBXRcQk3Lf
 c65MC8BT9rULEH7y6zzUdk+qBc5H1jWgUsvkgRhktGNNsFkUz7coMd+aKeMRPf+sv4Rc
 LeRfgNSoczkzD2DQRDbXCGVExEdcS53s1nbspyEfPIiGa73Fetn6l0EMep6n/EKQOKxw
 4TNLiuouRt1sAu8njLcruF9StBh96j5+g8dukVnT5tqU+SQfxBkKZ5KonXyTzoS+L1tX
 643g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cUrlBZmiyNrpbJm5/JfIJrbJfwN0oJT9y3uFT5IK0z4=;
 b=A/iW8l2hXpn0csjns64r4iF8hZGTtcMJ+z3h22evfpFBK7oZfChbczkMEityu5LAHB
 hUtQPx6MfKpOzJHoMmcMGVkgyGW0Yf7any8qoB4OrhfPulH8VcTFNlVh3j6WP2/O546e
 3Ak4ftxD66TvU1vqQQHMON7igXKKZqKmz+hSWS5eVxAOmGy9ZgdEjmJ464uEmdYuUpdr
 6FNUO2XG8uaNMY9d1trEpFDEw5JXENbHaARV7qrxSH8KAhBO8oxuPRYddJ9kXbK+kiDT
 nW2pJ9KeI/7RFtByoWAyCr278Nr5Nven8W1Fis6sibpLcKgzhceKosb/N3SRG9FPAWzE
 8r0Q==
X-Gm-Message-State: AOAM5307ZZHzHfQasdem1m2wBJ3BsTWxlUSmLfrMEloj5TZuTL9rvIH1
 ASHnnDol7LfVy2llxzfOOiNVkA==
X-Google-Smtp-Source: ABdhPJwm084+CtkAk6XZRA7la4/w2q5/A+7j22cIm3VBsXDbHqdS9CtRanePCwn8vEOY8xHSpkOfpA==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr19847970wro.395.1637148552076; 
 Wed, 17 Nov 2021 03:29:12 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id l21sm11006660wrb.38.2021.11.17.03.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 03:29:11 -0800 (PST)
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about to
 execute
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87h7cbw1tx.fsf@linaro.org> <207105cf-bb82-55c5-ff30-e29517c970f5@linaro.org>
 <87czmzvzuz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7de6e995-97fb-9431-f6fa-ba1ed15ec20a@linaro.org>
Date: Wed, 17 Nov 2021 12:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87czmzvzuz.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 qemu-devel@nongnu.org, peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 11:29 AM, Alex Bennée wrote:
>> Still missing something to avoid cpu_handle_interrupt firing?
> 
> Something as simple as:
> 
> --8<---------------cut here---------------start------------->8---
> modified   accel/tcg/cpu-exec.c
> @@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interrupt_request)
>   static inline bool cpu_handle_interrupt(CPUState *cpu,
>                                           TranslationBlock **last_tb)
>   {
> +    /*
> +     * If we have special cflags lets not get distracted with IRQs. We
> +     * shall exit the loop as soon as the next TB completes what it
> +     * needs to do.
> +     */
> +    if (cpu->cflags_next_tb != -1) {
> +        return false;
> +    }
> +
>       /* Clear the interrupt flag now since we're processing
>        * cpu->interrupt_request and cpu->exit_request.
> --8<---------------cut here---------------end--------------->8---
> 
> ?

Yeah, that should do it.


r~

