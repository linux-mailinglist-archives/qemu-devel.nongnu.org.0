Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A733E9DAE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 06:43:25 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE2Yt-0002ZU-NS
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 00:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2Y8-0001nn-KE
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:42:36 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2Y4-0000wp-T1
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:42:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d17so5614652plr.12
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 21:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujN9ekONKJ3TXT9v5nk2PmyhOey3+5068fE2lXWoIzM=;
 b=BZgQRRtwUBEyVp54jDHKyJzWQFJk8si8rJ0oQrCV+olmwUJXWnqXjLuZlMs5RdEEhc
 yMntWYeb6yFNjlu24Pql6P0B8AIXChSnJGSsEdWG9yfCBwplLWD3Um0fgO9xyJO3Vu9P
 4a+P+IFjwptRUSbufBI02uCbNUwVlA9TkbdDMyV63DOEtDuOQxYsk7Bq2Dw/uMn6KEUg
 tY2J01ByKMj9EzTR6b1Xh7Xam28g1fWvqpTjpw4U+6gv1RxXwo2K1KERJ2kFqbploiaD
 BHClpG86l6L4iJnIuk3NxHlG7sEPhcFk/ak4S+uhyoohvMf5lb5Y0DvJawImYsW2xzoo
 6N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujN9ekONKJ3TXT9v5nk2PmyhOey3+5068fE2lXWoIzM=;
 b=HrXp9XMshantOSK06cBiJvA3yVguZBReaZJ4Ii5Aiab7KtuV8vLgw5HVKBkz9C8d5Z
 N6uqjrT1FFN3mwEVbXr2Nti7OYDZ6tX6AO3TVHwNz552f/3Q316UTvSmtVGTkP0T+R6D
 m+griI90CU7ZEZWl6kiwy92TgBeqBO9v6kGcFnDFLOvREV/lr5kCSwhu/4XMJqli1nQm
 OaDOsTk4seTYovqwifUmSAw+rPG2/uiJws7g5/p1UlSo9wax5IJkC/57THIzoXbZuDj6
 V8OvG+bwPu1Iy4liu/n1jgZldSoe3nAkVQ2JmWF7STxCI31DoLtoyNz+vGVdNVsOYiit
 7f9g==
X-Gm-Message-State: AOAM533lewt6CCS8mqaBZ3sSCAprnWmPMhqDLAOGCK8x7UBSHGXy48Mi
 /lLzbghIm5nLjxDlm6OxGrrURg==
X-Google-Smtp-Source: ABdhPJxc3oF6rKenFF9kx5RR6V7QXfzgs7zbIWkGiZM5zQnuL1cUUddRPOanBrmFUhC3BGkdO2/Nuw==
X-Received: by 2002:a17:90a:ff94:: with SMTP id
 hf20mr2319308pjb.64.1628743351060; 
 Wed, 11 Aug 2021 21:42:31 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id f16sm1319759pfv.73.2021.08.11.21.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 21:42:28 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
 <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
Date: Wed, 11 Aug 2021 18:42:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 12:40 PM, LIU Zhiwei wrote:
> If the software doesn't use the high part, who cares the really value in high part? Do you 
> know the benefit?  Thanks again.

I do not.

I simply presume that they already have the hardware, in the form of the addw instruction, 
etc.

The mistake, I think, was changing the definition of "add" in the first place, which 
required the addition of a different opcode "addw", which is then undefined for RV32. 
They should simply have had "addw" and "addq" as different opcodes that didn't change 
behaviour.  Etc.

But what's done is done.


r~

