Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953475E6D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:36:53 +0200 (CEST)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSwG-0003yc-A5
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obStQ-0002OE-V8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obStN-0002cb-N3
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663878830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38h887HfzKb2f2rP/TsBJ7B1fN0ay51tuATW6aVKrKU=;
 b=FfpHpX0iD3LuYd8ri23hofuaZRtywbTnpQy2+nGqZSmXIPakLZ2pFtICXeqOMo8gJvYR7H
 6axmpFPnXXiHpbVzNuNpfitNClP6RmLwuzBkM+oq1TxnvjhAf4vxsUgKXRxHEgNkcPoGP2
 4gSAbub1eQs9D5xxtmxO6nqwTwD90hM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-5SYzBwOGMeqbFSu2t_m-ug-1; Thu, 22 Sep 2022 16:33:47 -0400
X-MC-Unique: 5SYzBwOGMeqbFSu2t_m-ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42896811E67;
 Thu, 22 Sep 2022 20:33:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0E8BC15BAB;
 Thu, 22 Sep 2022 20:33:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 72BCC1800084; Thu, 22 Sep 2022 22:33:45 +0200 (CEST)
Date: Thu, 22 Sep 2022 22:33:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922203345.3r7jteg7l75vcysv@sirius.home.kraxel.org>
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 02:38:02PM +0200, Paolo Bonzini wrote:
> On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > No.  This will basically inform the guest that host-phys-bits has been
> > enabled (and pass the number of bits).  So the firmware can make use of
> > the available address space instead of trying to be as conservative as
> > possible to avoid going beyond the (unknown) limit.
> 
> Intel processors that are not extremely old have host-phys-bits equal
> to 39, 46 or 52. Older processors that had 36, in all likelihood,
> didn't have IOMMUs (so no big 64-bit BARs).
> 
> AMD processors have had 48 for a while, though older consumer processors had 40.

How reliable is the vendorid?

Given newer processors have more than 40 and for older ones we know
the possible values for the two relevant x86 vendors we could do
something along the lines of:

   phys-bits >= 41                   -> valid
   phys-bits == 40    + AuthenticAMD -> valid
   phys-bits == 36,39 + GenuineIntel -> valid
   everything else                   -> invalid

Does that look sensible to you?

take care,
  Gerd


