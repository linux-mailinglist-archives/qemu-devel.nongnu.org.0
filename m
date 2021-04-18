Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E13637E2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:36:04 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYF5H-0003rb-Ck
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYF3y-0003Cv-LH
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:34:42 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYF3x-0007XG-3d
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:34:42 -0400
Received: by mail-qk1-x736.google.com with SMTP id d15so21109257qkc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8B7Fe2u5WKb1Or/HdCrEAJXX0veTElS8HmRXYE2jpJg=;
 b=nCs7/0Zo/poEDFbsK3z7pwVIb2F+R+Ot5nCqEVRbtQjXDJI474ZjoR5ZMigwEuVuRU
 NEGL+JYmCFxl0bfjhBsRJ8EsmQpd6hbnTtBjj6YlFnaTaztTooqDo3EnsAXxZWg4UHch
 zB3i/hbXkLU/SZydQN77DODpF2xguNjJddgvZIYf/9rRP8HZGwXF2LLl4dHmuYgLfXGP
 KIOYreoeK3Fz3yNpnVEUMf38CWJwF1Lv6Du706TSb1ghUlzHcxn6sEgqH0tWUxnTnLTF
 8lymK3m22NvQTU4LvgldlPZ3EbJTYtVBUu3mKpe0fofttBh/+hT0gDxWtcAou366UrH0
 81iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8B7Fe2u5WKb1Or/HdCrEAJXX0veTElS8HmRXYE2jpJg=;
 b=ULsNyjQfF6Xg7tQcbqGEK5GIXPUJUOkxFOFhIkBuZqWLpalBIN7StS3Cl69UQvnkIL
 mh0U513iM8wMNWK3zXLVgLHnzXDhE1m5qElxUhZ6yAVPFzAUwj82xgblvJjP3SEIUsac
 pTIsGTTCqJIW+A+NkaSZ+cKh0evS0qVtUX3iEkLHjJeitPZgtfd8eOAHdcrua1YCM+N6
 gZPbeeWyv+4GhBC3wPZruoBDog0JPZugEXBTfm/4MVE3wVwd4o3297w4H7WRzeMaOnA8
 VJrJP31bYUKUcwR/lqJyLKASd+0qlUy6nNhnsr/E/J44XnOhCBoqsNn73TCRGeLjTDJX
 +zYQ==
X-Gm-Message-State: AOAM533QBZWCQZbc1YoFkniXVja7uVnhVjsNUcXe1XbY8thQwjS5kPMX
 yCyomVtm926DwMDrW5sJ7apDLw==
X-Google-Smtp-Source: ABdhPJwH7bK8GdbCQFibQAzANMzvZVPUXpSu7ZCBq8YIukBca+n8592YE4DYQ+BTtTvYXIHGTBykig==
X-Received: by 2002:a05:620a:1038:: with SMTP id
 a24mr3868824qkk.417.1618781680103; 
 Sun, 18 Apr 2021 14:34:40 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id k127sm8481041qkc.88.2021.04.18.14.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:34:39 -0700 (PDT)
Subject: Re: [PATCH v4 07/12] target/hexagon: expose next PC in DisasContext
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-8-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de3c9fc5-a1b1-68f7-7200-c5eb7caef4f8@linaro.org>
Date: Sun, 18 Apr 2021 14:34:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-8-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel<babush@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> Signed-off-by: Paolo Montesel<babush@rev.ng>
> ---
>   target/hexagon/translate.c | 3 ++-
>   target/hexagon/translate.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

