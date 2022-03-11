Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C525E4D6477
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:23:00 +0100 (CET)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSh6Z-0003b5-Ua
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSglV-0002Ev-Fh
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSglK-0002xe-FS
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647010861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvZvYdhSGG6DPKYtnXYvZ1fKv4aw7t9Xx0wXbrtqW2Q=;
 b=edGRKkkWpwEDF1UI6Dc+7usaaVORoF5xZmsS+fxqoR9oZk9Fp9Jup002THzjpD6jakm9vB
 x8cy6Zn8MPt3peLuBljnFTFH/mSTcv5oBjrtyoQj/JAVNd4MsN+HVvU41UJunB2+ts61lv
 SvaL3FvRgMBQmGW3EtH/iDVb4WPyf7g=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-NLC466PdO820PKKYtljCVg-1; Fri, 11 Mar 2022 10:00:58 -0500
X-MC-Unique: NLC466PdO820PKKYtljCVg-1
Received: by mail-oo1-f71.google.com with SMTP id
 t31-20020a4a96e2000000b00320f7e020c3so6833439ooi.13
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 07:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DvZvYdhSGG6DPKYtnXYvZ1fKv4aw7t9Xx0wXbrtqW2Q=;
 b=mu/UmRXHib8WIjXP02smSe+xLigACy61JxbS9Sb2o2IuDd1EXPYEadNHX95nIZAuhY
 hhXBu+J1QRrimnQEETlNd06Mj6UTYttTgIn0ZsntQtOFGqK1722w0FfFFiu89mcsVukv
 YUGYJplkx7TPLEz01RnBjtrvg24P/z3gb9npC9fhmiX0Rz0xnlbWXO/KJVxBKrkyazQa
 RaThxD28oNf6AjY6O8E8n5RAyN25eNRDx0im8TacGvEDrMGaRn45P9mwp1Aj5kR9Ya2M
 LENnu5vh6nF3AliNuupywfTLgpkQBAA82E6vsPOBQRh9a+AR+/PxXl1lly8ieB78sm/k
 D1nA==
X-Gm-Message-State: AOAM531sJjXw+XAvlOnKtKEKjTYHwNdOb5nanePEkADHsQl16sIn6sEg
 jcAqZ116SvSMc9JtgEuJdtNZjhS2zCfY4i6Cv9LTfPBum5Miy1vE/S9k4UdK2d1EMc7e4QvVlp9
 IiqXA1etrLVpHgGc=
X-Received: by 2002:a05:6870:5a4:b0:da:b3f:2b17 with SMTP id
 m36-20020a05687005a400b000da0b3f2b17mr11220341oap.182.1647010858065; 
 Fri, 11 Mar 2022 07:00:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpy2oGDcbrV6agnH8UmISZF59edpD9ibYfHqu1hNa+Gxf+YCtroZXQF9EHHLYhy/pNu5CoDQ==
X-Received: by 2002:a05:6870:5a4:b0:da:b3f:2b17 with SMTP id
 m36-20020a05687005a400b000da0b3f2b17mr11220304oap.182.1647010857292; 
 Fri, 11 Mar 2022 07:00:57 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 q125-20020acac083000000b002da28e15501sm3747692oif.13.2022.03.11.07.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:00:56 -0800 (PST)
Date: Fri, 11 Mar 2022 12:00:54 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH] tests/avocado: starts PhoneServer upfront
Message-ID: <20220311150054.tfn4wtbzm6uhflcu@laptop.redhat>
References: <20220311130919.2120958-1-bleal@redhat.com>
 <875yokpnbn.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <875yokpnbn.fsf@p50.localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 09:28:24AM -0500, Cleber Rosa wrote:
> 
> Beraldo Leal <bleal@redhat.com> writes:
> 
> > Race conditions can happen with the current code, because the port that
> > was available might not be anymore by the time the server is started.
> >
> > By setting the port to 0, PhoneServer it will use the OS default
> > behavior to get a free port, then we save this information so we can
> > later configure the guest.
> >
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Beraldo Leal <bleal@redhat.com>
> > ---
> >  tests/avocado/avocado_qemu/__init__.py | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> > index 9b056b5ce5..e830d04b84 100644
> > --- a/tests/avocado/avocado_qemu/__init__.py
> > +++ b/tests/avocado/avocado_qemu/__init__.py
> > @@ -602,9 +602,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
> >          self.log.info('Preparing cloudinit image')
> >          try:
> >              cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> > -            self.phone_home_port = network.find_free_port()
> > -            if not self.phone_home_port:
> > -                self.cancel('Failed to get a free port')
> > +            if not self.phone_server:
> > +                self.cancel('Failed to get port used by the PhoneServer.')
> 
> Can you think of a condition where `self.phone_server` would not
> evaluate to True?  `network.find_free_port()` could return None, so this
> check was valid.  But now with `cloudinit.PhoneHomeServer`, I can not
> see how we'd end up with a similar condition.  Instantiating
> `cloudinit.PhoneHomeServer` where a port can not be alloccated, AFAICT,
> would raise a socket exception instead.

Since this is a public method and could be called anytime before
set_up_cloudinit(), I decided to keep the check just for safety reasons.
Ideally, I would prefer not to have this dependency and add a new
argument, but I didn't want to change the method signature since it
would be required.

> Also, the name of the utility class is PhoneHomeServer.  Using a
> different name in the message will make cross references into the
> Avocado docs harder.
> 
> Finally, a nitpick: I'd drop the leading dot in such a test cancelation
> message.

Makes sense.

> Other than those points, the direction of those changes are indeed a
> great improvement.

Thank you all, I will also remove the unused 'network' import on a v2,
that I just notice after sending the patch.

--
Beraldo


