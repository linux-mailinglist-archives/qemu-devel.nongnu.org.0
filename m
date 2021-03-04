Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D598E32CE43
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:19:00 +0100 (CET)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHjCF-0001bB-UV
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHjAo-0000tT-NT
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHjAn-0005Fe-9y
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614845848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWdBk/iKw5qY0BtRv78ztEZTCDNpDo7hXIW0NcOhvZ8=;
 b=EE1tRR5OvloMN113XzJzO+To/0LpnAjCScpSVEIbrXmhCVvmtZhBskdpxafMzVNWR3RMMe
 HJxoezzvY6iVIOAatZDPRH17DI0Bn34ZHtFlNrCvWGle2KEoKEzyx0ASh/7vIBQcpWpb3D
 8JNvknVV0x9CqDWA45FowFAgtmne2b8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Hxy3JdwkPGOjogwwya1-Gw-1; Thu, 04 Mar 2021 03:17:25 -0500
X-MC-Unique: Hxy3JdwkPGOjogwwya1-Gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 440DF107ACC7;
 Thu,  4 Mar 2021 08:17:24 +0000 (UTC)
Received: from gondolin (ovpn-113-67.ams2.redhat.com [10.36.113.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A41D7614F5;
 Thu,  4 Mar 2021 08:17:19 +0000 (UTC)
Date: Thu, 4 Mar 2021 09:17:16 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG
 condition-code-option bit
Message-ID: <20210304091716.1588c492.cohuck@redhat.com>
In-Reply-To: <67723c0d-eb1b-a69c-794d-67d2c31269ac@redhat.com>
References: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
 <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
 <0ac4007e-001b-73b5-8023-fbfc9ef94eed@linaro.org>
 <67723c0d-eb1b-a69c-794d-67d2c31269ac@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 09:10:44 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 03.03.21 22:36, Richard Henderson wrote:
> > On 3/3/21 1:22 PM, David Hildenbrand wrote: =20
> >> =20
> >>> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson@l=
inaro.org>:
> >>>
> >>> =EF=BB=BFOn 3/3/21 1:11 PM, David Hildenbrand wrote: =20
> >>>> MMIO on s390x? :) =20
> >>>
> >>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
> >>> =20
> >>
> >> ... part of system address space where a CPU could stumble over it? =
=20
> >=20
> > Impossible to tell within 3 layers of object wrappers.  :-(
> > I suppose I have no idea how "pci" was hacked onto s390x. =20
>=20
> You've used the right words to describe "pci" (!) on s390x.
>=20
> IIRC, there is no MMIO: configuration space accesses etc. are performed=
=20
> using special access instructions - which will "emulate" the MMIO access=
=20
> performed on other archs via simple read/write instructions.

Yes, it's all specialized instructions. (QEMU emulates one set, there's
a newer one supported by the Linux kernel that is a bit more mmio-like
in semantics, but I don't know the details.)

>=20
> Ordinary instructions (e.g., mvpg) that operate on the system address=20
> space should never stumble over MMIO regions - because that concept does=
=20
> not exist on s390x.
>=20

That's my understanding as well.


