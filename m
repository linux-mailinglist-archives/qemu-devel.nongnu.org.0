Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2758FCCD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:51:49 +0200 (CEST)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7fA-0007IV-PM
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1oM7IF-0004VQ-G0
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:28:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1oM7IB-0002fu-Ic
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:28:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id b96so22827201edf.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 05:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=3MRcVxkQskaoR9Gu8vTdfe3SAmvath2jQNxcSxuvW1Y=;
 b=NHGbxl9pUrdbk/qb8xkMm4zoxhQhX6Rs444HQVekSH5HLue8co3CqoPnGbERLio2dM
 LGx24QotE4kcbcEEhmgdmUCglkMRj9LUgkSP/KpiNA700mP6h94Dn1d/wFOg8IXrTV5Q
 7t8086tWE8qBuYhtW+ve33VVpMjT6RO9u3JV6fo+OXTJ5nEqqLqt5Xfar1N/31vDl+kb
 /Qc9CeYpCrRSPvgdT5jKrAYi+Bis7pm8rvEJBRuOqCqT9rTRlL5ZiL661wC2BrmdE5CH
 +f94perJ/2Z6mBI0Mqi+Tsy+mMxy6HBFjWyJQNFav6rilu1dhdspBsJwb60836MPgNiY
 wunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=3MRcVxkQskaoR9Gu8vTdfe3SAmvath2jQNxcSxuvW1Y=;
 b=fnfqQ4RzShpQdWTftrSsuwcxe4dUfnR2RYIBTya3kRjIyjrk7St8FofO32u8Eqecqk
 wRN423ZGUBNsaRNht07A9T7NTJoWWTnf799AoYrDUhoCN9pYK4LgGBNNnoarMb2fNhj7
 IO4lEkfei5z7wwAq1eS0mueb5xYOOE2uXtSM7TkkMGf17QASu4J3DQwO3As8/6jlBVeg
 pEyidmZIO++hgGlI1zLMT8ZidxUeYaOxBQXsYL8YUsL8Kbw/lkTdh2M1TjMrZJdVx1lc
 qHzjBdmkeRFKBcgtGMi7fw5duK8WEa5lTnUPRoDSE1zZq956VKxhbLRMwZq3ygHhJp4w
 3BoA==
X-Gm-Message-State: ACgBeo3pjmfX9kAJy+i4TsCnCUZIy5W1r82vZAaXieZK4CxgWSE0ZI8x
 JTGPMCysGaEMgppSpkc96BGnXA==
X-Google-Smtp-Source: AA6agR6+Oii1v3EbiMDbdYw7/ayqCsy6sGwTAVm4xglPzXzpkb8k3QGndmL9Qe4QpGf4syQIGgATXw==
X-Received: by 2002:a05:6402:3583:b0:43d:6943:44a with SMTP id
 y3-20020a056402358300b0043d6943044amr30188049edc.409.1660220881001; 
 Thu, 11 Aug 2022 05:28:01 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com.
 [34.90.227.64]) by smtp.gmail.com with ESMTPSA id
 v20-20020a170906381400b007307d099ed7sm3440458ejc.121.2022.08.11.05.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 05:27:59 -0700 (PDT)
Date: Thu, 11 Aug 2022 12:27:56 +0000
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
Message-ID: <YvT1zOQtTQl2t300@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
 <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
 <20220810092232.GC862421@chaop.bj.intel.com>
 <00f1aa03-bc82-ffce-569b-e2d5c459992c@redhat.com>
 <YvPC87FMgF7uac7z@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvPC87FMgF7uac7z@google.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=qperret@google.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

+CC Fuad

On Wednesday 10 Aug 2022 at 14:38:43 (+0000), Sean Christopherson wrote:
> > I understand Sean's suggestion about abstracting, but if the new name
> > makes it harder to grasp and there isn't really an alternative to memfd
> > in sight, I'm not so sure I enjoy the tried abstraction here.
> 
> ARM's pKVM implementation is potentially (hopefully) going to switch to this API
> (as a consumer) sooner than later.  If they anticipate being able to use memfd,
> then there's unlikely to be a second backing type any time soon.
> 
> Quentin, Will?

Yep, Fuad is currently trying to port the pKVM mm stuff on top of this
series to see how well it fits, so stay tuned. I think there is still
some room for discussion around page conversions (private->shared etc),
and we'll need a clearer idea of what the code might look like to have a
constructive discussion, but so far it does seem like using a memfd (the
new private one or perhaps just memfd_secret, to be discussed) + memfd
notifiers is a promising option.

