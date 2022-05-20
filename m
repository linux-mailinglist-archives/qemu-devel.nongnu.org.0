Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33052E458
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 07:30:18 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrvDO-0003pm-3J
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 01:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1nrvAI-0002QO-Uv
 for qemu-devel@nongnu.org; Fri, 20 May 2022 01:27:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:43098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1nrvAG-0004WE-FH
 for qemu-devel@nongnu.org; Fri, 20 May 2022 01:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653024424; x=1684560424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cI9uGBjhJtWFGhhOy8Mi22BCW4I7JOWQiAbMT6V9JNg=;
 b=kFREKulpCmvKs7Vu6jX4NQcNIbXfcibOnmRgjm57uK0cZLjp+wcUES2r
 YYOYiykbZanoxICbfYO3WbprHjPyKQf1kJiDNxB3oSIXiD1C/BhwSrHGo
 DLbW174b79OeHh7Tojz7CjizrT4JUAbm8iebvNfbNy8T7e6x7mbhEYFKT
 SfQq1MhRSfQbLO7Omw10x6bxrth9SJR2nTO1i1QfXkFjMGBGcX7Ueawgm
 lEL4PqGtqRH1f1a9Ko7WNdeKL3lYGeEZ67/JCTHXr7WLdrwMI1C6hSYhn
 P1SUQjPW2ClM7eQlQ+dDqEH99+V0J7dAIrDT2P5Fj8snXVNlr5iFKC62g A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="253010187"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="253010187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 22:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="599018451"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 22:26:58 -0700
Date: Fri, 20 May 2022 13:26:49 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Cc: qemu-devel@nongnu.org, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 mst@redhat.com, "Grimm, Jon" <jon.grimm@amd.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Roth, Michael" <Michael.Roth@amd.com>, Wei Huang <wei.huang2@amd.com>
Subject: Re: [RFC] KVM / QEMU: Introduce Interface for Querying APICv Info
Message-ID: <20220520052644.GA15937@gao-cwp>
References: <7e0d22fa-b9b0-ad1a-3a37-a450ec5d73e8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0d22fa-b9b0-ad1a-3a37-a450ec5d73e8@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chao.gao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 20, 2022 at 10:30:40AM +0700, Suthikulpanit, Suravee wrote:
>Hi All,
>
>Currently, we don't have a good way to check whether APICV is active on a VM.
>Normally, For AMD SVM AVIC, users either have to check for trace point, or using
>"perf kvm stat live" to catch AVIC-related #VMEXIT.
>
>For KVM, I would like to propose introducing a new IOCTL interface (i.e. KVM_GET_APICV_INFO),
>where user-space tools (e.g. QEMU monitor) can query run-time information of APICv for VM and vCPUs
>such as APICv inhibit reason flags.
>
>For QEMU, we can leverage the "info lapic" command, and append the APICV information after
>all LAPIC register information:
>
>For example:
>
>----- Begin Snippet -----
>(qemu) info lapic 0
>dumping local APIC state for CPU 0
>
>LVT0     0x00010700 active-hi edge  masked                      ExtINT (vec 0)
>LVT1     0x00000400 active-hi edge                              NMI
>LVTPC    0x00010000 active-hi edge  masked                      Fixed  (vec 0)
>LVTERR   0x000000fe active-hi edge                              Fixed  (vec 254)
>LVTTHMR  0x00010000 active-hi edge  masked                      Fixed  (vec 0)
>LVTT     0x000400ee active-hi edge                 tsc-deadline Fixed  (vec 238)
>Timer    DCR=0x0 (divide by 2) initial_count = 0 current_count = 0
>SPIV     0x000001ff APIC enabled, focus=off, spurious vec 255
>ICR      0x000000fd physical edge de-assert no-shorthand
>ICR2     0x00000005 cpu 5 (X2APIC ID)
>ESR      0x00000000
>ISR      (none)
>IRR      (none)
>
>APR 0x00 TPR 0x00 DFR 0x0f LDR 0x00PPR 0x00
>
>APICV   vm inhibit: 0x10 <-- HERE
>APICV vcpu inhibit: 0 <-- HERE
>
>------ End Snippet ------
>
>Otherwise, we can have APICv-specific info command (e.g. info apicv).

I think this information can be added to kvm per-vm/vcpu debugfs. Then no
qemu change is needed.

