Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4E5B966E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:34:48 +0200 (CEST)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkKY-0004wt-DV
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk7v-0000Eh-IB
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:21:39 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk7r-00089e-SY
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:21:37 -0400
Received: by mail-io1-xd29.google.com with SMTP id b23so14173366iof.2
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sagwqiJzF0s2i2jxVOw2gPnxlMWz6VbuB5RnR8EiMrw=;
 b=o13V1FmmEhcl1OSVXu0UFBSLg9cTUjYtDfFiFaWOt1aU+yYAEc0FYxQ6h7hE99kZBb
 mBcU89WcKOys7LRxgnCpfOM8Qn+1soEL+G9+s/i4edTVjlz8K4o6o6wf0AjZUhEbeLg1
 3yFN24VVnHaiRRF5J7wUCdwU2ARQ3/khvag/xcQu8IZXckvsEafBk95s6G7y2YkO/mCl
 9aRxB7ichw5Ri6YX7yvTb4qCdHkDWqBfGlv40Q+aEB6Jc8SZyxPUS5WsSx05nQDr2QPX
 QF9cclh3sEfTEVCGZ3p6rV0OtBDYeRKB68dmrAhHceUEtNvhrFdDqzxN7FHbK9ZQGRr1
 tKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sagwqiJzF0s2i2jxVOw2gPnxlMWz6VbuB5RnR8EiMrw=;
 b=4mkn8qx9+U5KoL/C5RQ5/ZcstMUrZs2g53yY1o3rWSM1gA7dL6Gv4ZwfDh32lju3m+
 +P5m3gGR3wW9KMQ3E+LL9KPWwtYSCwUVz8qhSInQ3vBG5ZgZQqWWfy2apxtyAkwshFde
 UiTa40Kr6q032UVqzQ85B7Oi2H9eI/ad/3VBlBqm5W7Kby74AYzS+Z0Ij8FJKsyXsT9U
 Me8EKGmAaXmyDElTfoLkYdlfkvaoLRatPN3GQLSz8p4nXFiUZTV5tlDtIHz6p6L2OVxZ
 Nwpqbs3iiSjqoHowg68/samv5qQVGD9jkmiGhcbXRYzguqHTMCY3t2D7cbbRtybtxRV9
 WrdA==
X-Gm-Message-State: ACgBeo07B9ADO1iET3iVMkAwIOaf/yBLk6Wkh//hE473QScVoZS/rAzV
 oa/EJWE+nOu77XJ/HqzkvaPBEw==
X-Google-Smtp-Source: AA6agR41x6rzpP5T9P6vE4T7bMS1D9tYBFuLm76yr4LmduQiGlleZxA4qjXoxrdqH/vk5SwqKAVFTA==
X-Received: by 2002:a6b:ba0a:0:b0:6a0:cf7e:b647 with SMTP id
 k10-20020a6bba0a000000b006a0cf7eb647mr12204242iof.137.1663230093920; 
 Thu, 15 Sep 2022 01:21:33 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a6b3f02000000b006a19152b3f0sm4629664ioa.5.2022.09.15.01.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:21:33 -0700 (PDT)
Message-ID: <9e9267b1-d1c5-3720-6e3b-0ca0647efe77@linaro.org>
Date: Thu, 15 Sep 2022 09:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/30] gitlab: reduce targets in cross_user_build_job
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 9/14/22 16:59, Alex Bennée wrote:
> We already limit the scope of the cross system build to reduce the
> cross build times. With the recent addition of more targets we are
> also running into timeout issues for some of the cross user builds.
> 
> I've selected a few of those linux-user targets which are less likely
> to be in common use as distros don't have pre-built rootfs for them.
> I've also added the same CROSS_SKIP_TARGETS variable as is
> occasionally used to further limit cross system builds.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/crossbuild-template.yml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

