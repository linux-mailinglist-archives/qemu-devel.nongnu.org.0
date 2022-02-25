Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96924C3F57
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 08:52:16 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNVOg-0004AU-Fx
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 02:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNVLh-0003Dr-3J
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 02:49:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:42369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNVLd-0008CZ-Ie
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 02:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645775345; x=1677311345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kGAIdOvXzCC9nJnmWDtLLRhy35UwAbZL+8PEaqJ8BhQ=;
 b=D0//It1qSMOTmD7p0IoQ+o+N2A5qcbsTtW6Hsec06M5soqz7B9y2vVkd
 pKq81xSVOQlG0rX6ckf+z8V/CiVb/vg9S5RGuV35RCMhqIJaTB9UrUIvs
 rJc91UmtIT5tiXa6sbqE7RASKyU3D+DBUruQ9R9LiPbpk6XY+Xrxpd5OX
 na8g0iKAwSbtIpQRzOiYu8uFMZ/sulQ0BTWHYUD0SpxYNwJHkzbGZNpC3
 qxyQsV4bvPX1CuWG8ARysNF+Wx7uYrXgkPBHgdfFkut3N5xbKCcbCL6U3
 1p07LOAKZug5hYtVfy77Blhf+VspzLxiXuJFwxdLfRcl+KkgJYOvnHN2B A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239846106"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="239846106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 23:48:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="574520937"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 24 Feb 2022 23:48:54 -0800
Date: Fri, 25 Feb 2022 15:33:12 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 6/8] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Message-ID: <20220225073312.GB24485@yangzhon-Virtual>
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-7-yang.zhong@intel.com>
 <cunv8x8nyfy.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cunv8x8nyfy.fsf@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yang.zhong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 pbonzini@redhat.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 01:25:53PM +0000, David Edmondson wrote:
> On Wednesday, 2022-02-16 at 22:04:32 -08, Yang Zhong wrote:
> 
> > From: Jing Liu <jing2.liu@intel.com>
> >
> > When dynamic xfeatures (e.g. AMX) are used by the guest, the xsave
> > area would be larger than 4KB. KVM_GET_XSAVE2 and KVM_SET_XSAVE
> > under KVM_CAP_XSAVE2 works with a xsave buffer larger than 4KB.
> > Always use the new ioctls under KVM_CAP_XSAVE2 when KVM supports it.
> >
> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> > Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  target/i386/cpu.h          |  4 ++++
> >  target/i386/kvm/kvm.c      | 42 ++++++++++++++++++++++++--------------
> >  target/i386/xsave_helper.c | 33 ++++++++++++++++++++++++++++++
> >  3 files changed, 64 insertions(+), 15 deletions(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index f7fc2e97a6..de9da38e42 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1528,6 +1528,10 @@ typedef struct CPUX86State {
> >      uint64_t opmask_regs[NB_OPMASK_REGS];
> >      YMMReg zmmh_regs[CPU_NB_REGS];
> >      ZMMReg hi16_zmm_regs[CPU_NB_REGS];
> > +#ifdef TARGET_X86_64
> > +    uint8_t xtilecfg[64];
> > +    uint8_t xtiledata[8192];
> > +#endif
> 
> Can we have defined constants for these sizes? They also appear in patch
> 2.

  David, the constants we used here are mainly consistent with other members
  in this struct and file.  thanks!

  Yang

