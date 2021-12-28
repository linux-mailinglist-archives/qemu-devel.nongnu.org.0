Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F7480DA3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 23:16:54 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Km5-0003pn-6q
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 17:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n2Kk4-0002lx-Rr
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 17:14:48 -0500
Received: from [2607:f8b0:4864:20::629] (port=45685
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n2Kk3-0007Cx-CY
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 17:14:48 -0500
Received: by mail-pl1-x629.google.com with SMTP id w24so14486280ply.12
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 14:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4kbldenRRljiKR1Jt8lmO+A9SOM5gsjtEfI6iQUXR9o=;
 b=MNwTLMoEjto6Tw6TfXVbYxRNk4Y/L11GzPwaCuLWqyWzjZ2pcEiwjFaSREd3CUy2fC
 MiMYyR8Cfk1wKwmCHbKOnQ+t6IQzl9Sw5a16HNSmWYqEpHHgEPKkuCKouItq6Q1Z1hFc
 MWTqs9iGTa5rvoxswEX5nU0xHrhOfCFbpvB3rYanRhKMz+DP1PdTiuKuvi2a2YEOySZN
 6CFhKlk2BnfSTBv/hCv7vLBIZepm6QGteoEDmTMfxwUFRX2DO4G2RWbTWc3RavQ+f0NQ
 pfTJMLA/uOnVIYf0YqAPnhCgUAusvK7b8nikHrV9n4IDIo1Keq98ObiEwq6iLXgYmejs
 jbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4kbldenRRljiKR1Jt8lmO+A9SOM5gsjtEfI6iQUXR9o=;
 b=C3rZG6ls5zhlHIGVu7mIGUsyeICicTDzmm1dyImCgCbMCA3x7c4/vHtVQ7XwX8NoXj
 EQI/OueyT4piLTo7BNe/uDbpcbPXdCn6JbEUWSFVVaabnZPORd9vjhb+zk/JjBIQd8C9
 tmV1WlOMAgdehq8PImjHdT0Px9m4uILB7CXJ+kj0Zu3joBsggfX+rv5Tb+7XKxROXzI0
 xtZt8TPEYE9ciE/UvuUO86xTlDNAVMULNAtHCuXTai1PDJDSjVauvwW0uDjKcqrOvf8Y
 xGarjFN0oKzOAKKqxdjIuDv8ZjuqAGnOfVX8SpoJN9nm0d7pQjizZUfLDYr+Jrq7l5Xk
 1lew==
X-Gm-Message-State: AOAM531p/8n0W/sWSZ2U9NnJtHBiHbSzcFVpFQOHyd3Iv7ivmiCuXpMR
 My0TLYcUCat80oegRNsbSUSi6Q==
X-Google-Smtp-Source: ABdhPJzfJNaMPXkNIFnIwBuKP0GW8ia1wKbbn8Tjarn7+ME8Xqk/IQFh/+e6Aq1yAU5kMGgNptVopg==
X-Received: by 2002:a17:90a:bc46:: with SMTP id
 t6mr29119866pjv.78.1640729685623; 
 Tue, 28 Dec 2021 14:14:45 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id a4sm23854157pjw.30.2021.12.28.14.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 14:14:45 -0800 (PST)
Date: Tue, 28 Dec 2021 22:14:41 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
Subject: Re: [PATCH v3 kvm/queue 06/16] KVM: Implement fd-based memory using
 MEMFD_OPS interfaces
Message-ID: <YcuMUemyBXFYyxCC@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-7-chao.p.peng@linux.intel.com>
 <YcTBLpVlETdI8JHi@google.com>
 <e3fe04eb-1a01-bea4-f1ea-cb9ee98ee216@redhat.com>
 <20211224042554.GD44042@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224042554.GD44042@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=seanjc@google.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Dec 24, 2021, Chao Peng wrote:
> On Fri, Dec 24, 2021 at 12:09:47AM +0100, Paolo Bonzini wrote:
> > On 12/23/21 19:34, Sean Christopherson wrote:
> > > >   	select HAVE_KVM_PM_NOTIFIER if PM
> > > > +	select MEMFD_OPS
> > > MEMFD_OPS is a weird Kconfig name given that it's not just memfd() that can
> > > implement the ops.
> > > 
> > 
> > Or, it's kvm that implements them to talk to memfd?
> 
> The only thing is VFIO may also use the same set of callbacks, as
> discussed in the v2. But I think that's fine.

I'm objecting to assuming that KVM is talking to memfd.  KVM shouldn't know or
care what is sitting behind the fd, KVM only cares whether or not the backing store
provides the necessary APIs.

I also think that the API as whole should be abstracted from memfd.  It's mostly
cosmectic, e.g. tweak the struct and Kconfig name.  I don't really care if it's
initially dependent on MEMFD_CREATE, I just don't want to end up with an API and
KVM implementation that implies there's something fundamentally special about memfd.

