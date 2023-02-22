Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315769F4EB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUobS-0001U7-Jn; Wed, 22 Feb 2023 07:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d08044c82682f1dc09d1+7122+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pUobQ-0001Tq-7O
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:52:08 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d08044c82682f1dc09d1+7122+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pUobM-0003fc-U4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=lWFRqZnliHQS+s4U7aeal+jCLji9nmcQIQSVYfxNA0g=; b=A/aoHUadZVp0THxDz4EW/uOTyj
 sSYqfZMbTd6LxZytqFugSuRAnMWtjcvXckQDu1EiQUYjcXSMDSF40ccANUCWRkJFK35zcGiqJyWWE
 JIQXTr3RQ5qAiQoaBb7Hh+pnPTmFviVdHDEYesUabV4Pw8xL0JwAe7tmJC+oy39vD2DMNflEnUivA
 hk5KHLlbB3U47k0Qp2WSsVWX+h/RHNmTu0fb1ka17TM4IezeNxQDbWJJwjAfj8/4VoJOnzzxbP7Kw
 iK3ptzAEO5tEbw2a69Ghvi7/iCtL1MBNCRkHzpKElFIellzR/tey7+HiumNGmlpsHsXUrpdERnHDN
 Rpf2zP7w==;
Received: from [2a00:23ee:13a0:bf27:2fd:dfaf:4834:544b] (helo=[IPv6:::1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pUobA-00DSw4-6e; Wed, 22 Feb 2023 12:51:53 +0000
Date: Wed, 22 Feb 2023 12:51:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Paul Durrant <xadimgnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: Re: [PATCH v12 47/60] i386/xen: handle PV timer hypercalls
User-Agent: K-9 Mail for Android
In-Reply-To: <11a088aa-aea1-bd0a-5537-fdbab65870f8@xen.org>
References: <20230220204736.2639601-1-dwmw2@infradead.org>
 <20230220204736.2639601-48-dwmw2@infradead.org>
 <c92e355e101669f8473a695ad4abfc555765e5be.camel@infradead.org>
 <54ddce90-a55c-b1f6-59ad-35f7fada4999@xen.org>
 <11a088aa-aea1-bd0a-5537-fdbab65870f8@xen.org>
Message-ID: <2AB12E9D-BEDE-4227-8360-EE953524B802@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+d08044c82682f1dc09d1+7122+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On 22 February 2023 12:14:00 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 22/02/2023 12:03, Paul Durrant wrote:
>> On 22/02/2023 09:21, David Woodhouse wrote:
>>> On Mon, 2023-02-20 at 20:47 +0000, David Woodhouse wrote:
>>>> @@ -1246,6 +1470,16 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu=
, struct kvm_xen_exit *exit)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (code) {
>>>> +=C2=A0=C2=A0=C2=A0 case __HYPERVISOR_set_timer_op:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (exit->u=2Ehcall=2Elon=
gmode) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn kvm_xen_hcall_set_timer_op(exit, cpu,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit->u=2Ehcall=2Epa=
rams[0]);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* In 32-bit mode, the 64-bit timer value is in two args=2E */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
int64_t val =3D ((uint64_t)exit->u=2Ehcall=2Eparams[1]) << 32 |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (uint32_t)exit->u=2Ehcall=2Eparams[0];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn kvm_xen_hcall_set_timer_op(exit, cpu, val);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=20
>>> Argh, there I'm returning -errno from a function that ought to set it
>>> in exit->u=2Ehcall=2Eresult and return 'true' for a handled syscall=2E=
 Again=2E
>>>=20
>>> Still *slightly* regretting my life choices there and wishing the
>>> compiler caught that for me, but not enough to change it because we
>>> really *do* want to track which unhandled calls guests are trying to
>>> make=2E I'll fix it and then (if I make load_multiboot() tolerate 64-b=
it
>>> binaries as previously discussed) the XTF tests work:
>>>=20
>>> =C2=A0 $ =2E/bkvm/qemu-system-x86_64 -serial mon:stdio=C2=A0 -accel kv=
m,xen-version=3D0x4000a,kernel-irqchip=3Dsplit -cpu host -display none -ker=
nel$XTFDIR/tests/set_timer_op/test-hvm64-set_timer_op
>>> --- Xen Test Framework ---
>>> Environment: HVM 64bit (Long mode 4 levels)
>>> Test hypercall set_timer_op
>>> Test result: SUCCESS
>>> ******************************
>>> PANIC: xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned
>>> ******************************
>>> QEMU: Terminated
>>> $ =2E/bkvm/qemu-system-x86_64 -serial mon:stdio=C2=A0 -accel kvm,xen-v=
ersion=3D0x4000a,kernel-irqchip=3Dsplit -cpu host -display none -kernel $XT=
FDIR/tests/set_timer_op/test-hvm32-set_timer_op
>>> --- Xen Test Framework ---
>>> Environment: HVM 32bit (No paging)
>>> Test hypercall set_timer_op
>>> Test result: SUCCESS
>>> ******************************
>>> PANIC: xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned
>>> ******************************
>>> QEMU: Terminated
>>>=20
>>>=20
>>> (Dunno why it whines about poweroff; it isn't even calling the
>>> hypercall=2E And the test to explicitly test that hypercall does work=
=2E)
>>>=20
>>>=20
>>> --- a/target/i386/kvm/xen-emu=2Ec
>>> +++ b/target/i386/kvm/xen-emu=2Ec
>>> @@ -1118,14 +1118,18 @@ static int vcpuop_stop_singleshot_timer(CPUSta=
te *cs)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> -static int kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86C=
PU *cpu,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uint64_t timeout)
>>> +static bool kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86=
CPU *cpu,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 uint64_t timeout)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 int err;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(timeout =3D=3D 0)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vcpuop_stop_singles=
hot_timer(CPU(cpu));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D vcpuop_stop_single=
shot_timer(CPU(cpu));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return do_set_singleshot_t=
imer(CPU(cpu), timeout, false, true);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D do_set_singleshot_=
timer(CPU(cpu), timeout, false, true);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 exit->u=2Ehcall=2Eresult =3D err;
>>> +=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0 }
>>> =C2=A0 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X8=
6CPU *cpu,
>>>=20
>>=20
>> That looks better :-)
>>=20
>
>NB I think you still need to fix kvm_xen_hcall_vcpu_op() to not return th=
e -ENOENT too=2E


 Didn't I already do that?

