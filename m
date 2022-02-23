Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE094C0EA2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:56:43 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnRy-0005Cd-DK
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:56:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMnKe-0001wi-3o
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMnKY-0006wg-Rp
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645606141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBM9UWjQmSViiuGkp+5zLBwd/t6PDtuxKubzl7m466Y=;
 b=JkumWuorJM04p//OjkJ4cXe81AkKAr48wPA94+dJnDk4SFfj8Kh6NzWrHsNsLGRTy+M24D
 DRbNp5AB+2fWjpWQYuWopcBZd62jBPRBYqT+MnigcxO7LYaWZHthz7nwfi23QlyF9Bl1YD
 UK15C4m0bCwgrXuYE4rS2toeEKHzNp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-RbXG_cuiMWWuyct6N1RCnQ-1; Wed, 23 Feb 2022 03:48:58 -0500
X-MC-Unique: RbXG_cuiMWWuyct6N1RCnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1736180FD71;
 Wed, 23 Feb 2022 08:48:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC908318F;
 Wed, 23 Feb 2022 08:48:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F04F41800613; Wed, 23 Feb 2022 09:48:36 +0100 (CET)
Date: Wed, 23 Feb 2022 09:48:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
 <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Oleg Vasilev <me@svin.in>,
 Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > If you want to boot a guest using EDK2, you should use the images
> > > build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> > > not these images.

> Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
> the distrib images in our generated Docker images.
> 
> Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
> add "boot_linux" tests"), can you have a look?

Well, it's not *that* simple.  Names are not consistent across
distributions.  I think if we want go that route we have to inspect
the *.json files in /usr/share/qemu/firmware to find the correct
distro firmware images.

Also note that at least fedora ships both verbose and non-verbose
images ...

    kraxel@sirius ~# rpm -ql edk2-aarch64 
    [ ... ]
    /usr/share/edk2/aarch64/QEMU_EFI-pflash.raw
    /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw
    /usr/share/edk2/aarch64/QEMU_EFI.fd
    /usr/share/edk2/aarch64/QEMU_EFI.silent.fd
    /usr/share/edk2/aarch64/QEMU_VARS.fd
    [ ... ]
    /usr/share/qemu/firmware/60-edk2-aarch64.json
    /usr/share/qemu/firmware/70-edk2-aarch64-verbose.json

... so maybe it is an option to use the distro images for the bios
tables test cases too.

take care,
  Gerd


