Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA45AE171
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:44:40 +0200 (CEST)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTGB-00082H-CR
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVT7a-0007MA-8v
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:35:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVT7Y-0003YE-CM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:35:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id t7so9049063wrm.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ikx7nJZviP34EixDJTT5ZOTQd0XCieU1V/8Sda0JO7U=;
 b=E09jAa8JZj9Z5Xbq9QlKcRFnMsb20v4oONwYsRlnpLsguvnW3RW3S3lPXzcknGOp6f
 EKzuzHBvgwfLLKBbyvvO/npeWEBKwc/jhX5s+HhcqUXg7lQbDbjPkv4LzbQJVjPhe2NJ
 vaWHWMnPVmXI/ucAYjL5UwYPHmxfRunbG+pJb25CiFtAkqsl3/5PxGr+cd95vigfu2dn
 6JGTp6v+WwvV52pU549Lxmpl19dimhYhN+weA6cKjALoEwhBTmtSCSpnVSlrhkBpCJfZ
 gb2Kta/s2eN1OD+mRT5oJrwbPUK6nB6B0+YnlEUlZEJvBphPw3Z08eUGdAQv64mriC+T
 ANBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ikx7nJZviP34EixDJTT5ZOTQd0XCieU1V/8Sda0JO7U=;
 b=ozXp5qysU1lYyaMaaGDu81LShTjsayHiwbt995QmIJ78PUoyQ2csNV8DFDLI2LobZU
 ZeVRWUAIcgOefGuCEVe11mplnOzQg/h6LphsO2kfYfdr4uLO6cdcLdqzFoxmv0X3Frw0
 n+tx9GlszE1/bQoXJwxor6m5GbgjnjWeN8bN4pbaRlXinSZd+DEiSv2KpZlYW9OEzzu8
 6G37CIHPjPzDrbenumxs/tbaAHBzjQNZ4zBSh1MI21gNiy3Nw4/U4kg5B+yyu93zoChx
 KRBDgQ6VGdxducu62lxNjJjI5F2o9K7wf8X/IZAzL7InFzCQ8U6Y2U35UMbqwrJrQeG4
 bp4g==
X-Gm-Message-State: ACgBeo0rIh72gIWbGRiozgLkz3Mba1w/QFF+O9Y9XMKhiiP2Cj5we8HN
 EIec4F0JDY2yMrm/QpQF1Q+19A==
X-Google-Smtp-Source: AA6agR6nedwCLtDA7NYTSHXgw/doBhuCxsgLfyStdEdzdcTYuIk2Nz8oUQOpGUJagessxtRafESrRQ==
X-Received: by 2002:a5d:630f:0:b0:225:617c:8076 with SMTP id
 i15-20020a5d630f000000b00225617c8076mr26951259wru.692.1662449742687; 
 Tue, 06 Sep 2022 00:35:42 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c304500b003a5de95b105sm18856969wmh.41.2022.09.06.00.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 00:35:42 -0700 (PDT)
Message-ID: <7d31b5bc-65a1-db1a-b7ac-b462e802e5cb@linaro.org>
Date: Tue, 6 Sep 2022 08:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/5] linux-user: Passthrough MADV_DONTNEED for certain
 file mappings
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/6/22 01:08, Ilya Leoshkevich wrote:
> Hi,
> 
> This series is made of patches from [1]. I've added a test and noticed
> that madvise(MADV_DONTNEED) was broken on alpha, fixing which required
> adding per-arch MADV_* definitions. This in turn affected the strace
> patch, so it made sense to make a series out of the results.
> 
> Patch 1 adds MADV_* constants for all architectures.
> Patch 2 fixes the alpha bug.
> Patch 3 adds madvise() support to strace.
> Patch 4 adds MADV_DONTNEED support for file mappings.
> Patch 5 adds a test.

Thanks for that, series
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

