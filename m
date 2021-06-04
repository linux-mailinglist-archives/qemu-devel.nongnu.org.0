Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251739C1CC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:02:25 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGxU-00060w-1y
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGwl-0005M6-3o
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:01:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGwj-0004Bv-M0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:01:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so8123101pjp.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xc6pBBUIVORGRE5haa1GPmqcBzbpGRkbcaNsUtcR/C4=;
 b=rLGT9k6wHyJ+CWdZuiiPPJcUiYdqrmeaLscmbvLlYUf/1RAdfUsIR9/+59d3tfkF9P
 WkpQL4alD+6NkcMnYPS951BvptfTN4hB9NmTma2qfATJv3Ggeouaob1c6RxuelNqGuvT
 tVCBKnhvTybLrlNRcamtxZEnREvXeuuSlWXgssA+axIHWSaRK+xt9bP0Mp1IPn4hay6e
 xoVXFt3KPIYMTbRa/I2ghyot8gm3L+enhBhYXLy+gdnKTb5XxWdHiu2G2ckvrZUiu//T
 tcueRkUdEuBsmRnfzhh2X9Y/UFcoDYTLJeueg/60+XpS0j/0V3lqaXfxh4aS3MIKXy9c
 pJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xc6pBBUIVORGRE5haa1GPmqcBzbpGRkbcaNsUtcR/C4=;
 b=kcRBWuIR/I65CbhOYaCZwXljg8o0RwPUfuJUq6TELqYbOS0m5rTX8E4T0euAIY/a7L
 ug6dLKc3cowBqZNudWiFSmeiEe8ioJgJzYPg1caBfTsrnwc33JMlc1KcIbVfUtlfBs9S
 t7vljrgFXJn7wb8O8uUx/0OR/6UoI2ahK4Hsw7TjS8lPy9Pv+SDmkdJfznfZmzGS0izh
 vkqak7BZwwAalsmtyrv5tbx83Uih6xbyHkxtmw6vbZPfAHkumq9PRjDxRsgMvxQgAJWZ
 /8NFZdVp+E2Nf0wt+DO4H1QopoNGDqu3yQZdrDrPCrMuOe0ngaH4ygnpSvAHjGlG6izz
 w1QA==
X-Gm-Message-State: AOAM532cU0KCjEnRcph17rRr3sDbLCANg2fQAV5gmSI35shE6Bev3BZs
 a8CDr9TA6pIClvHOYdlz1w9bBA==
X-Google-Smtp-Source: ABdhPJy0RU0IRxcEfjY8aEM9lBGNS7zBeJsAqNkZcIrVvkwFYLZeon1meCdAu/pCp/sndMuGHVnjjg==
X-Received: by 2002:a17:90a:e2c6:: with SMTP id
 fr6mr18752137pjb.198.1622840495825; 
 Fri, 04 Jun 2021 14:01:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q68sm5537570pjq.45.2021.06.04.14.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:01:35 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0411b63d-e610-fc7c-6910-518752086fd6@linaro.org>
Date: Fri, 4 Jun 2021 14:01:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
> 
> Suggested-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-5-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

