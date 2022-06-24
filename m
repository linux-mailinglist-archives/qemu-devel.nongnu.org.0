Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13462559247
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 07:38:24 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4c1O-0003Sq-NN
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 01:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4byJ-0002cp-R9
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 01:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4byF-0001J5-Lk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 01:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656048906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZJgM10lZz9x5V4uProo0aIcuMBB9U5Ul2SRKo0Xips=;
 b=Ng49lOPox5RUnsiJbX1rmmXNiS70a4ATdjSS86ZYY94lfXLXrVCqM0hwCoh+hbXXdpYVwK
 xWC3rf4lK4LiU3vs5Q8cZRTFoB6GNasS4qG0Ancefsv09GCOyOEE1NWuo7KFxKjAHtf230
 33BmRsCa9XStnbStdmKr8z2gQZhfzus=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-qWGJRdknN0KlwUHWQFOIzg-1; Fri, 24 Jun 2022 01:35:02 -0400
X-MC-Unique: qWGJRdknN0KlwUHWQFOIzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 605E8801E67;
 Fri, 24 Jun 2022 05:35:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 170332166B26;
 Fri, 24 Jun 2022 05:35:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCC3821E690D; Fri, 24 Jun 2022 07:35:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yuan Yao <yuan.yao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Yang
 Zhong <yang.zhong@intel.com>,  Connor Kuehl <ckuehl@redhat.com>,
 qemu-devel@nongnu.org,  Yamahata Isaku <isaku.yamahata@intel.com>
Subject: Re: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
References: <20220609083456.77946-1-yuan.yao@intel.com>
Date: Fri, 24 Jun 2022 07:35:00 +0200
In-Reply-To: <20220609083456.77946-1-yuan.yao@intel.com> (Yuan Yao's message
 of "Thu, 9 Jun 2022 16:34:56 +0800")
Message-ID: <87czeyd3p7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuan Yao <yuan.yao@intel.com> writes:

> Don't skip next leve page table for pdpe/pde when the

level

> PG_PRESENT_MASK is set.
>
> This fixs the issue that no mapping information was

fixes

> collected from "info mem" for guest with LA57 enabled.
>
> Signed-off-by: Yuan Yao <yuan.yao@intel.com>

Should we add

  Fixes: 6c7c3c21f95dd9af8a0691c0dd29b07247984122

?

> ---
>  target/i386/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 8e4b4d600c..3339550bbe 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -489,7 +489,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
>                  cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
>                  pdpe = le64_to_cpu(pdpe);
>                  end = (l0 << 48) + (l1 << 39) + (l2 << 30);
> -                if (pdpe & PG_PRESENT_MASK) {
> +                if (!(pdpe & PG_PRESENT_MASK)) {
>                      prot = 0;
>                      mem_print(mon, env, &start, &last_prot, end, prot);
>                      continue;
> @@ -508,7 +508,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
>                      cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
>                      pde = le64_to_cpu(pde);
>                      end = (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 << 21);
> -                    if (pde & PG_PRESENT_MASK) {
> +                    if (!(pde & PG_PRESENT_MASK)) {
>                          prot = 0;
>                          mem_print(mon, env, &start, &last_prot, end, prot);
>                          continue;
>
> base-commit: 6d940eff4734bcb40b1a25f62d7cec5a396f994a

The commit message talks about not skipping something when the flag is
set.  However, the patch *flips* the sense of conditions, which means
were *also* changing behavior when the flag is unset.  How?


