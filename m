Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B92B1B78
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:55:26 +0100 (CET)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYbt-0003XI-4f
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdYb1-0002yG-7k
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdYay-0002TN-6K
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605272067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4nUh8/mF/VbUT3oU88AAIYgcy0ch/FTRIH+rB3ZDPE=;
 b=Oh0ML/gCUAll3X47Qfwb48d3hr1oRNFo62IAAtGlpXDjRduvPi0FR6EPUL0IcNyIvAnwpJ
 amx7g3v/jYo/DnEPLxXbY6BC2xyaq4OyslztVy2APfTGZhRFs5qhWLUV9/oWpiN7TAmxk+
 ikZ9ZWB9lL347Pli4vs68UQDQ/OIHkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-_SPnyvCqM-Cy_dO4qD62jw-1; Fri, 13 Nov 2020 07:54:25 -0500
X-MC-Unique: _SPnyvCqM-Cy_dO4qD62jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B57610B9CA2
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 12:54:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CDC81002C08;
 Fri, 13 Nov 2020 12:54:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFECB11386A0; Fri, 13 Nov 2020 13:54:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] authz-list-file: Improve an error message
References: <20201113062358.2563662-1-armbru@redhat.com>
 <20201113062358.2563662-3-armbru@redhat.com>
 <20201113093648.GA30434@redhat.com>
Date: Fri, 13 Nov 2020 13:54:22 +0100
In-Reply-To: <20201113093648.GA30434@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9=22's?=
 message of "Fri, 13 Nov 2020 09:36:48 +0000")
Message-ID: <87y2j5fmdd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Nov 13, 2020 at 07:23:58AM +0100, Markus Armbruster wrote:
>> When qauthz_list_file_load() rejects JSON values other than JSON
>> object with a rather confusing error message:
>>=20
>>     $ echo 1 | qemu-system-x86_64 -nodefaults -S -display none  -object =
authz-list-file,id=3Dauthz0,filename=3D/dev/stdin
>>     qemu-system-x86_64: -object authz-list-file,id=3Dauthz0,filename=3D/=
dev/stdin: Invalid parameter type for 'obj', expected: dict
>>=20
>> Improve to
>>=20
>>     qemu-system-x86_64: -object authz-list-file,id=3Dauthz0,filename=3D/=
dev/stdin: File '/dev/stdin' must contain a JSON object
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  authz/listfile.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks!

>> diff --git a/authz/listfile.c b/authz/listfile.c
>> index 1421e674a4..da3a0e69a2 100644
>> --- a/authz/listfile.c
>> +++ b/authz/listfile.c
>> @@ -73,7 +73,8 @@ qauthz_list_file_load(QAuthZListFile *fauthz, Error **=
errp)
>> =20
>>      pdict =3D qobject_to(QDict, obj);
>>      if (!pdict) {
>> -        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "obj", "dict");
>> +        error_setg(errp, "File '%s' must contain a JSON object",
>> +                   fauthz->filename);
>
> This code pattern was copied from other places in QEMU which use the
> same QERR_INVALID_PARAMETER_TYPE. There are another 10 or so examples
> of this error message pattern.

Yes.  My "[PATCH 00/10] Chipping away at qerror.h" fixes other patterns,
but not this one.  I intend to chip some more, as time permits.


