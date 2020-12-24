Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEB2E287C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 19:08:01 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksV1r-0003Dn-OK
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 13:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksV0h-0002n4-Dx
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 13:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksV0d-0005K4-4f
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 13:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608833200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w1pSUwEDbX/yj7IvCEhpvF4T9xKJRc2up64NlKJ8rh8=;
 b=B+tAAYHh7Q4d/Jx7UC+BYlffjrMY5tQRa/fpi8EFvu3rtGDYMu++ptbT0QaED12VVtDXcv
 BPX8mjOeRg5xXRwE9U+pQl1UozMuxdCZOwa8ExgNuLb6Vvyo9Ktq0JR0+iXyzjiHVnMg7r
 Z/4xlaL9aLttMN7aBgaaoFqFeRbEb9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-vwFG6p0GODuiiPQpOZY7tw-1; Thu, 24 Dec 2020 13:06:38 -0500
X-MC-Unique: vwFG6p0GODuiiPQpOZY7tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14EE4800D53;
 Thu, 24 Dec 2020 18:06:37 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 804B310013C0;
 Thu, 24 Dec 2020 18:06:33 +0000 (UTC)
Date: Thu, 24 Dec 2020 13:06:32 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [RFC PATCH v2] x86/cpu: initialize the CPU concurrently
Message-ID: <20201224180632.GF286050@habkost.net>
References: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
 <20201221213620.GF6040@habkost.net>
 <e823060d-1a8a-a1d8-aa2f-1394c118bdae@huawei.com>
MIME-Version: 1.0
In-Reply-To: <e823060d-1a8a-a1d8-aa2f-1394c118bdae@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>, "S. Tsirkin,
 Michael" <mst@redhat.com>, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>, yebiaoxiang <yebiaoxiang@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 24, 2020 at 09:41:10PM +0800, Zhenyu Ye wrote:
> Hi Eduardo,
> 
> Sorry for the delay.
> 
> On 2020/12/22 5:36, Eduardo Habkost wrote:
> > On Mon, Dec 21, 2020 at 07:36:18PM +0800, Zhenyu Ye wrote:
> >> Providing a optional mechanism to wait for all VCPU threads be
> >> created out of qemu_init_vcpu(), then we can initialize the cpu
> >> concurrently on the x86 architecture.
> >>
> >> This reduces the time of creating virtual machines. For example, when
> >> the haxm is used as the accelerator, cpus_accel->create_vcpu_thread()
> >> will cause at least 200ms for each cpu, extremely prolong the boot
> >> time.
> >>

I have just realized one thing: all VCPU thread function
(including hax) keeps holding qemu_global_mutex most of the time.
Are you sure your patch is really making VCPU initialization run
in parallel?  Do you have numbers showing this patch really
improves boot time?


> >> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >> Signed-off-by: eillon <yezhenyu2@huawei.com>
> > 
> > The patch is easier to follow now, but I have a question that may
> > be difficult to answer:
> > 
> > What exactly is the meaning of cpu->created=true, and what
> > exactly would break if we never wait for cpu->created==true at all?
> > 
> > I'm asking that because we might be introducing subtle races
> > here, if some of the remaining CPU initialization code in
> > x86_cpu_realizefn() [1] expects the VCPU thread to be already
> > initialized.
> > 
> > The cpu_reset() call below is one such example (but probably not
> > the only one).  cpu_reset() ends up calling
> > kvm_arch_reset_vcpu(), which seems to assume kvm_init_vcpu() was
> > already called.  With your patch, kvm_init_vcpu() might end up
> > being called after kvm_arch_reset_vcpu().
> > 
> 
> There's a chance that this happens.
> Could we move these (after qemu_init_vcpu()) out of x86_cpu_realizefn()
> to the x86_cpus_init(), after qemu_wait_all_vcpu_threads_init()?
> Such as:
> 
> void x86_cpus_init()
> {
> 	foreach (cpu) {
> 		x86_cpu_new();
> 	}
> 
> 	qemu_wait_all_vcpu_threads_init();
> 
> 	foreach (cpu) {
> 		x86_cpu_new_post();
> 	}
> }

Maybe that would work, if the caveats are clearly documented.
I'm worried about bugs being introduced if people assume the VCPU
will always be fully initialized and ready to run after
qemu_init_vcpu() is called and qdev_realize() returns.

> 
> > Maybe a simpler alternative is to keep the existing thread
> > creation logic, but changing hax_cpu_thread_fn() to do less work
> > before calling cpu_thread_signal_created()?
> > 
> > In my testing (without this patch), creation of 8 KVM VCPU
> > threads in a 4 core machine takes less than 3 ms.  Why is
> > qemu_init_vcpu() taking so long on haxm?  Which parts of haxm
> > initialization can be moved after cpu_thread_signal_created(), to
> > make this better?
> > 
> 
> The most time-consuming operation in haxm is ioctl(HAX_VM_IOCTL_VCPU_CREATE).
> Saddly this can not be split.
> 
> Even if we fix the problem in haxm, other accelerators may also have
> this problem.  So I think if we can make the x86_cpu_new() concurrently,
> we should try to do it.

Changing the code to run all VCPU initialization actions for all
accelerators concurrently would require carefully reviewing the
VCPU thread code for all accelerators, looking for races.  Sounds
like a challenging task.  We could avoid that if we do something
that will parallelize only what we really need (and know to be
safe).

-- 
Eduardo


