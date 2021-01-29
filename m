Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7044308987
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:26:41 +0100 (CET)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5UjQ-0002EK-Vz
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5UfE-0007Gv-W5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5Uf8-0007nx-1T
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611930133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+dLICsiyuOac3T6ONDT/ab/ff6jzzcMiW4oYnX6SHk=;
 b=NzMYiu8nzMHE6QVVoXmag7a/FROkllE6Tw02jBVl49bwEl4t5jq/3fJhxMVVokTVm/OBG+
 facSmiObt6EUHVHtoT12ynyVK3LP7AaHszXmwzPP1dodh/in6bbUTI/xcdNV/ZEtyzDQbI
 O4h1SWRtTGyvK7M+M/drWeF7sEakacc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-wpFZAwCNNDKQYEMcW2ondw-1; Fri, 29 Jan 2021 09:22:11 -0500
X-MC-Unique: wpFZAwCNNDKQYEMcW2ondw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7058A39380;
 Fri, 29 Jan 2021 14:22:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3975A5D9C0;
 Fri, 29 Jan 2021 14:22:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 813F318000A2; Fri, 29 Jan 2021 15:22:08 +0100 (CET)
Date: Fri, 29 Jan 2021 15:22:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
Message-ID: <20210129142208.jlmx5k3f2iptjcy4@sirius.home.kraxel.org>
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
 <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
 <CAJ+F1CJ0Z378KCLGDzLYOfBor7HkHM2YemRj5F-3kTSnVK7ADg@mail.gmail.com>
 <20210128144202.2pqjjn3epspfvlgk@sirius.home.kraxel.org>
 <CAJ+F1C+1LdY2gJp0trTx_pR7iLeJG9j7O+FjqF6pgnDZGUa=YA@mail.gmail.com>
 <20210128163426.lsd2y3w7htovfnfx@sirius.home.kraxel.org>
 <CAJ+F1CJR2HzRPDmRudCKimeyRq0OFJV8q8BrdY1xw9DK-y2a8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJR2HzRPDmRudCKimeyRq0OFJV8q8BrdY1xw9DK-y2a8A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > >  void qemu_spice_display_init_done(void)
> > >  {
> > > -    spice_display_init_done = true;
> > > +    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
> > >      vm_change_state_handler(NULL, runstate_is_running(), runstate_get());
> >
> > I'd just call qemu_spice_display_start() directly here, the need for
> > runstate_get() goes away then.  Otherwise looks good to me.
> 
> Hmm, that could work, but it will behave differently as we will start
> spice even if the VM is not running then.

if (runstate_is_running())
    qemu_spice_display_start()

take care,
  Gerd


