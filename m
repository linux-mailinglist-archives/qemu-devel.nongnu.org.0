Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7043B4F806F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:24:03 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncS7F-0005VB-Uw
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncS4g-0004fd-Q8
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:21:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:12469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncS4e-0006va-5Z
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649337680; x=1680873680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r9SfYykrOTwk5eu+Z6K0Oe6zbG72XLpPQQlrv0B2u50=;
 b=dxb9/GXLg7MZ7vIi2qwGyujPwRb7DEz/tae+y++ST0NyKKuLr/3Y7DrE
 XPLwmQe07TxW9tEgYOdGipQ+c5IPLf///R2PZNMSD4mAagjCA6azp5+td
 VXVBWucUY6bRU/L6aqikZjfZr3fiwK90D4CsBhB4odXFMhRiaaviSL3gm
 SUuA7NyaBhyjmkQ2J9rf/NIEUToQbVvk4GKZQfGnOLqfenJNvwUCfoTzV
 UNfiRPKZLlG4lmaEYMmpZrXD6IGyh6ol1q9Ecwt7bh/qcXbi598/7yHST
 hFL1wdzQ+1a9p3ocFWhk1ttsTmSepNkkH23v2kxFHP8YsFAcUr3IP4bME A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10309"; a="243452463"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="243452463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 06:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="792664466"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2022 06:21:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 2974A179; Thu,  7 Apr 2022 16:18:43 +0300 (EEST)
Date: Thu, 7 Apr 2022 16:18:43 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Message-ID: <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 06, 2022 at 10:34:41PM -0500, Richard Henderson wrote:
> On 4/6/22 20:01, Kirill A. Shutemov wrote:
> > Linear Address Masking feature makes CPU ignore some bits of the virtual
> > address. These bits can be used to encode metadata.
> > 
> > The feature is enumerated with CPUID.(EAX=07H, ECX=01H):EAX.LAM[bit 26].
> > 
> > CR3.LAM_U57[bit 62] allows to encode 6 bits of metadata in bits 62:57 of
> > user pointers.
> > 
> > CR3.LAM_U48[bit 61] allows to encode 15 bits of metadata in bits 62:48
> > of user pointers.
> > 
> > CR4.LAM_SUP[bit 28] allows to encode metadata of supervisor pointers.
> > If 5-level paging is in use, 6 bits of metadata can be encoded in 62:57.
> > For 4-level paging, 15 bits of metadata can be encoded in bits 62:48.
> > 
> > QEMU strips address from the metadata bits and gets it to canonical
> > shape before handling memory access. It has to be done very early before
> > TLB lookup.
> 
> The new hook is incorrect, in that it doesn't apply to addresses along
> the tlb fast path.

I'm not sure what you mean by that. tlb_hit() mechanics works. We strip
the tag bits before tlb lookup.

Could you elaborate?

> But it isn't really needed.  You can do all of the work in the existing
> tlb_fill hook. AArch64 has a similar feature, and that works fine.

To be honest I don't fully understand how TBI emulation works.

Consider store_helper(). I failed to find where tag bits get stripped
before getting there for !CONFIG_USER_ONLY. clean_data_tbi() only covers
user-only case.

And if we get there with tags, I don't see how we will ever get to fast
path: tlb_hit() should never return true there if any bit in top byte is
set as cached tlb_addr has them stripped.

tlb_fill() will get it handled correctly, but it is wasteful to go through
pagewalk on every tagged pointer dereference.

Hm?

-- 
 Kirill A. Shutemov

