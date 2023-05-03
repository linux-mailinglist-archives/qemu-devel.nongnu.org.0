Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8236F55E0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:19:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9a0-0008Mm-8l; Wed, 03 May 2023 06:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Zy-0008MC-Bi
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:19:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Zw-0006sb-Rj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:19:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso31051025e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109159; x=1685701159;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPR55VHfjXvKEf6PgZxA+DsiAewgsyYybyCrK6XTDoE=;
 b=vIXjyvbGhP1pw9e4kM1ZpM936HjqEf6CzD+wLFQCJ5ZWF6vN6MjY/IK/BcYWDRB3Mc
 /Yt1oH3sflBO/e8cIXjBO323BXqfUGII/xYfAi/22XxJqnDtlE002PGwxtF3yJt19swn
 B9qndh2o7tCTotI4u0NxWpRAwsdK1j30rRZ1CoKI/pXzSFhuufMgU2U6Q/RYhwdmZ6LE
 6c96yQZWGyKMxFZcbqqs61mEKaN+otqqHuSq1+VsBh6SrspSLLA/ukoAfwPYIvBC8ogc
 AjiM7RXDYw7qt/iR+3xp6zRraE2Mzs9Isu0yT03lNwmZOKbIrfwZ6CSA0skdNW7dJi3b
 O+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109159; x=1685701159;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPR55VHfjXvKEf6PgZxA+DsiAewgsyYybyCrK6XTDoE=;
 b=dhSmjErvVk0cHmHoX10TBTrf5cS0rsp75rWh0rwuw7PE7sLnKfKvYSVkMwR/Ul6FTk
 aSZea9soPfYDJ5v6lFkQZRkfoth8snWJDrrfGzNsOVrLqQkg8Gwkfw0ZUjs4Rb7aFqbz
 WwebkwtsrZFimxqrdG5M0gVrwVxaljuyOJ7cjO8+1XQKc7J95Zfs2nvDG9YlXmrgii2W
 nRcqsWujKp/E7TM0wI+nuHm9dIW9w6ZYDhprPb/wyXzZh9qb9Og0/HJgoMgrx5Py3m+4
 Z33M0w1sdhuLrZqkEEyBd6s+I5uwFlOrAWPeZaGIWcwsWPW3XOL/WQOLf4Sa2ptMNpDz
 c7jg==
X-Gm-Message-State: AC+VfDyk7d/+n+YtY1Wnv9dSMXYygG42AaWkv/zKvZnoygYFFPaRk782
 Zwj3sJYehqbrvGtrU7t/aVftVw==
X-Google-Smtp-Source: ACHHUZ4rdh1QmSIo+knyph72AiTi2/ay2chXpIfs8OTTyXcnt1T9sDypMxAMlOvZCSph9tusjea7xA==
X-Received: by 2002:a1c:7417:0:b0:3f1:8ff5:b773 with SMTP id
 p23-20020a1c7417000000b003f18ff5b773mr14162861wmc.6.1683109159306; 
 Wed, 03 May 2023 03:19:19 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm1431341wmb.25.2023.05.03.03.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:19:18 -0700 (PDT)
Message-ID: <f662fdf6-38bb-2c11-a9f8-cd2b4144c782@linaro.org>
Date: Wed, 3 May 2023 11:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/22] hw/arm: Select GICV3_TCG for sbsa-ref machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> This machine hardcodes the creation of the interrupt controller, so
> make sure the dependency is explicitly described in the Kconfig.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-9-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

