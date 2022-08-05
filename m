Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643258B092
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:56:50 +0200 (CEST)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3RA-0000a0-LB
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK3P8-0005cg-GO
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:54:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK3P6-0004Ge-S9
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:54:42 -0400
Received: by mail-ej1-x630.google.com with SMTP id i14so6757770ejg.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uNNCMzM6wGgvKylIcV8lYZcNxMUBwXushcdpJCRFwXA=;
 b=e6zKPWvo6IkiM49qZMgVKOQWfbZ4SrSe6FffLSmDWP8fLIdlY1yC8OE/wQSvLo7meO
 H+G1B1j8KGTDWa3VYpZ9mL+EiFelSvWjLwXE7DG8n8DQ+D5rzmDidw5gGMSxEtzBTYay
 CLtkEm9skbWSrqajt3PPDuzophplCTD2rEc2ozvNuGxaWnQx2yPBCEFUqeaSi77JFMf/
 Lw2RNp9XxDE8YMazE5oWBsI9D+FoaBUwg1aWZoHlGg3LGNcIATEAW1twLhw3HNGCMwn7
 vwJyZXFiNu98nw+DG5ql1wkGSRaTKJ8FnxsEEAQxBwk2IlQrhE2vSCh672yBPBlGzRGv
 RtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uNNCMzM6wGgvKylIcV8lYZcNxMUBwXushcdpJCRFwXA=;
 b=pdRUKtTyNGVXgKSFtmsPK3VNgEdvzJSVlY8vNpM1WB1FUoy+h/omuzqcqkBm7rwXbU
 4j8sN9+R3QjVJGETgcLJdvZaTK9yaj2vT6a5OBoLrl/zq4953CUl02RXH1TaUDGtotB7
 W2ypgU3T7bvu1VpNBCt/8YBOWzw5uVVKynxKQsMbRC2EInNGZd/Yis+TFeLaHMKX6Xfj
 hQdKaNvjQv2veSxaASGmiTghkozp7QJXIAsnWAHx/Behud55tkYfVKhIbf1ht7C/opGt
 tS2hc+lGVC5APLQ1LrWPB7cnudTXIs8cSBuwbprGrKYTKBVlm4LRQDzgwlBCVFeQJxHh
 zYpQ==
X-Gm-Message-State: ACgBeo2rMYGKgVPROtfNZRiCG93BQvMAKxJGF4AL1OAW0OSvSrq1mcvc
 DslGfyKQjQAoYlnTvVTXswI=
X-Google-Smtp-Source: AA6agR69gHdIOk66u3DOAUGxbgd3W9IYbjKGJ4TRriMkRlw9SK3I2HFpGUjJDA71iNteqeGQVxRwjg==
X-Received: by 2002:a17:907:2719:b0:730:a5e7:9da7 with SMTP id
 w25-20020a170907271900b00730a5e79da7mr6558802ejk.26.1659729279246; 
 Fri, 05 Aug 2022 12:54:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 2-20020a170906200200b0073100dfa7b0sm947743ejo.8.2022.08.05.12.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 12:54:38 -0700 (PDT)
Message-ID: <ec3fe997-37d8-22b5-65f1-72f08a16474f@redhat.com>
Date: Fri, 5 Aug 2022 21:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 08/14] KVM: Rename mmu_notifier_*
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-9-chao.p.peng@linux.intel.com>
 <YuQutJAhKWcsrrYl@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YuQutJAhKWcsrrYl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/22 21:02, Sean Christopherson wrote:
> If we really want a different name, I'd vote for nomenclature that captures the
> invalidation aspect, which is really what the variables are all trackng, e.g.
> 
>    mmu_invalidate_seq
>    mmu_invalidate_in_progress
>    mmu_invalidate_range_start
>    mmu_invalidate_range_end
> 

Agreed, and this can of course be committed separately if Chao Peng 
sends it outside this series.

Paolo

