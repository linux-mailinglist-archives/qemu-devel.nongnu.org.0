Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D1840A264
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:20:01 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPx7A-0006Y0-FL
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPx5w-0005sU-Lh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:18:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPx5u-0007lj-TN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:18:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1462244pji.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 18:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2claGdAs6bkmVOrvKS3fr5Eh5Z3aTxlOTiB51DOyZo=;
 b=aS+CCIroGW9yui7i4Q1dqOit0iCtqNRJbwG9hvbjaOLBrYps/lc5f/37CtcuOEG9M/
 myRif1ep46VSrAajLMOXy39LMqGCNMaccKWo+nwtZVUH2nm17JTD02bUaLv9ho/ZkqZZ
 0AxJdf1xQ5CWrMmyARuRfCwpSwPxcFsqEcgLXee6CtelZ/DVpkp+HLMrHKbNjVlU5FTO
 l9Ni7nYuCfPhYBxDYupDXBPpE3w54QUFn67uDMJTUlA3Qlg+L02dVZ9KEAy/M8aDxFWl
 T7xCcJsf2PzezcQlcy5X+IYK2NQzG83IXyNXS1Gju9OMUvFqx7OJfdEH/+QPMFiXBrP4
 I3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2claGdAs6bkmVOrvKS3fr5Eh5Z3aTxlOTiB51DOyZo=;
 b=0g3WHoqWTZDcFk6ijrMn/mdYodcxd6Pyq93ow2GRcbknrl+CvEgEYm9huTJU83vHPR
 Fy6qGEUS1pRzU+lwxk3VxloPIPJFjml1Y0aYY/2eRP5uzwpn1Yd2GisoMWIHDzUpkqmX
 vXEvbGcFViN/+Z+qUB4jJy/YIVRlAxfAeeTTgGKhJGw6BEDEOJjWRdzg1QaAvsM+Yudw
 WHg1UDOzuPMuZMsFnXOU9jKrn6Iv9sGmpTctBL48yr1N07etsmmHBPoF6n0hZmNt4Bs3
 BHtpXyn3B5moQAw0kov0JtnzSeGY8yxM1T4kIpNNaYbZDl2KLTtLgi85H7MNbB5lFVKT
 hrVg==
X-Gm-Message-State: AOAM531uTPxkejroU8cp98UsvzZstqmoZJneysbX7rgdzVUvv8uA6Tk1
 6lIjbxNKS9tq95hzv35NOylgAA==
X-Google-Smtp-Source: ABdhPJyJpT6t+qxyHBzIQspObFadIaoUJ4lKkfX9Q94WqOaK0AV3p6WfV0KGOThkmBrEP32X3T6kNQ==
X-Received: by 2002:a17:90b:3849:: with SMTP id
 nl9mr2644854pjb.155.1631582321168; 
 Mon, 13 Sep 2021 18:18:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm9333398pgs.64.2021.09.13.18.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 18:18:40 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] linux-user: Streamline handling of SIGSEGV/SIGBUS
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210913220552.604064-1-richard.henderson@linaro.org>
Message-ID: <96b671e6-2d9a-1773-99a2-43aee164065a@linaro.org>
Date: Mon, 13 Sep 2021 18:18:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 3:05 PM, Richard Henderson wrote:
> All of the really tcg-specific portions are still in user-exec.c,
> and all of the really host-specific portions are now ditributed
> across linux-user/host/<arch>/.  Importantly, SEGV_MAPERR and
> SEGV_ACCERR are now passed through from the host kernel -- or at
> least there's a single place from which to manage it [1].

Hum.  And then there's the special case of s390x, where the hw does not provide the exact 
address on faults, but only the page.  We have code for that in cpu_loop, but I have to 
invent some new hook in this new scheme.


r~

