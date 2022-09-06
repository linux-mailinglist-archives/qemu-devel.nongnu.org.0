Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0E5AE895
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:41:15 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXtC-0007Pe-1W
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW4g-0006LD-6y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW4e-0001ZN-BD
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662461095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3M+B0cDaWhaL/O8FNNnnuwSpGVhbkFRwdLxKDJ1L1U=;
 b=Zvh4Iyk2Be2M2hJqOXWXt4UDaVzKWGHR3MTX9G9SsU+il+lIzLytCXZ7r0dZ78NDcs0hgU
 lVvEDXYsbzDZ2mV9Lpgb32r0K8VYfSmf/3c8z/sAG56bvVCxtFC5w83unjGVNZEDUG+CxO
 +hMOAVn6xjyoqNBpMWKv8WjZBvPL/jo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-Jd34AY8iPNS0cFWaMdQW4g-1; Tue, 06 Sep 2022 06:44:50 -0400
X-MC-Unique: Jd34AY8iPNS0cFWaMdQW4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27A47380390D;
 Tue,  6 Sep 2022 10:44:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD159492C3B;
 Tue,  6 Sep 2022 10:44:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F8751800629; Tue,  6 Sep 2022 12:44:48 +0200 (CEST)
Date: Tue, 6 Sep 2022 12:44:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <20220906104448.qlqhhyg5rvq2fjuq@sirius.home.kraxel.org>
References: <20220904165058.1140503-1-Jason@zx2c4.com>
 <20220905084051.cbwjktoumwhfy5tr@sirius.home.kraxel.org>
 <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Tue, Sep 06, 2022 at 12:27:25PM +0200, Jason A. Donenfeld wrote:
> Hi Gerd,
> 
> On Mon, Sep 5, 2022 at 10:40 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Sun, Sep 04, 2022 at 06:50:58PM +0200, Jason A. Donenfeld wrote:
> > > This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), and
> > > then makes the use of setup_data safe. It does so by checking the boot
> > > protocol version. If it's sufficient, then it means EFI boots won't
> > > crash. While we're at it, gate this on SEV too.
> >
> > > @@ -463,6 +462,7 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
> >
> > > +    pcmc->legacy_no_rng_seed = true;
> >
> > This needs go into the pc_i440fx_7_1_machine_options function, otherwise
> > legacy_no_rng_seed gets flipped from false to true for 7.1 machine types
> > which breaks compatibility.
> 
> Oh. Okay so a "straight" revert won't do the trick, since this is (I
> guess?) intended for 7.2 rather than 7.1. Makes sense; will do for v2.

Exactly.  7.1 is release and thus set in stone.  So we'll go flip the
switch for 7.2 because the feature missed the 7.1 boat.

take care,
  Gerd


