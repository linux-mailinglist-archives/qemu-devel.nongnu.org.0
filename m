Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87D6407B5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16AD-0007Ij-LU; Fri, 02 Dec 2022 08:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p169b-0007Ch-Fw
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:32:36 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p169N-0006v0-Lr
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669987941; x=1701523941;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEmy1c2bcyQx22F6dyR4ES4N7vulay3pIVGahBoVD0k=;
 b=HlpxoES55UcVtrUO87pkyATi3eOh4fvWFNXDt6Me48+JIDgm9NAhZOWl
 6qJJrc596tc6qrR0c1soo1xMTS/LcMDORxgGH1x2lVsLsGRKuXh5JKsHB
 otlviYpLnKmL59vIlPDl+yjPYrVPLJKT82hCO8Mf6pbyi+LDAkzLHOBIy
 PdDFDtAT5QeSApBI1y7ETUb/5N1bzR0DiNYw/m9I4ZjrxxNx2SiaL/DdP
 YmxAHXW6KN9pAjDqJJMfWRCvgeP14Po5xFB5BVLHQV2eBng1unIGB0msQ
 PM2E9MOpZndY48PBbVavW9RBOSz9PP9Gb7xQxj9BYr58tPrZ3v545+ybY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402233409"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402233409"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 05:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769606535"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="769606535"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 02 Dec 2022 05:32:01 -0800
Message-ID: <0022a85f16c1f1dc14decdc71f58af492b45b50d.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/3] KVM: keep track of running ioctls
From: Robert Hoo <robert.hu@linux.intel.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>, kvm@vger.kernel.org, David Hildenbrand
 <david@redhat.com>
Date: Fri, 02 Dec 2022 21:32:01 +0800
In-Reply-To: <22042ca5-9786-ca2b-3e3d-6443a744c5a9@redhat.com>
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-3-eesposit@redhat.com>
 <c7971c8ad3b4683e2b3036dd7524af1cb42e50e1.camel@linux.intel.com>
 <22042ca5-9786-ca2b-3e3d-6443a744c5a9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=robert.hu@linux.intel.com; helo=mga05.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2022-12-02 at 13:03 +0100, Emanuele Giuseppe Esposito wrote:
...
> > > @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type,
> > > ...)
> > >      va_end(ap);
> > >  
> > >      trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
> > > +    accel_cpu_ioctl_begin(cpu);
> > 
> > Does this mean that kvm_region_commit() can inhibit any other vcpus
> > doing any ioctls?
> 
> Yes, because we must prevent any vcpu from reading memslots while we
> are
> updating them.
> 
But do most other vm/vcpu ioctls contend with memslot operations?


