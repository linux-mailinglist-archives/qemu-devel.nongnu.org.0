Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC35B7640
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:19:29 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8dD-000771-Q1
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oY8WC-000191-Vw
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:12:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oY8WA-0002ua-Ns
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:12:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ge9so281601pjb.1
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4GTld6ZU8MtCcyeBG9nWMSKRKMoB2xn8bpkZwXHEw2s=;
 b=DihabYGaFpN/XoOHm1MSaQi2kRH2os0yj0QoILo7SPAJF8OpMSQjLf1+pqVt7GZRjd
 D81sKZU5Oq0vtGEgr0Plm1UVQOezX4s/yuWlGktjKnB/6aqUWru04VRRHhXjgMf9lgKo
 FR9C6O8IdbFGuxPJakYZ4BdDTShUXISvdElPZULkotAb3nTa0x7V27hT49l5H57ZEuzT
 Y2ncOVkRrhHKP66UtZI06AJkG7HRBc21aMZ2rHU6LkxtwqHKRvYMVYVLxRX743DN2L19
 qdr5gZklkks6Bi/hi2Z1rhwNsdKW/awWh0sDR0Rahs+8lcIfTne4V8e5TEE/NSU59M4J
 aEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4GTld6ZU8MtCcyeBG9nWMSKRKMoB2xn8bpkZwXHEw2s=;
 b=rfOciqjz/IeNNGQ3rZNR9CoT8IVUS7g+GB5AAVGnUZaZtnwqudWgUgMYbV+5NLy3+J
 B3oAFMqu7yRZJPPAP1O2DR8suP7FG8JRhGNCLnQE8U+dZsWtSP3JxNV+29vaHWWgqUjk
 lL01Qs6LJ8ghioU+7aYD/fqvrATTln+inJ92nPOui7qMJa9Wwk0zvY77X9bket5AWVbG
 d4aW1EIvXJwMahVvFSj6zIDLwsb0GzAowjFQdkJ7hKBHokS8+K036oLRbuCvMBLeS6Ec
 Bu7JoEfCH5ALxK9n9agsUCi6xQEEooEObyNo+b1VaBqBsQWzzxrD3nrOTC3qRR92WLsg
 thQg==
X-Gm-Message-State: ACgBeo0JEPH/NFDDiUkgsqGLECVqffT+uWiuGAwBiNnn30APUmU3Brm8
 LcJk4OoUlU/37Bujzjt6NsBseg==
X-Google-Smtp-Source: AA6agR40QaognMZ1z9EKqE4W87Ed5lvL47BWBF35ur3fvygfSXXOQSwbnkou/SgHBPbWX+ZFZu3LkA==
X-Received: by 2002:a17:902:ce12:b0:172:9512:595d with SMTP id
 k18-20020a170902ce1200b001729512595dmr33361116plg.101.1663085528936; 
 Tue, 13 Sep 2022 09:12:08 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 ij24-20020a170902ab5800b001783f964fe3sm3191697plb.113.2022.09.13.09.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 09:12:07 -0700 (PDT)
Date: Tue, 13 Sep 2022 16:12:04 +0000
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
Message-ID: <YyCr1IfPWtAHmrwN@google.com>
References: <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
 <20220908011037.ez2cdorthqxkerwk@box.shutemov.name>
 <YyBQ+wzPtGwwRB/U@google.com>
 <20220913132821.3ch5cv3rgdxqgz3i@box.shutemov.name>
 <YyCZZSyCrwXLLCD9@google.com>
 <20220913160046.rkz7uh6cpwy6wyzg@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913160046.rkz7uh6cpwy6wyzg@box.shutemov.name>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1036.google.com
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
> On Tue, Sep 13, 2022 at 02:53:25PM +0000, Sean Christopherson wrote:
> > > > Switching topics, what actually prevents mmapp() on the shim?  I tried to follow,
> > > > but I don't know these areas well enough.
> > > 
> > > It has no f_op->mmap, so mmap() will fail with -ENODEV. See do_mmap().
> > > (I did not read the switch statement correctly at first. Note there are
> > > two 'fallthrough' there.)
> > 
> > Ah, validate_mmap_request().  Thought not implementing ->mmap() was the key, but
> > couldn't find the actual check.
> 
> validate_mmap_request() is in mm/nommu.c which is not relevant for real
> computers.
> 
> I was talking about this check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/mmap.c#n1495

Hence the comment about 'fallthrough'.  Thanks again!

