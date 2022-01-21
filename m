Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE340495CE7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:34:59 +0100 (CET)
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqJu-0000RZ-F2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoOM-0000QG-BG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:31:29 -0500
Received: from mga02.intel.com ([134.134.136.20]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoOF-0001p7-TD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750279; x=1674286279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EN+vHdqdMk+B5zlKqQjm4A28vsXK2zdU6wW6ORx/3zU=;
 b=kYsb4EseU829PmOFAJ3bhrAH2vToieK1acZNlT3vaBEjTTuNWQKD6ymj
 jCBeosVuBGMVHeodv7pGIfYDSeBlHsdTm4jTM91MFjfdffVd1wL1Lxyz2
 JFHCv32sJkNP/W+M4pUOU845uWfWXK3xI2wPto+gE49pIgjgDDe54hGfL
 gYGdecYN5QOpq06FsV8b3CVaqkL9rLUZdhIxvRV+IRXlrUqylalgZHLk+
 XCgJsB4NoKnnR3mshW3sbUw9ChlMt/YI4jPr5AZMsAb7vjKwfQZar/ubV
 ZK0Lf7xYaS3rlndtC7JOiKJRqq9IPgSoJIOVCdfF/ff/QT/XA9Q4zGXaW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232948021"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="232948021"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:31:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533167565"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 23:31:07 -0800
Date: Fri, 21 Jan 2022 15:15:48 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Message-ID: <20220121071548.GB29921@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-3-yang.zhong@intel.com>
 <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
 <6941a519-3a26-e57c-5582-7238da90d263@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6941a519-3a26-e57c-5582-7238da90d263@redhat.com>
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
Cc: yang.zhong@intel.com, "Tian, Kevin" <kevin.tian@intel.com>, "Christopherson,
 , Sean" <seanjc@google.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Wei W" <wei.w.wang@intel.com>, "Zeng, Guang" <guang.zeng@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 01:39:59PM +0100, Paolo Bonzini wrote:
> On 1/10/22 09:23, Tian, Kevin wrote:
> >>
> >>AMX XTILECFG and XTILEDATA are managed by XSAVE feature
> >>set. State component 17 is used for 64-byte TILECFG register
> >>(XTILECFG state) and component 18 is used for 8192 bytes
> >>of tile data (XTILEDATA state).
> >to be consistent, "tile data" -> "TILEDATA"
> >
> 
> Previous sentences use "XTILECFG" / "XTILEDATA", not "TILEDATA".
> 
> So I would say:
> 
> The AMX TILECFG register and the TMMx tile data registers are
> saved/restored via XSAVE, respectively in state component 17 (64
> bytes) and state component 18 (8192 bytes).
>

  Thanks Paolo, I will update this in new version.
  Yang
 
> Paolo

