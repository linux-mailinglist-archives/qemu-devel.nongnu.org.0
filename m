Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19038339AD9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:31:29 +0100 (CET)
Received: from localhost ([::1]:55288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKt7m-0001oI-JH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKt5t-0007mV-ND
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:29:29 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKt5q-00008b-Py
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:29:29 -0500
Received: by mail-qv1-xf34.google.com with SMTP id cx5so5190470qvb.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aKOM3TQWYcC0svgnfp0v9OA5lh0/XsjxBH1zZEH14M8=;
 b=l46ZSy7yU3jChwoMiIovqOIgUzrW5D0QrRTHnbDU4lBe9La8FEVFtU252f6u9TKfIS
 b3PMIBdzRMCE0GyXD2Z501B/7+RAD2dpCuysGctNtcojUJC+8kInf3TsoOu/HeYQec2S
 5c0yz/UgSBsDcrWfleB7nCvILlpYGenxx5flfNwHv9Ot9rgcMRDmmVTUpl/u+ro3hrAC
 ICOQEW4nLA51D65dwZXPFdDhDeOFUmRE7D58SS9B3BHj4VQqSgfoq5IQxcbGTjQMz4N0
 QWGS/VEY9DlBhHcjNJhOHUgctw0GQqCvu6rVYAE1KSSqjaa47Jf8dhdR1ctgM1JwWQQ7
 GFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aKOM3TQWYcC0svgnfp0v9OA5lh0/XsjxBH1zZEH14M8=;
 b=ejhtxa7iugSJbVYzRZEFwbFOIvkoBeJYjHZ5T+uqMS/4vkxzmIPXTI90F/UJ4EQq/M
 4oSxAy2uXXcvNZ6EUaR0fcTUCp6g3aTcapzj4APqc6S936Q+49FHKTKGtypNgHJs9C6G
 zkzDxgBng2HfD25l/Gn1a2hAeDcj1SMdDlsH0fd0yxqrowL5rnYCBXlyrXeegMdqkKKc
 x48nnpgSfnfCz/MM9HnFYkbvDf/bTKih682z0k0qjrIyXZ+PMXCLmFBl67Lhix5yBd1r
 1XjzaArDtGn1C78SidvrBdUZ+IyytEou+2Q13heGQ8vnWWWlvbKVdjVs3srg/LpLo4U+
 335A==
X-Gm-Message-State: AOAM531S/jq5mMVsHlYhHAT7+mCMmHCu89SBXqAVVe/S/VL5XPcUz58m
 vMklEL4CVE6OYMfSKiQuClhRMw==
X-Google-Smtp-Source: ABdhPJzWJ4pqZcy2TYGcaAxIrrqo15YKfzHq+12imexJp69fkNbXIWgcGeGfhg5OwsavVXYs3J8Z0Q==
X-Received: by 2002:a05:6214:165:: with SMTP id y5mr908866qvs.59.1615598965805; 
 Fri, 12 Mar 2021 17:29:25 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p90sm5217630qtd.66.2021.03.12.17.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 17:29:25 -0800 (PST)
Subject: Re: [PATCH v6 2/2] target/s390x: Store r1/r2 for page-translation
 exceptions during MVPG
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311194426.149044-1-david@redhat.com>
 <20210311194426.149044-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbcf9e78-2287-e49a-7e48-887ac00057b5@linaro.org>
Date: Fri, 12 Mar 2021 19:29:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311194426.149044-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:44 PM, David Hildenbrand wrote:
> The PoP states:
> 
>      When EDAT-1 does not apply, and a program interruption due to a
>      page-translation exception is recognized by the MOVE PAGE
>      instruction, the contents of the R1 field of the instruction are
>      stored in bit positions 0-3 of location 162, and the contents of
>      the R2 field are stored in bit positions 4-7.
> 
>      If [...] an ASCE-type, region-first-translation,
>      region-second-translation, region-third-translation, or
>      segment-translation exception was recognized, the contents of
>      location 162 are unpredictable.
> 
> So we have to write r1/r2 into the lowcore on page-translation
> exceptions. Simply handle all exceptions inside our mvpg helper now.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

