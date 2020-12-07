Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C02D1892
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:33:56 +0100 (CET)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLKd-0004MH-2w
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmLG3-0002rj-2h
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmLG0-0001z9-0H
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607365746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g49Z+cox8snTr/zj7AmWcvwcO9TitNRZwD7v6LCWjqE=;
 b=H0j5A71wwIsHYCoghfL+Ga54YdRRLc05G3Tm4uGN8tflNFPUHXHJ2ahu1f7s/KA6xfJOvW
 rudCcFRJxOmjnsW9ibG23qhYiQf/8JOlqN1/7fNyai9an/7Qo7lH38zAXtUlFoNgqLgM6F
 zCM6QyyN3z9XG0DdpAhbWsQyQgKzT8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-0S06n5z0OIyaX0Z52Jxq9Q-1; Mon, 07 Dec 2020 13:28:45 -0500
X-MC-Unique: 0S06n5z0OIyaX0Z52Jxq9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 458BB107ACFC;
 Mon,  7 Dec 2020 18:28:43 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A025960BE2;
 Mon,  7 Dec 2020 18:28:42 +0000 (UTC)
Date: Mon, 7 Dec 2020 13:28:42 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Message-ID: <20201207182842.GE1289986@habkost.net>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 06:07:32PM +0000, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 17:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > arm_v7m_class_init() (used by cortex-* CPU models) overrides it.
> > Those CPU models as "TCG CPUs" in the code, but I don't see what
> > makes them TCG-specific.
> 
> They're TCG specific because the Arm Virtualization Extension
> is for A-profile only and only supports virtualization of
> A-profile CPUs. You can't accelerate an M-profile CPU with it.
> (Similarly, you can't use the Virtualization Extension to
> accelerate a pre-v7 CPU, which is why CPUs like the arm1176
> are also TCG-only, and you can't use it to accelerate a CPU
> which has TrustZone enabled.)
> 
> (M-profile CPUs override cc->do_interrupt() because their
> exception and interrupt handling logic is totally different
> to A-profile.)
> 
> > What exactly is the expected behavior
> > if using, e.g., "-cpu cortex-m33 -accel kvm"?
> 
> It ought to print a useful error message telling you
> that that CPU type isn't compatible with KVM.
> 
> As it happens, you get an assertion failure for cortex-m33:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an505 -display none
> qemu-system-aarch64: ../../softmmu/physmem.c:745:
> cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()'
> failed.
> Aborted
> 
> because the M33 has TrustZone enabled (which is not compatible
> with KVM) and we don't check that before we hit the assertion.
> We should fix that :-)
> 
> If you try it with a non-TrustZone M-profile core like the M3 then
> you do get a better error message:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an385 -display none
> qemu-system-aarch64: KVM is not supported for this guest CPU type
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
> Invalid argument
> 
> If you try this with the "virt" board then you'll run into the
> virt board's own sanity checking of CPU types instead:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M virt -cpu cortex-m33
> -display none
> qemu-system-aarch64: mach-virt: CPU type cortex-m33-arm-cpu not supported

Thanks!

So this patch seem correct, but we still have the questions
below:

> 
> All of that said, I think I agree with you -- we have this
> indirect mechanism for invoking class methods on the CPU
> object, why is it necessary for this KVM-specific code to
> call the implementation function directly?

All signs seem to indicate that CPUClass.do_interrupt is
TCG-specific, except for those two lines of code in
target/arm/kvm64.c.  The point of this patch would be to allow us
to separate TCG-specific code from accel-independent code later.

Maybe those signs are misleading us, and CPUClass.do_interrupt
shouldn't be TCG-specific.  If that's the case, why arm is the
only architecture that uses CPUClass.do_interrupt outside
TCG-specific code?

-- 
Eduardo


