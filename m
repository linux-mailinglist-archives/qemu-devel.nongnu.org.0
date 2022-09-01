Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3795A9CF3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:20:30 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTmvc-0000EE-N7
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTmt9-0006D2-Ha
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTmt5-00009f-Mc
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662049070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hedP1nanSg0nfEVRoW3l9wkxR5Nom5Xm3VIc4gzSbyI=;
 b=GkfUAQH5dvn3GYpz2rdJJkN5NJwWATlEJaKmXpSEMaPuqZ0crdhX7C/yA/Uc8LK4kJNGMC
 eYb0buESg2I8t3WukHUpZTdvS/bWsmVonEwdGb9031FbHnwKRtGiLaXZaGQJKHxA5iMRUx
 usOho2lHMdsu/sXbeHOKtyzsQBgU1RQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-XbIq98NtP9KElR6TTclKsA-1; Thu, 01 Sep 2022 12:17:45 -0400
X-MC-Unique: XbIq98NtP9KElR6TTclKsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AF30811E80;
 Thu,  1 Sep 2022 16:17:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E662840CF8F2;
 Thu,  1 Sep 2022 16:17:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A29AF18003AA; Thu,  1 Sep 2022 18:17:41 +0200 (CEST)
Date: Thu, 1 Sep 2022 18:17:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Thu, Sep 01, 2022 at 10:36:19PM +0800, Xiaoyao Li wrote:
> On 9/1/2022 9:58 PM, Gerd Hoffmann wrote:
> 
> > > Anyway, IMO, guest including guest firmware, should always consult from
> > > CPUID leaf 0x80000008 for physical address length.
> > 
> > It simply can't for the reason outlined above.  Even if we fix qemu
> > today that doesn't solve the problem for the firmware because we want
> > backward compatibility with older qemu versions.  Thats why I want the
> > extra bit which essentially says "CPUID leaf 0x80000008 actually works".
> 
> I don't understand how it backward compatible with older qemu version. Old
> QEMU won't set the extra bit you introduced in this series, and all the
> guest created with old QEMU will become untrusted on CPUID leaf 0x80000008 ?

Correct, on old qemu firmware will not trust CPUID leaf 0x80000008.
That is not worse than the situation we have today, currently the
firmware never trusts CPUID leaf 0x80000008.

So the patches will improves the situation for new qemu only, but I
don't see a way around that.

take care,
  Gerd


