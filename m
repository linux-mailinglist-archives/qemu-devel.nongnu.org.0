Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67829389977
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 00:48:15 +0200 (CEST)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljUz8-0005fV-9R
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 18:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljUy7-0004ps-KK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:47:11 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljUy5-0001LQ-E3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:47:11 -0400
Received: by mail-ua1-x933.google.com with SMTP id 20so4960660uaf.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 15:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eQtJDlgICXbFKPgxsC5dWdP2xsuhujFzbSYpNR3xSdU=;
 b=jb2/nrqdCUKqk4AT0XmCmvi9PxdG10RfJKwA75d9Is4leR+nVqM4tFUn6xrvgfGQWE
 qufpQSqv+Sni9H/11xiJwTiW4MPwSZV5+Xb1wVGk9ifn2aDhqjDsC6eoHcAyQZRQZOrZ
 vWU2Lh6XJUet7WKk4d7o+mZxVib89BvGT2kvj1n19EBHfPABPunTE2Z0PeSx7EhrSQ5u
 8YFCyWJ0CiYijQZjySE2LM1uDxVYE0alH0oaxoki0z+u+VY/6OzGGdVxyxnajhx6UQ33
 i8dNcNlB+nl+gB/Tb6oQ9Mbx41gi7esTBaan3ZVPGx1Kij6B6xlpB34VJMJCzFqJ3iGM
 LJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eQtJDlgICXbFKPgxsC5dWdP2xsuhujFzbSYpNR3xSdU=;
 b=WuPICGpBKRuvnrsDIDZu++4BCYE62SCVGzdYCetmHcUk/6LHPV9W9mWHxPZPdB0Vv8
 adVfM1kxq+S9hpYJIRG4LDvaAeIUXiHbJYTnv8w/0vcQGBSR2BDU5X6TE6OJVTLMeNO+
 7z1xHbQ/s3C2HOuGFhQnnhQb9xDymVPnmYTfLxEhQ4zrYKxJJzDAeKi5JwY8vLk4BiOm
 gdVp3ex55F9dB2iZzb2WUIOSTQjsFhYqaqzn2lPu60vTnh8I2dWsDZL+kntqoCfDdB0d
 GQ5AsapziMJCcn97SsH1Q5eWMCkYp47hexVZ9gDRJw2qoWYyDHuBvJlFoteRpguciNAn
 ZE+Q==
X-Gm-Message-State: AOAM532zjXaJ2fy8xb/GeNcIvfwtAmuQKXPDqqd6JzCudMugxPMNQcET
 c7w8gcGXjFKZnQIdeBgnNK44oAremVFr8XAt
X-Google-Smtp-Source: ABdhPJz0FuOYt6m+ZEluRptcg192Al9zgX7K2nb5YiNem/nQtU3bPYIIGxIYLOnwhfNalO3rt2jPGA==
X-Received: by 2002:a9f:2183:: with SMTP id 3mr2124822uac.0.1621464428273;
 Wed, 19 May 2021 15:47:08 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id 5sm168028vkf.48.2021.05.19.15.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 15:47:07 -0700 (PDT)
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
From: Richard Henderson <richard.henderson@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <YKR9bZmPxOHKlnnP@yekko> <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
Message-ID: <6bc68cda-a6aa-68c9-2c6f-f7c6ff95b7db@linaro.org>
Date: Wed, 19 May 2021 17:47:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x933.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 3:37 PM, Richard Henderson wrote:
> On 5/18/21 9:52 PM, David Gibson wrote:
>> I've applied 1..15, still looking at the rest.
> 
> Please dequeue.  I want to create a new mmu-internal.h, which affects all the 
> patches from #1.

Alternately, don't.  I can move the function later, and it may be a while 
before I can get back to this.

Two outstanding bugs:

(1) mmu-radix64.c vs hypervisors.  You'll not see these unless you run kvm 
inside of tcg.

Basically, all usage of msr_{hv,pr,ir,dr} within ppc_*_xlate is incorrect.  We 
should be pulling these from the 3 bits of mmu_idx, as outlined in the table in 
hreg_compute_hflags_value.

When you start propagating that around, you see that the second-level 
translation for loading the pte (2 of the 3 calls to 
ppc_radix64_partition_scoped_xlate) should not be using the mmu_idx related to 
the user-mode guest access, but should be using the mmu_idx of the 
kernel/hypervisor that owns the page table.

I can't see that mmu-radix64.c has the same problem.  I'm not really sure how 
the second-level translation for hypervisors works there.  Is it by the 
hypervisor altering the hash table as it is loaded?

(2) The direct-segment accesses for 6xx and hash32 use ACCESS_* to 
conditionally reject an mmu access.  This is flawed, because we only arrive 
into these translation routines on the softtlb slow path.  If we have an 
ACCESS_INT and then an ACCESS_FLOAT, the first will load a tlb entry which the 
second will use to stay on the fast path.

There are several possible solutions:

  (A) Give tlb_set_page size == 1 for direct-segment addresses.
      This will cause cputlb.c to force all references to the page
      back through the slow path and through tlb_fill.  At which
      point env->access_type is correct for each access, and we
      can reject on type.

      This could be really slow.  But since these direct-segment
      accesses are also uncached, I would expect the guest OS to
      only be using them for i/o access.  Which is already slow,
      so perhaps the extra trip through tlb_fill isn't noticeable.

  (B) Use additional mmu_idx.  Not ideal, since we wouldn't be
      sharing softtlb entries for ACCESS_INT and ACCESS_FLOAT
      and ACCESS_RES for the normal case.  But the relevant
      mmu_models do not have hypervisor support, so we could
      still fit them in to 8 mmu_idx.  We'd probably want to
      use special code for ACCESS_CACHE and ACCESS_EXT here.

  (C) Ignore this special case entirely, dropping everything
      related to env->access_type.  The section of code that
      uses them is all for really old machine types with
      comments like

         /* Direct-store segment : absolutely *BUGGY* for now */

      which is not encouraging.  And short of writing our own
      test cases we're not likely to have any code to exercise
      this.


r~

