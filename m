Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6E2C320A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 21:37:52 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khf4R-0003jC-9V
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 15:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khf1v-0002pN-Cl
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khf1r-0005vf-KP
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606250106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jsLKMIcXIaZCdx7nQPkT+14B+BZj5Vz7uLMLBtZkIf0=;
 b=O/3oVcofT9ZKc4P5likRcJ4TCjEgp3f4fdqAC+I8GmTCpbivKlBQJ5KDpz+zGJeCMqTd7l
 afb3vNMQAORzeR8kyr2nF5qyglF/tj21lhCFP0uQYGBoyJgdL7rQ26g67h8kosUqfD8I1b
 XXA4r8MEiVCfAv52x/Rv8/OGaMH3+AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-RS8gbse4NIWkOFE908iCzA-1; Tue, 24 Nov 2020 15:35:02 -0500
X-MC-Unique: RS8gbse4NIWkOFE908iCzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D1F80B70A;
 Tue, 24 Nov 2020 20:34:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57AC460864;
 Tue, 24 Nov 2020 20:34:54 +0000 (UTC)
Date: Tue, 24 Nov 2020 15:34:52 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
Message-ID: <20201124203452.GZ2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
 <20201124174821.GT2271382@habkost.net>
 <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
 <20201124192756.GX2271382@habkost.net>
 <115546ec-1024-e515-8eba-b89937fb23ac@suse.de>
MIME-Version: 1.0
In-Reply-To: <115546ec-1024-e515-8eba-b89937fb23ac@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 08:39:33PM +0100, Claudio Fontana wrote:
> On 11/24/20 8:27 PM, Eduardo Habkost wrote:
> > On Tue, Nov 24, 2020 at 07:52:15PM +0100, Claudio Fontana wrote:
> > [...]
> >>>> +    }
> >>>
> >>> Additionally, if you call arch_cpu_accel_init() here, you won't
> >>> need MODULE_INIT_ACCEL_CPU anymore.  The
> >>>
> >>>   module_call_init(MODULE_INIT_ACCEL_CPU)
> >>>
> >>> call with implicit dependencies on runtime state inside vl.c and
> >>> *-user/main.c becomes a trivial:
> >>>
> >>>   accel_init(accel)
> >>>
> >>> call in accel_init_machine() and *-user:main().
> >>
> >>
> >>
> >> I do need a separate thing for the arch cpu accel specialization though,
> >> without MODULE_INIT_ACCEL_CPU that link between all operations done at accel-chosen time is missing..
> >>
> > 
> > I think this is a key point we need to sort out.
> > 
> > What do you mean by "link between all operations done at
> > accel-chosen time" and why that's important?
> 
> 
> For understanding by a reader that tries to figure this out,
> (see the gid MODULE_INIT_ACCEL_CPU comment elsewhere in the thread).

Right, but how does the module_call_init(MODULE_INIT_ACCEL_CPU)
indirection makes this easier to figure out than just looking at
a accel_init() function that makes regular function calls?


> 
> And it could be that the high level plan to make accelerators fully dynamically loadable plugins in the future
> also conditioned me to want to have a very clear demarcation line around the choice of the accelerator.

We have dynamically loadable modules for other QOM types,
already, and they just use type_init().  I don't see why an extra
module_init() type makes this easier.

> 
> 
> > 
> > accel_init_machine() has 2-3 lines of code with side effects.  It
> > calls AccelClass.init_machine(), which may may have hundreds of
> 
> 
> could we initialize also all arch-dependent stuff in here?

You can, if you use a wrapper + stub, like arch_cpu_accel_init().


> 
> 
> > lines of code.  accel_setup_post() has one additional method
> > call, which is triggered at a slightly different moment.
> > 
> > You are using MODULE_INIT_ACCEL for 2 additional lines of code:
> > - the cpus_register_accel() call
> > - the x86_cpu_accel_init() call
> > 
> > What makes those 2 lines of code so special, to make them deserve
> > a completely new mechanism to trigger them, instead of using
> > trivial function calls inside a accel_init() function?
> > 
> 
> ...can we do also the x86_cpu_accel_init inside accel_init()?
> 
> 
> In any case I'll try also the alternative, it would be nice if I could bring everything together under the same roof,
> and easily discoverable, both the arch-specific steps that we need to do at accel-chosen time and the non-arch-specific steps.

One way to bring everything together under the same roof is to
call everything inside a accel_init() function.


> 
> Hope this helps clarifying where I am coming from,
> but I am open to have my mind changed, also trying the alternatives you propose here could help me see first hand how things play out.

Thanks!

-- 
Eduardo


