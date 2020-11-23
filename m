Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF432C12FC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:22:51 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGUE-0001jF-Uf
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khGSN-0000UY-W5
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khGSK-000307-7k
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606155649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JWkqEhuHoQW3rZOr8MWgwicB9xTuDmx1fnCrO+YDtRY=;
 b=ew2+DT4l4vyOfDLF792wsHLu7uFjLhU+xNi3+YPROd6qHVxpMg97ZgMRzwHs622rDY02hl
 i94uyM6gm1zv7D5KxsvCHW5vxLd+reUtD7WBPDUGaoE/XLC95qdmUW2Eg9aSBLZRHajN3S
 dPJwGKNgsSQVRa4qsD1fmgQ1gFF25uM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-7qLtnRkrNymJx6eez6pfUQ-1; Mon, 23 Nov 2020 13:20:46 -0500
X-MC-Unique: 7qLtnRkrNymJx6eez6pfUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34EF410151E7;
 Mon, 23 Nov 2020 18:20:44 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC07360C61;
 Mon, 23 Nov 2020 18:20:39 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:20:38 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201123182038.GI2271382@habkost.net>
References: <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
 <20201118220750.GP1509407@habkost.net>
 <2984625a-15ee-f638-b1bb-050a4514bade@suse.de>
 <20201120171942.GA2271382@habkost.net>
 <f780a9e5-2142-3bf4-b3fb-1bdeeed61945@suse.de>
 <20201120180936.GD2271382@habkost.net>
 <a32dbea4-8381-d247-3443-441b484d39e3@suse.de>
 <3e8fac27-aea5-5f5d-5421-291df660a586@suse.de>
 <bd5d6bd7-a4a0-9f38-94ca-14f39e538e70@redhat.com>
 <de219743-6605-8514-b54d-9e70f24a09c8@suse.de>
MIME-Version: 1.0
In-Reply-To: <de219743-6605-8514-b54d-9e70f24a09c8@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 23, 2020 at 04:02:24PM +0100, Claudio Fontana wrote:
> On 11/23/20 2:18 PM, Paolo Bonzini wrote:
> > On 23/11/20 10:55, Claudio Fontana wrote:
> >> One idea that came to mind is, why not extend accel.h to user mode?
> >>
> >> It already contains
> >>
> >> #ifndef CONFIG_USER_ONLY
> >>
> >> parts, so maybe it was meant to be used by both, and just happened to
> >> end up confined to include/softmmu ?
> >>
> >> Basically I was thinking, we could have an AccelState and an
> >> AccelClass for user mode as well (without bringing in the whole
> >> machine thing), and from there we could use current_accel() to build
> >> up the right name for the chosen accelerator?
> > 
> > Yes, extending the accelerator class to usermode emulation is certainly 
> > a good idea.
> > 
> > Paolo
> > 
> 
> Thanks, I'll work on this option.
> 
> Btw considering that CpusAccel for tcg is actually three different interfaces (for mttcg, for icount, and plain RR),
> it will be tough to, in the stated objective, "remove all conditionals", even after removing the tcg_enabled().

The main issue were the conditionals inside module init function.
They are completely OK inside accel-specific methods.

> 
> I wonder how you see this issue (patches for 3 TCG split are in Richard's queue atm).
> 
> static void tcg_accel_cpu_init(void)
> {
>     if (tcg_enabled()) {
>         TCGState *s = TCG_STATE(current_accel());
> 
>         if (s->mttcg_enabled) {
>             cpus_register_accel(&tcg_cpus_mttcg);
>         } else if (icount_enabled()) {
>             cpus_register_accel(&tcg_cpus_icount);
>         } else {
>             cpus_register_accel(&tcg_cpus_rr);
>         }
>     }
> }

Probably what we are missing here is a non-softmmu-specific
AccelClass.init() method?

-- 
Eduardo


