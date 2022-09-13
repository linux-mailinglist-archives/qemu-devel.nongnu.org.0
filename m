Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25B5B7298
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 17:00:19 +0200 (CEST)
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY7Oc-0003Ah-1b
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 11:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oY7I7-0001nZ-H6
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:53:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oY7I5-0002t1-OW
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:53:35 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so12089268ply.2
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=OJAIEjey9dL/oOlyHKJUty+rvUtRfrNcjV74l588HbE=;
 b=nipjUGyopyRbnweevoI2Oq+FbDhrGlaD7wKP+k5xapkMVsoGweAQ6K2hQ8AZ+n3N71
 J85U0qDe2D5AD8d1gpjf++nTpiIkyTFzNlFk+YTPVFtJCYSH/SE9jP8KJtPu7wQ0hfi5
 wYDpgxyUrRwd1sYa/NGSuu4VudYk3GqiPthKN+bOi/ckST3RiIggvPeGp3bhm5p8ypVT
 3f+MwrbGT4h/7a0VEnXrxvfZQW0KEOYcQaivu+1/UqQdLAEGFiH+0RbJHMUiEdIZPPCt
 MhVMuPS1IGUUE+HBMjXHJM9fAUIO8mG1oaSP0/UpGjTZuC/UI7ZeIyP4hCCX4seU5+Tv
 A0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=OJAIEjey9dL/oOlyHKJUty+rvUtRfrNcjV74l588HbE=;
 b=TIvPXCoKG9E0WnqpHzsF9dZQuJCsbOMhmG+JiOaJ6LZBYjDiP5j8/W6jy+6CgvWao7
 Z9+CMCEqeVnuVJgnLyO1jONyictjd1T1ZnpQWf0Jkm4D209woCLPcElDOzAxuHkF6tDG
 sNTZho8UXkHheYrNxgbRIlatYaWmOnGSOosiK5eJYo9yWi4aQLQSGjqJ5FAMDGPOkBes
 ET51Kvj96RyArwSp1G8GqHkP/mvUXuNEGPRyJXhlcBZH95cj4vRy0qPJQ8+1zwbSauzN
 gEv1zRg8N894/CevN1Uzp1mvGASdL55xAl7chZbHaRd285jd0MAvGr2f3SFWBSLnYMRP
 84YA==
X-Gm-Message-State: ACgBeo2fD3DHl2Ysqgh5HTk9+xYoop4RrpjUGmluz9pj6FZqYC7zH7QU
 NE31sfz8e85MkDTR0m1yndjLKw==
X-Google-Smtp-Source: AA6agR4hCeLSjZthMuJfgYlKUGutRaZadKKJTFOH4uT+lOP/oa9jwO7wbAgJCVwL7oqP3EbrVwcGew==
X-Received: by 2002:a17:902:c7cc:b0:176:9fdd:ddb7 with SMTP id
 r12-20020a170902c7cc00b001769fddddb7mr32324812pla.150.1663080810301; 
 Tue, 13 Sep 2022 07:53:30 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k5-20020aa79985000000b00535d3caa66fsm7855085pfh.197.2022.09.13.07.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:53:29 -0700 (PDT)
Date: Tue, 13 Sep 2022 14:53:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Hugh Dickins <hughd@google.com>,
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
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YyCZZSyCrwXLLCD9@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
 <20220908011037.ez2cdorthqxkerwk@box.shutemov.name>
 <YyBQ+wzPtGwwRB/U@google.com>
 <20220913132821.3ch5cv3rgdxqgz3i@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913132821.3ch5cv3rgdxqgz3i@box.shutemov.name>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=seanjc@google.com; helo=mail-pl1-x635.google.com
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

On Tue, Sep 13, 2022, Kirill A. Shutemov wrote:
> On Tue, Sep 13, 2022 at 09:44:27AM +0000, Sean Christopherson wrote:
> > On Thu, Sep 08, 2022, Kirill A. Shutemov wrote:
> > > On Wed, Aug 31, 2022 at 05:24:39PM +0300, Kirill A . Shutemov wrote:
> > > > On Sat, Aug 20, 2022 at 10:15:32PM -0700, Hugh Dickins wrote:
> > > > > > I will try next week to rework it as shim to top of shmem. Does it work
> > > > > > for you?
> > > > > 
> > > > > Yes, please do, thanks.  It's a compromise between us: the initial TDX
> > > > > case has no justification to use shmem at all, but doing it that way
> > > > > will help you with some of the infrastructure, and will probably be
> > > > > easiest for KVM to extend to other more relaxed fd cases later.
> > > > 
> > > > Okay, below is my take on the shim approach.
> > > > 
> > > > I don't hate how it turned out. It is easier to understand without
> > > > callback exchange thing.
> > > > 
> > > > The only caveat is I had to introduce external lock to protect against
> > > > race between lookup and truncate.
> > 
> > As before, I think this lock is unnecessary.  Or at least it's unnessary to hold
> > the lock across get/put.  The ->invalidate() call will ensure that the pfn is
> > never actually used if get() races with truncation.
> 
> The updated version you replying to does not use the lock to protect
> against truncation anymore. The lock protect notifier list.

Gah, grabbed the patch when applying.

> > Switching topics, what actually prevents mmapp() on the shim?  I tried to follow,
> > but I don't know these areas well enough.
> 
> It has no f_op->mmap, so mmap() will fail with -ENODEV. See do_mmap().
> (I did not read the switch statement correctly at first. Note there are
> two 'fallthrough' there.)

Ah, validate_mmap_request().  Thought not implementing ->mmap() was the key, but
couldn't find the actual check.

Thanks much!

