Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E83F853F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 12:23:14 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJCXR-0004Sj-Jk
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 06:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCWe-0003nH-79
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCWc-0000Za-Dj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629973341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KghYdQ02d5GN1f8jgPYvz3Sv8fjljwc+oeQsWyEvHUY=;
 b=RvwcnqTRCBBTtV2kNg6MkMMFSk5ptpeNkADkru2j85rXWL1KNp+t/hT2/arC2trMFHMrix
 lFwGLVYapbXGjlR4taS88+svXD2AVr5w3FsDz+d0kRKpfC72acrUGRaoLIMpQ8hfGI8lNA
 vd9ItSVAVYr2Du5SaZJ3OJC8fIsxObU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-CKEK4k2dO2qEin7uK9V4BQ-1; Thu, 26 Aug 2021 06:22:19 -0400
X-MC-Unique: CKEK4k2dO2qEin7uK9V4BQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32DB418C8C00;
 Thu, 26 Aug 2021 10:22:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3C46060F;
 Thu, 26 Aug 2021 10:22:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A9B518003AA; Thu, 26 Aug 2021 12:22:12 +0200 (CEST)
Date: Thu, 26 Aug 2021 12:22:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest
Message-ID: <20210826102212.gykq2z4fb2iszb2k@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:54:36PM -0700, isaku.yamahata@gmail.com wrote:
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Introduce a machine property, kvm-type, to allow the user to create a
> Trusted Domain eXtensions (TDX) VM, a.k.a. a Trusted Domain (TD), e.g.:
> 
>  # $QEMU \
> 	-machine ...,kvm-type=tdx \
> 	...

Can we align sev and tdx better than that?

SEV is enabled this way:

qemu -machine ...,confidential-guest-support=sev0 \
     -object sev-guest,id=sev0,...

(see docs/amd-memory-encryption.txt for details).

tdx could likewise use a tdx-guest object (and both sev-guest and
tdx-guest should probably have a common parent object type) to enable
and configure tdx support.

take care,
  Gerd


