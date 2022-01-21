Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A3495CFE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:41:16 +0100 (CET)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqPz-0005dR-AG
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoQP-0000pr-LQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:33:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:54674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoQN-0002Pl-C7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750411; x=1674286411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t/LMOmGNj51QHSx3F4yOV0skCSb0gs41w7Z769780i8=;
 b=FlDG5vEKiRJLNM8uSbAlJXUZ172Yx/w+VArtKdq3zN1oVL2m4PaZ7HVB
 CVnBVRL4OE5X1fNqkS9zGk3oGjf5EjlLYpY/F7LAwIDJY9KhYkDbPIT9J
 K92rjxO76kxL5sdUXoMkMb4Z/FK9BABbDKdI6TC3B2YKR7DBq/2UCWfIp
 /FM9Q5dQoT6UU+WrPQ7uc1c7mO62hnw7nwfNjcK5O+3jsn5jyxp0vwEsk
 bZhFXnF7oRHWjpdeUiNkdbTga0eccHvWdGDdQh/R3pNjE8iCuhip303YN
 smWmGVrxAstEDFh9R+qqXpDys3NM0LtOS2OXYpmxxnLXNOM3gWCxE/ISI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232948493"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="232948493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:33:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="478151386"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 23:33:26 -0800
Date: Fri, 21 Jan 2022 15:18:07 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Message-ID: <20220121071807.GC29921@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-5-yang.zhong@intel.com>
 <c494456b-42a7-d591-02e0-dbdeecf2c36b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c494456b-42a7-d591-02e0-dbdeecf2c36b@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yang.zhong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jan 18, 2022 at 01:52:51PM +0100, Paolo Bonzini wrote:
> On 1/7/22 10:31, Yang Zhong wrote:
> >-    uint32_t need_align;
> >+    uint32_t need_align, support_xfd;
> 
> These can be replaced by a single field "uint32_t ecx".
> 
> You can add also macros like
> 
> #define ESA_FEATURE_ALIGN64_BIT	(1)
> #define ESA_FEATURE_XFD_BIT	(2)
> 
> to simplify access.
  
  Thanks Paolo, this is a more simplified solution, thanks!

  Yang
 
> Paolo

