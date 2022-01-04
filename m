Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E484709
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:36:53 +0100 (CET)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4njw-0001fx-Px
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4ni6-0000Zt-CP
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:34:59 -0500
Received: from [2607:f8b0:4864:20::434] (port=33628
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4ni4-0004HJ-Sz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:34:58 -0500
Received: by mail-pf1-x434.google.com with SMTP id 205so32853091pfu.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=whSHyDkf0XZc1mjjjqOGE1/cp29qdWazioE+cyFAqO0=;
 b=AKGtA6ul6yuij5z+AvEU6YGN7uC/zmR1Z3AA2eavQwv49exOo937KC2cThIO1M5x5R
 ld8sDO2VSHM/RDAO9u2p+XO+70K8kcxVOrir1Y0yigapUXNM0Ylp9TZuzLp8opNiwQ7F
 AnKU33bHmO0NaKXzOI53pZm3IA1/NzLaG7sHnIF4oNjbhA1aPFUnql4JxyGrCHn6JbAR
 SUbiQLLvznmxlgAa1lOw1puG4OnmRONMmAC/E92187ZUZ0u1IfwKfyQOhRxiduWbOsmw
 QfJOYMgQVQMBG6eYUimmH+OiBuy14zVxqAM71F46TwcrfoWBadi7V6J39TzjtU+srhbw
 QcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=whSHyDkf0XZc1mjjjqOGE1/cp29qdWazioE+cyFAqO0=;
 b=SogCXoR8EI8cfe+fs278H8EQLixAfv2e38vm7xZgesiUUdwj+zDj+DU2vSMKSspab5
 6fT2NgKoaqZ4nbVeQsN3muGZG6Fe4VszZjGdrNTuG028LJDBy7aUbB8m3Qi8lbGs6gVb
 vyPFK8ZBdOPoKspz78fgtf+XIZ7idVkrKKTLpWBG2SB4HegM0StYdFcLOv+PJ57wWMVy
 2Ku8fsrzbbboKqjldcVpo342uEKP8gxqXTZGeyJa52icocMMQv0SdBoN9Bk89nruuy7p
 +3zddAQ1oPQTueeYPGkiR1ctypwZGtAi0mbUGj814oU6Evb0GGZ+iUYJ0OsEyXNpeqWa
 6uHg==
X-Gm-Message-State: AOAM532DRB/blbNlnoAPHQTY9dkRk2RDmRgPFPXrptaOzJLJf02ZRd1u
 Lp+kWrupoT2JVM/1q/xSbJGGtw==
X-Google-Smtp-Source: ABdhPJzZB3uUldS3H3PomxXInau17VQRCQJ4/BUX9qRXpwldcK2cYuphdyVvLg2cunzd1cVS/euxnw==
X-Received: by 2002:a63:87c3:: with SMTP id
 i186mr45003143pge.507.1641317695407; 
 Tue, 04 Jan 2022 09:34:55 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id k23sm401859pji.3.2022.01.04.09.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:34:54 -0800 (PST)
Date: Tue, 4 Jan 2022 17:34:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 04/16] KVM: Extend the memslot to support
 fd-based private memory
Message-ID: <YdSFO2fAHhdGsPLG@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-5-chao.p.peng@linux.intel.com>
 <YcSzafzpjMy6m28B@google.com>
 <20211231025344.GC7255@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231025344.GC7255@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=seanjc@google.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -148
X-Spam_score: -14.9
X-Spam_bar: --------------
X-Spam_report: (-14.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Fri, Dec 31, 2021, Chao Peng wrote:
> On Thu, Dec 23, 2021 at 05:35:37PM +0000, Sean Christopherson wrote:
> > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > > index 1daa45268de2..41434322fa23 100644
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -103,6 +103,17 @@ struct kvm_userspace_memory_region {
> > >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> > >  };
> > >  
> > > +struct kvm_userspace_memory_region_ext {
> > > +	__u32 slot;
> > > +	__u32 flags;
> > > +	__u64 guest_phys_addr;
> > > +	__u64 memory_size; /* bytes */
> > > +	__u64 userspace_addr; /* hva */
> > 
> > Would it make sense to embed "struct kvm_userspace_memory_region"?
> > 
> > > +	__u64 ofs; /* offset into fd */
> > > +	__u32 fd;
> > 
> > Again, use descriptive names, then comments like "offset into fd" are unnecessary.
> > 
> > 	__u64 private_offset;
> > 	__u32 private_fd;
> 
> My original thought is the same fields might be used for shared memslot
> as well in future (e.g. there may be another KVM_MEM_* bit can reuse the
> same fields for shared slot) so non private-specific name may sound
> better. But definitely I have no objection and can use private_* names
> for next version unless there is other objection.

If that does happen, it's easy enough to wrap them in a union.

