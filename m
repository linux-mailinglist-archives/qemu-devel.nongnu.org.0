Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D82C6A84
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:20:12 +0100 (CET)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihPm-0006eq-Jz
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihNt-0005kd-4V
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihNk-00024R-2O
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606497482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WpkWoFSqB2UtbilhxjOZtvQ6tnj66kdLS/x8OXpv3ag=;
 b=Tik+Q8TL2OJ3E/pkrrhuCHUWSmLAcwJrcWOIWi9dgtZ7LKPSEbK3T9EB58u4mRF0QvQ4wB
 ElOpX2jHWecK06pbMZ2PHLgNpfjiWK+z22WhbfTauf7tFa1Yw7CF+HNnuaAfA7XFVlM49P
 XNMsVeTreArt/I6rJkbg6UCAEGbROos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Sy4QISk4MkmCXtQUY13x-g-1; Fri, 27 Nov 2020 12:18:00 -0500
X-MC-Unique: Sy4QISk4MkmCXtQUY13x-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25BAE7193;
 Fri, 27 Nov 2020 17:17:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0995D6D1;
 Fri, 27 Nov 2020 17:17:58 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:17:57 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127171757.GB2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
 <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 04:53:59PM +0000, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 16:47, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Do you know how the implicitly-accelerator-specific code is
> > implemented?  PARange is in id_aa64mmfr0, correct?  I don't see
> > any accel-specific code for initializing id_aa64mmfr0.
> 
> For TCG, the value of id_aa64mmfr0 is set by the per-cpu
> init functions aarch64_a57_initfn(), aarch64_a72_initfn(), etc.
> 
> For KVM, if we're using "-cpu cortex-a53" or "-cpu cortex-a57"
> these only work if the host CPU really is an A53 or A57, in
> which case the reset value set by the initfn is correct.
> In the more usual case of "-cpu host", we ask the kernel for
> the ID register values in kvm_arm_get_host_cpu_features(),
> which is part of the implementation of
> kvm_arm_set_cpu_features_from_host(), which gets called
> in aarch64_max_initfn() (inside a kvm_enabled() conditional).
> 
> So there is a *_enabled() check involved, which I hadn't
> realised until I worked back up to where this stuff is called.
> 

Thanks!  Is the data returned by kvm_arm_get_host_cpu_features()
supposed to eventually affect the value of id_aa64mmfr0?  I don't
see how that could happen.

-- 
Eduardo


