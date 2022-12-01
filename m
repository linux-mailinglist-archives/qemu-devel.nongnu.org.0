Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45063E9FB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:50:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dNc-0002wm-WF; Thu, 01 Dec 2022 01:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0dN4-0002u2-Bg
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0dN2-0005Zk-CW
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669877311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tIF6FbzWXISzwvkfEflv2q9inpHxu7hmOUIY1f7llE=;
 b=KlnV1DkxABN/e5en316Zh5EI0HnWTSWbhDAGNa7lGITF6VPnxFH44E6Z5RHRcn03WTRz2C
 rToGhx68i9WtssWHhhEJWeMq5fBPAIMKOsKvHpEBD3hhlsi1c9FkY97sTO1ajEP3/q9YXZ
 uNubHBijq+1AKIYDrv6gMSDvTTphV7E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-5NuKgNDqOyuOBI-MWu_7wQ-1; Thu, 01 Dec 2022 01:48:29 -0500
X-MC-Unique: 5NuKgNDqOyuOBI-MWu_7wQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F6486F12E
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:48:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7F9C15BA5;
 Thu,  1 Dec 2022 06:48:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECED921E6921; Thu,  1 Dec 2022 07:48:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Monitor commands related to display server passwords
References: <87mt88oonj.fsf@pond.sub.org> <Y4ccR2d2GUHpmHwx@redhat.com>
 <87h6yglgke.fsf@pond.sub.org> <Y4da1Ble0mkqNvZW@redhat.com>
Date: Thu, 01 Dec 2022 07:48:25 +0100
In-Reply-To: <Y4da1Ble0mkqNvZW@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 30 Nov 2022 13:29:56 +0000")
Message-ID: <87r0xjzkjq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 30, 2022 at 02:25:53PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
>> > In 6.0 I introduced support for 'password-secret' to SPICE and VNC
>> > command line.
>> >
>> > I don't know why, but I only deprecated 'password' in SPICE and
>> > not in VNC.
>>=20
>> I figure you mean
>>=20
>>     ``-spice password=3Dstring`` (since 6.0)
>>     ''''''''''''''''''''''''''''''''''''''
>>=20
>>     This option is insecure because the SPICE password remains visible in
>>     the process listing. This is replaced by the new ``password-secret``
>>     option which lets the password be securely provided on the command
>>     line using a ``secret`` object instance.
>>=20
>> and -vnc password=3D...
>>=20
>> There's also -iscsi password=3D..., and possibly more.
>
> Oh, iSCSI already has password-secret=3D, so yeah, we should
> deprecate the old way there too.

Would you like to prepare the patch?

> Basically I want nothing in QMP/CLI to accept passwords,
> everything must use the 'secret' objects.

Understood.

>> > I didn't wire up any QMP commands todo live password changes. If
>> > the display was already configured with 'password-secret', you
>> > could delete and re-create the existing named secret object
>> > using object-add/object-del, since we fetch the secret value
>> > on every auth check.
>>=20
>> Is this behavior documented?
>
> I don't believe so

No need if we provide a more direct solution, like the one you sketched
(extending display-update).


