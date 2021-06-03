Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4639A79B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:11:15 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqsE-0000X6-4m
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqrH-0008Aw-Me
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:10:15 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqrF-0003rA-FU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:10:15 -0400
Received: by mail-pf1-x431.google.com with SMTP id y15so5369994pfl.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0hoO8uTPxq/3iT4+Q+M8SFghmZbmNJqVgMl4lREq/Kk=;
 b=ti67mgd1lmAtilIdjdEmxMNmz40wgkCmiI72/8mEbzb9nhjzTuFEAE4H8V1QXeYbcH
 lXLFHF2z0miriDsL9owbcT7m/IhltkJJ793+drdaFhvVO1VlPLBwd+q2UbZJ9xZOH5cr
 j3nIwajhEZRC2eUDROSlIqIK2+tO5pwXFlwU1U07WCq5bXHQx9YE1s2qIwrcOPRns0/s
 HYo/lrBFJnVXGzZkwJoZ/lhmtxpiu1Wi/Z1BfvbqHYKm3n8cZj7Q1bcVSOFK1/VMwjt4
 nQrb9+ikHTcGhemTg63dkXLL71bgyV9BiZuQtcTe239GIkHpJKnwUW0iEHAtLsG5Fuo3
 gHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0hoO8uTPxq/3iT4+Q+M8SFghmZbmNJqVgMl4lREq/Kk=;
 b=jn/c8sD9txGs9P5x9W4iMmQZ1V8kY3sA/48wFCL2LN5NzpSP1RGJ7djVMQfNFhev4u
 yCQUhI6cfRCSzkcu0GLQU3hIEjmGvebUhemAXg9hf/Bj5DdxscF3MjdMCO79Z1lUzb9B
 uHBLbJ9eBTIIXzhWI8+/YA6kde4cUadhRF37mU2+fSYL8cFYkDmDo/iUd7gVYSiw4D6K
 pcsVnqkrAt8GeNF+VgY8H8ZSn+TB/C0ymkTz6PShQPins8Sz94F0Cwo6LmegTQkNHk55
 O+oAmmFyO4mNZudbrryuGu/q+cUa5moRztHlqzCETA/wKGLQf0TK0BWj4vRx6EBUjyXX
 gB9w==
X-Gm-Message-State: AOAM532rKI76yspddGKbYXatqLwifEb2B+da377QxhJQvECeIrINpoWg
 +TBfxsbKHXHqMhno0Ar5GwHdVQ==
X-Google-Smtp-Source: ABdhPJz/negNeMMNO8GZMje7eGLG64WT1tt6hzEUovINTLrlrzOVSTQZRUe3UoYA3agxSZLtmFbCow==
X-Received: by 2002:a63:d410:: with SMTP id a16mr491900pgh.298.1622740211551; 
 Thu, 03 Jun 2021 10:10:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y27sm1007688pff.202.2021.06.03.10.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:10:11 -0700 (PDT)
Subject: Re: [PATCH v2 03/26] s390x/tcg: Simplify vop64_3() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29506698-47b8-7dc2-16f8-1e2cc1164296@linaro.org>
Date: Thu, 3 Jun 2021 10:10:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
> Let's simplify, reworking our handler generation, passing the whole "m5"
> register content and not providing specialized handlers for "se", and
> reading/writing proper float64 values using new helpers.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  4 --
>   target/s390x/translate_vx.c.inc | 11 ++--
>   target/s390x/vec_fpu_helper.c   | 94 +++++++++------------------------
>   3 files changed, 30 insertions(+), 79 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

