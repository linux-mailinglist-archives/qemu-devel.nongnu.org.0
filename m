Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11956586D21
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:42:59 +0200 (CEST)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWdF-0005dG-Uu
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.hansen@intel.com>)
 id 1oIWbD-0003cN-L3
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:40:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:17474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.hansen@intel.com>)
 id 1oIWb3-0005xm-Tc
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659364841; x=1690900841;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fpTxLnSKdCefwrmog3N//MC/2iEi6i+ELgFRyAQC2bY=;
 b=FuKlVsCbcfuRz4QVhx0Ib9YKu1F7jyhu0bNvZupu+5mKOrhdARj0bDdA
 AKCBZeVSPPjubusL5dAE7nafMldq/dAKyvSaEIlo3KJAG96z5b7mrh3Rp
 YiUeamt7CX7nmPXJqzv2/fzv8GkQw18WUF4jnF1hX1bfPHWfMuoETRXdJ
 /p6xqTQnso3avT7rAw8BDyuH2rdhqm9MwFrWIh5A3WcZ/TXSdbD/TmgiP
 +thwTrljoiX0iIJpwz+/dT2r06XdXc572+mKOUIf4Iq+5nkG3Yws5jO9R
 5xAtW/+RJ9g1KY6nQUH+sihHSguv2muBc76DzlXorAGZvzt5YC+FnuYim g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="268924868"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="268924868"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 07:40:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="744281754"
Received: from cdthomas-mobl2.amr.corp.intel.com (HELO [10.209.57.155])
 ([10.209.57.155])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 07:40:32 -0700
Message-ID: <dc878e6c-c1d2-c291-00ef-11cff6cb03ec@intel.com>
Date: Mon, 1 Aug 2022 07:40:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 14/14] memfd_create.2: Describe MFD_INACCESSIBLE flag
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, ak@linux.intel.com, david@redhat.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-15-chao.p.peng@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220706082016.2603916-15-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dave.hansen@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch does not belong in this series.  It's not a patch to the
kernel.  This is a kernel series.

It would be much more appropriate to put a link to a separately posted
manpage patch in the cover letter.

