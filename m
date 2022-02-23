Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F74C1115
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:14:03 +0100 (CET)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpas-0005BA-Sk
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMpYu-0003zt-79
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMpYs-0007Q0-Av
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645614717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JK7oyIv3Qbbhv1nup1LAU0/7Ssy0jSC7ErjVBhLSzIA=;
 b=eMCAkH6lLkyUmNt98y9pf9gmBQk2JAmgwzlUesWbWwl89y+PB8ZfhYvZbn1agedIuY+v/f
 oFKlBri1RY/972y9VwFSnuswfynZbbDybewNf5OZC9p0EXSzpMJODT7cYy61g9HNinz4lu
 dYTm28qv2WMA6CHQrYq0CQDoEbNjQac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-MXLUO9GiOgivybumxPGasA-1; Wed, 23 Feb 2022 06:11:54 -0500
X-MC-Unique: MXLUO9GiOgivybumxPGasA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B0F801AAD;
 Wed, 23 Feb 2022 11:11:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A187B5F3;
 Wed, 23 Feb 2022 11:11:34 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:11:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhYWY0Ea5KwlCj/O@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Oleg Vasilev <me@svin.in>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 11:53:28AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/2/22 10:19, Peter Maydell wrote:
> > On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> > <philippe.mathieu.daude@gmail.com> wrote:
> > > We need the DEBUG profile to ensure the bios-tables-tests work.
> > > 
> > > If you want to boot a guest using EDK2, you should use the images
> > > build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> > > not these images.
> > 
> > Do we have any other images in pc-bios that are silently
> > "do not use these images, they are only for a very specific
> > test case and nothing else" ?
> 
> I might try to move that to test/. Gerd, are you OK with that?
> 
> > Also, "make install" installs these EDK2 images, which doesn't
> > seem like the right thing for "this is only for one test case".
> 
> Well I'd prefer we never had them installed. Today I don't remember
> why it ended that way. Gerd, similarly, are you OK with not installing
> these images (after a 2 release deprecation warning)?

If we didn't install them, wouldn't that mean people using QEMU upstream
would not have all the pieces needed to use AAch64 virt, without now
building EDK2 themselves. That feels wrong/bad to me, given we ship
firmware needed to use everything else.

I don't disagree with recommendation that most people are better off
using distro built QEMU + EDK, but if someone chooses to use a upstream
QEMU I feel it ought to come with firmware needed to make it work with
all targets we support.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


