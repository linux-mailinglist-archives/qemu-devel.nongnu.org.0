Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD239A984
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:47:29 +0200 (CEST)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorRI-0004Tk-I4
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorPp-00031X-0h
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:45:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorPm-0007jZ-W3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:45:56 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 69so3273860plc.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9NvB1S9BUbenAMg+XGPd57d61HoOEqcPHlLGX5ldJIg=;
 b=lVgRMf1QiKWP3CAiXuPm60frEV5hQM50NjK+Y6bQVevRU79aQ++QR/hBhb0kGJ2Glm
 Bn9x1igePZpR94PH/czsdDjUGjHr3MHW4RoKmtxCLKbZLLz9ZtlanF3joI5y6RhjpHsI
 Wd5q2yPOSNEzNAP8zcPqjcO13p8/wsR5vpkWCvE+ZxJJehHLuLTSskN7rBorKDT8Bo54
 Vp0F2o1dgWvqosx4WsyYDlWHTCklqMOpN6pVCOInmNaelYr86G7JJlRYUlz24txLSKxd
 W7cURVSarZnnlWOsM2mNQkBrRb67kQudJsy797T2HUw/41VXERiR7mr7qclu8mI+xvs8
 qvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NvB1S9BUbenAMg+XGPd57d61HoOEqcPHlLGX5ldJIg=;
 b=L3S6wx2wk4VTQYVYATSE9yGNOsdNR4197j3gYoXqde5EyLfH+cvdx5FuxVJW4dHKEM
 mQDYujEhcVMqLSS6wp21TOUjXjrbjNf+yZS+oYEBCRzDPgmvxri9so70zKUTv51YpUtS
 CNdkIZpF7BZoxPqIEvcTiDZw+6C1glbcGTJ5YdikcyLaQLPtbPfkuxXaZrXrnb4GQULn
 2Ckopj83pz86QW5Wol+ZZsMujVHRnJ3H6SB8KineZ4AReG6CIrA0kDeBjFsymiihhJE3
 W4wAXYQYm1M4k3ulW1TraSnANIHyj7FLrAuKCU882GN1VCGj97OqDfvQwqpDjv98faB+
 NRKA==
X-Gm-Message-State: AOAM533t+1eO5yANqKN3y9PuvuL6FCSFynsPGnxn2XXT8k5N5m53AH6z
 fT7LK5jUSqueRhWANoOpfSX/0A==
X-Google-Smtp-Source: ABdhPJw/izH5tTggrMU5biRGMRWM3PjA53uWa19sb5G9NmylKPVSXuNLys0BYRLUJalZZuRBV6bt1Q==
X-Received: by 2002:a17:90b:4004:: with SMTP id
 ie4mr410592pjb.102.1622742353315; 
 Thu, 03 Jun 2021 10:45:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g8sm3143494pgo.10.2021.06.03.10.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:45:53 -0700 (PDT)
Subject: Re: [PATCH v2 22/26] s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY
 AND (ADD|SUBTRACT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-23-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6654bb37-7a0e-d0e1-335e-590199876dec@linaro.org>
Date: Thu, 3 Jun 2021 10:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-23-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  6 +++++
>   target/s390x/insn-data.def      |  4 ++++
>   target/s390x/translate_vx.c.inc | 39 +++++++++++++++++++++++++++++++--
>   target/s390x/vec_fpu_helper.c   |  2 ++
>   4 files changed, 49 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

