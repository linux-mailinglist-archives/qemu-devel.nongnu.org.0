Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E169FBCF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuZI-0002W7-BS; Wed, 22 Feb 2023 14:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUuZG-0002Vd-TI
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:14:18 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUuZF-0005Ix-1r
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:14:18 -0500
Received: by mail-pl1-x643.google.com with SMTP id z2so10140627plf.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5irA+ryBZvAqDVW3HveUPpaWs63H68MPfyX2Xe81HrQ=;
 b=B9Xobm9beGxALz0GfF7t12sTeboO4CVE5GeN1UeZFL/YbttCGKa5pZdUYiQ5sGGQ3O
 NeJMJb7Dv9Io3DUWn4ux1FO4I9aZlk61wS9CODBSth1w0XFSZ3kG9+iWIs9g0seZmbfM
 hZ7g+GIuaVzUHxmuKqkqATFecWpjagUHZwj4OM3pfb/MQJEoTAy5Jpya9PfzMoK/8KrX
 rgDdFsH83RWhR1FBPp0lGB7BnFApS5hsjvBLhqsAe1xAmITMlSE8dvBpnruj6ebH4vwf
 DKLf3Lgk8bQTkGKlsL76oRIPfUW1XgvLN3k+MQS07Ae3KZKrPyhwwbrW6/mNVs3aGAZn
 jzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5irA+ryBZvAqDVW3HveUPpaWs63H68MPfyX2Xe81HrQ=;
 b=T2vXxo0f56mIQGkKF5uhS4qTZnxKKeuxBB0cOlVbIy0qND0jF4a4Rp8PBSMPolqxPE
 lDvroD4DMBXdfbQrKsHTU8TCOIgoO1ZdmmcJxVpwVCcp/USxNB7bW5nHVVv79EJ8jAxk
 NkPEAuAUvuH5wRDGuwDt9UqG7hbQpMmE4lVrGM4pQsNpo4SWwjIh8buN3qrsp7ETwm8n
 BVL8zJ+aUAvJQLSIpX5Hr8uuIHGhqBmV2y2NZQCDJvOoSe8S3084OzqIPjZ9g9V+n22Z
 aGOJwOZGeXQcG3GdE+oLO0DODzVlf6730GWiSzdDQUQ14vHt+9Pbfs2aLAOpN+YX45T/
 On3Q==
X-Gm-Message-State: AO0yUKU3B4MUTg85mpCihem/pEenvzsXdgDzJlpXr9g/AdnTa8te0E+7
 fqRYJDJL+b6G7uz82aOvii4yGQ==
X-Google-Smtp-Source: AK7set/3qVxS25OcRSrHblez5s8EHQXeiWSrVm5XANGdDdOtRm2u14S+rjCLnNhffJaK9FAWLCGDQw==
X-Received: by 2002:a17:90b:1bce:b0:234:2007:1ff6 with SMTP id
 oa14-20020a17090b1bce00b0023420071ff6mr11476200pjb.14.1677093254926; 
 Wed, 22 Feb 2023 11:14:14 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 gj5-20020a17090b108500b002340d317f3esm5264503pjb.52.2023.02.22.11.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 11:14:14 -0800 (PST)
Message-ID: <f5b820d8-68ce-d280-4025-3473fa2a5a13@linaro.org>
Date: Wed, 22 Feb 2023 09:14:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: mttcg: warning to user about memory ordering
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: bobby.prani@gmail.com
References: <7d380f61-b104-0fcd-47af-8712ffa01668@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7d380f61-b104-0fcd-47af-8712ffa01668@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 06:28, Pierrick Bouvier wrote:
> Hello,
> 
> When using multi thread tcg, a warning is emitted to user if models for guest and host are 
> not compatible (like qemu-system-x86_64 running on aarch64 host)
> 
> accel/tcg/tcg-all.c:
> 161             if (!check_tcg_memory_orders_compatible()) {
> 162                 warn_report("Guest expects a stronger memory ordering "
> 163                             "than the host provides");
> 164                 error_printf("This may cause strange/hard to debug errors\n");
> 165             }
> 
> However, in tcg/tcg-op.c, all load/stores are emitting memory barriers using 
> tcg_gen_req_mo, which lets think it's already implemented for any host/guest combination 
> (was added in b32dc3).
> 
> In your opinion, are there still corner cases that are not covered correctly? If no, 
> should we drop this scary warning?

See

https://lore.kernel.org/qemu-devel/20210316220735.2048137-1-richard.henderson@linaro.org/
https://gitlab.com/rth7680/qemu/-/commits/tcg-mb-small/

It never got merged because it didn't actually solve the s390x on aarch64 problem.  I 
assume there's something I've missed.


r~

