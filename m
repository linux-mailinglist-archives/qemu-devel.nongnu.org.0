Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B35AAA9B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:50:15 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2NR-0007RX-Qi
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oU2Hu-0005ma-MT
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oU2Hr-00056s-IT
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662108266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNOpLflP/Pm8NxANPGyXgCPBwfLtNpzAYQv+Of4HoFw=;
 b=NEldhBVPm3JEES+NxwcwEAJcyn9I9njGXWFQlHuvkBcZgJjP8ZYy2BZ8e5atysqQ1SRLRb
 WXeKSPbv/Cqe51Fj+jwX4R3qtgqN/69ontbrbMYC0v7En2yHKS4S6QtAXMl628gMAHp3fI
 8KNjG3PbJimhQgYPyeFcGumCkAuv8RE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-NFwmjWPkOs25c1W8bDAVKA-1; Fri, 02 Sep 2022 04:44:22 -0400
X-MC-Unique: NFwmjWPkOs25c1W8bDAVKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6803C0ED64;
 Fri,  2 Sep 2022 08:44:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3FCB2166B26;
 Fri,  2 Sep 2022 08:44:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B73218003AA; Fri,  2 Sep 2022 10:44:20 +0200 (CEST)
Date: Fri, 2 Sep 2022 10:44:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220902084420.noroojfcy5hnngya@sirius.home.kraxel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
 <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
 <34be4132-53f4-8779-1ada-68aa554e0eac@intel.com>
 <20220902060720.xruqoxc2iuszkror@sirius.home.kraxel.org>
 <20220902021628-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902021628-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
 
> I feel there are three major sources of controversy here
> 
> 0. the cover letter and subject don't do such a good job
>    explaining that what we are doing is just telling guest
>    CPUID is not broken. we are not exposing anything new
>    and not exposing host capability to guest, for example,
>    if cpuid phys address is smaller than host things also
>    work fine.
> 
> 1. really the naming.  We need to be more explicit that it's just a bugfix.

Yep, I'll go improve that for v2.

> 2. down the road we will want to switch the default when no PV. however,
>    some hosts might still want conservative firmware for compatibility
>    reasons, so I think we need a way to tell firmware
>    "ignore phys address width in CPUID like you did in the past".
>    let's add a flag for that?
>    and if none are set firmware should print a warning, though I
>    do not know how many people will see that. Maybe some ;)

> /*
>  * Force firmware to be very conservative in its use of physical
>  * addresses, ignoring phys address width in CPUID.
>  * Helpful for migration between hosts with different capabilities.
>  */
> #define KVM_BUG_PHYS_ADDRESS_WIDTH_BROKEN 2

I don't see a need for that.  Live migration compatibility can be
handled just fine today using
	'host-phys-bits=on,host-phys-bits-limit=<xx>'

Which is simliar to 'phys-bits=<xx>'.

The important difference is that phys-bits allows pretty much anything
whereas host-phys-bits-limit applies sanity checks against the host
supported phys bits and throws error on invalid values.

take care,
  Gerd


