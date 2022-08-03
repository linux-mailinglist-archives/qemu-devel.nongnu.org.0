Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73DE5891DB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:55:58 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIb8-00061t-0j
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJIPu-00036e-Nh
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJIPr-0001LY-Ly
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659548658;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f07pmX2X/9ezSJkmLyBsCE9o6iaqy47R2T+lPh6txxg=;
 b=hizVWvUqumSKrfpJBPsyhFLchS1ULGp8AJt/w6APX2W6LfAuCfrrgwR9eyzBZZqgWIlsg1
 zhL8IOiwR3W1Cvp9erKYCKBggU/ADT7+XzSmXY8Ti0fiep1Gj5gbw8WM99xTeuWPVWrO7/
 icNkvt2qk1NtFCabMSFJptnd1nH0IqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-cSXMfVP3OPW6xfrU-kXlJg-1; Wed, 03 Aug 2022 13:44:15 -0400
X-MC-Unique: cSXMfVP3OPW6xfrU-kXlJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE61B85A585;
 Wed,  3 Aug 2022 17:44:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4777D2026D4C;
 Wed,  3 Aug 2022 17:44:12 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:44:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [PATCH v1 00/40] TDX QEMU support
Message-ID: <Yuqz6nPIIqzrlxP1@redhat.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <YujzOUjMbBZRi/e6@redhat.com>
 <db14e4f1-6090-7f97-f690-176ba828500c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db14e4f1-6090-7f97-f690-176ba828500c@intel.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 02, 2022 at 06:55:48PM +0800, Xiaoyao Li wrote:
> On 8/2/2022 5:49 PM, Daniel P. Berrangé wrote:
> > On Tue, Aug 02, 2022 at 03:47:10PM +0800, Xiaoyao Li wrote:
> 
> > > - CPU model
> > > 
> > >    We cannot create a TD with arbitrary CPU model like what for non-TDX VMs,
> > >    because only a subset of features can be configured for TD.
> > >    - It's recommended to use '-cpu host' to create TD;
> > >    - '+feature/-feature' might not work as expected;
> > > 
> > >    future work: To introduce specific CPU model for TDs and enhance +/-features
> > >                 for TDs.
> > 
> > Which features are incompatible with TDX ?
> 
> TDX enforces some features fixed to 1 (e.g., CPUID_EXT_X2APIC,
> CPUID_EXT_HYPERVISOR)and some fixed to 0 (e.g., CPUID_EXT_VMX ).
> 
> Details can be found in patch 8 and TDX spec chapter "CPUID virtualization"
> 
> > Presumably you have such a list, so that KVM can block them when
> > using '-cpu host' ?
> 
> No, KVM doesn't do this. The result is no error reported from KVM but what
> TD OS sees from CPUID might be different what user specifies in QEMU.
> 
> > If so, we should be able to sanity check the
> > use of these features in QEMU for the named CPU models / feature
> > selection too.
> 
> This series enhances get_supported_cpuid() for TDX. If named CPU models are
> used to boot a TDX guest, it likely gets warning of "xxx feature is not
> available"

If the  ',check=on' arg is given to -cpu, does it ensure that the
guest fails to startup with an incompatible feature set ? That's
really the key thing to protect the user from mistakes.


> We have another series to enhance the "-feature" for TDX, to warn out if
> some fixed1 is specified to be removed. Besides, we will introduce specific
> named CPU model for TDX. e.g., TDX-SapphireRapids which contains the maximum
> feature set a TDX guest can have on SPR host.

I don't know if this is the right approach or not, but we should at least
consider making use of CPU versioning here.  ie have a single "SapphireRapids"
alias, which resolves to a suitable specific CPU version depending on whether
TDX is used or not.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


