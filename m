Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49A168821
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 21:12:17 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Eem-00060R-Ki
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 15:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j5EdC-0003yF-SK
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:10:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j5EdB-00085b-NF
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:10:38 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25825
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j5EdB-00084M-J7
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582315837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sjOmSCHMfvrvRVy91WQ7NLjtvUcMcmS76ybToQDiQc=;
 b=Di6bsgnzdn0vGueR4ja+kxQDEjX7p85v4lSJHEmWENcDKABugGMfY4isXAB31HrN5Imn1q
 lFHCVbL7txN5Zkdn8klobc46HCLTinKJ7hbJGf1Qj1ftx3UxjQAWW5l5TpZXXxgOF6ZVn3
 3joBug1Mq/m0Atyc0B87xl+HlKtF4H0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-LxNFeqckMxOPWnh1Ktw5Eg-1; Fri, 21 Feb 2020 15:10:31 -0500
X-MC-Unique: LxNFeqckMxOPWnh1Ktw5Eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F77B107ACC5;
 Fri, 21 Feb 2020 20:10:15 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E1279077F;
 Fri, 21 Feb 2020 20:10:08 +0000 (UTC)
Subject: Re: [PATCH v7 01/11] qapi/error: add (Error **errp) cleaning APIs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b7c3dc22-99fd-6165-75e5-f148157e5e8d@redhat.com>
Date: Fri, 21 Feb 2020 08:25:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:

>>> +static inline void warn_report_errp(Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 assert(errp && *errp);
>>> +=C2=A0=C2=A0=C2=A0 warn_report_err(*errp);
>>> +=C2=A0=C2=A0=C2=A0 *errp =3D NULL;
>>> +}
>>> +
>>> +
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * Just like error_setg(), except you get to specify the er=
ror class.
>>> =C2=A0=C2=A0 * Note: use of error classes other than ERROR_CLASS_GENERI=
C_ERROR is
>>
>> These appear to be unused apart from the Coccinelle script in PATCH 03.
>>
>> They are used in the full "[RFC v5 000/126] error: auto propagated
>> local_err" series.=C2=A0 Options:
>>
>> 1. Pick a few more patches into this part I series, so these guys come
>> =C2=A0=C2=A0=C2=A0 with users.
>=20
> It needs some additional effort for this series.. But it's possible. Stil=
l,
> I think that we at least should not pull out patches which should be in
> future series (for example from ppc or block/)..
>=20

>> 2. Punt this patch to the first part that has users, along with the
>> =C2=A0=C2=A0=C2=A0 part of the Coccinelle script that deals with them.
>=20
> But coccinelle script would be wrong, if we drop this part from it. I=20
> think,
> that after commit which adds coccinelle script, it should work with any=
=20
> file,
> not only subset of these series.
>=20
> So, it's probably OK for now to drop these functions, forcing their=20
> addition if
> coccinelle script will be applied where these functions are needed. We=20
> can, for
> example comment these three functions.
>=20
> Splitting coccinelle script into two parts, which will be in different=20
> series will
> not help any patch-porting processes.

Splitting the coccinelle script across multiple patches is actually=20
quite reviewable, and still easy to backport.  Consider this series by=20
Philippe:

https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg05554.html

which makes multiple additions to scripts/coccinelle/exec_rw_const.cocci=20
over the course of the series.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


