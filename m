Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A944AFE6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:00:15 +0100 (CET)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSbf-0001Hi-1U
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSaW-0000Wl-LK
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:59:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSaS-0006u4-U8
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636469940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cs2675x2rR8un3NVj2DsQTzmay+tzFtkbUJG2hNU+x0=;
 b=UodpVk8gCQrz6Swuden58CpNhR2m3byaSF3SOpoyeQ+wNA7WYLFQSwDwupgnLlCnO9Ml2n
 3UgVht2oPDAmUc0Evc2w+ZZ+NDFVmWpiYW2/CKxR6QPVbg3l9GDcK6u1krDbR6E5cZaDzG
 xZwMysTKmLWjS22/BIti9c205iRWgSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-_8_BLXDAPAaWfJFPWQAWuA-1; Tue, 09 Nov 2021 09:58:57 -0500
X-MC-Unique: _8_BLXDAPAaWfJFPWQAWuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E5D1B2C9A3;
 Tue,  9 Nov 2021 14:58:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D31F19C59;
 Tue,  9 Nov 2021 14:58:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E8E211380A7; Tue,  9 Nov 2021 15:58:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 03/19] docs/devel: document expectations for QAPI
 data modelling for QMP
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-4-berrange@redhat.com>
 <871r45p6er.fsf@dusky.pond.sub.org> <YXrAr3uTFchrH9+N@redhat.com>
 <YYKUKAJEveBv9FP+@redhat.com> <87ilx8h3wk.fsf@dusky.pond.sub.org>
 <YYOfv0buHL/9UMiy@redhat.com> <87bl2tg7dq.fsf@dusky.pond.sub.org>
 <YYpDoHn7p4XeZ90f@redhat.com>
Date: Tue, 09 Nov 2021 15:58:53 +0100
In-Reply-To: <YYpDoHn7p4XeZ90f@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 9 Nov 2021 09:47:12 +0000")
Message-ID: <87tuglbck2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Nov 09, 2021 at 07:39:29AM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Nov 04, 2021 at 06:43:23AM +0100, Markus Armbruster wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Thu, Oct 28, 2021 at 04:24:31PM +0100, Daniel P. Berrang=C3=A9 w=
rote:
>> >> >> On Thu, Oct 28, 2021 at 04:31:40PM +0200, Markus Armbruster wrote:
>> >> >> > This clashes with my "[PATCH v2 0/9] Configurable policy for han=
dling
>> >> >> > unstable interfaces", which replaces "you must give unstable stu=
ff names
>> >> >> > starting with 'x-'" by "you must give unstable stuff feature fla=
g
>> >> >> > 'unstable' (and may give it a name starting with 'x-')".
>> >> >>=20
>> >> >> If your series goes in first, I'll update this to take account of =
it,
>> >> >> but for now I'll leave it as is.
>> >> >
>> >> > This patch has now merged to git master.
>> >>=20
>> >> Merge commit e86e00a2493, Nov 3.
>> >>=20
>> >> > If you re-post your series feel free to update the new docs, or let
>> >> > me know if you want me to do it afterwards.
>> >>=20
>> >> The latter, because my series went in before yours, in merge commit
>> >> dd61b91c080, Oct 29 :)
>> >
>> > Sigh, I'm blind ! Dunno how i missed that.
>>=20
>> I can do it for you (it's such a simple patch), but I'd rather not do it
>> in addition to you :)
>
> I've not started yet, so I'll let you do it since you probably have a
> better idea of the preferred language to describe it. I'll promise my
> review services in return.

[PATCH] qapi: Belatedly mark unstable QMP parts with feature 'unstable'


