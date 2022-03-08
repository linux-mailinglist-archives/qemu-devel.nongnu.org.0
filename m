Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB24D171D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:18:41 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYnY-0006T2-2J
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRYm4-0005AO-6A
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:17:08 -0500
Received: from [2a00:1450:4864:20::634] (port=33639
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRYm2-0005QW-Iq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:17:07 -0500
Received: by mail-ej1-x634.google.com with SMTP id kt27so38913547ejb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 04:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OFA2/eM8lwGnQdw8L8HYozWRTs8bN4HRmWhwr7+OpfQ=;
 b=dZxiz91cR9d8+CC4dJkv0i2jFfJ9CP0b3NlEsXD6TPHMGYacNdhru2mSELTl8O+6T+
 FkPBsspyt6yrQV1UNk0fLDyvuyTBbsyYl6/T/V6x+ZilvnI0NzYTKb6PgY7cnu5zGc3W
 z8u6cgybLElr2aEZQqTCU+yd3hjzgyX32dfmIm7l1uFqFRVNXPWDahWbmtxQMKSxUF6t
 mDip2hxkD1fj4trIskXiu0dLQGix1y5LAmHMsfX0r/TW2pyZZX5NoWOICWOAFwOo7IeO
 jpGsIE8IKRoh4awk7E5UsjXtaPmC6jPN5sC8oetFJ5PMyH0bpwZVfBbDUpiUazI2kL/w
 rFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OFA2/eM8lwGnQdw8L8HYozWRTs8bN4HRmWhwr7+OpfQ=;
 b=Vrc9UzYpUmSCl5v8dZz8GMhFtXPING57757vvK5xzBF35L0r8G1nH8XFudeoQdrJjY
 ABLRjQlL7Ld7Fd5K+6UiNWSq3PrTJDbaS1WPlo5kIeEWE4ozeM33GfxOhZbHjuIvP5NK
 pRuBJiBQUXqlqT9eVxEcxzNx0aJ7vrwS/YmSl4AOYtSQMwTL5VzWO2vxe2CMi67J37f5
 d2u47A4eec+qGnz4QwxgHibd9SK2TjR9QcQ6hiz2SY+9D4uN8hasBVh5W/otm3eelEHx
 9JacLYdZtYtbA72vmw9rEt259h98PiYFOed6+nREqgmKj5CqIRTnQHsECix3RMvJLD+I
 +QBA==
X-Gm-Message-State: AOAM532oT/rVhzgZcWJrHoGdtc+k09Y+0YraU754KKX0miJrvjmKW3VO
 kg1etQHN9t1H+74LRuLyOxY=
X-Google-Smtp-Source: ABdhPJwE9PU5xJ81uImIisWcDcAXQ3ECFtBqwX9p5ItDnR0zlR5H81k8PeGbgOyJEUFk90ZFZol5QQ==
X-Received: by 2002:a17:907:97cc:b0:6da:a8fb:d1db with SMTP id
 js12-20020a17090797cc00b006daa8fbd1dbmr13315004ejc.267.1646741825187; 
 Tue, 08 Mar 2022 04:17:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm5886872ejd.11.2022.03.08.04.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 04:17:04 -0800 (PST)
Message-ID: <800a68f8-fbe0-5980-4290-bdc0ed4d05bd@redhat.com>
Date: Tue, 8 Mar 2022 13:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, Andy Lutomirski <luto@kernel.org>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
 <20220217130631.GB32679@chaop.bj.intel.com>
 <2ca78dcb-61d9-4c9d-baa9-955b6f4298bb@www.fastmail.com>
 <20220223114935.GA53733@chaop.bj.intel.com>
 <71a06402-6743-bfd2-bbd4-997f8e256554@arm.com>
 <7cc65bbd-e323-eabb-c576-b5656a3355ac@kernel.org>
 <20220307132602.GA58690@chaop.bj.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220307132602.GA58690@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Linux API <linux-api@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 14:26, Chao Peng wrote:
>> In pseudo-Rust, this is the difference between:
>>
>> fn convert_to_private(in: &mut Memfd)
>>
>> and
>>
>> fn convert_to_private(in: Memfd) -> PrivateMemoryFd
>>
>> This doesn't map particularly nicely to the kernel, though.
> I understand this Rust semantics and the difficulty to handle races.
> Probably we should not expose F_SEAL_INACCESSIBLE to userspace, instead
> we can use a new in-kernel flag to indicate the same thing. That flag
> should be set only when the memfd is created with MFD_INACCESSIBLE.

Yes, I like this.

Paolo


