Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F136BEBAB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBLe-0006ed-EV; Fri, 17 Mar 2023 10:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdBLc-0006dK-Dh
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:46:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdBLa-0005GA-Ju
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:46:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so9362689pjt.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679064381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mav6bocCWV6sxsoPa02ZnhU4GgrYox8+kSkZtzNYfng=;
 b=GjeUfTQF1Wqphm/9WWU+LPm+C8ErhsPTeG+QErQkRX8ajffDbJ65XguybdUVSXC3bb
 veBpbiH+YhkjHv4ZkE670IYZZPmvdaKBgZAr9c8DiOn1u9arzg5VIpZx4I4+ukAVCBMa
 maCqFusA2YWHJUajeEPrhjGJTE0J+vQM6Bbw8MHaJ6UzZrHM/oblZ0qhSmOls5kD7h6p
 hdhGMU/J+anWKM0mRi2lK7lUTz28lF74dhiYyCO97yegQHq0aI0+HRSN2qcNpJpoZW/S
 AwxEAQSkk1Y8SbWyB298Z2QMeGdyixX1mr4df45999+H4E8peK4D7GurHH+CVzkL0L0t
 LZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mav6bocCWV6sxsoPa02ZnhU4GgrYox8+kSkZtzNYfng=;
 b=fQ+c/dY1g8VOjoTHEv7spuJwUeoIMd5aCx9+8NVHSBJpBHBTho7nBJadU0Ctr3Iuzu
 OjZOjXZI+D/PwHt3uLNymBDG7IA3wJeP1okbz+mcjnM36pVw26d/Br/DzOCoQOyGig2N
 oEpOcFlPNyp6n/H4J63mK9VAE2E6CPU9kejPWahGFIMF5ifGVDnGytPIqmcEGBYwPAfK
 DMw+NZz4kOKQ7XgmBJMNsCvP9uCKiprin3YviaN1vN1pSnCYa2sMq5sh/ycBwNjxiX8u
 NygCY1K2gyX6/Hoqo6fMLqjYK60Tg1CSHn0OET7D04zYdurg2jcrj5f3nFwfTD1Nrg0d
 cP6Q==
X-Gm-Message-State: AO0yUKWIoKZo7gGUAHn+TNbGiKnagF4ky+tLxF4GLJy0hR0prgdbjf5q
 8tfP+JIoiSUU/9UvVjIYv6d9rw==
X-Google-Smtp-Source: AK7set+O8Jqeyn9VPnjT/aCsJ6Y+aqw8p5WwoaP9d2uS8EODoJLwi4tUeJV5JkXRyQ2sJ/tOnvZUkg==
X-Received: by 2002:a05:6a20:7fa8:b0:cc:a5d4:c31e with SMTP id
 d40-20020a056a207fa800b000cca5d4c31emr8834638pzj.10.1679064380830; 
 Fri, 17 Mar 2023 07:46:20 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 j6-20020a62e906000000b00625e885a6ffsm1720191pfh.18.2023.03.17.07.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 07:46:20 -0700 (PDT)
Message-ID: <2c4ad288-d805-c130-f1c7-0a42d1125d12@linaro.org>
Date: Fri, 17 Mar 2023 07:46:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
 <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
 <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
 <CAFEAcA_dYmf-6kF58CvrcvL+NjpXYaau+_=vRJPuOXEuNYmEeA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_dYmf-6kF58CvrcvL+NjpXYaau+_=vRJPuOXEuNYmEeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/7/23 02:17, Peter Maydell wrote:
> It looks like we (inadvertently) broke "-R 0 means turn off"
> in 2019 with commit dc18baaef36d95e5; prior to that the
> 64-on-32 default was set by the initial value of the global
> variable and could be overridden on the command line. After
> that we ended up doing the default-value stuff after the
> command line was parsed instead.

(Not 64-on-32, but 32-on-64.)

I don't understand how 32-on-64 would ever work without reserved_va.  The host kernel 
would otherwise place mmap blocks anywhere it chooses, which may not be within 4GB of any 
given guest_base.

I would not characterize that patch as "inadvertently broke" but "fixed bug but didn't 
record that fact in the commit message".


r~


