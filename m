Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF666A7B8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 01:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGUYq-000484-U9; Fri, 13 Jan 2023 19:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGUYl-00047w-59
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:38:12 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGUYh-000564-Dd
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:38:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so28556492pjk.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 16:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MgBnQ26ItOkyYKiu1oV6JX0ska5GpfEn/0b8SeFBGOs=;
 b=fZz4bsSG6rplxu+/+bbAGu03TpfBRqzSERj11fI9gPC3YiJL/UeAPW98CKZYKTN7Ws
 j53XSFyQZNUTcXaOijVfFvsqXEfJGx6cLcfKMLjiLO/bW7eqi7LulykqxZENOBL1WwJN
 RayxBQjRABfgAcBUTV5MtEdBlwhGdejOfhp+6x1ylwnSaQw5/5CItg/TVLAvnSFoGFQD
 lbGhWsb6A9IEcn0SbTi5gMac6RtBt94MErdTeqH8q/FrYZ43WZq9AALzNfaHFxf2mxJm
 5DgARQXIRLPhEsnlbzOh8dlw4D9+iPLKzKCIvdG2Ml019sB1Ej5N2/v0hQswCEcOzBeL
 65NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgBnQ26ItOkyYKiu1oV6JX0ska5GpfEn/0b8SeFBGOs=;
 b=J0CLfS4a4JFprulmJPynLcW1oAI7k5XPoiPCdDKF6bE/Bma96t91oF+iBJsU8cYsKN
 3Csa2C/EtYFKsB5/m0T9+g4Mo4nIzu2jXNggTuJgvdZZSfW1EilasukvtUs+zGX8EQKC
 Qvlxz11yaR+egIcFssszN2KsqZWNXHrrMCdBHqIX9F+Y0maMZT7o2PIw4VslE8je4z5/
 2hvVLmHpY+t+uExLeGBfHDugYl2+708/5g+FKI5d2q3oPw11iNay1oGDKCx2HgZvFL3B
 9CXJVGKEIT67mZonqKMnuGHk35R/9PqbxPLMsGzgpWsXL+EA0TKSZ2nGc9f5gBwz8k1i
 C6ww==
X-Gm-Message-State: AFqh2kq6aB5sGKG4imQ1suKxBAdx/3cltwhY5rrq3NbVgVkSGn6LyUzB
 L35rjErICFAhhsYCE+ZaZVF2tg==
X-Google-Smtp-Source: AMrXdXvO5lr0leGyzGM7js7Dp/RGVdcEkNK6lyE8EJsgzKqjTO8ro2/W2YgLE7h5m81d74tyNSIgGA==
X-Received: by 2002:a05:6a20:1394:b0:b5:a970:8d5a with SMTP id
 w20-20020a056a20139400b000b5a9708d5amr2026776pzh.0.1673656683660; 
 Fri, 13 Jan 2023 16:38:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 d12-20020a634f0c000000b0047829d1b8eesm9871303pgb.31.2023.01.13.16.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 16:38:03 -0800 (PST)
Date: Sat, 14 Jan 2023 00:37:59 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Message-ID: <Y8H5Z3e4hZkFxAVS@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1031.google.com
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

On Fri, Dec 02, 2022, Chao Peng wrote:
> This patch series implements KVM guest private memory for confidential
> computing scenarios like Intel TDX[1]. If a TDX host accesses
> TDX-protected guest memory, machine check can happen which can further
> crash the running host system, this is terrible for multi-tenant
> configurations. The host accesses include those from KVM userspace like
> QEMU. This series addresses KVM userspace induced crash by introducing
> new mm and KVM interfaces so KVM userspace can still manage guest memory
> via a fd-based approach, but it can never access the guest memory
> content.
> 
> The patch series touches both core mm and KVM code. I appreciate
> Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> reviews are always welcome.
>   - 01: mm change, target for mm tree
>   - 02-09: KVM change, target for KVM tree

A version with all of my feedback, plus reworked versions of Vishal's selftest,
is available here:

  git@github.com:sean-jc/linux.git x86/upm_base_support

It compiles and passes the selftest, but it's otherwise barely tested.  There are
a few todos (2 I think?) and many of the commits need changelogs, i.e. it's still
a WIP.

As for next steps, can you (handwaving all of the TDX folks) take a look at what
I pushed and see if there's anything horrifically broken, and that it still works
for TDX?

Fuad (and pKVM folks) same ask for you with respect to pKVM.  Absolutely no rush
(and I mean that).

On my side, the two things on my mind are (a) tests and (b) downstream dependencies
(SEV and TDX).  For tests, I want to build a lists of tests that are required for
merging so that the criteria for merging are clear, and so that if the list is large
(haven't thought much yet), the work of writing and running tests can be distributed.

Regarding downstream dependencies, before this lands, I want to pull in all the
TDX and SNP series and see how everything fits together.  Specifically, I want to
make sure that we don't end up with a uAPI that necessitates ugly code, and that we
don't miss an opportunity to make things simpler.  The patches in the SNP series to
add "legacy" SEV support for UPM in particular made me slightly rethink some minor
details.  Nothing remotely major, but something that needs attention since it'll
be uAPI.

I'm off Monday, so it'll be at least Tuesday before I make any more progress on
my side.

Thanks!

