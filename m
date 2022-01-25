Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AF49AE48
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:46:39 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHTK-0008TC-VQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGTq-0002mG-Oc
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGTj-0004un-5u
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643096567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lroAuQ9KwUUuf3SkYzmdVj0qTqXFnUMeQK3AGcniNQw=;
 b=JxvSgzxyKA4x43XUUIZya3yOrxHV1O0jMN9R7ivUKg0HXZfYBsBWqW4AaD7tIvO2S881sP
 fXuQPs3yOS4kTlDNLsTz8PJgDk8NGFhXM+QKraYyGdahNB6SaD1f7CFQh43espb2IHSn0w
 iPPp8KI44udNaG4r9a1INW3kdMW59Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-XWiGIoLcNc2-O2okqRgknQ-1; Tue, 25 Jan 2022 02:42:44 -0500
X-MC-Unique: XWiGIoLcNc2-O2okqRgknQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C987946860;
 Tue, 25 Jan 2022 07:42:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9BF62D44;
 Tue, 25 Jan 2022 07:42:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9170518000B2; Tue, 25 Jan 2022 08:42:25 +0100 (CET)
Date: Tue, 25 Jan 2022 08:42:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Message-ID: <20220125074225.sqxukflp3vat7ilu@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
 <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
 <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
 <e74fcb88-3add-4bb7-4508-742db44fa3c8@intel.com>
 <20220110110120.ldjekirdzgmgex4z@sirius.home.kraxel.org>
 <8793aa69-3416-d48e-d690-9f70b1784b46@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8793aa69-3416-d48e-d690-9f70b1784b46@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, mtosatti@redhat.com, "Min M . Xu" <min.m.xu@intel.com>,
 erdemaktas@google.com, pbonzini@redhat.com, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Regarding what interface should be used to load TDVF, there are three
> options:
> 
>   1) pflash: the same as how we load OVMF.
> 
>   Suppose TDVF support will finally get into OVMF, using this
>   interface, it's full compatible with normal VMs. No change required
>   to QEMU command line and TDVF binary is mapped to the GPA address
>   right below 4G, but they are actually mapped as RAM.
> 
>   Of course, we need several hacks (special handling) in QEMU.

What kind if "hack"?

>   Of course, they don't work as flash, the change made to it doesn't
>   persist.
> 
>   2) -bios
> 
>   exploit "-bios" parameter to load TDVF. But again, read-only is not
>   supported. TDVF is mapped as RAM.
> 
>   3) generic loader
> 
>   Just like what this series does. Implement specific parser in generic
>   loader to load and parse TDVF as private RAM.
> 
> I'm nor sure if 1) is acceptable from your side. If not, we will go with
> option 3, since 2) doesn't make too much sense.

Yep, Daniel (Cc'ed) tried (2) recently for SEV.  Didn't work due to
differences in -bios and -pflash reset handling.  So that option is
out I guess.

SEV uses (1), and there is some support code which you should be able to
reuse (walker for the list of guid-sections with meta-data in the ovmf
reset vector for example).

So TDX going for (1) too is probably the best option.

take care,
  Gerd


