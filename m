Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5648207E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 23:07:46 +0100 (CET)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n33aL-0000ee-9v
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 17:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33Yg-00075P-Cl
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:06:02 -0500
Received: from [2607:f8b0:4864:20::1030] (port=39684
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33Ye-00027J-La
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:06:01 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso29055643pjc.4
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 14:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=opQ2aIuedl98iM94eoiegPJB9kaZb+Br7YxHdpdCYQI=;
 b=Ed1/I8HydlK/Du0w48zbv4niFYfsW3zOhnBOxGn5icApg2hT2Q7dtI1I5cyjyhgo1A
 R/YCTfsmv3SodIthYh+YC+1e5lhNatGhE/S1gdoDfHlhFQljhac0dDpJhVv+rtXhNZkt
 R8vkh3gezPGJcEklay4D/40EHAC9Tc0T01pRt/ai+MLtuUvq3U2DLJLkbBbCPhWXN4bt
 Q+VO6aAptxqzlnPGURuMM7QrY7LK0QUOoj1LrzFDpVNCTpalM/0JcFqGjj7kvmwe2ZPq
 yAwzm6hE2KvToQnsaq2qLue2qtyBMZ7a+GUfRMXMNBhtvQaTlxNLRI5749fph6PzGMk+
 /aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opQ2aIuedl98iM94eoiegPJB9kaZb+Br7YxHdpdCYQI=;
 b=5yA1wSDW/8JKHpVaXBmNygfjQ8+Jzrx/RviuayyoMCD7kiXA7Dd0MxjuBWIJOEfcRO
 1O9gbkRUZx71S1lsC6hVmWYiNx6vCv9pO77ZCBAP4SSwUG31CHuGn/5mYrgW0q/oxgFs
 tQo/fDGG6hm85xnwJltiXWnpuozLn4Re9iJGXXxVqzEHJAnL+RnpJ7mBI7hFU7BuD9Ea
 0UNEU+xse8ofPHKNf1kWGQD49EwWjPG6jd7BElYVzOAvbLqaaWnhoH6xmhl0iDOLr9Nq
 x/G8hz7DlUatI6GCNzdF2Mzc51Jp7INNl4X8Vlo9w/wJMP7/cWlgM4+ajrHzKNjnkuNt
 FkdA==
X-Gm-Message-State: AOAM530xxwXugsORfwcxsUpBdWuE5g4+IVaJlOJQ+fNbiXrEkbjbLlCU
 dyNZZV5VTBZ/1ikPpPZVXi7Emg==
X-Google-Smtp-Source: ABdhPJwX3QkKETRYn4s2ciPAmf1J1g+G64wu1Ydr/g7VVJceoyMkDMorjM6IiId4MM8irAfC5VhirA==
X-Received: by 2002:a17:90b:4f43:: with SMTP id
 pj3mr40178096pjb.239.1640901959229; 
 Thu, 30 Dec 2021 14:05:59 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:23dc:65c4:ecfd:93ff?
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id f8sm23728595pga.69.2021.12.30.14.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 14:05:58 -0800 (PST)
Subject: Re: [PATCH v2 3/5] target/ppc: powerpc_excp: Set vector earlier
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
 <20211229165751.3774248-4-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbd28e4a-01fa-c96b-5a27-cd14e82f8c5d@linaro.org>
Date: Thu, 30 Dec 2021 14:05:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229165751.3774248-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 8:57 AM, Fabiano Rosas wrote:
> None of the interrupt setup code touches 'vector', so we can move it
> earlier in the function. This will allow us to later move the System
> Call Vectored setup that is on the top level into the
> POWERPC_EXCP_SYSCALL_VECTORED code block.
> 
> This patch also moves the verification for when 'excp' does not have
> an address associated with it. We now bail a little earlier when that
> is the case. This should not cause any visible effects.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> Reviewed-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/excp_helper.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

