Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18859336FD6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:22:29 +0100 (CET)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKISW-0002XX-Na
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lKIRb-0001xK-A9
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lKIRX-0006Fw-1B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=970qm4hwZ2zwEvWb2oKs8qK2FoGDx8y39bxuwWrifGw=;
 b=CPunI40+qDkOGaBRMgw0DdMBIjZY5+yZxsleIBYZm5CpkqdL9lMRSC7ZVVpwMin3K5JCXL
 k/I/0wgCvmuqauQXQ9iUrzI/IkE+yfLeEW4k/kR5wBSsKMIbdg1Spre/vb/44vTXB8bOcM
 KnAZ7D+KZh9Cpya0hy3a5hxWWyni2uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-VR8QuulSOjawhfAR1FsZ_A-1; Thu, 11 Mar 2021 05:21:19 -0500
X-MC-Unique: VR8QuulSOjawhfAR1FsZ_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E901710866A5;
 Thu, 11 Mar 2021 10:21:17 +0000 (UTC)
Received: from gondolin (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 262F660BF3;
 Thu, 11 Mar 2021 10:21:12 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:21:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG
 condition-code-option bit
Message-ID: <20210311112110.74fd6122.cohuck@redhat.com>
In-Reply-To: <204A69C9-45EF-4613-8BC4-E2CF18E63180@redhat.com>
References: <5630635a-f605-dd73-4b06-844988f17dc6@redhat.com>
 <204A69C9-45EF-4613-8BC4-E2CF18E63180@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, 10 Mar 2021 21:49:22 +0100
David Hildenbrand <david@redhat.com> wrote:

> > Am 09.03.2021 um 22:05 schrieb Thomas Huth <thuth@redhat.com>:
> >=20
> > =EF=BB=BFOn 04/03/2021 09.10, David Hildenbrand wrote: =20
> >>> On 03.03.21 22:36, Richard Henderson wrote:
> >>> On 3/3/21 1:22 PM, David Hildenbrand wrote: =20
> >>>>  =20
> >>>>> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson=
@linaro.org>:
> >>>>>=20
> >>>>> =EF=BB=BFOn 3/3/21 1:11 PM, David Hildenbrand wrote: =20
> >>>>>> MMIO on s390x? :) =20
> >>>>>=20
> >>>>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
> >>>>>  =20
> >>>>=20
> >>>> ... part of system address space where a CPU could stumble over it? =
=20
> >>>=20
> >>> Impossible to tell within 3 layers of object wrappers.  :-(
> >>> I suppose I have no idea how "pci" was hacked onto s390x. =20
> >> You've used the right words to describe "pci" (!) on s390x.
> >> IIRC, there is no MMIO: configuration space accesses etc. are performe=
d using special access instructions - which will "emulate" the MMIO access =
performed on other archs via simple read/write instructions.
> >> Ordinary instructions (e.g., mvpg) that operate on the system address =
space should never stumble over MMIO regions - because that concept does no=
t exist on s390x. =20
> >=20
> > Sorry, guys, you've lost me here ... is there now something left to do =
for this patch or is it good as it is? =20
>=20
> I think that check for invalid TLB should be replaced by a check against =
host =3D=3D NULL.
>=20

Just a reminder that softfreeze is on Tuesday next week, and I'd like
to send a pull request by Monday. So a v5 should arrive soon to make it
:)


