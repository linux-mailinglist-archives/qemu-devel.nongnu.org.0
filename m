Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601466CF7E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 20:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHV3X-00032p-U2; Mon, 16 Jan 2023 14:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHV3V-00032Q-E5
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:22:05 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHV3T-0008K6-Rx
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:22:05 -0500
Received: by mail-pj1-x1031.google.com with SMTP id v23so30046054pju.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 11:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UHgUmU2tyJTjx8CLVJS+SuvK330lHkpn1dZvIU/qrLQ=;
 b=TltHjFrT4JQ28uZvU8Z7kusRnEArmZH3b0BgpZK0nNRYyBMg0/7s1c/2tGiAsDKaQx
 VTtkEpIdFWjn8fOTMsFWCfDIrBJYrK5mp3tL+9H8iLZLfnYVUIbzO9+XpFl8XXVGvRHy
 sEyhV4FQU6cTX/ddqOoFlEtvRY6i26sAv9BWh8Qo2sr4xF9FwHym6wOxK4DxOU9ryeKL
 b+BwuJC93mwnG5KwKqsUPPqt4GoXD+3s0xlmgxmjOsfce7UhaE482lfeO1XfHln2jT04
 aLdrf3nGN7haGQCzbIJ15Ko730QCb1aZw4Eax9NzXuARJHHDw0pnRRGaRat9I7ERqvdo
 DwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UHgUmU2tyJTjx8CLVJS+SuvK330lHkpn1dZvIU/qrLQ=;
 b=aMZgPQ2nC5T7Zp/y4SN6QcW1VYaCFMxEvfN/SqrlPl6RccAbI2zKlVsQ6sBWt3LhTd
 v5xo2nx9+VxrBvoIJPzRkaSaRD39+JhnW+lHLmea5zh/onUfit3jnZ73Q5tCy8+m0zah
 hmrlvk3t5KZXLgw0nrb3iUEJk1cg/Rdl52BGkItQbfGNKhNwq+Tch1VLO+/+VQSeMj9s
 YQ3f8fSPsIt+WizTb4Ej1ANhNj82pAowkpFIO9jTUquLrayPoBYMVriaGv+iKi1LJ0l2
 yQ1HfC6UBCFzLH7G8ZUi+yZgFkqyqDEJyXA+38XXIEnGfjmVrhjMKAQRJk5kikEptDuX
 5XtA==
X-Gm-Message-State: AFqh2kqPUyXIqTZtILICdEelvZ0A4WNhg2fPZSsBpNAdOcAe9gUHnGct
 m7zPybdq30/hEqI8tlbANQZFyA==
X-Google-Smtp-Source: AMrXdXsVgySYF6mEmbQyHyKoX7I76uDB43xkIvmFRPHtNNkwY6r6U1IR0HW7f8grCk6RcINC1LOWHA==
X-Received: by 2002:a17:903:3245:b0:186:95c9:ddc9 with SMTP id
 ji5-20020a170903324500b0018695c9ddc9mr21464381plb.55.1673896921701; 
 Mon, 16 Jan 2023 11:22:01 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm54958plf.71.2023.01.16.11.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 11:22:01 -0800 (PST)
Message-ID: <3d4667fe-a593-ae3d-76fd-68f181f88918@linaro.org>
Date: Mon, 16 Jan 2023 09:21:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 iii@linux.ibm.com, qemu-devel@nongnu.org
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org> <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
 <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
 <87bkmye8xx.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87bkmye8xx.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/16/23 06:27, Alex Bennée wrote:
> Although looking at the test I'm beginning to wonder what the sync point
> is between the mutator and the read/write threads?

What do you mean?

There is no explicit sync, because the mutator always leaves each page with the (one) 
permission that the read/write/execute thread requires.

Within qemu... the sync point is primarily the syscall for read/write, and the tb 
invalidate (during the mprotect) or the mmap lock for new translation for execute.


r~


