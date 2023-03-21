Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AD6C3515
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedZx-000393-H7; Tue, 21 Mar 2023 11:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedZu-00038S-Qx
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:07:10 -0400
Received: from out-21.mta0.migadu.com ([91.218.175.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedZt-0000T0-6s
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:07:10 -0400
Date: Tue, 21 Mar 2023 16:07:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679411227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCnOwZ5hK6OX/UZaD9F4u+bgFnj3TwRoGBE0/NR556w=;
 b=Ymo8+QYqFSqHQ+6WBTBV3WvX91V42Ky1ooU6lNKH4ddKTJvN5VmYQtVYqD05Xlq2nNKPly
 ddhvR8MIP+0Th/SFf2nYwbxevwr2PF9N8g4K6T/lQidnOvv9Rch0i1ad/jGAb8D5pHYA77
 vnUUTWwzXY5jk5fI68MBKmOag0Blq90=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Message-ID: <20230321150706.6njowkadyp3vpb44@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321150220.mfrvgxg3ebju5e6k@orel>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.21;
 envelope-from=andrew.jones@linux.dev; helo=out-21.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Mar 21, 2023 at 04:02:21PM +0100, Andrew Jones wrote:
...
> > +
> > +# TLB Torture Tests
> > +[tlbflush-code::all_other]
> 
> It's better to use '-', '_', '.', or ',' than '::' because otherwise the
> standalone test will have a filename like tests/tlbflush-code::all_other
> which will be awkward for shells.
> 
> BTW, have you tried running these tests as standalone? Since they're
> 'nodefault' it'd be good if they work that way.
> 
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::page_other]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'page'
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::all_self]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'self'
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::page_self]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'page self'
> > +groups = nodefault mttcg

Shouldn't these also be in something like a "tlb" group?

Thanks,
drew

