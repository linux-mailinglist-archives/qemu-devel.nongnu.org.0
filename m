Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F933F5806
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:16:07 +0200 (CEST)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIPjC-0007uZ-M5
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIPhp-0006Sl-DF
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIPhl-00086W-VC
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629785675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG3216AH9pIsIthJl8FP/ybEa4mLRtqo0Bn5ReEliI0=;
 b=JxBkoUxdFUVDdl9lKvWPhNMSNCqu8b+p66+1KGVkZxB3Khv1f+SRZd2X6MeGuzyN4T5IfT
 bw3P7G4khIR561OjqaxKwTpdMffkP5q8vYQubgoaeKJKBeeWHC/NUJaB4yqeQNm0YX+Pvn
 WbedNwes3+W9s7nEUL8oZv3V/q4AA9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-eDK5X-z-Psi0IuCAnzRDJg-1; Tue, 24 Aug 2021 02:14:32 -0400
X-MC-Unique: eDK5X-z-Psi0IuCAnzRDJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 433558799E0;
 Tue, 24 Aug 2021 06:14:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 459FC5DA61;
 Tue, 24 Aug 2021 06:14:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3C0D11380A9; Tue, 24 Aug 2021 08:14:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Is QEMU's vmxnet3 still being used?
References: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
 <YR4b9J7jlfrd84BK@redhat.com>
Date: Tue, 24 Aug 2021 08:14:25 +0200
In-Reply-To: <YR4b9J7jlfrd84BK@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 19 Aug 2021 09:53:08 +0100")
Message-ID: <87h7ffpdxa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Leonid Bloch <leonid@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Aug 18, 2021 at 03:42:23PM +0200, Thomas Huth wrote:
>>=20
>>  Hi all,
>>=20
>> I recently noticed that we have quite a bunch of tickets against the vmx=
net3
>> device in our bug trackers, which indicate that this device could be use=
d to
>> crash QEMU in various ways:
>>=20
>>  https://gitlab.com/qemu-project/qemu/-/issues?state=3Dopened&search=3Dv=
mxnet3
>>=20
>>  https://bugs.launchpad.net/qemu?field.searchtext=3Dvmxnet3
>
> IIUC, all except 3 of those bugs, are issues from the device fuzzer.
>
> It is nice that we find those, but if we don't consider this a device
> targetted at virtualization use cases, I don't think they're a reason
> to remove the device.
>
>> Having hardly any knowledge about this device and its usage at all, I wo=
nder
>> how much it is still used out there in the wild? If there are still many
>> users of this device, is there anybody interested here in helping to get
>> these crashes fixed in the near future? Otherwise, should we maybe rathe=
r
>> mark this device as deprecated and remove it in a couple of releases? Wh=
at
>> do you think?
>
> We've got countless NIC models in QEMU most of which have minimal users,
> are possibly buggy, not actively maintained, but exist to support
> non-virtualization use cases. We've especially not had "how many users
> are there" as a criteria for acceptance or removal of a device.

I accept "good enough for intended use", and that certain kinds of bugs
are much less serious in emulation use than in virtualization use.

Still, there's a difference between "possibly buggy" and "perennially
unmaintained / can't even be bothered to fix known bugs".  Why should we
carry code that isn't of sufficient interest to anyone to motivate basic
care?

Moreover, having drastically different code quality requirements in the
tree is problematic.  Compounded by them being less than obvious.  If
people knew nobody cared for bugs in hw/mumble/mutter.c, they could save
themselves the trouble of fuzzing or otherwise examining it.  They might
even be dissuaded from copying (quite possibly bad) code from it.

I do believe the way we operate promotes misallocation of (scarce)
resources.


