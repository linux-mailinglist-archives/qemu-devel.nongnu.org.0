Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38CD5E746E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:56:20 +0200 (CEST)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obcbi-0003D5-1g
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obc5r-0002Rz-Bw
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obc5p-0008Jn-IA
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663914199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uzb06LCFqQRAxWtzB5MZA8xgQJFRF/V7Jb6Ja+s8BU=;
 b=AxMPz2X64Kfq4+/W00YDC4GUyISy+U3dBTnRXQznxSR+1ccOT47vp2yGcYvkXJtVxr0fZO
 JaoLye4GnFugwIDvs7H3JzD5ZOLAm9jqz1FbAaic2zP4XqNLcTdN5SH5rhj1u9f6qbPDUi
 Ddvl7C4c1qhlOlKRPYMbgVhvdFq+3CU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-OgoXSm4kMrSoOeHF6YqfCA-1; Fri, 23 Sep 2022 02:23:14 -0400
X-MC-Unique: OgoXSm4kMrSoOeHF6YqfCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 752BD185A792;
 Fri, 23 Sep 2022 06:23:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24EF4140EBF4;
 Fri, 23 Sep 2022 06:23:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D584C18000A3; Fri, 23 Sep 2022 08:23:12 +0200 (CEST)
Date: Fri, 23 Sep 2022 08:23:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm <kvm@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220923062312.sibqhfhfznnc22km@sirius.home.kraxel.org>
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
 <20220922203345.3r7jteg7l75vcysv@sirius.home.kraxel.org>
 <CABgObfZS+xW9dTKNy34d0ew1VbxzH8EKtEZO3MwGsX+DUPzWqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfZS+xW9dTKNy34d0ew1VbxzH8EKtEZO3MwGsX+DUPzWqw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> > Given newer processors have more than 40 and for older ones we know
> > the possible values for the two relevant x86 vendors we could do
> > something along the lines of:
> >
> >    phys-bits >= 41                   -> valid
> >    phys-bits == 40    + AuthenticAMD -> valid
> >    phys-bits == 36,39 + GenuineIntel -> valid
> >    everything else                   -> invalid
> >
> > Does that look sensible to you?
> >
> 
> Yes, it does! Is phys-bits == 36 the same as invalid?

'invalid' would continue to use the current guesswork codepath for
phys-bits.  Which will end up with phys-bits = 36 for smaller VMs, but
it can go beyond that in VMs with alot (32G or more) of memory.  That
logic assumes that physical machines with enough RAM for 32G+ guests
have a physical address space > 64G.

'phys-bits = 36' would be a hard limit.

So, it's not exactly the same but small VMs wouldn't see a difference.

take care,
  Gerd


