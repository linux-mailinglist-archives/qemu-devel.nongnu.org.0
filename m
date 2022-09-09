Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C475B2E00
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 07:21:40 +0200 (CEST)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWWSQ-0008I2-FE
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 01:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWWPM-0006kD-KV
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 01:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWWPK-0003BQ-6s
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 01:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662700705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIbzNz29YPbmCVTVBXbJyWztnZBv3IdFfpT/fzMMz78=;
 b=isohFQgmK4Ql5aFv7ely9Hv94jy4ing900CaGG1sylDSHoqoQsgtIr5chwxxHM0f2eFnf9
 CUZL7CqS6vJN3UfddsZDp2ToxdSwW+i5cbuXcxKNXQVgY5mwAFFvwPt4cUqTrn9XURx7xe
 8dJrERPfRI23LPOzvsiE9GSpphoW7i4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-SkMWKDKfMhehCQYp-wWwbg-1; Fri, 09 Sep 2022 01:18:19 -0400
X-MC-Unique: SkMWKDKfMhehCQYp-wWwbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5C643802121;
 Fri,  9 Sep 2022 05:18:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B0122026D4C;
 Fri,  9 Sep 2022 05:18:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48F1518000A3; Fri,  9 Sep 2022 07:18:17 +0200 (CEST)
Date: Fri, 9 Sep 2022 07:18:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 2/2] [RfC] expose host-phys-bits to guest
Message-ID: <20220909051817.vlai3l6cjl5sfgmv@sirius.home.kraxel.org>
References: <20220908113109.470792-1-kraxel@redhat.com>
 <20220908113109.470792-3-kraxel@redhat.com>
 <20220908101757-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908101757-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > @@ -424,7 +426,10 @@ static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >  {
> >      X86CPU *cpu = X86_CPU(dev);
> >  
> > -    cpu->host_phys_bits = true; /* need reliable phys-bits */
> > +    /* need reliable phys-bits */
> > +    cpu->env.features[FEAT_KVM_HINTS] |=
> > +        (1 << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID);
> > +
> 
> Do we need compat machinery for this?

Don't think so, microvm has no versioned machine types anyway.

> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c

> >      [FEAT_KVM_HINTS] = {
> >          .type = CPUID_FEATURE_WORD,
> >          .feat_names = {
> > -            "kvm-hint-dedicated", NULL, NULL, NULL,
> > +            "kvm-hint-dedicated", "host-phys-bits", NULL, NULL,

> > -    DEFINE_PROP_BOOL("host-phys-bits", X86CPU, host_phys_bits, false),

> > -    if (cpu->host_phys_bits) {
> > +    if (cpu->env.features[FEAT_KVM_HINTS] &
> > +        (1 << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID)) {
> >          /* The user asked for us to use the host physical bits */
> >          phys_bits = host_phys_bits;
> >          if (cpu->host_phys_bits_limit &&
> 
> I think we still want to key this one off host_phys_bits
> so it works for e.g. hyperv emulation too.

I think that should be the case.  The chunks above change the
host-phys-bits option from setting cpu->host_phys_bits to setting
the FEAT_KVM_HINTS bit.  That should also happen with hyperv emulation
enabled, and the bit should also be visible to the guest then, just at
another location (base 0x40000100 instead of 0x40000000).

take care,
  Gerd


