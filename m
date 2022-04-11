Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5964FC0DF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:34:52 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw43-0006b1-0z
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndw2L-0004Jl-Ff
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:33:05 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndw2J-0006oT-O7
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:33:05 -0400
Received: by mail-lj1-x22c.google.com with SMTP id q189so4023536ljb.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xnPakWPy2yT3pIDHfh65ar6g/dls1kfh8Fm485ETQ5M=;
 b=dQKM0d07whgvlC9oDhJtSUhDkTW4MoFSVg0vfgfBTGbnyj/vLpwIRlpTJbwhAy5wXy
 t4NvGLtrVnALpqzfCg7AJJXugL5G+gxtpmDu4P3kfUwP/PxlbMFsvAkSX6LdhPrmqMXT
 qiLuU+fH5rX1P4bRYOwwYVvuKX3ABpSSlgtg6Az3/bkGGCuw7OQsN/ELNNrrh8dksm+L
 jdUaWuAeAK2VUjv+c+38AFbQNMQ+BBRMEFHjUicyzn/UUqkyKZ+8hd7a357wBJLh/+Ai
 HUBjhhdQSdLifDKyLGXJgEw/B/MdcmTILkWCG50hI08mI+XNVGIswEXj19aZoHfNzVBJ
 crnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xnPakWPy2yT3pIDHfh65ar6g/dls1kfh8Fm485ETQ5M=;
 b=WAbHMxaoBqlpT4X7VwWro6nDgiKm6ubUzH61o1f2SxAxvFG+przhd1mqOtnpvzso4u
 1aYTwve4i6RAzuMdIrVvuKaXMldwb78CsSfR4H96vkvEvG6amwd7O486W5+nRgQCG5b1
 DArFzkg/NHCYmZ2bgP6Ej4875w8/ScSKjYBE/Qz3HlLZeDFKBcR54TT2rJb+RB/43k5E
 z8ZEPPFrCOukAtyqV9NDKAhSab3Mxbk2TwLiIZ/WaeZmvwMmJm3lNMSbVKFmn48lPDBl
 PRUf+Cc6/pdG1Hb5Z7dgtvHvsS56XA8+IoDYKMBvon9dP0ET/YCiVX7reL7kLw4/J5Dd
 9XzA==
X-Gm-Message-State: AOAM532143Fm7daPWe488Z2ShlFSJi+adLypX4kUTN3LC40N4V7w2PWK
 P3WsKhjl43UBpuCRYbxA9dVoHg==
X-Google-Smtp-Source: ABdhPJznGRs4U58z6UmE7zKZGIORoorFbfftosrGPlCNHfF3AfxicsXpipbZkrEfC0QnRLsaSTmPLw==
X-Received: by 2002:a2e:3a02:0:b0:24b:6120:1be4 with SMTP id
 h2-20020a2e3a02000000b0024b61201be4mr4554362lja.451.1649691181857; 
 Mon, 11 Apr 2022 08:33:01 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a2e6819000000b00247de61d3fdsm3162062lja.113.2022.04.11.08.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:33:01 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id E5DD4103CE0; Mon, 11 Apr 2022 18:34:33 +0300 (+03)
Date: Mon, 11 Apr 2022 18:34:33 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220411153433.6sqqqd6vzhyfjee6@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <20220408130254.GB57095@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408130254.GB57095@chaop.bj.intel.com>
Received-SPF: none client-ip=2a00:1450:4864:20::22c;
 envelope-from=kirill@shutemov.name; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 08, 2022 at 09:02:54PM +0800, Chao Peng wrote:
> > I think the correct approach is to not do the locking automatically for SHM_F_INACCESSIBLE,
> > and instead require userspace to do shmctl(.., SHM_LOCK, ...) if userspace knows the
> > consumers don't support migrate/swap.  That'd require wrapping migrate_page() and then
> > wiring up notifier hooks for migrate/swap, but IMO that's a good thing to get sorted
> > out sooner than later.  KVM isn't planning on support migrate/swap for TDX or SNP,
> > but supporting at least migrate for a software-only implementation a la pKVM should
> > be relatively straightforward.  On the notifiee side, KVM can terminate the VM if it
> > gets an unexpected migrate/swap, e.g. so that TDX/SEV VMs don't die later with
> > exceptions and/or data corruption (pre-SNP SEV guests) in the guest.
> 
> SHM_LOCK sounds like a good match.

Emm, no. shmctl(2) and SHM_LOCK are SysV IPC thing. I don't see how they
fit here.

-- 
 Kirill A. Shutemov

