Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CD65CA38
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 00:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCqMq-0007jO-Ht; Tue, 03 Jan 2023 18:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pCqMo-0007jB-BV
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 18:06:46 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pCqMl-0005v4-Lr
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 18:06:46 -0500
Received: by mail-pl1-x633.google.com with SMTP id n4so34237161plp.1
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 15:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wms9vJRG39Hnpaj8L9AdTUEiKoOujl8Zc1PlfJpuAvc=;
 b=h9725tfa5hdVaq1HRKMg38pT3bnSdsZu1gYJxnR5d5+gbg52PuYQIv5wBFlDJhO9bS
 mI84Q+hhI20dHQcSkgxSkQf4wP4qmQP1LNIFkAq/VomPx4jdE8OPYacqy/eeBE+fylf/
 swL/aH5bYQ07AmejSAYJHcZh07QDgP5xrRt6bm8Q1etUwfrKAFos+bdLOE5+JE6PBi3U
 sFDQ9Dps9Lxs/yyXs3jQijpfnjXJqK66rKL3UJSPZwrJDKJketPNn4qX/18FtXZzHbno
 RPLBoKWopziiN34rcQN0qmYINuJwWj5jMTrSB3yTnXpqqbcBJ6htLtlQbhw4piMR+QeH
 MFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wms9vJRG39Hnpaj8L9AdTUEiKoOujl8Zc1PlfJpuAvc=;
 b=fx4RoHfr0xyJ66xQrsunqt6yF4LP991zRPTaEXffgmJPdhSb7Sccx+CWSXiT5uJpMc
 L8AhUdGCrFoTL8S8KPpFlFMP7wqfNpnpMZWXyiIMt2a/Fe2o6gPrrjr51PoC/F2ciK27
 3gM5NVg3q2JeAr9R12IVTOUdk5dRjHP87AZc2Ckb6AVK9jJYSaBzFERMEA+vO8Mc4TUB
 4HrMsKxQiOWqdILzVBcRgIT4ctWYFprdEL+m8ZEu6grAmb5ySvmovoPBp7Cl8LFuZ0Lq
 RLdnbvWeNOT+C6S8RLNra4XA5sI4CzGdLAmreLdv6ZwI/qj9M/hsPQn/CJ4qTts5xOUZ
 i6fQ==
X-Gm-Message-State: AFqh2krXIVxXZFAlJwEAnXOEpnMw5CJ26qaKR9Zm0YgpatfOZXYuTEka
 PY+3AoxNNcGmP33mBoqX97DWhA==
X-Google-Smtp-Source: AMrXdXv0hPqADj10or2SDVYag+quux5jra8KVSiEDlbg50PLMvdP+6Y7KrZdfBMvhypOkMi3Sz3H1g==
X-Received: by 2002:a05:6a20:2a9f:b0:a4:efde:2ed8 with SMTP id
 v31-20020a056a202a9f00b000a4efde2ed8mr5044243pzh.0.1672787201272; 
 Tue, 03 Jan 2023 15:06:41 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 b27-20020aa7951b000000b00580c8a15d13sm19479380pfp.11.2023.01.03.15.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 15:06:40 -0800 (PST)
Date: Tue, 3 Jan 2023 23:06:37 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 "Qiang, Chenyi" <chenyi.qiang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, "x86@kernel.org" <x86@kernel.org>,
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
 "Lutomirski, Andy" <luto@kernel.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 Quentin Perret <qperret@google.com>, "tabba@google.com" <tabba@google.com>,
 Michael Roth <michael.roth@amd.com>, "Hocko, Michal" <mhocko@suse.com>
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <Y7S0/VYsy4aWjfQ+@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <1c9bbaa5-eea3-351e-d6a0-cfbc32115c82@intel.com>
 <20230103013948.GA2178318@chaop.bj.intel.com>
 <DS0PR11MB63738AE206ADE5EB00D8838BDCF49@DS0PR11MB6373.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB63738AE206ADE5EB00D8838BDCF49@DS0PR11MB6373.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=seanjc@google.com; helo=mail-pl1-x633.google.com
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

On Tue, Jan 03, 2023, Wang, Wei W wrote:
> On Tuesday, January 3, 2023 9:40 AM, Chao Peng wrote:
> > > Because guest memory defaults to private, and now this patch stores
> > > the attributes with KVM_MEMORY_ATTRIBUTE_PRIVATE instead of
> > _SHARED,
> > > it would bring more KVM_EXIT_MEMORY_FAULT exits at the beginning of
> > > boot time. Maybe it can be optimized somehow in other places? e.g. set
> > > mem attr in advance.
> > 
> > KVM defaults to 'shared' because this ioctl can also be potentially used by
> > normal VMs and 'shared' sounds a value meaningful for both normal VMs and
> > confidential VMs. 
> 
> Do you mean a normal VM could have pages marked private? What's the usage?
> (If all the pages are just marked shared for normal VMs, then why do we need it)

No, there are potential use cases for per-page attribute/permissions, e.g. to
make select pages read-only, exec-only, no-exec, etc...

> > As for more KVM_EXIT_MEMORY_FAULT exits during the
> > booting time, yes, setting all memory to 'private' for confidential VMs through
> > this ioctl in userspace before guest launch is an approach for KVM userspace to
> > 'override' the KVM default and reduce the number of implicit conversions.
> 
> Most pages of a confidential VM are likely to be private pages. It seems more efficient
> (and not difficult to check vm_type) to have KVM defaults to "private" for confidential VMs
> and defaults to "shared" for normal VMs.

If done right, the default shouldn't matter all that much for efficiency.  KVM
needs to be able to effeciently track large ranges regardless of the default,
otherwise the memory overhead and the presumably cost of lookups will be painful.
E.g. converting a 1GiB chunk to shared should ideally require one entry, not 256k
entries.

Looks like that behavior was changed in v8 in response to feedback[*] that doing
xa_store_range() on a subset of an existing range (entry) would overwrite the
entire existing range (entry), not just the smaller subset.  xa_store_range() does
appear to be too simplistic for this use case, but looking at __filemap_add_folio(),
splitting an existing entry isn't super complex.

Using xa_store() for the very initial implementation is ok, and probably a good
idea since it's more obviously correct and will give us a bisection point.  But
we definitely want a more performant implementation sooner than later.  The hardest
part will likely be merging existing entries, but that can be done separately too,
and is probably lower priority.

E.g. (1) use xa_store() and always track at 4KiB granularity, (2) support storing
metadata in multi-index entries, and finally (3) support merging adjacent entries
with identical values.

[*] https://lore.kernel.org/all/CAGtprH9xyw6bt4=RBWF6-v2CSpabOCpKq5rPz+e-9co7EisoVQ@mail.gmail.com

