Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA35337E00
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:23:06 +0100 (CET)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQtl-0003DF-OP
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKQiJ-0003mK-Ia
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKQi5-0001mL-8T
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615489856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mvnt0/oHxgsc0ZSJzXmoV4OhUWcGkwTy29Z3dbN2kS4=;
 b=Aoto1I3a50GqCP7RdH4KacYLyXeFFRwpfm69Ordzhw5KVBto2lXZpwsxe4iIpz40kYieV2
 zon2C1DQOs9zaUTUPshlokD14V4j9Dgm5nnkPrkAA7p33qUnSmYVZs5dRosQ3j6hCHP4E3
 hWoOPkRnibANW5lok5dW4yQy9KaFM28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-gfHgqskGOpO3CLWyjvHC9g-1; Thu, 11 Mar 2021 14:10:52 -0500
X-MC-Unique: gfHgqskGOpO3CLWyjvHC9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5842419057A1;
 Thu, 11 Mar 2021 19:10:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E33517A81;
 Thu, 11 Mar 2021 19:10:49 +0000 (UTC)
Date: Thu, 11 Mar 2021 20:10:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
Message-ID: <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:33:15PM +0000, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 17:16, Claudio Fontana <cfontana@suse.de> wrote:
> > Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?
> 
> "max" is "best we can do, whatever that is". (On KVM this is "same as
> the host".)
> "host" is "whatever the host is (KVM only)".
> 
> > KVM: (aarch64-only): aarch64_max_initfn():
> >
> > The following comment in the code seems wrong to me:
> >
> > /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
> >
> > This is not exactly true:
> >
> > "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
> > After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.
> >
> > In the case of cpu host instead,
> >
> > "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
> >
> > Is this a bug?

It was left out intentionally. More below.

> 
> Maybe; that's a question for Richard or Drew...
> 
> > Are "max" and "host" for KVM supposed to be the same like with x86?

Yes, but my understanding of "max" == "host" for KVM is that that only
applies to the perspective of the guest. What CPU and what CPU features
the guest can see should be exactly the same with either "max" or "host",
depending on the enabling/disabling of any optional CPU properties.

The question here seems to be that, if one has a CPU property, does that
imply the other should have the same? Which would effectively allow the
two to be aliases (when KVM is enabled). I don't know, does x86 ensure
100% property compatibility?

I opted not to support sve-max-vq for "host" because I consider it a
legacy CPU property, one I didn't want to propagate. Indeed it may
make more sense to depreciate sve-max-vq than to "fix" this issue
by adding it to "host". Note, we can already create equivalent SVE
CPUs. The following are the same from the perspective of the guest

 -accel kvm -cpu host,sve512=on
 -accel kvm -cpu max,sve512=on

And, for TCG, these are the same from the perspective of the guest
 
 -accel tcg -cpu max,sve512=on
 -accel tcg -cpu max,sve-max-vq=4

So we already don't need sve-max-vq.

Thanks,
drew


