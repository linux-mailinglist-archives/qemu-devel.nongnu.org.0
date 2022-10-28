Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37476610797
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:01:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEeu-0004YJ-5G; Thu, 27 Oct 2022 21:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEeo-0004YB-FF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEem-0001z4-Ki
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666922375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhVyN4Jx+jw9kjTEkJl2Aig/ttiXAEtfYGkTNpe/kEU=;
 b=LJUBPQVEr9ansgNBd1M+bIO7vME5UctGVbbu/unKxHlx4KNXXjH2Zwf4NrBvdLoBLMtZAF
 39VILNc1qqQYikZBql0/Crq4iRY4gk4kXi1qaLbxLlqXitVzqYHLHjpDNSiMT38DsdXLvw
 K09EFUOUbSRlZOZUrrUv2gbg85BiOcM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-JCj0Q5X8N2OXBW9VBI5GJA-1; Thu, 27 Oct 2022 21:59:34 -0400
X-MC-Unique: JCj0Q5X8N2OXBW9VBI5GJA-1
Received: by mail-oo1-f72.google.com with SMTP id
 x18-20020a4aea12000000b00496ecd6046eso1187464ood.14
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 18:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhVyN4Jx+jw9kjTEkJl2Aig/ttiXAEtfYGkTNpe/kEU=;
 b=H9NEqZ7lpwMM3dl8mkmRj6oID5mdYXNgmVISlkGI2ig51SvRyzJrninCHN6F6RPN71
 g70Kk0CAEVwhAbK5W1ap53wU+ZuNHMvTQSgnXyyWCr2vFTRVBt76GSr/RQL3mwYEQ0to
 n4CNp7VnOtRlHkL9MCO9J5oU8awGsW2FJNSoq++2OzECnzOXEvc812WrY/N7eXM2Noy0
 YRMCSbLRumd5cH1e4PnLPDpkzT3zzL7vqEmqU5qgkJMhCOqgBB1hfqU/COzNU85vixLI
 My1bEnDbezOEE4si4X2x8dMUI7i44pgVL9NnW/KmkIGa5c/A6Xgzvo/aq73bp4YhosXP
 RaBw==
X-Gm-Message-State: ACrzQf1HM/TiKCkqqBRaFh/kpig1ao1fKjTc6afHFCbNNeOx7UbGGilq
 Q4leayA2DhebKK6OlUepzQLcdWF10pTB+2l9L6TbkYdvPJ2IRd9JH5OmX3J75svX1E1wimAosom
 VFgu+BxZzqgQGJ8qEiQY/KQrNMWlUbkE=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr7329045oab.280.1666922373705; 
 Thu, 27 Oct 2022 18:59:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QbZKCzSIdWC9x1tzT3TdmpUThsTs2su/lFXYblMCf0YOj2glqO1Sla8lA0Cu1UyU8PGcagRtBHyi9Eq88oco=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr7329029oab.280.1666922373472; Thu, 27
 Oct 2022 18:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221003100612.596845-1-berrange@redhat.com>
 <Y1pi7iAuehFGZc6w@redhat.com>
In-Reply-To: <Y1pi7iAuehFGZc6w@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 09:59:22 +0800
Message-ID: <CACGkMEukZBe9eGTSGxbrW14FWZnY0GTsv-ZYzQGRJZ2M_4z2Zg@mail.gmail.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 6:52 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> ping: Jason, are you willing to queue this since it has two
> positive reviews.
>

Yes, I've queued this.

Thanks

> On Mon, Oct 03, 2022 at 11:06:12AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > The current message when using '-net user...' with SLIRP disabled at
> > compile time is:
> >
> >   qemu-system-x86_64: -net user: Parameter 'type' expects a net backend=
 type (maybe it is not compiled into this binary)
> >
> > An observation is that we're using the 'netdev->type' field here which
> > is an enum value, produced after QAPI has converted from its string
> > form.
> >
> > IOW, at this point in the code, we know that the user's specified
> > type name was a valid network backend. The only possible scenario that
> > can make the backend init function be NULL, is if support for that
> > backend was disabled at build time. Given this, we don't need to caveat
> > our error message with a 'maybe' hint, we can be totally explicit.
> >
> > The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> > user friendly error message text. Since this is not used to set a
> > specific QAPI error class, we can simply stop using this pre-formatted
> > error text and provide something better.
> >
> > Thus the new message is:
> >
> >   qemu-system-x86_64: -net user: network backend 'user' is not compiled=
 into this binary
> >
> > The case of passing 'hubport' for -net is also given a message remindin=
g
> > people they should have used -netdev/-nic instead, as this backend type
> > is only valid for the modern syntax.
> >
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >
> > NB, this does not make any difference to people who were relying on the
> > QEMU built-in default hub that was created if you don't list any -net /
> > -netdev / -nic argument, only those using explicit args.
> >
> >  net/net.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 2db160e063..8ddafacf13 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netde=
v, bool is_netdev, Error **errp)
> >      if (is_netdev) {
> >          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NIC ||
> >              !net_client_init_fun[netdev->type]) {
> > -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> > -                       "a netdev backend type");
> > +            error_setg(errp, "network backend '%s' is not compiled int=
o this binary",
> > +                       NetClientDriver_str(netdev->type));
> >              return -1;
> >          }
> >      } else {
> >          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NONE) {
> >              return 0; /* nothing to do */
> >          }
> > -        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT ||
> > -            !net_client_init_fun[netdev->type]) {
> > -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> > -                       "a net backend type (maybe it is not compiled "
> > -                       "into this binary)");
> > +        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT) {
> > +            error_setg(errp, "network backend '%s' is only supported w=
ith -netdev/-nic",
> > +                       NetClientDriver_str(netdev->type));
> > +            return -1;
> > +        }
> > +
> > +        if (!net_client_init_fun[netdev->type]) {
> > +            error_setg(errp, "network backend '%s' is not compiled int=
o this binary",
> > +                       NetClientDriver_str(netdev->type));
> >              return -1;
> >          }
> >
> > --
> > 2.37.3
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


