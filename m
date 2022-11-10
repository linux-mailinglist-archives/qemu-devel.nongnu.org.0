Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63E6248BE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:55:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBkC-0005uC-4g; Thu, 10 Nov 2022 12:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1otBk9-0005tj-Ny
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:53:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1otBk8-0002KI-18
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:53:37 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u6so2033289plq.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2oKQDlB6eYx+fAXvKZFnqwvhnIR4JQKKCXs9/v8+asA=;
 b=USq4b5Vh1OXggTCD0w44axvUCuw0wgwmRJONRIlB95PFBRewtOpmoKc7I2XbMFe+Jt
 py6SLDlrcfHe9Q3VO4+7dfiMGs6dPX9qHKjrdWteekp4+U/DoQ8k4+BtA12MyhPAKSwW
 oWUbDGwbmbtRu0HlyiAF1gzP3/dmYGn+4ag1yp2zQxUQz3Y8R8NAepQDJa1zRgnFTAwp
 482q2MupCDGAkGCVertYK1p6MwGRwEAvRckuUOPwVBujunwWETFLz4d1bnde8cgKCLkj
 6U6T7ZnM4yWVZOheoRcwISEPaZCMlXQ5G+O2GSFI15kWlhWhoPX3ZMRej3KuRu/bUqnC
 oRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oKQDlB6eYx+fAXvKZFnqwvhnIR4JQKKCXs9/v8+asA=;
 b=YoKAdp2+wp+WHXtev3jgJIejImukUCpctzH6j2TU9Q+6x/yWVMABBXtYBh6hwOJK/O
 Pt0G6PJSf2I2qzmg6RvEqDlbPSCVz8DO/w0ozKdMkGfBQlF6AlrhnrVSb2dr9ICpHVLY
 gouxMa6QQ4o7y4MsVuNIRzthrqBW4ILEiRZnfp8MPD3VkCBWjpnVccYjCErTP7zap7Qo
 iVolbMveTQcPXGpo788FTO9O+iRkoPUM3Ay5DXP+Y3X20D140p0HxARSQJg2aA35aNAe
 CqfA+u6SPzV4S495Yc3TQv+zsa6+MehRmwHH8f4riJ3MIgd282Erz2zfLjUgNQBifK5L
 07Sw==
X-Gm-Message-State: ANoB5pkv87lOdAoGYt6LmD9jVlzBrFO81VT2w2I0juexAxA9GafqOf7o
 jtlScyOGcbtQ5/ou96ILepKHtg==
X-Google-Smtp-Source: AA0mqf5Tm7voUfqlq46fUuj/FQZ0U+LCKMGUSx8RMJOkkJOakWUAIRLRpdmCoJrBserqv+E6AVAQEA==
X-Received: by 2002:a17:903:120f:b0:188:82fc:e259 with SMTP id
 l15-20020a170903120f00b0018882fce259mr18758217plh.61.1668102813812; 
 Thu, 10 Nov 2022 09:53:33 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b00172e19c5f8bsm11666966pla.168.2022.11.10.09.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 09:53:33 -0800 (PST)
Date: Thu, 10 Nov 2022 17:53:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 4/8] KVM: Use gfn instead of hva for mmu_notifier_retry
Message-ID: <Y206mVuJlXjO10qx@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-5-chao.p.peng@linux.intel.com>
 <CA+EHjTySnJTuLB+XoRya6kS_zw2iMahW9-Ze70oKTf+6k0GrGQ@mail.gmail.com>
 <20221104022813.GA4129873@chaop.bj.intel.com>
 <Y2WSXLtcJOpWPtuv@google.com>
 <20221108071624.GA76278@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108071624.GA76278@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62e.google.com
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

On Tue, Nov 08, 2022, Chao Peng wrote:
> On Fri, Nov 04, 2022 at 10:29:48PM +0000, Sean Christopherson wrote:
> > The APICv case that this was added for could very well be broken because of
> > this, and the resulting failures would be an absolute nightmare to debug.
> 
> Given the apicv_inhibit should be rare, the change looks good to me.
> Just to be clear, your will send out this fix, right?

Ya, I'll post an official patch.

