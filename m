Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE472C4276
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:53:22 +0100 (CET)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khwAZ-00077u-PD
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khw9E-0006cT-5g
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khw9B-0006Er-4k
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606315911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hfwq5YnhQZZ0OwVxtuUm0y9mK94HSxzFwNbPRmiswG0=;
 b=GOuT4gRUXjO7RsZq7wZCPNe1fu0HcafxzBmbFZF6Ud7LLnrzjnPVff/MswIrejJiPsaeek
 isUBPViBvWunWdw3ScoQpPwyG69K3mKX4PDn/Ja2gHN7UlvPtkpci/ssyGs9I3Q9+kkB0B
 W2H4Q8uMNMczB47wjn5trFuoyfgglgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-uK425IIJP5WxH817Chs-bw-1; Wed, 25 Nov 2020 09:51:47 -0500
X-MC-Unique: uK425IIJP5WxH817Chs-bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2A38F8E06;
 Wed, 25 Nov 2020 14:51:26 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50FFA5D9CA;
 Wed, 25 Nov 2020 14:51:24 +0000 (UTC)
Date: Wed, 25 Nov 2020 09:51:23 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
Message-ID: <20201125145123.GC2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
 <20201124174821.GT2271382@habkost.net>
 <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
 <20201124192756.GX2271382@habkost.net>
 <115546ec-1024-e515-8eba-b89937fb23ac@suse.de>
 <20201124203452.GZ2271382@habkost.net>
 <60e9ff3e-8896-c9a1-302c-c1378a48a564@suse.de>
 <6328a231-a3d0-92c7-7da6-f383c14748ac@suse.de>
MIME-Version: 1.0
In-Reply-To: <6328a231-a3d0-92c7-7da6-f383c14748ac@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Wed, Nov 25, 2020 at 12:48:22PM +0100, Claudio Fontana wrote:
> On 11/25/20 10:32 AM, Claudio Fontana wrote:
> > On 11/24/20 9:34 PM, Eduardo Habkost wrote:
> >> On Tue, Nov 24, 2020 at 08:39:33PM +0100, Claudio Fontana wrote:
> >>> On 11/24/20 8:27 PM, Eduardo Habkost wrote:
> >>>> On Tue, Nov 24, 2020 at 07:52:15PM +0100, Claudio Fontana wrote:
> >>>> [...]
> >>>>>>> +    }
> >>>>>>
> >>>>>> Additionally, if you call arch_cpu_accel_init() here, you won't
> >>>>>> need MODULE_INIT_ACCEL_CPU anymore.  The
> >>>>>>
> >>>>>>   module_call_init(MODULE_INIT_ACCEL_CPU)
> >>>>>>
> >>>>>> call with implicit dependencies on runtime state inside vl.c and
> >>>>>> *-user/main.c becomes a trivial:
> >>>>>>
> >>>>>>   accel_init(accel)
> >>>>>>
> >>>>>> call in accel_init_machine() and *-user:main().
> 
> 
> On this one I see an issue:
> 
> the *-user_main() would still need an ac->machine_init() call to initialize tcg itself,
> currently the accelerator initialization is put into ac->machine_init
> 
> (tcg_init, kvm_init, xen_init, etc).
> 
> Or are you proposing to move tcg initialization away from the current ->machine_init(),
> into the new ac->init called by accel_init()?

Yes.  Anything that requires MachineState (and is
softmmu-specific) would go to ->machine_init().  Anything that is
not softmmu-specific would go to ->init().

> 
> This would make tcg even more different from the other accelerators.

That's true, but isn't this only because TCG is the only one that
really needs it?

> 
> Or are you proposing for all accelerators to separate the initialization of the accelerator itself
> from the machine state input, leading to, for example, separating kvm-all.c kvm_init() into two
> functions, one which takes the input from MachineState and puts it into the AccelState, and
> another one which actually then initializes kvm proper? And same for all accels?

That would be possible (and maybe a good idea), but not necessary
to make it work.

> 
> In my view we could still do in *-user main.c,
> 
> ac = ACCEL_GET_CLASS(current_accel())
> ac->machine_init(NULL);
> ac->init_cpu_interfaces(ac);

That would work too.  I would implement it as an accel_init(NULL)
call, however, to avoid duplicating the code from
accel_init_machine().

Calling ->machine_init(NULL) is just a bit surprising because of
the name (calling machine_init() when there's no machine), and
because we know most accelerators will crash if getting a NULL
argument.

Anyway, the split between ->machine_init() and ->init() is just a
suggestion.  Keeping a single init method that accepts a NULL
MachineState* as argument is not my favourite option, but it
works.

Whatever you choose, my only ask is to document clearly the
expectations and requirements of the AccelClass methods you are
using.


> 
> to solve this, or something like that, but also the option of fixing all accelerators to separate
> the gathering of the input from the MachineState to the actual accelerator initialization is
> a possibility to me.
> 
> Ciao,
> 
> Claudio

Thank you very much for your patience!  I think we're going on
the right direction.

-- 
Eduardo


