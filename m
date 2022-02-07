Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F234ABA67
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:28:39 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2CE-0002zE-6b
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH26O-00008p-R7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:22:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH26L-0008B0-AP
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644232951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0vVV19TZA5yW+DowytJy45fL6L1lqYWLHajNdDyyhA=;
 b=eC63Qf65vM+PnEsnQvk/OpEOEk/1mLfDCyzpydyDhW5A9/SVjmLitQEaVFSmJ95kOOXHkz
 4bbDhCRcFtDBcq4zqOqV20I4W7FkHvEUq5qrN3bJftvp3BMSNybOBeOuQrfJn6ntj4T45D
 bXrXz/FePr3ul5wymEeJBfaBC9imRsM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-C6xqFNfaMbaOWonVQmEqBA-1; Mon, 07 Feb 2022 06:22:25 -0500
X-MC-Unique: C6xqFNfaMbaOWonVQmEqBA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn20-20020a05640222f400b0040f8cdfb542so201300edb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0vVV19TZA5yW+DowytJy45fL6L1lqYWLHajNdDyyhA=;
 b=EZH9pJ5XTrJHgk2KtPqRklZ4rKR8KpBTMEbhlxjYqROsyG/rlvuE7fSE38MPrR+sC9
 qJHreVGBrnEhhn8MuH2hwLMUz3kvvrSn3+AJ6bpptGG37LKO8uqPSn4PsjSVVx7DU7YA
 EOi3XW0CfBfH+IhFLSg4Nosz1I20+1fkdJ5NQRIOvepOXhICYjg35V76xvUUJ4nOJjTE
 jBsWDCGhwKG0K6vDfifurhQuDPsx+AbQC8lO5YI2bkfcQ+dfPebnAh4l/mgum5bljW48
 L7+/kvhCcEnM3ysnkjuRh5SPArhc3q1yoZD7/Tf7NazKhryzDi9KUzV5grCqiQAxoye3
 pWpg==
X-Gm-Message-State: AOAM5320oubG1OsgK5pvyw+qbZLjMv716XNqgfqTO1OuvQy+QuzgLCqo
 NKpcN/JKHL6RB7L1dkmK4rOvAF6j3lspsOKrnN+TyX4yuGdNZv1sdeeFGfBGUdLU0914Z5tWx/D
 2CGi6gviryWgW3MM=
X-Received: by 2002:a17:907:1b07:: with SMTP id
 mp7mr9620901ejc.390.1644232944285; 
 Mon, 07 Feb 2022 03:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxF0odOGo/B1Xsy9LIzlbXwbQnasGzimKlry31oCB/XklNX0OkQ7QxuyOqEQIIx+aGzVtTpA==
X-Received: by 2002:a17:907:1b07:: with SMTP id
 mp7mr9620877ejc.390.1644232944100; 
 Mon, 07 Feb 2022 03:22:24 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id qk26sm1714361ejb.145.2022.02.07.03.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:22:23 -0800 (PST)
Date: Mon, 7 Feb 2022 12:22:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <20220207122222.58903ec7@redhat.com>
In-Reply-To: <YgDoKlkP9Isdjnv8@angien.pipo.sk>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 10:36:42 +0100
Peter Krempa <pkrempa@redhat.com> wrote:

> On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > On Mon, 7 Feb 2022 09:14:37 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >  =20
> > > On Sat,  5 Feb 2022 13:45:24 +0100
> > > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > >  =20
> > > > Previously CPUs were exposed in the QOM tree at a path
> > > >=20
> > > >   /machine/unattached/device[nn]
> > > >=20
> > > > where the 'nn' of the first CPU is usually zero, but can
> > > > vary depending on what devices were already created.
> > > >=20
> > > > With this change the CPUs are now at
> > > >=20
> > > >   /machine/cpu[nn]
> > > >=20
> > > > where the 'nn' of the first CPU is always zero.   =20
> > >=20
> > > Could you add to commit message the reason behind the change? =20
> >=20
> > regardless, it looks like unwarranted movement to me
> > prompted by livirt accessing/expecting a QOM patch which is
> > not stable ABI. I'd rather get it fixed on libvirt side.
> >=20
> > If libvirt needs for some reason access a CPU instance,
> > it should use @query-hotpluggable-cpus to get a list of CPUs
> > (which includes QOM path of already present CPUs) instead of
> > hard-codding some 'well-known' path as there is no any guarantee=20
> > that it will stay stable whatsoever. =20
>=20
> I don't disagree with you about the use of hardcoded path, but the way
> of using @query-hotpluggable-cpus is not really aligning well for how
> it's being used.
>
> To shed a bit more light, libvirt uses the following hardcoded path
>=20
> #define QOM_CPU_PATH  "/machine/unattached/device[0]"
>=20
> in code which is used to query CPU flags. That code doesn't care at all
> which cpus are present but wants to get any of them. So yes, calling
> query-hotpluggable-cpus is possible but a bit pointless.

Even though query-hotpluggable-cpus is cumbersome
it still lets you avoid hardcodding QOM path and let you
get away with keeping "_400 QMP calls" probing while
something better comes along.


> In general the code probing cpu flags via qom-get is very cumbersome as
> it ends up doing ~400 QMP calls at startup of a VM in cases when we deem
> it necessary to probe the cpu fully.
>=20
> It would be much better (And would sidestep the issue altoghether) if we
> had a more sane interface to probe all cpu flags in one go, and ideally
> the argument specifying the cpu being optional.
>=20
> Libvirt can do the adjustment, but for now IMO the path to the first cpu
> (/machine/unattached/device[0]) became de-facto ABI by the virtue that
> it was used by libvirt and if I remember correctly it was suggested by
> the folks dealing with the CPU when the code was added originally.
I would've argued against that back then as well,
there weren't any guarantee and I wouldn't like precedent of
QOM abuse becoming de-facto ABI.
Note: this patch breaks this so called ABI as well and introduces
yet another harcodded path without any stability guarantee whatsoever.

>=20
> Even if we change it in libvirt right away, changing qemu will break
> forward compatibility. While we don't guarantee it, it still creates
> user grief.
>=20


