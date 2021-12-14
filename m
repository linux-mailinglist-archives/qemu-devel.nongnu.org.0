Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E089147462A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:16:03 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9X9-0004bz-1l
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:16:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx9Tu-0002Y0-Ql
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:12:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx9Tt-0002uI-AJ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639494760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvdXRc+rOFm3yqp0Ylw0/O1/vkSv22zLKuNOlLWn4kA=;
 b=geBxv4M0uW9cSf3v6n7RZnZ9Tmx0Xi1PCzsN+GU0Hs56zQGIh6Vz2tKHa5shNTt37bD5+f
 tmj0bsHYaxtGphjj99wVva33wU5y5k3CYubsBXznkEPlJb9lIrCTYm8eaf9ikeQm9wVVSY
 SmmT0+HL96B6yERir6oEwqGXMk+Oj8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-of1a1yGXPhCtpl-Xtpd56w-1; Tue, 14 Dec 2021 10:12:33 -0500
X-MC-Unique: of1a1yGXPhCtpl-Xtpd56w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC75C190B2A1;
 Tue, 14 Dec 2021 15:12:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78EF9100EBB8;
 Tue, 14 Dec 2021 15:12:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0621E113865F; Tue, 14 Dec 2021 16:12:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
 <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
 <Ybigt8LMt20L1AqS@redhat.com>
 <B3F81D50-DB24-40EE-BB36-F17FCC3394F0@greensocs.com>
 <Ybiwhfbs+j7RzNrj@redhat.com>
Date: Tue, 14 Dec 2021 16:12:29 +0100
In-Reply-To: <Ybiwhfbs+j7RzNrj@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 14 Dec 2021 14:56:05 +0000")
Message-ID: <87ilvrp6ea.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?M?= =?utf-8?Q?arc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Dec 14, 2021 at 03:42:52PM +0100, Mark Burton wrote:
>> I think we=E2=80=99re talking at cross purposes, and probably we agree (=
not sure). I=E2=80=99ll top quote to try and explain my point of view.
>>=20
>> I think there are two discussions being mixed:
>> 1/ A discussion about improving the CLI. (Having a new one, etc etc)
>> 2/ A discussion about supporting a low level, and complete, API that can=
 be used by =E2=80=9Cmanagement layers=E2=80=9D (QAPI).
>>=20
>> I think this also gets mixed up with the discussion on migrating the CLI=
 to use the low level API.
>>=20
>> I want to focus on the low level API.=20
>>=20
>> I dont see why we=E2=80=99re discussing a =E2=80=98high level=E2=80=99 t=
hing when, for now, we have to support the CLI, and we have work to do on Q=
API.
>
> We're discussing both because we're setting out what our end goal is
> to be, and that end goal should be expected to cover both use cases.
>
>> If somebody wants to build a new CLI, with a new =E2=80=98high level=E2=
=80=99
>> interface, using QAPI - let them!
>
> This is too weak of a statement, as it implies that a replacement
> high level interface is optional and not important for the overall
> project. I don't believe that to be the case, so I'm saying that
> our design & impl plan has to demonstrate how we intend to cover
> both deliverables or use cases. We can't simply ignore the high
> level API saying it is someone else's problem to worry about.

Seconded.


