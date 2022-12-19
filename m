Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7B65084C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7B3G-0002rC-10; Mon, 19 Dec 2022 02:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B3C-0002qg-Kn
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:59:08 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B3B-0007yQ-0k
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671436745; x=1702972745;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LTCN5nc9sJT3ve1jNEbkwKdzxPjXUiJ2eqZmznP7zEs=;
 b=nYwXY/OMrqWWuhp+bPJ2/Fm8holbDFUKMT2yBtgR0tN1v8ffP9nlaM+s
 /OOuqfsWyQx/Y9NSyBDE3iCCXjivfNIcy0uZoSs7Jxm//H9/vkyDP+E9l
 HPG3tMarjq/1EXxValrbh8kRcpWt0i7OYyxTFVH3sr8CxrCpHLwzMV6JG
 DaBelH9f1NtFd0cXPpAvZwt3NsgFqrTv5QwQ6UihuBL0Gv4c+z6Zum5t4
 HCZV+XbxaYlDKW4LE0uwg74OjAaRis6zXn2RjHQ5OnDqdUsLKqpaKlxsU
 FqxStHy/phw1xPcHs2uswuvR/RNNgqokjfQnFa4hhSWjFPvN5cRVDwo3q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383638114"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383638114"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 23:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="895959169"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="895959169"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga006.fm.intel.com with ESMTP; 18 Dec 2022 23:58:49 -0800
Date: Mon, 19 Dec 2022 15:54:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jmattson@google.com" <jmattson@google.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "tabba@google.com" <tabba@google.com>, "Hocko, Michal" <mhocko@suse.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "vannapurve@google.com" <vannapurve@google.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "arnd@arndb.de" <arnd@arndb.de>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "qperret@google.com" <qperret@google.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "hughd@google.com" <hughd@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linmiaohe@huawei.com" <linmiaohe@huawei.com>,
 "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v10 6/9] KVM: Unmap existing mappings when change the
 memory attributes
Message-ID: <20221219075432.GC1691829@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-7-chao.p.peng@linux.intel.com>
 <0889bab999cbb464e63490bdb5b3c68c07791979.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0889bab999cbb464e63490bdb5b3c68c07791979.camel@intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 13, 2022 at 11:51:25PM +0000, Huang, Kai wrote:
> On Fri, 2022-12-02 at 14:13 +0800, Chao Peng wrote:
> >  
> > -	/* flags is currently not used. */
> > +	/* 'flags' is currently not used. */
> >  	if (attrs->flags)
> >  		return -EINVAL;
> 
> Unintended code change.

Yeah!

Chao

