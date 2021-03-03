Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631C32BB0E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:06:51 +0100 (CET)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYhm-00039J-4S
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHYg9-0002QC-L9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:05:09 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHYg7-0006uM-0i
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:05:09 -0500
Received: by mail-pj1-x102e.google.com with SMTP id d2so5175335pjs.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aZzZ3+0LVr+pANQk24sVt/1s6xzmB8WIjMkHRhqLvp4=;
 b=OMZxYg7Rahf8TVAuvl90BnoJTRE1Wwkw1UZOwjsbXy47EbpCk4zS6WK5ju310d8hML
 1Bp3Hl2RdARcwmpUQ8Hg+V8OM+splznkYb4aAFjqHOPwIHD8BKowMbUfQS3bgfNT2JTe
 3dd2jnTAFkx7PSKLlN+8Dd5hG+TrMbwxLfv6gbnvKxg+uLzscLOVcRSBTzYqd82XoT0A
 RqYR00mRsh8icguoNgapHTYtpbK77HEMSdHs6mYar8thh4cAU4s3TvGUD2wPpgUyyxvu
 jUZBSMBxPwgyx9o891O1uw39FEg7q0+lLzG/c8a1HqWXlOLbNQqleUpmgHhDXHQK88+T
 7cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZzZ3+0LVr+pANQk24sVt/1s6xzmB8WIjMkHRhqLvp4=;
 b=WESnl3//MAVTE1h0bLYwrCvVk55YaekDsretgFsxkbZPM5LekOZRc8l/dmyZxU4XBl
 r9FERqrDE/HnfxbzLWZm7VGKbylJ7z/xs5Z8Xhu0HVABLf2ffo6MBLx/LidYXI8gjYsx
 VnvreaLP5A/T3rE5eGhqBZWAEUQUMOm0cCPTGgBPSGB3NOR0u2YVcbMViqLgWYm/q223
 ewgmb8Xe0AWKrCgPxFMqOB75AxbsYEOTGYFGB/RPtqSNyskuFLcFHINjO5cicOJDkXtc
 thNprRkAXcAoIZPrXvRO/QwDEb815lye+eBtSYqDEeF7mRSgWjk5pO0EtLZLXPssCDov
 OKQg==
X-Gm-Message-State: AOAM531YW6zEwDNoVy2/SUDISneHbHRAONEGS29IHCZzFIxR3dlzCgub
 42VY3GWPlXzB7OdZkamdPvTwBw==
X-Google-Smtp-Source: ABdhPJzJbnG1STmejpk3tHpcgz0Su5YpradyaazhnBOsIgdt7rOjNONE/Prg1LzK0f11Zuidq3nsrA==
X-Received: by 2002:a17:902:fe96:b029:e4:2f39:9083 with SMTP id
 x22-20020a170902fe96b02900e42f399083mr933646plm.47.1614805505527; 
 Wed, 03 Mar 2021 13:05:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id w1sm17433524pgs.15.2021.03.03.13.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 13:05:04 -0800 (PST)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303132850.459687-1-thuth@redhat.com>
 <c938bfb6-7322-1738-8492-972b83cb7c99@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae902e23-08e4-303f-3eee-9e196987aeea@linaro.org>
Date: Wed, 3 Mar 2021 13:05:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c938bfb6-7322-1738-8492-972b83cb7c99@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 11:39 AM, David Hildenbrand wrote:
> Should we start wrapping that stuff into #ifdef CONFIG_TCG ?
> 
>> +    uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
>> +    int tlb_fill_exc;        /* exception number seen during tlb_fill */

Eh, probably not.  At least not until we elide the softmmu tlb, which is 
fantastically larger.

>> +    if (unlikely(flags & TLB_INVALID_MASK)) {
>> +        return false;
> 
> ^ I recall PAGE_WRITE_INV handling where we immediately set TLB_INVALID_MASK 
> again on write access (to handle low-address protection cleanly). I suspect 
> that TLB_INVALID_MASK will be set in that case (I could be wrong, though).
> 
> What certainly would work is checking for "haddr != NULL".
> 
> /* Don't rely on TLB_INVALID_MASK - see PAGE_WRITE_INV handling. */
> if (unlikely(!haddr1)) {
>      return false;
> }

Ah, right.  I consider TLB_INVALID_MASK being set in the return from 
probe_access_flags for PAGE_WRITE_INV a bug.  I'm not sure how to fix that 
right away.

Well, !haddr1 is also false for TLB_MMIO, so you'd need to check for that as well.


r~

