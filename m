Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9563B63D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 01:04:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozo5L-0006VR-Dt; Mon, 28 Nov 2022 19:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ozo5J-0006VA-HC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 19:02:49 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ozo5H-0004Ae-Dk
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 19:02:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so804868pjp.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rb6fXHTjC8JCm1EEOtyThJxmpF+w+vvWO2MCEGluh9c=;
 b=pPbxu05crBCclKeHutuVJ3SdhahJ5rpfRnUyM79xKvR+9B4Y4KWkgoC4VyLscAwLO5
 5Hnt5fniemdbSOlXinHjZyHxe+5igZHJBCowLReUPta4m9BbKTvKU0RgD6br2OdZAN7e
 7CW9RE6MS1r1ITY0UnID96YkjUQefJpV4vM7IAtWdoyM8yz4WtW3bYNGm0CMBj6AE3jd
 cfHUZ8KbodgeNiCoUH9jCL3d3vwSakDThFZaaaTvB8mgP4rB9V9V1rldDyt7fvawG7+7
 8B6SYUlEVweE+FkxbdNyPAtpAFcy9JOghnKYH1GCnGSvKgmBhhbE3hYSSBA/EMvi7khQ
 FU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rb6fXHTjC8JCm1EEOtyThJxmpF+w+vvWO2MCEGluh9c=;
 b=Q73/JabTGXG47mKdV9SHg35QkKLKhzEmjVd1wlNUnyYcehFqR3RBPI4Q7a4mtkPo4w
 lcEgQlxusxau/Uyl8tcFuwCpdBbWW8fD9//6JNEvcFPd8cgJ2qU02PbUWPX3nwEByye5
 i28JcGLDjOGGDFm6BP/EXoGAei2eY3oaStEA8pbrn6MSeEhRUh5oPFxVkljO4leCcWh/
 Te5e+dTlhw7iUGHmZ535CWn+jU40MT7r6trpTL+4h12ielQTqQ4cR4EfwatC7kP1wZb1
 qI/xyf+DjxdFWCmwOegXMn7It2spKvOUxfOira93lfpDW/ZYsQCf/KsA1eeSamrtBGm0
 E2bw==
X-Gm-Message-State: ANoB5pkWhhqPkoAoaN5xj2yygPwynlDk9e60cMQwIdE8rTuSMndkG6rh
 TbPvWd13YjDY1i/2gLJ9L4MPFw==
X-Google-Smtp-Source: AA0mqf4Tn0GE+hXOqKwiPSuEyiIBrBhwiqrejYZt/6Fh/GTHvdkA+Ggho9LheWK7tnXqkbV7l1Yc3Q==
X-Received: by 2002:a17:90b:784:b0:218:fa11:5f87 with SMTP id
 l4-20020a17090b078400b00218fa115f87mr25191643pjz.25.1669680162068; 
 Mon, 28 Nov 2022 16:02:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:77be:da03:8c5a:e406?
 ([2602:47:d48a:1201:77be:da03:8c5a:e406])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a17090a12ce00b00218bd1745c5sm50262pjg.12.2022.11.28.16.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 16:02:41 -0800 (PST)
Message-ID: <0ab87401-268a-4b97-c4bf-37066e3968a1@linaro.org>
Date: Mon, 28 Nov 2022 16:02:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 v2 12/13] target/s390x: Use
 tcg_gen_atomic_cmpxchg_i128 for CDSG
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: david@redhat.com
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
 <20221111080820.2132412-13-richard.henderson@linaro.org>
 <20221128234051.7j3tre72owh4eyif@heavy>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221128234051.7j3tre72owh4eyif@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 11/28/22 15:40, Ilya Leoshkevich wrote:
> On an s390x host we fall back to cpu_exec_step_atomic(), because in the
> configure test:
> 
>        int main(void)
>        {
>          unsigned __int128 x = 0, y = 0;
>          __sync_val_compare_and_swap_16(&x, y, x);
>          return 0;
>        }
> 
> x and y are not aligned. I guess that's working as intended as well,
> even though it would be nice to eventually make use of cdsg there.

I have a fix for that as a part of '[PATCH for-8.0 00/29] tcg: Improve atomicity support':
https://lore.kernel.org/qemu-devel/20221118094754.242910-14-richard.henderson@linaro.org/


r~


