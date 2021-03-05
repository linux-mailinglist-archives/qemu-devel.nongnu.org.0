Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16C32E39D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 09:26:28 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI5n1-0002cP-2A
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 03:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI5m8-000286-Lv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 03:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI5m4-0002eO-PL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 03:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614932727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3AME8A75jubRmsUN+ozaeKiSax9VFX6qRsHEVOR3lQ=;
 b=UKYJMhi8wY6RVEN+K+tMPCwiNmzWISPukhRxIEym3NUDJVZL/W0+eSPEke/aXVBYkKsrSl
 FT1ODYroLNNP/uAlE9ypd9M+MVbYirr53yWRQjbpW1/Q+L+9R/c/Tz36SJZqPS7Y48qcIq
 FZZFxUDHFEEhHOZgNHSpFDwkJOvDoW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-6Lu2hQxdMYWS2dVRMY9uww-1; Fri, 05 Mar 2021 03:25:25 -0500
X-MC-Unique: 6Lu2hQxdMYWS2dVRMY9uww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71B4010866A4;
 Fri,  5 Mar 2021 08:25:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8EDE5C1B4;
 Fri,  5 Mar 2021 08:25:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4D231132C12; Fri,  5 Mar 2021 09:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
Date: Fri, 05 Mar 2021 09:06:45 +0100
In-Reply-To: <87v9a7dmfk.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 04 Mar 2021 15:26:55 +0100")
Message-ID: <87lfb29g8a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
>> On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
>>> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
>>> configuring floppies with -global isa-fdc" (v5.1.0).
>>>=20
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
[...]
> Sadly, the commit's update of docs/system/deprecated.rst neglects to
> cover this use.  Looks the series overtaxed my capacity to juggle
> details; my apologies.
[...]

I'm talking about commit 4a27a638e7 here.

The deprecated.rst text only covers setting floppy controller properties
with -global.  It neglects to cover setting them with -device.  For
onboard controllers, -global is the only way to set them.

I append a fixup.

We can put it before this patch.  This patch then moves the fixed up
text to removed-features.rst.

Or we squash it into this patch, i.e. this patch deletes the flawed text
from deprecated.rst and adds the fixed up text to removed-features.rst.

Got a preference?



diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 2fcac7861e..393ede47f1 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -97,7 +97,11 @@ QEMU 5.1 has three options:
 ``Configuring floppies with ``-global``
 '''''''''''''''''''''''''''''''''''''''
=20
-Use ``-device floppy,...`` instead:
+Floppy controllers' drive properties (since 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-device floppy,...`` instead.  When configuring onboard floppy
+controllers
 ::
=20
     -global isa-fdc.driveA=3D...
@@ -120,8 +124,30 @@ become
=20
     -device floppy,unit=3D1,drive=3D...
=20
-``-drive`` with bogus interface type
-''''''''''''''''''''''''''''''''''''
+When plugging in a floppy controller
+::
+
+    -device isa-fdc,...,driveA=3D...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=3D0,drive=3D...
+
+and
+::
+
+    -device isa-fdc,...,driveB=3D...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=3D1,drive=3D...
+
+``-drive`` with bogus interface type (since 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
=20
 Drives with interface types other than ``if=3Dnone`` are for onboard
 devices.  It is possible to use drives the board doesn't pick up with


