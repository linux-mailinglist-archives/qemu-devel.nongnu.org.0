Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A035A0A9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:06:21 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrm8-0007u2-RD
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUrkX-00079o-GI
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUrkQ-0001Y1-55
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617977072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+ExAtLK4DB5ZNYsQdtarksWFCC+P5nVFywv1oMdaPo=;
 b=CYCNaen2sK/vLHlXXRyTXDsxhBex1Bqmp07puP/bMGPn9BqkmltfhvAC1Bvm3r1bygdDCU
 ISvQcnM6yg+YVoNWGda9giVxsRMzaj169vsrGFKmpwZSlvDY8GeyP4z8dl4bNSFD5kcrFT
 qp3N0dk0baYwMu4c+mIzvA8W6KKyUZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-pWT4mKoyPhmltggEI2L_Eg-1; Fri, 09 Apr 2021 10:04:29 -0400
X-MC-Unique: pWT4mKoyPhmltggEI2L_Eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF70E100A690
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 14:04:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8124C50F1A;
 Fri,  9 Apr 2021 14:04:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1F6B113525D; Fri,  9 Apr 2021 16:04:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
 <YG77DnwTyCVPL3nw@redhat.com> <87o8eo9609.fsf@dusky.pond.sub.org>
 <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
 <87czv34xzh.fsf@dusky.pond.sub.org> <YHAhQWdX15V54U8G@redhat.com>
Date: Fri, 09 Apr 2021 16:04:03 +0200
In-Reply-To: <YHAhQWdX15V54U8G@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 9 Apr 2021 10:41:21 +0100")
Message-ID: <87r1jjy2p8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Apr 09, 2021 at 11:18:42AM +0200, Markus Armbruster wrote:
>> Gerd Hoffmann <kraxel@redhat.com> writes:
[...]
>> >> Gerd, you changed device-list-properties from object_class_by_name() =
to
>> >> module_object_class_by_name() in commit 7ab6e7fcce.  Should
>> >> qom-list-properties be changed, too?
>> >
>> > Makes sense.  We already have non-device modular objects
>> > (some chardevs).
>> >
>> >> If yes, is there any reason to use
>> >> object_class_by_name() for looking up user-provided type names in QMP
>> >> commands?
>> >
>> > I've tried to be conservative and call module_object_class_by_name()
>> > only in places where it is actually needed.  Reason one being the extr=
a
>> > overhead.  But maybe this isn't too bad given the extra module code ru=
ns
>> > only on lookup failures.  Reason two is to avoid modules being loaded =
by
>> > accident even when not needed.  This needs checking when you try drop
>> > object_class_by_name().  A VM without --for example -- qxl device shou=
ld
>> > not load the qxl module.
>>=20
>> Yes, module load should be reasonably explicit, to avoid accidental
>> loading.
>>=20
>> Automatic load on use is explicit enough.
>>=20
>> Automatic load on introspection could perhaps be surprising.  I figure
>> it depends on how the introspection request is phrased.  Loading X on
>> "tell me more about X" feels okay.  Loading X on "show me all the X that
>> satisfy Y" feels iffy.
>
> IIUC, the intention is that as designed today, the existance of modules
> is supposed to be transparent to mgmt application.
>
> IOW, to a mgmt app "qemu + installed qxl module" should behaviour
> identically to "qemu + statically linked qxl".
>
> Conversely "qemu + uninstalled qxl module" should behaviour identically
> to "qemu + qxl disabled at buld time".
>
> This implies that when a mgmt app introspects QEMU for features, then
> QEMU must auto-load all modules that are needed to ensure introspection
> results match those that would be reported in non-modular build.

Since this is not the only possible design for module behavior, I'd
recomend we spell out the behavior we want in a suitable place, to avoid
misunderstandings.  Maybe we already did; if yes, pointer, please.

> If we not going to make introspetion results equivalent, then we may
> need to make modules be an explicit concept so mgmt apps can find out
> when introspection is incomplete and force loading when they need it.

They are not equivalent now.  Case in point: qom-list-properties does
not load modules.  Thus:

>> A systematic review of object_class_by_name() and
>> module_object_class_by_name() use might be advisable.


