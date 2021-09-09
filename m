Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C29404377
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 04:19:10 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO9ee-0006UW-Tq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 22:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mO9du-0005pl-4N
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:18:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:38278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mO9dr-0003Wv-PJ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:18:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="242958582"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="242958582"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 19:18:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="479416032"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 08 Sep 2021 19:18:12 -0700
Date: Thu, 9 Sep 2021 10:04:19 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/7] bitops: Support 32 and 64 bit mask macro
Message-ID: <20210909020419.GA21362@yangzhon-Virtual>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-5-yang.zhong@intel.com>
 <92520c7c-0aaa-5776-b8b1-3dd97d3eb63d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92520c7c-0aaa-5776-b8b1-3dd97d3eb63d@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:34:39AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/8/21 10:19 AM, Yang Zhong wrote:
> > The Qemu should enable bit mask macro like Linux did in the
> > kernel, the GENMASK(h, l) and GENMASK_ULL(h, l) will set the
> > bit to 1 from l to h bit in the 32 bit or 64 bit long type.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  include/qemu/bitops.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> > index 03213ce952..04dec60670 100644
> > --- a/include/qemu/bitops.h
> > +++ b/include/qemu/bitops.h
> > @@ -18,6 +18,7 @@
> >  
> >  #define BITS_PER_BYTE           CHAR_BIT
> >  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
> > +#define BITS_PER_LONG_LONG       64
> >  
> >  #define BIT(nr)                 (1UL << (nr))
> >  #define BIT_ULL(nr)             (1ULL << (nr))
> > @@ -28,6 +29,12 @@
> >  #define MAKE_64BIT_MASK(shift, length) \
> >      (((~0ULL) >> (64 - (length))) << (shift))
> >  
> > +#define GENMASK(h, l) \
> > +    (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> > +
> > +#define GENMASK_ULL(h, l) \
> > +    (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
> 
> What is the difference with MAKE_64BIT_MASK()??

  Philippe, thanks for comments, i will use MAKE_64BIT_MASK() to replace
  GENMASK_ULL(), and at the same time, this patch will be dropped, thanks!

  Yang

