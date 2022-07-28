Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABA58425F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:55:40 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4vK-0003e0-C1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH4rU-0007a0-Ah
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH4rQ-00064S-EA
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659019894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSgHLzDKLe63FgbEgd4ROad5E62nSsjy5YKI4EJFq0Y=;
 b=aMUnSREVq2D2IYJDy0RZhM74DfMrknJmSDID3UNWcRPPs+pc74X7vOa+Rgds+lBPQYfDcw
 rp3FxGWvBWm5hwmngXh5fYFiR+Y9JAs+rBlj4ngWog8ifa+dkD+nsVCOEQLt99IfMN5ygl
 xfvCnGDHx1v9i3AjJfLTdSz7/aAeiT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-5x4ASOtlP22ozeg1rDAJsQ-1; Thu, 28 Jul 2022 10:51:30 -0400
X-MC-Unique: 5x4ASOtlP22ozeg1rDAJsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C53D3C01E17;
 Thu, 28 Jul 2022 14:51:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E2318EB7;
 Thu, 28 Jul 2022 14:51:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C71D21E6930; Thu, 28 Jul 2022 16:51:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Igor Mammedov
 <imammedo@redhat.com>,  qemu-devel@nongnu.org,  mst@redhat.com,
 t0rr3sp3dr0@gmail.com,  alex.bennee@linaro.org,  dgilbert@redhat.com,
 agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
 <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
 <87mtctxt49.fsf@pond.sub.org>
 <CAFEAcA_GfY8uDA+z8NSOebw1MKoaNoCNYiRBss3Ku-Q-jTBeWg@mail.gmail.com>
 <YuKSXDgCmmBNJndy@redhat.com>
Date: Thu, 28 Jul 2022 16:51:29 +0200
In-Reply-To: <YuKSXDgCmmBNJndy@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 28 Jul 2022 14:42:52 +0100")
Message-ID: <874jz1xpce.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 28, 2022 at 02:40:22PM +0100, Peter Maydell wrote:
>> On Thu, 28 Jul 2022 at 14:30, Markus Armbruster <armbru@redhat.com> wrot=
e:
>> > Peter Maydell <peter.maydell@linaro.org> writes:
>> > I applaud the renaissance of roman-style inscriptions, but it's not ju=
st
>> > words without spaces, it's also capital letters only:
>> >
>> >     ANY64CHARACTERFAKEOSKISENOUGHTOPREVENTINVALIDKEYWARNINGSONSTDERR
>> >
>> > Seriously, throw in some dashes or spaces.
>>=20
>>       any-64-char-fake-osk-will-avoid-an-invalid-key-warning-on-stderr
>
> On the basis that virtualization gives you turtles all the way down...
>
>  -device isa-applesmc,osk=3D=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=
=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=
=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2=F0=9F=90=A2

Oh, Egyptian rather than Roman.  Works for me!


