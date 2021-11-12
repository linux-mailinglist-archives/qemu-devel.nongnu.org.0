Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761EA44E82D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 15:08:15 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlXDy-0001HY-2W
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 09:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlXBy-0000W9-Jg
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 09:06:10 -0500
Received: from [2a00:1450:4864:20::32b] (port=42718
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlXBu-0006vq-TW
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 09:06:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6866260wmd.1
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 06:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w0c3ILhcB99anUMzEU8xoK7xv/OZpLAbzriVjG4tAnk=;
 b=oUGezKj+KhJ+Rz9AuWxiHS1tIG/g0N+FbX4UAVhjcy8neilf88gwLns+g55mKYSUbY
 2i4Smaf3QUL+74y99pyTS5Y+F1VpoiD5trKlVfix2nH5nCin6UsPIMQWtBZGJq1dKtY3
 mrz+q6CaC5zf+i6cKuSdBj6cdTs6jRt0zirIf3fKKOJJYx8oLE6u94U4xVOEY9SokDJ8
 tuj2ASO7mADw0eKbzY5pwiJBipiM1IY3E3IHw8tYCh4kyDvRl9poleGncuZ0zm93O11C
 AB5Lw6qrLMRVF7qF/YMCtQ0bpuI0OPzmUx0LbITRTFQq16nd05zuQulB1GH7XHirGXmS
 CHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w0c3ILhcB99anUMzEU8xoK7xv/OZpLAbzriVjG4tAnk=;
 b=ISxAyzy4baGevtQ3nVxHswvAvYsyvIpFlY8akh7rLb9LTl7FEp5Iac/89YqqHOIsKG
 VhJLkVmAEryTTa65u8GMkK74R4vgKnbLn7ln+KCq9IpQXhWNA+3mciiGePQT9YS0t5fn
 sSPqjnyhMnS3KXTUYjJOePSxNiGhwEhAB2X9p04/r2+GfWKX+jaIWg0cL3XUY8y9iBN1
 KlXlJi39kWiwT/fR3Kgs2qSHMFoAZbUqE3lScIy3yLUFVA1Vd5gUMUXf0KV9KXRavKxV
 dWu2Bz3rX/H2nTJzK/7yv/H0bmJrBd/SE4R7UjyEFzVXt5JmUSOSxOfnuTgPUfMniLR9
 MDTQ==
X-Gm-Message-State: AOAM530sFFhdhrZOA5CbpBEZz1gZabkTwRunxEFGuB2PZ+zphc66F3Zq
 5NM9tEnGSXE43XJ5U8LKEIb2XTbajoBRS8Uj4DI=
X-Google-Smtp-Source: ABdhPJzV+k7jf0N/mkJCasWlCjVG5UfSBDAQoaHsLZvmK3yNeigpQT+REBTmPRWJE4O6mY/bV+aSZA==
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr4739290wmb.3.1636725965249; 
 Fri, 12 Nov 2021 06:06:05 -0800 (PST)
Received: from [192.168.8.106] (18.red-2-142-115.dynamicip.rima-tde.net.
 [2.142.115.18])
 by smtp.gmail.com with ESMTPSA id o12sm6513035wmq.12.2021.11.12.06.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 06:06:04 -0800 (PST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
Date: Fri, 12 Nov 2021 15:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.449,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 7:53 AM, Song Gao wrote:
> +#
> +# Fields
> +#
> +%rd      0:5
> +%rj      5:5
> +%rk      10:5
> +%sa2     15:2
> +%si12    10:s12
> +%ui12    10:12
> +%si16    10:s16
> +%si20    5:s20

You should only create separate field definitions like this when they are complex: e.g. 
the logical field is disjoint or there's a need for !function.

> +
> +#
> +# Argument sets
> +#
> +&fmt_rdrjrk         rd rj rk
> +&fmt_rdrjsi12       rd rj si12
> +&fmt_rdrjrksa2      rd rj rk sa2
> +&fmt_rdrjsi16       rd rj si16
> +&fmt_rdrjui12       rd rj ui12
> +&fmt_rdsi20         rd si20

Some of these should be combined.  The width of the immediate is a detail of the format, 
not the decoded argument set.  Thus you should have

&fmt_rdimm     rd imm
&fmt_rdrjimm   rd rj imm
&fmt_rdrjrk    rd rj rk
&fmt_rdrjrksa  rd rj rk sa

> +alsl_w           0000 00000000 010 .. ..... ..... .....   @fmt_rdrjrksa2
> +alsl_wu          0000 00000000 011 .. ..... ..... .....   @fmt_rdrjrksa2
> +alsl_d           0000 00000010 110 .. ..... ..... .....   @fmt_rdrjrksa2

The encoding of these insns is that the shift is sa+1.

While you compensate for this in gen_alsl_*, we print the "wrong" number in the 
disassembly.  I think it would be better to do

%sa2p1     15:2 !function=plus_1
@fmt_rdrjrksa2p1  .... ........ ... .. rk:5 rj:5 rd:5 \
                   &fmt_rdrjrksa sa=%sa2p1


r~

