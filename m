Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2454F869F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 19:51:24 +0200 (CEST)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncWHz-0007Xr-5G
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 13:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncWDM-0005yH-VZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:46:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:61394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncWDJ-0001ro-Pv
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649353593; x=1680889593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3YBX5s+lR3dFQOhKmexGSCvvGRUGyMACrBo/2GriCcI=;
 b=gUbYYJ5BUDKGGmWolkourBKyeDeSP7Z9YcAiFRIrjUw2zr10eVU7i1mv
 FhIKlxo/psGOJqFyb18WY4bpi8XRAv/RsEZ/sfbPFWfttieugk0z8hjvm
 dptLbkeIGp4lmHDoSUfeUfvrw++6MaCK7MIism+ViUG+qKxhdjaVF+6BO
 hfDLh6Y3Jlca9EO2/bP2K0NckQ2/CUMBmQ6lcRCuyk7OpnpLi3xZ9DxQJ
 5XA6zLZrLRX/ZBv5+XhBlzu/ChHt7HDSq/85hv+AYOBNSdh8aiFpd038X
 QVFmnCwfIYIVnnA2dcgpH3TIe9DTVsJIhFhXaPFcMbb4Skp9L/2DmSgxo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260229781"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="260229781"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 10:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="793029268"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2022 10:46:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id BD493132; Thu,  7 Apr 2022 20:44:10 +0300 (EEST)
Date: Thu, 7 Apr 2022 20:44:10 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Message-ID: <20220407174410.lhmi3p3simo3n3tx@black.fi.intel.com>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
 <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
 <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
 <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
 <d6455021-2522-c4e0-8c5a-b7852ec0d967@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6455021-2522-c4e0-8c5a-b7852ec0d967@redhat.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 06:38:40PM +0200, Paolo Bonzini wrote:
> On 4/7/22 17:27, Kirill A. Shutemov wrote:
> > On Thu, Apr 07, 2022 at 07:28:54AM -0700, Richard Henderson wrote:
> > > On 4/7/22 06:18, Kirill A. Shutemov wrote:
> > > > > The new hook is incorrect, in that it doesn't apply to addresses along
> > > > > the tlb fast path.
> > > > 
> > > > I'm not sure what you mean by that. tlb_hit() mechanics works. We strip
> > > > the tag bits before tlb lookup.
> > > > 
> > > > Could you elaborate?
> > > 
> > > The fast path does not clear the bits, so you enter the slow path before you
> > > get to clearing the bits.  You've lost most of the advantage of the tlb
> > > already.
> > 
> > Sorry for my ignorance, but what do you mean by fast path here?
> 
> The fast path is the TLB lookup code that is generated by the JIT compiler.
> If the TLB hits, the memory access doesn't go through any C code.  I think
> tagged addresses always fail the fast path in your patch.

Ah. Got it.

Could you point me to the key code area relevant to the topic? I'm not
familiar with the JIT side of QEMU.

-- 
 Kirill A. Shutemov

