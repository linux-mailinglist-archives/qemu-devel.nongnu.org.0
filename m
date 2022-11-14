Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E4628DB4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:45:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiof-0000bn-O6; Mon, 14 Nov 2022 18:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouifd-0004xE-1K
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:19 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouY2d-0007Wc-1c
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 06:54:21 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p16so7294337wmc.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 03:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFrv/gZh3M5M+GHa7rgQfMzZBcJfOT6Htd7GIwYXDjY=;
 b=EUoeLavTVlHYdJZCNph9EHvSI+oEmosznJ6f/upKgsdxBCVKAD+wKTTxF2HefZF4aJ
 +voBzLkimQpEK0QSkfAiC1ct7gmCt04TDRoYbiQk2+ZrURn8qyzn7B8NaLHEY4CnDGm6
 2jfadRSEAwkAURqUwVqJzHS0olixUeaFGq8/b2tw1FpYy5tfyimf03hvtmiBkAGD8Dwl
 b0COvNcSFazcgu2nDWFiq0ZFNQbDFye/UqRwXqYAyjzv+ihl5HvLX0qY0nWmYQKPF5Em
 ZwJAftOJ9dK9vLfL3ce4f68mG7VbwAJZ0JD+C1zsDfb08VanEK8T+D9r6Jo/S49b7wiV
 j91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UFrv/gZh3M5M+GHa7rgQfMzZBcJfOT6Htd7GIwYXDjY=;
 b=KMkjD7Trt/RRq5YiwczXUmRzT6wLcPcGYVYbKasLtE2CeTo1IFSFxHC3q1IbUxGncD
 nXLmR2Dkgw1FGeR/y8/UAvmPOrA5dgWUyF+ouZvEqX9CBKQiR2o5L/NMF9g++/AAF2qD
 dhtscB47h4aEoXrAHMRz+mKOg1O6OoKz1w1RTY+8YcgxGuLody2kw6mbTE+2+zMTjJ9J
 vHfzcTYk5+X1l7qT5Ci2Ru/U32CHL6OZw2AZbaL7/r1R7J3LI5Hb5sbJz6BTSNMC8m0K
 VwMiMA195IW6wUlqQ0ftFICVIN1SBy84WCxIcLTnOy233dVY9Wv1qXZge67o7iNW/9JI
 Bitg==
X-Gm-Message-State: ANoB5pn8+61SuheIOdsYMu/skHeLD30XGZ5WnLcuSUK6HlBWTUb9qzvx
 04H6S/BFS9JwSi5ulTMwn7X+YA==
X-Google-Smtp-Source: AA0mqf403V0vwqaE+mnyncg76u8ir3wUv9Nm7KTIlaElnQNtqjHebbBnqedRs9sCRLI9w2BMk0/32Q==
X-Received: by 2002:a05:600c:2315:b0:3cf:ae53:918f with SMTP id
 21-20020a05600c231500b003cfae53918fmr7727329wmo.131.1668426851811; 
 Mon, 14 Nov 2022 03:54:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002417f35767asm6097766wrr.40.2022.11.14.03.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 03:54:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E6971FFB7;
 Mon, 14 Nov 2022 11:54:10 +0000 (GMT)
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim
 Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, "J .
 Bruce Fields" <bfields@fieldses.org>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Steven Price <steven.price@arm.com>, "Maciej S .
 Szmigiero" <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang
 <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 tabba@google.com, Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com, Viresh Kumar
 <viresh.kumar@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: [PATCH v9 0/8] KVM: mm: fd-based approach for supporting KVM
Date: Mon, 14 Nov 2022 11:43:37 +0000
In-reply-to: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
Message-ID: <87k03xbvkt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Chao Peng <chao.p.peng@linux.intel.com> writes:

