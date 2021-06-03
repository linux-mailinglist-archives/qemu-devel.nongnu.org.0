Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCAF39A919
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:24:57 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor5U-0008DR-Ve
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor4V-0006iR-D1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:23:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor4T-0004Ao-PL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:23:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id h16so4056727pjv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xsDZJB0e0ZSEvN7GsDDsnhhcwSOAmK6XaCr9o8TRIPs=;
 b=N4jBgW7+ZZnLhe18cY/1lru3sohxPuFeT126+9fNti5jfH1+OkxQ+3TRs4SXuDdwqP
 s8xVDaHulBhV3L/oWALxMf9EOPtfDiLO9IDHkbpnm/sfUUsYQ44NFMXY3Jp17O7KmN5H
 5MTEVfHEd66zazgU39qm96oKyc0/Now/cDl5allXj0TFaoRK2/Fs6qJNDrxA3CYUfjMf
 QQK7uX/Z1rgeSieBmdNHXNfFBmZQ5/HpSG2Z/fo5qam/Tf5U6h/tWHhiJMWVu3+yDuFZ
 BKcqhpo/RiS46wjITA15nObT7gVBLcXxgqWOVweG8MEKYodYRDy9MZq/Am6YJ5BQVINm
 UR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xsDZJB0e0ZSEvN7GsDDsnhhcwSOAmK6XaCr9o8TRIPs=;
 b=hh1dWrhFn8oQf+kH1TeLNrpvrzFNtvUU76JwEUGVfUQJm6wB4sov8rNqlkBZAfDa0H
 3KzVE6isn/XCvpP2Pu8RuDDdthCwA8WowTW3lfYWlKRxWCKYlNINr59klyTDmdzdhgAT
 A5NATAA6BwbdhRQG3XAPb4dcmfS8mVKL7griJGiMqr4/FuSJKdNwh3WtvvHHAo7Lkchr
 2N/eWRq/sO5lkzQD4xqKIkcpZBbukxTCFZ+9n5Bg3+cxrJMustgyKsZfkqjkz3boMeg2
 wN7dCR1Mj9C3mqAAFeUE1fctaoPy2OmgyJaaNeDzSn/oDCPFSA3rDqmk2zegtoLCa7Nu
 I8FA==
X-Gm-Message-State: AOAM5328Z/SwW/sustj82fM1CipmH9+3SmJuRzOWh0nM/NOlQzT2zvql
 mZXiU1kv+xji0xfs6KzSsVA1NQ==
X-Google-Smtp-Source: ABdhPJzYWNtanthqX93zgXC6Q4Rumni7iwvwKKQOPwiNZO6uBgSr3tJe851+TAqOzKJ5gj9w9s3pZg==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr12434853pjp.84.1622741031970; 
 Thu, 03 Jun 2021 10:23:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f3sm2710500pfd.21.2021.06.03.10.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:23:51 -0700 (PDT)
Subject: Re: [PATCH v2 08/26] s390x/tcg: Simplify vfll32() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-9-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8837038-38b1-07f1-815d-6d83478c097f@linaro.org>
Date: Thu, 3 Jun 2021 10:23:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-9-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
>   target/s390x/helper.h           |  1 -
>   target/s390x/translate_vx.c.inc |  6 +-----
>   target/s390x/vec_fpu_helper.c   | 21 +++++----------------
>   3 files changed, 6 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

