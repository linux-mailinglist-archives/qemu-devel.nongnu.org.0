Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928A5ACCD2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 09:42:04 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV6k7-00022Z-1y
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 03:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oV6hM-0000Zg-Ag
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oV6hJ-0005i1-7X
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662363547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZbIUECdII8tK9BhsRycVKJJqNBhWBSkf3Xay6/B6wA=;
 b=TgdVT6C832qSoYuglYNXBXkaK1/DKPNdNiGy3Js7sdNTK0dpwUAgEykxTD/GHGV1aJTR01
 cBdy6LMm1p3wd4fG6ZcQ4xkt1EJR0geL+gpWcWZ/cjGe84k2Tl8ZRHJePSnzJi/2oltsyD
 mFdSs6JqVwEiODsiZFgJ5NKRG6mbNpc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-f-N6yZOnME6gkjQDPveccQ-1; Mon, 05 Sep 2022 03:39:04 -0400
X-MC-Unique: f-N6yZOnME6gkjQDPveccQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6ED73810D23;
 Mon,  5 Sep 2022 07:39:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A1439458A;
 Mon,  5 Sep 2022 07:39:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE10618007A4; Mon,  5 Sep 2022 09:39:01 +0200 (CEST)
Date: Mon, 5 Sep 2022 09:39:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220905073901.t4xattq23y2mawjy@sirius.home.kraxel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
 <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
 <34be4132-53f4-8779-1ada-68aa554e0eac@intel.com>
 <20220902060720.xruqoxc2iuszkror@sirius.home.kraxel.org>
 <20220902021628-mutt-send-email-mst@kernel.org>
 <20220902084420.noroojfcy5hnngya@sirius.home.kraxel.org>
 <20220904163609-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904163609-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> > I don't see a need for that.  Live migration compatibility can be
> > handled just fine today using
> > 	'host-phys-bits=on,host-phys-bits-limit=<xx>'
> > 
> > Which is simliar to 'phys-bits=<xx>'.
> 
> yes but what if user did not configure anything?

I expect that'll be less and less common.  The phys-bits=40 default used
by qemu becomes increasingly problematic for large guests which need
more than that, and we see activity implementing support for that in
libvirt.

> the point of the above is so we can eventually, in X years, change the guests
> to trust CPUID by default.

Well, we can flip host-phys-bits to default to 'on' in qemu for new
machine types (or new cpu versions).  That'll have the very same effect.

take care,
  Gerd


