Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B14392DD2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:19:34 +0200 (CEST)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmEz5-0003dI-Iy
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7744f0ff1=sidcha@amazon.de>)
 id 1lmEYS-0000cP-2j
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:52:00 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217]:15072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7744f0ff1=sidcha@amazon.de>)
 id 1lmEYB-00063G-Tb
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1622116304; x=1653652304;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=/b+CzBHyllLAb9T0raLjpOuY5FSoP8nR4EMXd2L8x8o=;
 b=tsDR46HI65W+GRzUaByFforKGys9iTS30qX08cb0yK19GxMfZxSuyZxC
 dKImXYN/n0bVbERTjm3jWjLhRtKMO4pTm/I4CWTe2oiaXKsyu1volp6W6
 nO7Q4/5juWSqgUCNNpyDZa5LEe+P1ZWEL/0ajfW95zCBEnK9tUNzSGv2U I=;
X-IronPort-AV: E=Sophos;i="5.82,334,1613433600"; 
   d="scan'208";a="3610143"
Subject: Re: Windows fails to boot after rebase to QEMU master
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 27 May 2021 11:51:26 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id E3D04A2133; Thu, 27 May 2021 11:51:23 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.97) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Thu, 27 May 2021 11:51:18 +0000
Date: Thu, 27 May 2021 13:51:14 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Claudio Fontana <cfontana@suse.de>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, <kvm@vger.kernel.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Message-ID: <20210527115113.GA4143@uc8bbc9586ea454.ant.amazon.com>
References: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
 <20210524055322-mutt-send-email-mst@kernel.org>
 <YK6hunkEnft6VJHz@work-vm>
 <d71fee00-0c21-c5e8-dbc6-00b7ace11c5a@suse.de>
 <YK9Y64U0wjU5K753@work-vm>
 <16a5085f-868b-7e1a-f6de-1dab16103a66@redhat.com>
 <YK9jOdCPUGQF4t0D@work-vm>
 <855c9f5c-a8e8-82b4-d71e-db9c966ddcc3@suse.de>
 <3b8f2f3b-0254-22c1-6391-44569c8ff821@suse.de>
 <d43ca6d9-d00c-6c2e-6838-36554de3fba5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d43ca6d9-d00c-6c2e-6838-36554de3fba5@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.161.97]
X-ClientProxiedBy: EX13D37UWC003.ant.amazon.com (10.43.162.183) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=7744f0ff1=sidcha@amazon.de; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Thu, May 27, 2021 at 01:36:37PM +0200, Claudio Fontana wrote:
> Just to check whether this is actually the issue we are talking about,
> Sid et al, could you try this?
> 
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index c496bfa1c2..810c46281b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4252,6 +4252,7 @@ static void max_x86_cpu_initfn(Object *obj)
>      object_property_set_str(OBJECT(cpu), "model-id",
>                              "QEMU TCG CPU version " QEMU_HW_VERSION,
>                              &error_abort);
> +    accel_cpu_instance_init(CPU(cpu));
>  }
> 
>  static const TypeInfo max_x86_cpu_type_info = {
> ------------------------------------------------------------------------------------------
> 
> Does this band-aid happen to cover-up the issue?

Yes it does fix the issue for me. Thanks.

~ Sid.

> I need to think about the proper fix though, any suggestions Paolo,
> Eduardo?
> 
> The pickle here is that we'd need to call the accelerator specific
> initialization of the x86 accel-cpu only after the x86 cpu subclass
> initfn, otherwise the accel-specific cpu initialization code has no
> chance to see the subclass (max) trying to set ->max_features.
> 
> C.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




