Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243EB369C0A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:29:13 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3MO-0001uR-8f
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1la3L5-0001TS-8T
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1la3L3-00033S-Lb
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619213268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7BvSr21XQgqMH9Pqs8lMn1NquEI5fhtxmGMoamdbFsc=;
 b=XmLf73toRmsGRmNy4w0NU46ZGtHv5IrDUc+etsEYQ77G40cashYqus4xpy0xDYbKgMaVSi
 5k9H85HLeDyhWrOl79Kmksr0AvgQ382rIWiBagI+Z+wg0b0HbkZS5I7jZgGHulwfk1wZ5n
 kMp1TjDGO9h5b/XB8jWk0UU/inpI1LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-J3CwzHATPRqekIQGa6m5gQ-1; Fri, 23 Apr 2021 17:27:46 -0400
X-MC-Unique: J3CwzHATPRqekIQGa6m5gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 906C98030C4;
 Fri, 23 Apr 2021 21:27:45 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E4360BD8;
 Fri, 23 Apr 2021 21:27:45 +0000 (UTC)
Date: Fri, 23 Apr 2021 17:27:44 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wei Huang <wei.huang2@amd.com>
Subject: Re: constant_tsc support for SVM guest
Message-ID: <20210423212744.4urvjdirnqdvqcq5@habkost.net>
References: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
MIME-Version: 1.0
In-Reply-To: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, "Moger, Babu" <babu.moger@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 12:32:00AM -0500, Wei Huang wrote:
> There was a customer request for const_tsc support on AMD guests. Right now
> this feature is turned off by default for QEMU x86 CPU types (in
> CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest VM
> behavior between Intel and AMD.
> 
> In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based on
> vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and guest VMs
> have const_tsc enabled. On AMD, however, the kernel checks
> CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.

Oh.  This seems to defeat the purpose of the invtsc migration
blocker we have.

Do we know when this behavior was introduced in Linux?

> 
> I am thinking turning on invtsc for EPYC CPU types (see example below). Most
> AMD server CPUs have supported invariant TSC for a long time. So this change
> is compatible with the hardware behavior. The only problem is live migration
> support, which will be blocked because of invtsc. However this problem
> should be considered very minor because most server CPUs support TscRateMsr
> (see CPUID_Fn8000000A_EDX[4]), allowing VMs to migrate among CPUs with
> different TSC rates. This live migration restriction can be lifted as long
> as the destination supports TscRateMsr or has the same frequency as the
> source (QEMU/libvirt do it).
> 
> [BTW I believe this migration limitation might be unnecessary because it is
> apparently OK for Intel guests to ignore invtsc while claiming const_tsc.
> Have anyone reported issues?]

CCing Marcelo, who originally added the migration blocker in QEMU.

> 
> Do I miss anything here? Any comments about the proposal?
> 
> Thanks,
> -Wei
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7..3c48266884 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4077,6 +4076,21 @@ static X86CPUDefinition builtin_x86_defs[] = {
>                      { /* end of list */ }
>                  }
>              },
> +            {
> +                .version = 4,
> +                .alias = "EPYC-IBPB",
> +                .props = (PropValue[]) {
> +                    { "ibpb", "on" },
> +                    { "perfctr-core", "on" },
> +                    { "clzero", "on" },
> +                    { "xsaveerptr", "on" },
> +                    { "xsaves", "on" },

You don't need to copy the properties from the previous version.
The properties of version N are applied on top of the properties
of version (N-1).

> +                    { "invtsc", "on" },
> +                    { "model-id",
> +                      "AMD EPYC Processor" },
> +                    { /* end of list */ }
> +                }
> +            },
>              { /* end of list */ }
>          }
>      },
> @@ -4189,6 +4203,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
>                      { /* end of list */ }
>                  }
>              },
> +            {
> +                .version = 3,
> +                .props = (PropValue[]) {
> +                    { "ibrs", "on" },
> +                    { "amd-ssbd", "on" },
> +                    { "invtsc", "on" },
> +                    { /* end of list */ }
> +                }
> +            },
>              { /* end of list */ }
>          }
>      },
> @@ -4246,6 +4269,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .xlevel = 0x8000001E,
>          .model_id = "AMD EPYC-Milan Processor",
>          .cache_info = &epyc_milan_cache_info,
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            {
> +                .version = 2,
> +                .props = (PropValue[]) {
> +                    { "invtsc", "on" },
> +                    { /* end of list */ }
> +                }
> +            },
> +            { /* end of list */ }
> +        }
> 

-- 
Eduardo


