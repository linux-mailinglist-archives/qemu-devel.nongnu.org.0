Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC32CD65A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:05:05 +0100 (CET)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoIC-0000WG-N4
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkoFd-00079l-GZ; Thu, 03 Dec 2020 08:02:29 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:36298 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkoFZ-00038u-Ld; Thu, 03 Dec 2020 08:02:25 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C1A2C413E4;
 Thu,  3 Dec 2020 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607000533;
 x=1608814934; bh=CL4/18eonhp2DebrzEauZKFHFiBt5QLcBVr0+4Yp9H4=; b=
 D8+2IqVNiCyjcdFpgO72SQRmLl90pg9Pd1kWakzDe47H4gR2/dnakyDqCRshOmb+
 DT3gLakUGJ0+3W1KV9jpwzNJkbreOpnGEVU6deWgtGi6yM8nVDMyhX0kms4n8uMF
 Za6frn8TyBzDLVa00TtxQZJMuWIGyqhvQudjjBnk9zs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTncT90QvS9m; Thu,  3 Dec 2020 16:02:13 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 768A04137E;
 Thu,  3 Dec 2020 16:02:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 16:02:13 +0300
Date: Thu, 3 Dec 2020 16:02:33 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
Message-ID: <20201203130233.GA14685@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
 <20201203015218.GA82480@SPB-NB-133.local>
 <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:55:17AM +0100, Alexander Graf wrote:
> 
> On 03.12.20 02:52, Roman Bolshakov wrote:
> > On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
> > > When clearing internal state of a CPU, we should also make sure that HVF
> > > knows about it and can push the new values down to vcpu state.
> > > 
> > I'm sorry if I'm asking something dumb. But isn't
> > cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
> > (or any other accel) after reset?
> > 
> > For x86 it used to work:
> > 
> >    static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> >                                                  run_on_cpu_data arg)
> >    {
> >        hvf_put_registers(cpu);
> >        cpu->vcpu_dirty = false;
> >    }
> 
> 
> Yes, it works because after the reset is done, there is no other register
> modification happening. With the PSCI emulation code in QEMU, we still do
> modify CPU state after reset though.
> 

Maybe I miss something but that doesn't seem correct. Why PSCI reset is
split from machine reset?

> Different question though: Why do we need the post_reset() call at all here
> to push state?

My understanding that post_reset is akin to a commit of the CPU state
after all reset actions have been done to QEMU CPU Arch env state. i.e.
arch/machine reset modifies env state and then the env is pushed to
accel. cpu->vcpu_dirty is cleared because env is in-sync with vcpu.

> We would just push it on the next run anyways, right?

That's correct (at least for x86 HVF).

> So if we don't set vcpu_dirty to false then, we wouldn't need this
> patch here I think.
>

That's right but the same post-reset approach is used for all accels,
including KVM. But I haven't found this for TCG.

Regards,
Roman

