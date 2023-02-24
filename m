Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5686A23C6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:27:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfaF-0003ll-2h; Fri, 24 Feb 2023 16:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfaC-0003jW-Ri
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:26:24 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfaB-00052o-Ey
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:26:24 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e5so831366plg.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYAq7tNHpZyirtJDO03/Lfisei/KfYLIGWvzP7Vg00Q=;
 b=a+Ye3NBYh0c3TvGXcJriuv2G5vxjroNNxj3/aXm39T8jSfplAF4dIVwhlQWawzl5se
 B78js/RmD/TcjccaL6lJQLFgaY2JFlXZ0Kr53aFPr0QLtBF6PvUWFbgyV+QbeFcaBSLD
 1P29be0/3nLIiur0qvUq+kqLJJ4MTJ5ugbW1Mg19RytfpOwo5jiwbePEXuJNmqWOd7tE
 SB5276LWvifZCSV45M5ro0GiT6K0HS9C2KZ4NSroZnIjaPYnUKZSbwJaZWpoNCP19isI
 hteEbXejt+YPhkha/x08N0aj1yCIbuizGHYnKGfE/s8j4H3fHmduh89fZHcq8W9TGHWU
 1djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYAq7tNHpZyirtJDO03/Lfisei/KfYLIGWvzP7Vg00Q=;
 b=2F4dJvXUwG8noe8+qon4ahu8Sm2DYqhFAdOD5iYFzV6t6uTMZ6en39ehh/YzY2Jvkm
 odoqtADzkwTs82Wrr24xABKYvhzvd9Sk4GGpCvZsrlcQ/iTz/Lvjt11iOX15Mrf2HYgW
 0uZTTaVuUA8d88HM+XA0X1OGSaxw7h+cKBtwTDHxWo4kN19oGi5Rb+ardYEnxx4s9XB2
 OvBWgrdWXe6QQ2v6XTlnRARsKO0Eac/BAcyF9XUEWfT0+GZf/DlWgPY27nPvUtq88UeK
 uLLCE9xl1n1DwNoodkTBlqP/wK5yCIXdnSzUJdQvi9eI/iE5plrUm3Cs2p4JTcE4DouH
 ftDA==
X-Gm-Message-State: AO0yUKXEfirxm7r/EJ4kN4nGOm54PNWzfgr6GOfBmCwzY0fSyJzrfgrk
 Pps+iw68CyLug08LsOM09tM9Eg==
X-Google-Smtp-Source: AK7set8sA0ZrBE0MOyr23FYpDEIwh9fF3+deMRQzty/mWDv1NcBDRvPetGgeBq29Hgl4rQ89pJYL4A==
X-Received: by 2002:a17:90a:e7cc:b0:230:86de:f390 with SMTP id
 kb12-20020a17090ae7cc00b0023086def390mr16724428pjb.42.1677273981840; 
 Fri, 24 Feb 2023 13:26:21 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d16-20020a17090abf9000b0023440af7aafsm113129pjs.9.2023.02.24.13.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:26:21 -0800 (PST)
Message-ID: <7085e0f2-5ff9-671a-42ba-efd61398e946@linaro.org>
Date: Fri, 24 Feb 2023 11:26:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] block/qcow2: QAPI'fy Qcow2DiscardType
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
References: <20230224152019.19278-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224152019.19278-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 2/24/23 05:20, Philippe Mathieu-Daudé wrote:
> QAPI seems designed to maintain such enums,
> so convert Qcow2DiscardType to be QAPI generated.
> Besides, this is how Qcow2CompressionType is maintained.
> 
> Philippe Mathieu-Daudé (2):
>    block/qcow2: Rename QCOW2_DISCARD_TYPE enum definitions
>    block/qcow2: QAPI'fy Qcow2DiscardType

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

