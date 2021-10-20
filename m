Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0229434E29
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:43:46 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCoj-0006GN-T1
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdCm6-0003Qx-Ge
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdCm4-0002jW-UD
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634740859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2fhDMB3hp5MjVtJ7La/4se6O33rXfLMQPnJJveRDZk=;
 b=dxgsurRVoDiHLZf6+KRcODDYHiG9ss2gxy44UgJOeFUlvARdym81QcvYc3wNiL0n5Qv9o/
 ZEviNuslT2qZXKIclO862siFKGFoXAEj1ACHtrnvGvF8PcjEresGSvQrcgVEF+09KHrR07
 mMSK+q6BQzB0xA+gfOCten8VVYVxVVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-1LYywBdFOKmAZBpKg2Kc2A-1; Wed, 20 Oct 2021 10:40:58 -0400
X-MC-Unique: 1LYywBdFOKmAZBpKg2Kc2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC2E1180831B;
 Wed, 20 Oct 2021 14:40:57 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86CF219D9B;
 Wed, 20 Oct 2021 14:40:57 +0000 (UTC)
Date: Wed, 20 Oct 2021 10:40:56 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH 3/5] target/i386: Enable host pass through of Intel PT
Message-ID: <20211020144056.5ot6gubmrbbqft32@habkost.net>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-4-xiaoyao.li@intel.com>
 <20211015202220.ghdn6gsdfuh56xq7@habkost.net>
 <ebd46603-d3dc-c7ba-1ab7-40d7881b83ed@intel.com>
 <373a40f3-2ba4-fecd-f4ce-1a5ebbc3c138@intel.com>
MIME-Version: 1.0
In-Reply-To: <373a40f3-2ba4-fecd-f4ce-1a5ebbc3c138@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 01:37:12PM +0800, Xiaoyao Li wrote:
> On 10/18/2021 11:46 AM, Xiaoyao Li wrote:
> > On 10/16/2021 4:22 AM, Eduardo Habkost wrote:
> > > On Thu, Sep 09, 2021 at 10:41:48PM +0800, Xiaoyao Li wrote:
[...]
> > > > +#define INTEL_PT_DEFAULT_0_EBX  (CPUID_14_0_EBX_CR3_FILTER | \
> > > > +            CPUID_14_0_EBX_PSB | CPUID_14_0_EBX_IP_FILTER |
> > > > CPUID_14_0_EBX_MTC)
> > > > +#define INTEL_PT_DEFAULT_0_ECX  (CPUID_14_0_ECX_TOPA | \
> > > > +            CPUID_14_0_ECX_MULTI_ENTRIES | CPUID_14_0_ECX_SINGLE_RANGE)
> > > > +#define INTEL_PT_DEFAULT_1_EAX  (INTEL_PT_DEFAULT_MTC_BITMAP << 16 | \
> > > > +                                 INTEL_PT_DEFAULT_ADDR_RANGES_NUM)
> > > > +#define INTEL_PT_DEFAULT_1_EBX  (INTEL_PT_DEFAULT_PSB_BITMAP << 16 | \
> > > > +                                 INTEL_PT_DEFAULT_CYCLE_BITMAP)
> > > 
> > > I like these new macros because they make the code at
> > > x86_cpu_filter_features() clearer.
> 
> I tried it. But I find it doesn't make the code at x86_cpu_filter_features()
> clearer. It just introduces more code churn.

Don't worry, this is not a requirement for getting the code
accepted, but just a suggestion to make the more complex parts of
the series smaller and easier to review.

-- 
Eduardo


