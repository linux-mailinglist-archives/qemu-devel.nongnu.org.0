Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E266A5C2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:14:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSJk-0003Zk-8s; Fri, 13 Jan 2023 17:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSJh-0003Z7-IO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:14:29 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSJd-0005HP-A2
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:14:27 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so6793573pjm.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Us/2GYxR1CvhyTHZ7Rv1cdbUiuMJ/PsykrqC7LNnkc4=;
 b=SbA9eAQAMwScCRuQi2Nnr5+DPoiToXjAExv3iOLnevZymxF3qM3BWuN3IxLZHN96q7
 oTOgvtK3iedmykY1rjk+df6/SaMDvRhGgjzFH5czbdjYar1GNc4w5mDsr/PkQlLK/ol8
 U2OU+ODVGUM3BjiR+XIcrCgg1PDVWhrqxUcnM0Ogim+ku6tMd3sMF7ju/sEBsUzJZ7Zb
 IEwGaFoMlGCvURmDhnY02UKvEKr8V856ranFDkjXSYCY5v84f0sQbzUKTXP8rqCAVcij
 gjbc8ZTIT5dPrshxif954j45iUqm1cJuvCDQjtd1lXNZ++ia1tEpmLyjhKzviyGC41+g
 qzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Us/2GYxR1CvhyTHZ7Rv1cdbUiuMJ/PsykrqC7LNnkc4=;
 b=1YIs0XZ4u94+1K8A2xOPgw8gyVbHE0Z4SxrlWyAGgfqrQZBeZjbSZZa9XY3CFxz4Lb
 8FnMKA2Vwqr+h5JlAbsAU1tv0HnD6w+sPuqTHispODJbXivyn2QswinZKhR8mAqN5gJJ
 F0jYUu8S3FJbXnVrKQonRo9gAiSkLwqD2Tb1MOpCvodE0wtTdWbky1juQw9VfAfJRPd4
 FBOTNyV7SO0fHuSL0VNSisJFNgmoJXgpnK+2uKpHhAoTY6K+ZcQQvs325R4sojMj7wDp
 zQGaIlDkYaS7HnAS3/eV9vpmfrvZlR7xUqlICNwuOx9uDOs5hJSGfpfJCnfnLZ7MeUme
 ia/A==
X-Gm-Message-State: AFqh2koeIbNkShUlyZHL7L3at7KTX/RMX5vTK+MW7Q5fr2Rl66l+YAIh
 bwB/xu5wPp4TuDYrWpfxOXenfQ==
X-Google-Smtp-Source: AMrXdXs5HUW/DUY3ml74rXhm9cnZziC/7tfieTRm2hYyMnXP51HQ3GhjGf0Yqa6kh5BX5T9bO3EJ5A==
X-Received: by 2002:a17:902:784a:b0:193:3354:1c22 with SMTP id
 e10-20020a170902784a00b0019333541c22mr11712612pln.39.1673648063449; 
 Fri, 13 Jan 2023 14:14:23 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d90500b001946119c22esm3708918plz.146.2023.01.13.14.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:14:22 -0800 (PST)
Message-ID: <da04028b-3f5f-6388-ba8a-734cf3901ea4@linaro.org>
Date: Fri, 13 Jan 2023 12:14:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 25/28] tests/avocado: Tag TCG tests with accel:tcg
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-26-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-26-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> This allows the test to be skipped when TCG is not present in the QEMU
> binary.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/avocado/boot_linux_console.py | 1 +
>   tests/avocado/reverse_debugging.py  | 8 ++++++++
>   2 files changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