<snip>
> Introduction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> KVM userspace being able to crash the host is horrible. Under current
> KVM architecture, all guest memory is inherently accessible from KVM
> userspace and is exposed to the mentioned crash issue. The goal of this
> series is to provide a solution to align mm and KVM, on a userspace
> inaccessible approach of exposing guest memory.=20
>
> Normally, KVM populates secondary page table (e.g. EPT) by using a host
> virtual address (hva) from core mm page table (e.g. x86 userspace page
> table). This requires guest memory being mmaped into KVM userspace, but
> this is also the source where the mentioned crash issue can happen. In
> theory, apart from those 'shared' memory for device emulation etc, guest
> memory doesn't have to be mmaped into KVM userspace.
>
> This series introduces fd-based guest memory which will not be mmaped
> into KVM userspace. KVM populates secondary page table by using a
> fd/offset pair backed by a memory file system. The fd can be created
> from a supported memory filesystem like tmpfs/hugetlbfs and KVM can
> directly interact with them with newly introduced in-kernel interface,
> therefore remove the KVM userspace from the path of accessing/mmaping
> the guest memory.=20
>
> Kirill had a patch [2] to address the same issue in a different way. It
> tracks guest encrypted memory at the 'struct page' level and relies on
> HWPOISON to reject the userspace access. The patch has been discussed in
> several online and offline threads and resulted in a design document [3]
> which is also the original proposal for this series. Later this patch
> series evolved as more comments received in community but the major
> concepts in [3] still hold true so recommend reading.
>
> The patch series may also be useful for other usages, for example, pure
> software approach may use it to harden itself against unintentional
> access to guest memory. This series is designed with these usages in
> mind but doesn't have code directly support them and extension might be
> needed.

There are a couple of additional use cases where having a consistent
memory interface with the kernel would be useful.

  - Xen DomU guests providing other domains with VirtIO backends

  Xen by default doesn't give other domains special access to a domains
  memory. The guest can grant access to regions of its memory to other
  domains for this purpose.=20

  - pKVM on ARM

  Similar to Xen, pKVM moves the management of the page tables into the
  hypervisor and again doesn't allow those domains to share memory by
  default.

  - VirtIO loopback

  This allows for VirtIO devices for the host kernel to be serviced by
  backends running in userspace. Obviously the memory userspace is
  allowed to access is strictly limited to the buffers and queues
  because giving userspace unrestricted access to the host kernel would
  have consequences.

All of these VirtIO backends work with vhost-user which uses memfds to
pass references to guest memory from the VMM to the backend
implementation.

> mm change
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Introduces a new memfd_restricted system call which can create memory
> file that is restricted from userspace access via normal MMU operations
> like read(), write() or mmap() etc and the only way to use it is
> passing it to a third kernel module like KVM and relying on it to
> access the fd through the newly added restrictedmem kernel interface.
> The restrictedmem interface bridges the memory file subsystems
> (tmpfs/hugetlbfs etc) and their users (KVM in this case) and provides
> bi-directional communication between them.=20
>
>
> KVM change
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Extends the KVM memslot to provide guest private (encrypted) memory from
> a fd. With this extension, a single memslot can maintain both private
> memory through private fd (restricted_fd/restricted_offset) and shared
> (unencrypted) memory through userspace mmaped host virtual address
> (userspace_addr). For a particular guest page, the corresponding page in
> KVM memslot can be only either private or shared and only one of the
> shared/private parts of the memslot is visible to guest. For how this
> new extension is used in QEMU, please refer to kvm_set_phys_mem() in
> below TDX-enabled QEMU repo.
>
> Introduces new KVM_EXIT_MEMORY_FAULT exit to allow userspace to get the
> chance on decision-making for shared <-> private memory conversion. The
> exit can be an implicit conversion in KVM page fault handler or an
> explicit conversion from guest OS.
>
> Extends existing SEV ioctls KVM_MEMORY_ENCRYPT_{UN,}REG_REGION to
> convert a guest page between private <-> shared. The data maintained in
> these ioctls tells the truth whether a guest page is private or shared
> and this information will be used in KVM page fault handler to decide
> whether the private or the shared part of the memslot is visible to
> guest.
>
<snip>

--=20
Alex Benn=C3=A9e

