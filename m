Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13412C30CD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:42:20 +0100 (CET)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kheCh-00041d-Fn
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khdz0-0007Mr-AV
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khdyx-00038y-MT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606246086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CrOZhGHTZYhRMKvLb3+oTwJg+P+11dnPUpJuNM7LWnc=;
 b=a2RWoPESmdQntEX8nUx5Mu8EWARvgRVahqlh5G/G2RibE0p30cofmgFynF/XlJmmREVHmT
 RRouZI83Zb+wyn+kfPNrKE3g43invJmi4pvmoMItmaitGEv9YHLankR16kH+p1VKDB+UcL
 ahneNIuj/SAb9Wg3YdIfQ4LJE8RnkJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Y9cXI6t9MCOT6WUaCVerIg-1; Tue, 24 Nov 2020 14:28:03 -0500
X-MC-Unique: Y9cXI6t9MCOT6WUaCVerIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06F857215;
 Tue, 24 Nov 2020 19:28:00 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E664E19C45;
 Tue, 24 Nov 2020 19:27:56 +0000 (UTC)
Date: Tue, 24 Nov 2020 14:27:56 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
Message-ID: <20201124192756.GX2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
 <20201124174821.GT2271382@habkost.net>
 <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
MIME-Version: 1.0
In-Reply-To: <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Tue, Nov 24, 2020 at 07:52:15PM +0100, Claudio Fontana wrote:
[...]
> >> +    }
> > 
> > Additionally, if you call arch_cpu_accel_init() here, you won't
> > need MODULE_INIT_ACCEL_CPU anymore.  The
> > 
> >   module_call_init(MODULE_INIT_ACCEL_CPU)
> > 
> > call with implicit dependencies on runtime state inside vl.c and
> > *-user/main.c becomes a trivial:
> > 
> >   accel_init(accel)
> > 
> > call in accel_init_machine() and *-user:main().
> 
> 
> 
> I do need a separate thing for the arch cpu accel specialization though,
> without MODULE_INIT_ACCEL_CPU that link between all operations done at accel-chosen time is missing..
> 

I think this is a key point we need to sort out.

What do you mean by "link between all operations done at
accel-chosen time" and why that's important?

accel_init_machine() has 2-3 lines of code with side effects.  It
calls AccelClass.init_machine(), which may may have hundreds of
lines of code.  accel_setup_post() has one additional method
call, which is triggered at a slightly different moment.

You are using MODULE_INIT_ACCEL for 2 additional lines of code:
- the cpus_register_accel() call
- the x86_cpu_accel_init() call

What makes those 2 lines of code so special, to make them deserve
a completely new mechanism to trigger them, instead of using
trivial function calls inside a accel_init() function?

-- 
Eduardo


