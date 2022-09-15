Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48E5B9778
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:31:53 +0200 (CEST)
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYlDr-0004Xl-TD
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkMT-0005zy-NK
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:36:47 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkMR-0007lm-8J
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:36:40 -0400
Received: by mail-io1-xd36.google.com with SMTP id b23so14196589iof.2
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=u/RVzed4QlL9PpFvNTQ0s2MdNV2ek+NO/vdXSeYEOho=;
 b=JOVpF2lDpR8tTOy9/zNcHa8npcNwRG4sapL8NSproAi755g5NFI7Nf/IHXyzVy+JNw
 HAMTZtH6QPPiDk2y9sgg24MDYWnwvVbWRpcIQggMMJWig0je7y2yflomootRhZ3A2Zqj
 CdITlO50CVAd+1Nu7TKG6eG/xYZPcC3s0JogAxOoh1aFgSqSJTfnhJSHKT1nVl2d2tWl
 SQA1HYcnFycShzwDtxWyJzs7xjhUJ3bulvy1MsdXkBZ4cc5rVSjsm7RNbW6stDGMjoSa
 GL2+jPUzw9eNPluE8DO0GHxJ2LXx4MzB+SLOB4b+iFsGGZ3PiMWFg6rty0FiV3kkoiSF
 UMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=u/RVzed4QlL9PpFvNTQ0s2MdNV2ek+NO/vdXSeYEOho=;
 b=llhuCjRHrI1ysngtOfvwA7y4AvJ+TT0/WmEDuePeqB05CkmlvCuasvay+wYgpNmy0s
 3Sql86g0aMnbZCcvHNgQwt2h1/FqBkkV5h64lH3yFSbf3yrdJeACiSIQ4dYCEzFqIqGZ
 tjOyKvLQrdk8todQrABVXS/ccnq1kK4Xx9K703xPsJX+F4NYp+fNOqjSSesHt/nanLZ1
 MbaP3YYtA1TKNzFJto8vJY67WX94Y5FdHihqAHIiwL/rdBSpqhT7C7B8tlEWi38I1m1t
 3s99b0J0WLFJgal73bMFGwKK7DGWqrc5jQogmABOYk/SKpkhJYUsMxmVxgrDbVKErv2T
 GfoQ==
X-Gm-Message-State: ACgBeo0mfeTt0mOOW4N/JdqiWa1Uq1ElEOIQ890Y3y3CmAyC0/7S+1V4
 VUXpnBFvGL7MSnIfoYgAGyLh2A==
X-Google-Smtp-Source: AA6agR4MXbxMOHOrwrSvRDkWAQErSrWHsq9FatpvH/zNNyr2S65x91CVbWQTeucgKhp7W5Tx2QPIPw==
X-Received: by 2002:a05:6602:1592:b0:6a2:1feb:4809 with SMTP id
 e18-20020a056602159200b006a21feb4809mr736845iow.214.1663230998107; 
 Thu, 15 Sep 2022 01:36:38 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a05663822ba00b00358444942easm842372jas.3.2022.09.15.01.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:36:37 -0700 (PDT)
Message-ID: <67f04a50-98ac-64a5-cbcb-cfc96ace3241@linaro.org>
Date: Thu, 15 Sep 2022 09:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 23/30] tests/docker: update and flatten
 debian-all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
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
> Update to the latest stable Debian. While we are at it flatten into a
> single dockerfile. We also need to ensure we install clang as it is
> used for those builds as well.
> 
> It would be nice to port this to lcitool but for now this will do.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20220826172128.353798-18-alex.bennee@linaro.org>
> 
> ---
> v2
>    - move ccache/clang/git/ninja-build to main insall stanza
>    - minor comment tweaks
> ---
>   .gitlab-ci.d/container-cross.yml               |  1 -
>   tests/docker/Makefile.include                  |  1 -
>   .../dockerfiles/debian-all-test-cross.docker   | 18 +++++++++++++-----
>   3 files changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

