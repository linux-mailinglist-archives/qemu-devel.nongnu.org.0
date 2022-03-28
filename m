Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09184EA19C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:37:05 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw6r-0008Mm-0w
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:37:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nYvnd-0005aU-S9
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:17:14 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:41284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nYvnc-0003aF-6j
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:17:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5640661471
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 20:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79DBC34100
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648498621;
 bh=F88P3EjB8xr5i+2/B7u8QJbACQEAp4uoybtn389DnK4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XYn15NiWNNsF7dxAmFQbJtgtcNDJDT1dU7g8i6f+H1YquMPuC/7wmudwTz8JXxVDw
 SHZiugH6r4nSQuo3RkBaieTY7fR97IZs0RPXizfy333Z9GGrXu1z6Z0psQ/b5lig2B
 Nk8l7XdhZKirBEQjqrx7Ta1taqENR3RggObIixfMUryIvmPE2lv/NVgQndq2rcXbKJ
 U/RQWWCck4yiTEvHP8ESjKSoC3Y77Yp+jn7tsjMVJH6ag3b/+QIOAWkkyyv/FssBbZ
 +KUAQkh8KoLVEBMxjKObI5fCgpxW+OBlCxGTzwe57REk6eA82dh/taavMBJc4UsYnd
 ME0wTzjKdIZpw==
Received: by mail-ej1-f47.google.com with SMTP id yy13so31018662ejb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:17:01 -0700 (PDT)
X-Gm-Message-State: AOAM530zWvs1kE2Exj7BkA1kec6pGvoGnouugDhXBWQ5WdH1w8pF3aBk
 VjfXFGf7Uc3rlyudrLVH4krfOCYrpYl69pJv60kYYg==
X-Google-Smtp-Source: ABdhPJyUCfqNMjY4j/zDrp5thzUNKGPE9xMYQkN6ReIG1dPzUmJOgX3w9dDbnVfGV3lDWzlxjIqdp/oS80009PSifH0=
X-Received: by 2002:a17:906:c10d:b0:6e0:dc2a:338d with SMTP id
 do13-20020a170906c10d00b006e0dc2a338dmr14671860ejc.538.1648498620006; Mon, 28
 Mar 2022 13:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 28 Mar 2022 13:16:48 -0700
X-Gmail-Original-Message-ID: <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
Message-ID: <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> This is the v5 of this series which tries to implement the fd-based KVM
> guest private memory. The patches are based on latest kvm/queue branch
> commit:
>
>   d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2

Can this series be run and a VM booted without TDX?  A feature like
that might help push it forward.

--Andy

