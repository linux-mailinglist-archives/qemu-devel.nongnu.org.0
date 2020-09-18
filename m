Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5CA2708E5
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 00:22:02 +0200 (CEST)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJOlV-0005zf-A0
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 18:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJOkT-0005Px-8r
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 18:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJOkP-0000Ox-3m
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 18:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600467651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SIQtXAOsqtM1oR4TaQIH/rJT9lHX2iWTxjKAODYSNDk=;
 b=bQYXesedVeL84cl2d8EznyW11UXiM/mS6LpbnROhZXwUmzrHgFxZhXUTwKD98Fkx4DtHwv
 0t3k/z50mnjxKNiU35dcb0+NJYrN6kloGHZSSzHIblCJevBr6sC4aSFdIClUhHguegQYF6
 LUazl0o3PfNKgWxX9xVaL+ZajmZ76Ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-GIJgSdXhOFSi3TC435yf-w-1; Fri, 18 Sep 2020 18:20:49 -0400
X-MC-Unique: GIJgSdXhOFSi3TC435yf-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B197188C12D;
 Fri, 18 Sep 2020 22:20:48 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF75873677;
 Fri, 18 Sep 2020 22:20:47 +0000 (UTC)
Date: Fri, 18 Sep 2020 18:20:46 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Qemu-devel] [PATCH] i386/kvm: fix FEATURE_HYPERV_EDX value in
 hyperv_passthrough case
Message-ID: <20200918222046.GF57321@habkost.net>
References: <20190820103030.12515-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190820103030.12515-1-zhenyuw@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 06:30:30PM +0800, Zhenyu Wang wrote:
> Fix typo to use correct edx value for FEATURE_HYPERV_EDX when
> hyperv_passthrough is enabled.
> 
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>

CCing other maintainers (please use ./scripts/get_maintainer.pl
to make sure maintainers don't miss patches).

Queued, thanks!

> ---
>  target/i386/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 2abc881324..101229bce4 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1152,7 +1152,7 @@ static int hyperv_handle_properties(CPUState *cs,
>          if (c) {
>              env->features[FEAT_HYPERV_EAX] = c->eax;
>              env->features[FEAT_HYPERV_EBX] = c->ebx;
> -            env->features[FEAT_HYPERV_EDX] = c->eax;
> +            env->features[FEAT_HYPERV_EDX] = c->edx;
>          }
>          c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
>          if (c) {
> -- 
> 2.20.1
> 
> 

-- 
Eduardo


