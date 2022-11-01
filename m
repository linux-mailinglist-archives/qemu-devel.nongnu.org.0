Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBB614C43
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 15:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opqpr-0005Z9-6x; Tue, 01 Nov 2022 08:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opqpo-0005Z0-Ql
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opqpn-0002Ry-2t
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667307449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIKTs6NkBlSdT8S1fH9Ak3Q/xrjiHr6oxb6O5TwqcGA=;
 b=dV4Vowx4OlshDJk55UYWG+FO/wBxk4Hv26QplMuXhKe9RbOMEi3U+jxKKIIPChr6toVjEQ
 vrH+iKNvXMT5aCmuuYDiBV5eE2bm+89C3FdU+AgNy0PxHmMErgZvvS87gH7s5+bukL3T6F
 tte37k4z2Yg5+1TfeOUdnAzF2RrOWmw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-uwKcgzWgMgSFCVeX6eyEdA-1; Tue, 01 Nov 2022 08:57:28 -0400
X-MC-Unique: uwKcgzWgMgSFCVeX6eyEdA-1
Received: by mail-qk1-f200.google.com with SMTP id
 i11-20020a05620a404b00b006eeb0791c1aso12072194qko.10
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 05:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIKTs6NkBlSdT8S1fH9Ak3Q/xrjiHr6oxb6O5TwqcGA=;
 b=f6JcIPNtG72gs25s+liXtmvi0kiW1GHFWe+LRm6uZjNO/5SIEikIGQ45stFOLxaEvQ
 wvG8biK6szP9LBf+nFPfg3kbIgqD/oI26j1Teo7fhk5/wPRK5ldiJmVnyWe68KXKe4hT
 xzOEmJZBPCCLamv80GmE1tPFMGDyTOjkyN7GDbX5aWuljTY7MNmUd6QrFJOWPXU7uC6K
 DHglKRzENjAHkX+WkEvIUcHYRKnNhZUlJWnocU0zByviWrvWgu6S2uK9QQ0mZcdyDmDO
 RUiz15mzk7UQuUI5yNaEvsuKyhhsb2IebcZTBB72hpyT8peaFUkbDtqDSk2IUE7+r4Am
 S2Fg==
X-Gm-Message-State: ACrzQf2kCCh/1l5+1EMV6ZudgpLsU3fDJ2+5ZH2zQxMAwChlfIXzhonD
 wb9WYr8AgrxuMSV0XPGgO5XijYfbPf0ct6/c4kbt+/rNM7YNwfUevClaeN8BHghOqrGpIKFLi1Y
 FD02cCzJOfYHiRAM=
X-Received: by 2002:a05:620a:1293:b0:6fa:4e62:ad8 with SMTP id
 w19-20020a05620a129300b006fa4e620ad8mr746961qki.128.1667307448255; 
 Tue, 01 Nov 2022 05:57:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7m9IKiyoPv/piuqtqnyv1efZpWe29VNhcaMO/gebl/x3O6pdsFNLgsUnAqAhH22Ov1pGCHPg==
X-Received: by 2002:a05:620a:1293:b0:6fa:4e62:ad8 with SMTP id
 w19-20020a05620a129300b006fa4e620ad8mr746950qki.128.1667307448035; 
 Tue, 01 Nov 2022 05:57:28 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05620a409400b006bbf85cad0fsm6681799qko.20.2022.11.01.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 05:57:27 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:57:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Message-ID: <20221101135724.7f89868c@fedora>
In-Reply-To: <20221031114835-mutt-send-email-mst@kernel.org>
References: <20221031131934.425448-1-berrange@redhat.com>
 <Y1/SoFxe3P2HVV3W@redhat.com>
 <20221031114835-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 11:48:58 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 31, 2022 at 01:50:24PM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Oct 31, 2022 at 01:19:30PM +0000, Daniel P. Berrang=C3=A9 wrote=
: =20
> > > The TCO watchdog is unconditionally integrated into the Q35 machine
> > > type by default, but at the same time is unconditionally disabled
> > > from firing by a host config option that overrides guest OS attempts
> > > to enable it. People have to know to set a magic -global to make
> > > it non-broken =20
> >=20
> > Incidentally I found that originally the TCO watchdog was not
> > unconditionally enabled. Its exposure to the guest could be
> > turned on/off using
> >=20
> >   -global ICH9-LPC.enable_tco=3Dbool
> >=20
> > This was implemented for machine type compat, but it also gave
> > apps a way to disable the watchdog functionality. Unfortunately
> > that ability was discarded in this series:
> >=20
> >   https://lore.kernel.org/all/1453564933-29638-1-git-send-email-ehabkos=
t@redhat.com/
> >=20
> > but the 'enable_tco' property still exists in QOM, but silently
> > ignored.
> >=20
> > Seems we should either fix the impl of 'enable_tco', or remove the
> > QOM property entirely, so we don't pretend it can be toggled anymore.
> >=20
> > With regards,
> > Daniel =20
>=20
> i am inclined to say you are right and the fix is to fix the impl.

Is there need for users to disable whatchdog at all?
It was always present since then and no one complained,=20
so perhaps we should ditch property instead fixing it
to keep it simple.

>=20
> > --=20
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :| =20
>=20


