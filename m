Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF94BFFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:08:33 +0100 (CET)
Received: from localhost ([::1]:53368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYeO-0002Ph-L2
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMYBa-000625-Rw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:38:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMYBZ-0000v8-3D
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645547924;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYa4rHDhYe14xmC6555n1VmRCeOY76oa4WNCVke9MWk=;
 b=ffauRHi48s4E06LIgugjg/LTT95gFvP3LPtbhRxW3/OvnmuXaFsFgFXR8QcdX+4/LZobBt
 jqum/onCTju/9PhxLal4oiyjp8DKD0ROUZKvuC5oS8nxqLQsWttVVGvd1xeNNPRTi1hBTS
 /mb7Xqlk8ospjeUKtWS0q6c2PZ030cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-n-nHbnUDOoC3-ZeOPZv5AQ-1; Tue, 22 Feb 2022 11:38:31 -0500
X-MC-Unique: n-nHbnUDOoC3-ZeOPZv5AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3624D100CC84;
 Tue, 22 Feb 2022 16:38:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD182348B8;
 Tue, 22 Feb 2022 16:38:25 +0000 (UTC)
Date: Tue, 22 Feb 2022 16:38:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhURfqMvRT4xbiz6@redhat.com>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <878ru2nacq.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Oleg Vasilev <me@svin.in>,
 Idan Horowitz <idan.horowitz@gmail.com>, Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Hi,
> >
> > TL;DR:
> >
> >   - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> 
> Laszlo,
> 
> Would it be possible to do a less debug enabled version of EDK2 on the
> next update to pc-bios/edk2-*?

NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
an EDK2 contributor taking over from Lazslo in EDK2 community

> 
> >
> > So my working theory is:
> >
> >   - booting with EFI leaves a number stale code pages
> >   - as the kernel boots it clears these pages triggering lots of
> >     slow-path writes
> >   - result very slow boot
> >
> > I think the only real solution is to improve our TB invalidation code
> > but perhaps another approach would be to detect a high TB invalidation
> > churn and just tb_flush the whole thing and start again?
> >
> > Any thoughts or ideas?
> 
> 
> -- 
> Alex Bennée
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


