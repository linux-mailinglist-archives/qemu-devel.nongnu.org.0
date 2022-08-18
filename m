Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D775980E5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:35:44 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObwE-0006yv-N7
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oObXM-0006gI-I5
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:10:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oObXK-0005RK-Qs
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:10:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id gb36so2055076ejc.10
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=OM28IoofemszvZBGCPnenf9hx1PitiC3j3mv8pJzzLY=;
 b=ij1yc1LQl9Wf3pW5R1RqykES0Aufpt68J+25lcVedl/CpmlFqJG/3XGLjyW2MHoLNc
 RATABqbitRRkNkbzTUPBN+b00N4M50Y7j/0ODEeCK4DJ1JxY6f4rpDPPWv/L1cl0a3G9
 sAXVvVEsJtSRSRthDDyQtU3BfZ7y/6/7XEt+z2ltD4pkwWTqhWOhuCsB62txeENhXVbe
 +mMm1pX2BJT/74i8I6amFdoHLlwihES/nKklvXI3VtoaDAYi9ugEu++7ZTBVUoALiTH9
 N3WC3/Fq94Hur7bPMP7JJwb2EwBBorftYgTT0A/a/fS4RdJtnmRaHQgCu7FbcBd3pI8j
 XqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=OM28IoofemszvZBGCPnenf9hx1PitiC3j3mv8pJzzLY=;
 b=NFI3J7xkxgx1KQVnAa//qUvrhs/IyghEZ+gqdSi2w8ttT2ZRxjBV0aKgeRgyOz2I3w
 7u4x2P6QgU1REC1DyF4w1SypJTBU9v2rNDrpFNLzRp95oLNba332Nz+IPTK6YpSSpoS8
 Hu4cMRgk+PxGb0CCNHAPs6loVVtLNC1Qw/8mhgcV+06GGOTdAHLLbFqyTy8UBuoB1I+O
 q+GZugQiVe6AvxUapOoD6I0mCQiN8/npv87MOUBSL1JZOkzGQo3fLk/Y1aDF2e11hy9N
 Y70VwiKN1DKWR3nbF2h+q3NDshoAlhVLKrg5Udwtr5gq1HRrracVe1xpKBQaEM6XzSB9
 Yvlg==
X-Gm-Message-State: ACgBeo0d+o2LOCVvwABfCkqSq8wO23Gwz5rZAl0Xg5OVXAkxQIY2SLc3
 bYxP75/BONW4fDjukWe3qJk=
X-Google-Smtp-Source: AA6agR7J/9/o1YBQevKgS2HfGCsS2gahP6q9ngCobHspK0yQln3/vemjVdtjZipLOMqNIx4sDBaa7Q==
X-Received: by 2002:a17:907:a057:b0:730:a2d8:d5ac with SMTP id
 gz23-20020a170907a05700b00730a2d8d5acmr1327595ejc.764.1660813795048; 
 Thu, 18 Aug 2022 02:09:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 ck30-20020a0564021c1e00b00445d760fc69sm772722edb.50.2022.08.18.02.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 02:09:54 -0700 (PDT)
Message-ID: <b13f84e2-d402-d686-a365-d13cd09b2a01@redhat.com>
Date: Thu, 18 Aug 2022 11:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: David Hildenbrand <david@redhat.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
 <20220817234120.mw2j3cgshmuyo2vw@box.shutemov.name>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220817234120.mw2j3cgshmuyo2vw@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

On 8/18/22 01:41, Kirill A. Shutemov wrote:
> Note, that userfaultfd is only relevant for shared memory as it requires
> VMA which we don't have for MFD_INACCESSIBLE.

Oh, you're right!  So yeah, looks like userfaultfd is not a problem.

Paolo

