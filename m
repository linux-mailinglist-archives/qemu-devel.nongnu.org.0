Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AD36C14C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:54:54 +0200 (CEST)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJUb-0001Op-Ck
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbJTQ-0000yd-4S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbJTM-0008Hw-07
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619513614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5ophWe4PFnMhGy0T3ysJ7azuqJaeXJebLsAWygGb64=;
 b=OKwnzctmffv48Fs3vQvk/Q0ohazA1A6g9NLlVSxLwfB5bdWHnJNKTkKJIo5JwLr0GQIWer
 iODF99+tBp7WbIrUTlPoru1ONvdZsH0LiZp/jfNwhrDnIZh9eXPzATfWrNAhXfVZ+16wPN
 ROI5tMaootQDz4sNCIa2hm3IGC+OtMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-8UAGZ88_OFuIzJFGxiAuZg-1; Tue, 27 Apr 2021 04:53:31 -0400
X-MC-Unique: 8UAGZ88_OFuIzJFGxiAuZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECF576D246;
 Tue, 27 Apr 2021 08:53:30 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C24160CFB;
 Tue, 27 Apr 2021 08:53:22 +0000 (UTC)
Date: Tue, 27 Apr 2021 09:53:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
Message-ID: <YIfRAKDvfZyOWrEL@work-vm>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com>
MIME-Version: 1.0
In-Reply-To: <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, joe.jin@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dongli Zhang (dongli.zhang@oracle.com) wrote:
>=20
>=20
> On 4/22/21 11:01 PM, Jason Wang wrote:
> >=20
> > =E5=9C=A8 2021/4/23 =E4=B8=8B=E5=8D=8812:47, Dongli Zhang =E5=86=99=E9=
=81=93:
> >> This is inspired by the discussion with Jason on below patchset.
> >>
> >> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-de=
vel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmB=
TF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
> >>
> >> The new HMP command is introduced to dump the MSI-X table and PBA.
> >>
> >> Initially, I was going to add new option to "info pci". However, as th=
e
> >> number of entries is not determined and the output of MSI-X table is m=
uch
> >> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patc=
h
> >> adds interface for only HMP.
> >>
> >> The patch is tagged with RFC because I am looking for suggestions on:
> >>
> >> 1. Is it fine to add new "info msix <dev>" command?
> >=20
> >=20
> > I wonder the reason for not simply reusing "info pci"?
>=20
> The "info pci" will show PCI data for all devices and it does not accept =
any
> argument to print for a specific device.
>=20
> In addition, the "info pci" relies on qmp_query_pci(), where this patch w=
ill not
> implement the interface for QMP considering the number of MSI-X entries i=
s not
> determined.
>=20
> Suppose we have 10 NVMe (emulated by QEMU with default number of queues),=
 we
> will have about 600+ lines of output.

From an HMP perspective I'm happy, so:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

but since I don't know much about MSI I'd like to see Jason's reply.

Adding an optional option to 'info pci' to limit to one device would be eas=
y
though; that bit is probably easier than adding a new command.
Figuring out the QMP representation of your entries might be harder -
and if this is strictly for debug, probably not worth it?

Dave


> Dongli Zhang
>=20
> >=20
> >=20
> >>
> >> 2. Is there any issue with output format?
> >=20
> >=20
> > If it's not for QMP, I guess it's not a part of ABI so it should be fin=
e.
> >=20
> >=20
> >>
> >> 3. Is it fine to add only for HMP, but not QMP?
> >=20
> >=20
> > I think so.
> >=20
> > Thanks
> >=20
> >=20
> >>
> >> Thank you very much!
> >>
> >> Dongli Zhang
> >>
> >>
> >>
> >=20
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


