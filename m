Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5D341F7A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:33:26 +0100 (CET)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGBp-0002Yz-Sz
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGAh-0001iy-Sx
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGAe-0000Zl-BA
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEXNVq/GWnPsYXeCbfFkMPyp9eeVB7pyLnbNRfXJtl8=;
 b=GfQU3b4MC8BFi8j/SBPOWHxRS/q3+C30lStPXoydjeFCgD1B0K0zvLCZWzxRaF+DcUEPnS
 3TJEz3qDKyROSkkX0Vlhc7WfByf7G9Sq0lyTTse68K1ftXEV96+k6l+DpkUsDQ8Zk9Anvp
 LF5CBHqVmjAyDGEbJz+LsLZ2HxWqub4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-SSWbrbYtNIGChLkKkbTq_Q-1; Fri, 19 Mar 2021 10:32:10 -0400
X-MC-Unique: SSWbrbYtNIGChLkKkbTq_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B219F10082EF;
 Fri, 19 Mar 2021 14:32:08 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17D866085A;
 Fri, 19 Mar 2021 14:32:05 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:32:03 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 6/6] iotests: iothreads need ioeventfd
Message-ID: <20210319153203.433f7246.cohuck@redhat.com>
In-Reply-To: <f1e1c1ac-d688-74dc-fff4-e6b0bad78cf3@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-7-laurent@vivier.eu>
 <95209fe1-9b85-0eec-ace2-b3eff20ee88e@redhat.com>
 <b5e6476f-ae52-056b-8ac8-8a3d17118ca3@vivier.eu>
 <20210319152314.7151c275.cohuck@redhat.com>
 <f1e1c1ac-d688-74dc-fff4-e6b0bad78cf3@vivier.eu>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 15:27:24 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Le 19/03/2021 =C3=A0 15:23, Cornelia Huck a =C3=A9crit=C2=A0:
> > On Fri, 19 Mar 2021 14:51:59 +0100
> > Laurent Vivier <laurent@vivier.eu> wrote:
> >  =20
> >> Le 19/03/2021 =C3=A0 14:36, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=
=C2=A0: =20
> >>> On 3/19/21 2:25 PM, Laurent Vivier wrote:   =20
> >>>> And ioeventfd are only available with virtio-scsi-pci or virtio-scsi=
-ccw,
> >>>> use the alias but add a rule to require virtio-scsi-pci or virtio-sc=
si-ccw
> >>>> for the tests that use iothreads.
> >>>>
> >>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >>>> ---
> >>>>  tests/qemu-iotests/127        | 3 ++-
> >>>>  tests/qemu-iotests/256        | 6 ++++--
> >>>>  tests/qemu-iotests/iotests.py | 5 +++++
> >>>>  3 files changed, 11 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
> >>>> index 98e8e82a8210..abe24861100d 100755
> >>>> --- a/tests/qemu-iotests/127
> >>>> +++ b/tests/qemu-iotests/127
> >>>> @@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
> >>>>  _supported_fmt qcow2
> >>>>  _supported_proto file fuse
> >>>> =20
> >>>> -_require_devices virtio-scsi scsi-hd
> >>>> +_require_devices scsi-hd
> >>>> +_require_devices virtio-scsi-pci || _require_devices virtio-scsi-cc=
w   =20
> >>
> >> Re-reading the code, I think this cannot work because we have an "exit=
" if the test fails. =20
> >=20
> > We could try to make _require_devices accept alternatives, but that is
> > probably overkill...
> >  =20
> >>
> >> The test is executed anyway because s390x provides virtio-scsi-ccw and=
 virtio-scsi-pci. =20
> >=20
> > ...because of this.
> >=20
> > Maybe just add a comment that we require pci or ccw because iothreads
> > depend on ioventfd, but checking for pci is enough, as we have pci when
> > we have ccw?
> >  =20
>=20
> Well... bash is fun:
>=20
> _require_one_device_of()
> {
>     available=3D$($QEMU -M none -device help | \
>                 grep ^name | sed -e 's/^name "//' -e 's/".*$//')
>     for device
>     do
>         if echo "$available" | grep -q "$device" ; then
>             return
>         fi
>     done
>     _notrun "$* not available"
> }
>=20
> and:
>=20
> _require_one_device_of virtio-scsi-pci virtio-scsi-ccw
>=20
> Thanks,
> Laurent
>=20

Even better :)


