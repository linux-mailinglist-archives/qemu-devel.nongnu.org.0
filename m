Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A97F4C14A3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:48:33 +0100 (CET)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMs0O-0001vP-66
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMrwI-0008PB-Mj
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMrwF-00044v-Rv
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645623855;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvRF6Bk2Hdl11kNRsEVHwxmqlwLQr1+buD9hdb+CiuQ=;
 b=QJBN8C6Tj0Snk0vPItKdkuF1cUsGDuLQICtJQBXbUBNEpeDEyPQF66kQftmUV1xJQlfoqs
 2SUestdHZ1RKqcd7Z7DWwRw+BMa5s7hf0GDf3LQ6Hfi6ExiY2WKN2wMJlhRjzON5JcUvSp
 WsEhuWsjIpbu7Bwn0yz2FAM8uWYijHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-dEL1MJ0-NnalQwfY-YFTDQ-1; Wed, 23 Feb 2022 08:43:55 -0500
X-MC-Unique: dEL1MJ0-NnalQwfY-YFTDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE2510247A6;
 Wed, 23 Feb 2022 13:43:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7FF84974;
 Wed, 23 Feb 2022 13:43:07 +0000 (UTC)
Date: Wed, 23 Feb 2022 13:43:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhY56KLLPrqGWtBM@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 Cleber Rosa <cleber@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Oleg Vasilev <me@svin.in>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 02:34:23PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/2/22 12:07, Daniel P. Berrangé wrote:
> > On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
> > > +Igor/MST for UEFI tests.
> > > 
> > > On 22/2/22 17:38, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
> > > > > 
> > > > > Alex Bennée <alex.bennee@linaro.org> writes:
> > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > TL;DR:
> > > > > > 
> > > > > >     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> > > > > 
> > > > > Laszlo,
> > > > > 
> > > > > Would it be possible to do a less debug enabled version of EDK2 on the
> > > > > next update to pc-bios/edk2-*?
> > > > 
> > > > NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
> > > > over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
> > > > an EDK2 contributor taking over from Lazslo in EDK2 community
> > > 
> > > We need the DEBUG profile to ensure the bios-tables-tests work.
> > 
> > Can you elaborate on what bios-tables-tests needs this for, and
> > what coverage we would loose by disabling DEBUG.
> 
> Maybe it was only required when the tests were developed...
> I'll defer that question to Igor.
> 
> > It may well be a better tradeoff to sacrifice part of bios-tables-tests
> > in favour of shipping more broadly usable images without DEBUG.
> 
> Why not, if users are aware/happy to use a unsafe image with various
> unfixed CVEs.

Note there's nothing special about EDK2 in regard of CVE fixes (or lack
thereof). The same applies to every other firmware we ship, as well as
QEMU code itself.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


