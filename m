Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C161C5B97A1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:40:26 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYlM9-0001S3-DM
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkOw-0007XP-Mb
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:39:18 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkOu-00085R-Ul
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:39:14 -0400
Received: by mail-il1-x12b.google.com with SMTP id m16so9334298ilg.3
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CJInNbT93GWqWEH0DYiN46rKdQ8ItQFSkQ/ZGRYP4LQ=;
 b=tUnP6PMIYd58ZCm+fH5bPBY0iKzjTJhi/7Q0O1j89nGUvFP0QLaBrndwb4UWZXgwSS
 OdPNvtsb/U1MnRvwNHM4/21zBUiSO2BEqpNnSy81X9n0tO7b/o2a4KMLe8NIB13ILqPj
 N71TdsemM/6PR00TpjkLEr3BwyZE/vXxBEjvy+cLPo6YeSBXDs4te0U0cuh7uV2Q6hDF
 O5po51gKvXjDIKea7jUJ/Xj2jIvQYukYjcTmdqR+VqK1Ioeigqakb1l4CJEhjsqWVLLD
 wqk5w207OMK1q3BvnCE5wjEaOOfln/40QL8egRqSqW3VFoVqcNnynw4DQ8ipFNCaBn5v
 6thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CJInNbT93GWqWEH0DYiN46rKdQ8ItQFSkQ/ZGRYP4LQ=;
 b=p4+/AQM9eh3Vk4Aj7lqFlXGl5BL1wG+Ls18M0277gn30OU5mkiLlmYGkfO7OfqUf0N
 9i50Cs3E1LIQlvR9mAUiaP206Jo8lJRuOWQk+pfvF8SGrz5xPbc7kmi0c9vaFqMlEBP5
 ElE2dgH7LgX92PyuKJtvqpzcrP78Xl17s6B1cOnptHPaven2M96Ag2gFu6egpVqpeawf
 2bka++geEEpUWN5/1k0HFrP5qedTMQm3tmUvKilHDyCaI6dTeabwwYv4yqL9Lrr0dcZm
 g55aaRlWTPVvjCmH95CgykoEyiIzrnpK73d7EUN08yuXUyBlIQd479JkYziMuziTKAQo
 YpYg==
X-Gm-Message-State: ACgBeo3e4vbgu1J30irc9j3S9r4TdW2h083cDj27NrUwz93xv+E0qVAc
 UOBMIC6IFcVrl9MV/NtAAPPQ1A==
X-Google-Smtp-Source: AA6agR6t+IiEAByLxzK5Gymy1AqjANBvNMsYZbcQctQyPSrCqqcutn1NOVS4kadFQwEWfEYCvGQMng==
X-Received: by 2002:a05:6e02:1bac:b0:2f2:45c2:235c with SMTP id
 n12-20020a056e021bac00b002f245c2235cmr16466092ili.128.1663231151786; 
 Thu, 15 Sep 2022 01:39:11 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 w136-20020a022a8e000000b0035a4cb79215sm841058jaw.32.2022.09.15.01.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:39:11 -0700 (PDT)
Message-ID: <e99be9e5-317f-db4a-fabf-a6d4c2cfda9b@linaro.org>
Date: Thu, 15 Sep 2022 09:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 27/30] tests/docker: update and flatten
 debian-hexagon-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-28-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
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
> single dockerfile as we do not some of the extraneous packages from
> the base image to build the toolchain.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220826172128.353798-22-alex.bennee@linaro.org>
> 
> ---
> v2
>    - use debian11 consistently
>    - remove "stand-alone" comments which will soon be irrelevant
>    - reword commit as we do need some extra packages
> ---
>   .../dockerfiles/debian-hexagon-cross.docker   | 19 ++++++++++++-------
>   .../dockerfiles/debian-loongarch-cross.docker |  3 +--

Extraneous hunks to loongarch.  Accidental squah?  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

