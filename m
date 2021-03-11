Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D695A336DFC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:40:34 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGrx-00046B-UO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKGpy-0002eX-R7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKGpw-0001Ax-12
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615451907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9n+y5vf0XDU1h0ox29pau6IJVaK+f1DQ02kA+jh9RxY=;
 b=Ek+CEnQCZE6cZr4/NFDV8MklYxAH+PEkcGLUM/qXEu4S7BdMJA9i38mkOJpxuGgZLjmIRj
 gfvNevHmNdzzsA0uhDKbJYbdCxwnH5Nik7Wr9hztVppUm4Is4qOM+s+STmj92iKjP/UNLK
 AUaoz7VZlun/T6tOBOCd7gD8FgBDKTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-O89QGLbSOvGGLh48YSmK-A-1; Thu, 11 Mar 2021 03:38:23 -0500
X-MC-Unique: O89QGLbSOvGGLh48YSmK-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A72D5100C661;
 Thu, 11 Mar 2021 08:38:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75AE85C1CF;
 Thu, 11 Mar 2021 08:38:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEAB11132C12; Thu, 11 Mar 2021 09:38:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-4-thuth@redhat.com>
Date: Thu, 11 Mar 2021 09:38:20 +0100
In-Reply-To: <20210310173323.1422754-4-thuth@redhat.com> (Thomas Huth's
 message of "Wed, 10 Mar 2021 18:33:22 +0100")
Message-ID: <87y2euqe4j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> When trying to remove the -usbdevice option, there were complaints that
> "-usbdevice braille" is still a very useful shortcut for some people.
> Thus we never remove this option. Since it's not such a big burden to
> keep it around, and it's also convenient in the sense that you don't
> have to worry to enable a host controller explicitly with this option,
> we should remove it from he deprecation list again.
>
> However, there is one exception: "-usbdevice audio" should go away, since
> audio devices without "audiodev=..." parameter are also on the deprecation
> list and you cannot use "-usbdevice audio" with "audiodev".
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I accept the complaint that the replacement of "-usbdevice braille" is
less convenient.  This is not the case for the -usbdevice tablet, mouse,
keyboard, ccid, and wacom-tablet.  It is arguably the case for disk,
serial, net, and host, yet we removed those anyway, to make the regular
and more expressive interface the only one.

Perhaps braille is special enough to justify sugar.  Paolo wrote:

    Braille is worth a special case because a subset of our user base
    (blind people) will use it 100% of the time, plus it is not
    supported by libvirt and hence virt-manager

I'm not against extending the grace period to give libvirt (and hence
virt-manager) more time to transition to the regular interface.  For
libvirt, the regular (and often more expressive) interface is almost
always preferable to sugared interfaces.

I'm not even against braille sugar if our human users of braille truly
need it, as long as it's reasonably unobtrusive.  Straightforward macro
expansion is.

However, "braille is special" is only an argument for *braille* sugar.
It doesn't extend to -usbdevice tablet, mouse etc.  I am against
undeprecating these.

If we decide we want braille sugar, we then need to decide whether it
should be -usbdevice braille or something else, like -braille.

If we decide we want something else, keep -usbdevice braille deprecated
until something else is ready, then keep it deprecated for a sensible
grace period, then remove it.  Flip-flopping deprecation in between is
not helpful.

If we can't make up our minds, keep it deprecated until we do.

Only if we decide the sugar should remain -usbdevice braille, we should
undeprecate it now.

The road to the CLI hell we're in is paved with "convenience".


