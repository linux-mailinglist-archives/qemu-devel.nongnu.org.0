Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D9344B76
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:35:27 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONWY-00056V-QB
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lONU4-0003RV-RV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lONU0-0000Qe-NR
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KU2dTkFiOnuGIjl3xtTylH84ggAkTIgZTxZocXWGU2Y=;
 b=KdQ7V0yI1Dc0PS8kur/WBIgZpJUvEZnyELa2pAI/YyI8EeuT99GEFiLPy3UyletsGQ/8u5
 JVSVOmy422djoac0jTHGfbbUO+PkxmEMUhjA+ul2vRhPVcSmW79pQKLJp4utMa2xzUIM6s
 2/8F2+RMJ2SlFdoCBXBeclcrB1Z4ZQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-eDG7b7nDMiKEn35JmBxenA-1; Mon, 22 Mar 2021 12:32:45 -0400
X-MC-Unique: eDG7b7nDMiKEn35JmBxenA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752315F9C6;
 Mon, 22 Mar 2021 16:32:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1E360C0F;
 Mon, 22 Mar 2021 16:32:41 +0000 (UTC)
Date: Mon, 22 Mar 2021 17:32:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 0/3] target/arm: Add nested virtualization support
Message-ID: <20210322163238.kkuvtvmqeb437cke@kamzik.brq.redhat.com>
References: <cover.1616052889.git.haibo.xu@linaro.org>
 <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 04:42:23PM +0100, Andrea Bolognani wrote:
> On Mon, 2021-03-22 at 10:07 +0000, Haibo Xu wrote:
> > This series add support for ARMv8.3/8.4 nested virtualization support
> > in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> > has been tested on a FVP model to run a L2 guest with Qemu. Now the
> > feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
> > starting a VM.
> 
> Why the need to enable this explicitly? AFAIK, that's not necessary
> for any other architecture: on x86, you just need to make sure you're
> using '-cpu host' and pass a parameter to the kernel module.
> 
> Even assuming this can't be enabled transparently, wouldn't its
> availability it be controlled by a CPU feature flag, similar to what
> already happens for SVE and PMU, rather than a machine type option?

I 100% agree. We should control this feature with a CPU feature property.
NV is a CPU feature, after all. Also, we should add it to the properties
that we can probe in cpu_model_advertised_features[].

Thanks,
drew

> 
> That would also address the discoverability issue: unless I'm
> mistaken (which I very well might be :), with the current
> implementation there's no way to tell whether nested KVM will be
> usable short of trying and seeing whether QEMU errors out.
> 
> -- 
> Andrea Bolognani / Red Hat / Virtualization
> 
> 


