Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16762F9D9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 17:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3m0-0004v6-B7; Fri, 18 Nov 2022 10:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ow3lw-0004ry-7c
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:59:21 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ow3lu-0003j7-J5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:59:19 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so5454178pjk.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BIzAKlqfAaMg368D6jPlp8HmIeVCVtTOFRZVfOrIoRA=;
 b=s6eyQMrxXlVr7mjyTTlqJhnlh/Xi9X6Am4TwNlENwsPyRh8KvXIqhnsP3MMWC9+MoB
 oQd97BmjUOsQPxgMsh5zyjcOYLIVp3cqB3U8qN7/Ud5hvTdIANRIWIS/vJblpoBTxukB
 h0Lxk6Jg3vNqw4OVzI0CkcjluXS6vsT31cdyDImlVx7++g13+ozmNNZ5BkzVdivrg7g+
 00m3rpeYDbyzY05rk/dB8GnC4ClchfIxtJ5aTCzCQyATv7KhMjKNSIDvnh3cGt1Q5v+L
 lNMyGoelDxkjB2wAw8ywO8jmucxwhUGJpJ8n7dWOAqcgUj06ocsZtkUfpHvBn0wBdFz1
 TsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BIzAKlqfAaMg368D6jPlp8HmIeVCVtTOFRZVfOrIoRA=;
 b=eUwN4kGEWdJz/PkrLFeHXLWvUaJh7RQ2DY8522ob7Bn5T/vqwCai+vfvnEJbK5IQQ9
 uQzToEIR0K4+7cDGE2gEf5hZmPgkU6UYeYjLMc6kxyU8SD+1mdQCSZ3xvN9KSjMrxtA3
 JYJ5BYu1X6N/xvztL3AL1fR6na3JaRNKv7+e6ziiaV7PAQwt7uuiQg1naV0Lo0UpBgIz
 Ty6Y7173oULFHhG7LSKHSm0BNLSm2hcB9qrgwUvTmeHT/msE0PHr46I51e2dNA+oltyC
 KYVrVDLhCHNgXdfYpwo8Maw2exGQzk8RO8XPDpyD0qfyDbqtPn4P7+iaGG6Euy8zVKoF
 jrwQ==
X-Gm-Message-State: ANoB5pmjXV4r9aUrYi2JWmV8ePQn8AEnwQ/aeXzGKmA9NzK4YYlQrBRA
 oY//OKvtJ7NrlQYu8k6DzWHuoA==
X-Google-Smtp-Source: AA0mqf68z73TZ4LH+iMU8Y7+vIcozkzW9+xI2VfYzqSxI4RUtQBXAdSaqw03S7HKwO0upOzd1Ydjhw==
X-Received: by 2002:a17:90a:9f03:b0:211:59c6:6133 with SMTP id
 n3-20020a17090a9f0300b0021159c66133mr8428311pjp.238.1668787156611; 
 Fri, 18 Nov 2022 07:59:16 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 s16-20020a170902a51000b001869f2120a5sm3840359plq.34.2022.11.18.07.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 07:59:16 -0800 (PST)
Date: Fri, 18 Nov 2022 15:59:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <Y3er0M5Rpf1X97W/@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <87cz9o9mr8.fsf@linaro.org>
 <20221116031441.GA364614@chaop.bj.intel.com>
 <87mt8q90rw.fsf@linaro.org>
 <20221117134520.GD422408@chaop.bj.intel.com>
 <87a64p8vof.fsf@linaro.org>
 <20221118013201.GA456562@chaop.bj.intel.com>
 <87o7t475o7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7t475o7.fsf@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022, Alex Bennée wrote:
> 
> Chao Peng <chao.p.peng@linux.intel.com> writes:
> 
> > On Thu, Nov 17, 2022 at 03:08:17PM +0000, Alex Bennée wrote:
> >> >> I think this should be explicit rather than implied by the absence of
> >> >> another flag. Sean suggested you might want flags for RWX failures so
> >> >> maybe something like:
> >> >> 
> >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_READ	(1 << 0)
> >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_WRITE	(1 << 1)
> >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_EXECUTE	(1 << 2)
> >> >>         KVM_MEMORY_EXIT_FLAG_PRIVATE            (1 << 3)
> >> >
> >> > Yes, but I would not add 'SHARED' to RWX, they are not share memory
> >> > specific, private memory can also set them once introduced.
> >> 
> >> OK so how about:
> >> 
> >>  	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
> >>  	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
> >>  	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)
> >>         KVM_MEMORY_EXIT_FLAG_SHARED     (1 << 3)
> >>         KVM_MEMORY_EXIT_FLAG_PRIVATE    (1 << 4)
> >
> > We don't actually need a new bit, the opposite side of private is
> > shared, i.e. flags with KVM_MEMORY_EXIT_FLAG_PRIVATE cleared expresses
> > 'shared'.
> 
> If that is always true and we never expect a 3rd type of memory that is
> fine. But given we are leaving room for expansion having an explicit bit
> allows for that as well as making cases of forgetting to set the flags
> more obvious.

Hrm, I'm on the fence.

A dedicated flag isn't strictly needed, e.g. even if we end up with 3+ types in
this category, the baseline could always be "private".

I do like being explicit, and adding a PRIVATE flag costs KVM practically nothing
to implement and maintain, but evetually we'll up with flags that are paired with
an implicit state, e.g. see the many #PF error codes in x86.  In other words,
inevitably KVM will need to define the default/base state of the access, at which
point the base state for SHARED vs. PRIVATE is "undefined".  

The RWX bits are in the same boat, e.g. the READ flag isn't strictly necessary.
I was thinking more of the KVM_SET_MEMORY_ATTRIBUTES ioctl(), which does need
the full RWX gamut, when I typed out that response.

So I would say if we add an explicit READ flag, then we might as well add an explicit
PRIVATE flag too.  But if we omit PRIVATE, then we should omit READ too.

