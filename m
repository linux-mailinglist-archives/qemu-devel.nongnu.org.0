Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411131DBF3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:13:05 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOVk-0002Wz-Is
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCOUW-0001gg-HL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:11:48 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCOUR-0007Pa-LP
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:11:48 -0500
Received: by mail-pg1-x536.google.com with SMTP id a4so7082293pgc.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 07:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0+VWKmKWgGMr5jb1x0H35dmhQYo2sbC66r+WnFVw+cc=;
 b=X8Tj0CCq4bebBc+BdIG1+HqM6bCDagsjpWDAXWtLS9yP0gMM0HRygizhL313AFV3tO
 aUMgUa6fDR6wuisC3/e+hbAQxeZkQUkWGSbWjWpdoCTdJ4RESIof1+wmS+BR6lq02bwR
 yzjWTiG09qcYSKQ/ooJEEI0S6ujcBtehmYc+ri7p+a4JMIVz4bzAfh5vI7X7OxK6dHnd
 qofTE5aarASghfMtbY14baFSfoa8p8LVjAh2jswh6/sfu/s16ZytEoe9ee6CM930ge0x
 ugLRz17iv14LCjhGnn1nd5PHvm0ZPMgIQY7nszkLnl3uuvwr6ezrIwCUJKTZ1N+97sAG
 p1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0+VWKmKWgGMr5jb1x0H35dmhQYo2sbC66r+WnFVw+cc=;
 b=cyK8cI9vS6Q20F8Y6dirdeT21TjNgHH/dK31nRDLCiBDw9i9BdwWRRcBATgf5tjNlJ
 094iAXvYuq2H850KmI9cRBobsXxzmmFLg4BsIyunaR/qO14lB4ltkpzRr7wJB/+BpifV
 BaYpSpmeDmm/OJI4AMNvFS/QxUvo2mcXXoX+W5jBlMou13wTXF8Z97+Z4y4lbrPjhaaI
 9+FFA57klL7LWMJw4r5dlB2aoQOW2BXMa6nxmooIvRU0VF5zvxVzeAf2HS/lndABuWzn
 XG8nUVP48n/fW26KkHFLRww3FbOMmjOY1zCrsQfX/jImZHLceY2peEKXRgnl7mgHK8cl
 3TLg==
X-Gm-Message-State: AOAM531gr6xywM3Pw3YYbxqTGBIWAZQSBBtPuTZD4nQ97kshY1iNoJyO
 eLS042H5KHsCjVqIT4BvRaCeDth2hFVl2g==
X-Google-Smtp-Source: ABdhPJwufiyEs6WJlyaGrwSAQ4YATRoPImy1MCeuUXTbZZGHHJhUkrpJLWjO+w8OYY6Us9ruhW1H7A==
X-Received: by 2002:a63:907:: with SMTP id 7mr23886606pgj.96.1613574702042;
 Wed, 17 Feb 2021 07:11:42 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id q13sm2834687pfg.155.2021.02.17.07.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 07:11:40 -0800 (PST)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
 <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
 <5c37f1f1-5538-cd06-55a2-e266cc9a972c@linaro.org>
 <CAFEAcA-sgkxazKcR8tbLdj_B3F5bwg2c4TqkNd7gCSCQ5BYQEQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52bc865c-9e4d-ebfa-e7c0-15747f194532@linaro.org>
Date: Wed, 17 Feb 2021 07:11:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-sgkxazKcR8tbLdj_B3F5bwg2c4TqkNd7gCSCQ5BYQEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 3:15 AM, Peter Maydell wrote:
> This isn't aarch64-host-specific, though, is it? It's going to be
> the situation for any host with a relaxed memory model.

Yes.  I intend to make the code-generation changes generic.

> Do we really
> want to make all loads and stores lower-performance by adding in
> the ldacq/strel (or worse, barriers everywhere on host archs without
> ldacq/strel)?

Well, yes.  But then we get to enable mttcg too.

> I feel like there ought to be an alternate approach
> involving using some kind of exclusion to ensure that we don't run
> the iothreads in parallel with the vCPU thread if we're using the
> non-MTTCG setup where all the vCPUs are on a single thread, and that
> that's probably less of a perf hit.

I don't know where to put such a block, do you?

The memory barriers are a perf hit with -smp 1, but I would think that all that
and more are recoverable by not having to run -smp 2 serially.


r~

