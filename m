Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2765370491
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 02:57:36 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcdwt-0002DN-JE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 20:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcduw-0001be-W5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:55:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcduu-0001hk-FK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:55:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2638070pjh.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R/P60SYKRQnN0EYiNlizPnITHlISyALdQBRmxHqL1FQ=;
 b=mmAjBZm0JUR7Bnap1LAeahK6t0a87HDCHGijdAzCHyW/iAzSBUnoko1xhasnWSO4AP
 DgVZC8ELvR0JDf2lSi4yuTdQpxAKKnH3ICkS4I98WXtAiyncAnknBAllaVgn5BJKH5v5
 nhhIcR3/DPC0t9CNyTDWG/oZdJZHD0X5p+Dx4YSobmuGxrV4EUivYYMSwnNTsCqtMAuE
 15Bh856su+sgb/LbBIOedN6cRNANrVciIFyg+rOEQDxkHJZ4igfHUWVAHP0Ch8CV21do
 IKsZ5qlWvxXvLu5JuTvAgjgPJllSNoqd/Tc81fDJ/d3r2rmTE+GRDm1b6IiRj6RSJooJ
 +a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R/P60SYKRQnN0EYiNlizPnITHlISyALdQBRmxHqL1FQ=;
 b=Rtu8ErBAM0zP5H/c6SrIIDwZg+aqMc7B8RbG+ry9Xt+jPdAXVWne6swnzaYKRCszbN
 643U8IqhG21MF61IN3EjTatmO6CtJIT6C4kTJAg+W22TX5ptPC1xEUT6QehhqPiTMd1y
 GbkNQMWojf5oUO+QY2zuiuUHNgHGa8ddAu//K8Nkgs9cd8WRL698pou3ig84KRIEaHwx
 lLW6emWZy+WRByBdF/6prqxWir0XFmDTgY8ZT+efzjEwf/+LXKwKEmCjNAaQE2KhY6GH
 k0NTbfGmidZY/HOJtM4PrxOu4YJWRyq/3Z4Imd9MR1XALLQtOazzH6TUNiqtH4/xnmTl
 jxfg==
X-Gm-Message-State: AOAM531rwNCJn/5QKxgIbKdDN+IwxtDgdS0N8J4KvOFj4wBoyi5GBsAX
 keMd4jJPe6X1UcMLtuE5h+iJ4A==
X-Google-Smtp-Source: ABdhPJxx2AdDY71h7Qitguxl15DdICZtqAMhg5hB21UWEyeXybqUHipCOXRdYslQStonA/YxylvTcg==
X-Received: by 2002:a17:90a:6289:: with SMTP id
 d9mr8088604pjj.84.1619830530534; 
 Fri, 30 Apr 2021 17:55:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j16sm3127245pgh.69.2021.04.30.17.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 17:55:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] target/ppc: Isolated SPR read/write callbacks
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6f4a150-b64d-db68-ca8c-533b7ea7c7bc@linaro.org>
Date: Fri, 30 Apr 2021 17:55:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> Moved all SPR read/write callback, and some related functions, to a
> new file specific for it. These callbacks are TCG only, so separating
> them is required to support the build flag disable-tcg.
> 
> Making the spr_noaccess function not static, and moving the define to
> internal.h is required, otherwise the project doesn't build

Why is that?  You're moving the code to a different file, but then including 
that file back into the same translation unit.  There should be no change in 
which symbols appear in which object file.

I think that the spr_noaccess move might be required by patch 7, but that's 
something different.


r~

