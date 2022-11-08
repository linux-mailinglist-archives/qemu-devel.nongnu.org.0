Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B56204CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:43:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osCgk-0007Hb-Ec; Mon, 07 Nov 2022 19:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1osCge-0007HK-Vu
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 19:41:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1osCgZ-0007wK-6p
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 19:41:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id b21so12736127plc.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 16:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f4mzRLoeQ48oTB+HkMbcCJtw/jiM85vqqZbEZxBfoPw=;
 b=jNkxWtUCmfG2zrTTxPn7pXbOfg8WgaPlJ/TmU5ho83sUA7wRBlAIcBc7kM55RSxQfz
 O9KfA73Mo41SgYIU/6ztTbPkU74vvXbXhLfeG7if5q08aJsers9rlUH+IcWmJCieuLMB
 gbuRsARLxBA75WAmVf89DtRjcvxlhjWPeHEm1phJr7YMFgREvRfd7mjbZlBzS7taId+K
 Z7st3hqeZybjF8yrj+ldtMVMB0xM9NnHcs5o8YhIkyHPPFq825EvPYOoBldCw5yPpP7F
 HggWHyUW5wTNWT3I1EIWRCFsjLeBu0Rg8w3vv3t1/ntNPIXw9J4HHOSpeRyqwRkQq+gR
 i+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4mzRLoeQ48oTB+HkMbcCJtw/jiM85vqqZbEZxBfoPw=;
 b=rrvJRTz4nUJfUgH3aVq2Q0iXPZZEPa9grlaJJe5jRhFisKpJH70AtimGyFphnJWRPe
 3JMvwcQkWfzw7y6ir2kE0WlGSbFxZn+8UZwxZJW45yHF8LxbTQKPdTS1ZYffXYfHegMn
 0vNCW30/POwfYgPSGE/5KsBT1uh74aaPsH40szBUi93uhg0YjZ6ucGczwCQg7mgQmBy0
 YG105iGUOPSYRdoA/0LC3shWIhGjspoCsWcl+BSCkH3q0L0VhandS/dVXXQrvCW0BYYS
 y20U0JeeQ7iwlQJ2tfdC9LHMZc51ZIZBMJVX8m5XImWFosQ6XdKDPAPaz1UTPUzu7cnj
 00rQ==
X-Gm-Message-State: ACrzQf05u1CidInU9+nzd3/LamSApP9yQCLR/rtjUpCXaBFbF0hQwyDz
 ZvZNl4cAlmQbVtm8PmWa9qA=
X-Google-Smtp-Source: AMsMyM5LfnPnZCR4C8YhXTlekjNtWQ4eT83Y8KqrHrr59s3tox+2We3eFncHxrM2kJlqZycKqKXg3A==
X-Received: by 2002:a17:903:1109:b0:179:d220:1f55 with SMTP id
 n9-20020a170903110900b00179d2201f55mr36061753plh.42.1667868104037; 
 Mon, 07 Nov 2022 16:41:44 -0800 (PST)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170902ea0400b001837463f654sm5535395plg.251.2022.11.07.16.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 16:41:43 -0800 (PST)
Date: Mon, 7 Nov 2022 16:41:41 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v9 0/8] KVM: mm: fd-based approach for supporting KVM
Message-ID: <20221108004141.GF1063309@ls.amr.corp.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <CAGtprH-av3K6YxUbz1cAsQp4w2ce35UrfBF-u7Q_qCuTNMdvzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGtprH-av3K6YxUbz1cAsQp4w2ce35UrfBF-u7Q_qCuTNMdvzQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 03, 2022 at 05:43:52PM +0530,
Vishal Annapurve <vannapurve@google.com> wrote:

> On Tue, Oct 25, 2022 at 8:48 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > This patch series implements KVM guest private memory for confidential
> > computing scenarios like Intel TDX[1]. If a TDX host accesses
> > TDX-protected guest memory, machine check can happen which can further
> > crash the running host system, this is terrible for multi-tenant
> > configurations. The host accesses include those from KVM userspace like
> > QEMU. This series addresses KVM userspace induced crash by introducing
> > new mm and KVM interfaces so KVM userspace can still manage guest memory
> > via a fd-based approach, but it can never access the guest memory
> > content.
> >
> > The patch series touches both core mm and KVM code. I appreciate
> > Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> > reviews are always welcome.
> >   - 01: mm change, target for mm tree
> >   - 02-08: KVM change, target for KVM tree
> >
> > Given KVM is the only current user for the mm part, I have chatted with
> > Paolo and he is OK to merge the mm change through KVM tree, but
> > reviewed-by/acked-by is still expected from the mm people.
> >
> > The patches have been verified in Intel TDX environment, but Vishal has
> > done an excellent work on the selftests[4] which are dedicated for this
> > series, making it possible to test this series without innovative
> > hardware and fancy steps of building a VM environment. See Test section
> > below for more info.
> >
> >
> > Introduction
> > ============
> > KVM userspace being able to crash the host is horrible. Under current
> > KVM architecture, all guest memory is inherently accessible from KVM
> > userspace and is exposed to the mentioned crash issue. The goal of this
> > series is to provide a solution to align mm and KVM, on a userspace
> > inaccessible approach of exposing guest memory.
> >
> > Normally, KVM populates secondary page table (e.g. EPT) by using a host
> > virtual address (hva) from core mm page table (e.g. x86 userspace page
> > table). This requires guest memory being mmaped into KVM userspace, but
> > this is also the source where the mentioned crash issue can happen. In
> > theory, apart from those 'shared' memory for device emulation etc, guest
> > memory doesn't have to be mmaped into KVM userspace.
> >
> > This series introduces fd-based guest memory which will not be mmaped
> > into KVM userspace. KVM populates secondary page table by using a
> 
> With no mappings in place for userspace VMM, IIUC, looks like the host
> kernel will not be able to find the culprit userspace process in case
> of Machine check error on guest private memory. As implemented in
> hwpoison_user_mappings, host kernel tries to look at the processes
> which have mapped the pfns with hardware error.
> 
> Is there a modification needed in mce handling logic of the host
> kernel to immediately send a signal to the vcpu thread accessing
> faulting pfn backing guest private memory?

mce_register_decode_chain() can be used.  MCE physical address(p->mce_addr)
includes host key id in addition to real physical address.  By searching used
hkid by KVM, we can determine if the page is assigned to guest TD or not. If
yes, send SIGBUS.

kvm_machine_check() can be enhanced for KVM specific use.  This is before
memory_failure() is called, though.

any other ideas?
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

