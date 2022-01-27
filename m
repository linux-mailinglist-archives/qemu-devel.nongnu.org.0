Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243449E46F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:16:59 +0100 (CET)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5a6-0008Td-JA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:16:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5U3-0002DZ-2A
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:43 -0500
Received: from mga03.intel.com ([134.134.136.65]:54144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5To-0001e8-QM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643292628; x=1674828628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Hp8b8jp6Jkr7RFbYzw2rWQY2UWZf9Hnr1KJu1j5kvQ=;
 b=G2uj/GyPsopPxHA1NhiXnps9Tm7/AJti+Vki2CXcTUl6MA5G7yTwLGi3
 200O3oBJijpoRjy1cPNIOJqwyYFLHywUWegndjgaMWpF03yc0iTWz3Ab7
 sHgg2uZW2EmYR3kyEx+7BdLn+zk1Fsh4r4a8tp6TpKRw5cT/+h44oRoka
 +MzvQeyTYa1f5jm1VNckk+7OwQR0OIaQxat6mYn9oyAGZEs8G/0vZQN3U
 9jqtkzLSgClqGi92EMAM31BZiNF3shFOnspaXgy0bC7+tuVbNiHeu+VIH
 9BCJMgX5oQig/VOL8hl0plrvhh51cRwuJsLdJ9O74TM0qO6EaGX1y0G9b g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246800224"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="246800224"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 06:03:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="696653965"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Jan 2022 06:03:18 -0800
Date: Thu, 27 Jan 2022 21:47:56 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 6/7] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Message-ID: <20220127134756.GC8954@yangzhon-Virtual>
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-7-yang.zhong@intel.com>
 <e4ee8710-acdb-62ad-0273-f7ad44ac0c5c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ee8710-acdb-62ad-0273-f7ad44ac0c5c@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 11:15:25AM +0100, Paolo Bonzini wrote:
> On 1/24/22 08:55, Yang Zhong wrote:
> >
> >+    if (buflen > sizeof(struct kvm_xsave)) {
> >+        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> >+
> >+        if (e->size && e->offset) {
> >+            const XSaveXTILEDATA *tiledata = buf + e->offset;
> >+
> >+            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
> >+        }
> >+    }
> 
> Slightly nicer:
> 
>     e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
>     if (e->size && e->offset && buflen >= e->size + e->offset) {
>         ...
>     }
> 
> Same for xsave.

     Thanks Paolo, new version will change this.

     Yang
> 
> Paolo

