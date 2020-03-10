Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98017F6A9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 12:49:08 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBdNj-0000Z7-SH
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 07:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jBdM7-0007N5-RY
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jBdM6-0003LV-Jf
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:47:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54771
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jBdM6-0003H9-Du
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583840846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFOoQypaldymGm6peVs0Pbqr2KwRZZOB5n57kO+CrQk=;
 b=FvwNTxtZ0qzBFNG9n+Q1JF2aN3SqO2ojmgsWl18sVHBsWPoNW4kmVhTAMgsne7ls+4pVsR
 2EiQXlSCGzp2eMDGCtH17QEKUiZFPf8cnGhBtkFEe73PDC6N0eNOoUojt/HzdaE/z9d6pN
 pXlDBlcBsqrdDUFwvGkPdVPYPpMoNn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-Uj-NcjqxNcipBsKd8OK1Gg-1; Tue, 10 Mar 2020 07:47:22 -0400
X-MC-Unique: Uj-NcjqxNcipBsKd8OK1Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A390DB21;
 Tue, 10 Mar 2020 11:47:21 +0000 (UTC)
Received: from [10.3.116.177] (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D651A5C28D;
 Tue, 10 Mar 2020 11:47:20 +0000 (UTC)
Subject: Re: [PATCH v10 02/10] qemu-binfmt-conf.sh: enforce safe tests
To: Laurent Vivier <laurent@vivier.eu>,
 Unai Martinez-Corral <unai.martinezcorral@ehu.eus>, qemu-devel@nongnu.org
References: <20200309191200.GA60@669c1c222ef4>
 <20200309191924.GB65@669c1c222ef4>
 <b7389e46-c96b-a95b-5831-accfdbd1da4a@vivier.eu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <62decc58-62e9-9352-ce64-9f8c3a796162@redhat.com>
Date: Tue, 10 Mar 2020 06:47:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b7389e46-c96b-a95b-5831-accfdbd1da4a@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/20 3:28 AM, Laurent Vivier wrote:
> Le 09/03/2020 =C3=A0 20:19, Unai Martinez-Corral a =C3=A9crit=C2=A0:
>> All the tests are prefixed with 'x', in order to avoid risky comparisons
>> (i.e. a user deliberately trying to provoke a syntax error).
>=20
> With the quotes I don't see how we can provoke a syntax error.
> Could you provide an example?

Historically, in some shells:

foo=3D\(
bar=3D\)
if [ "$foo" =3D "$bar" ]; then echo hello world; fi

could output 'hello world' (by parsing a parenthesized one-argument=20
test, and the string '=3D' is non-empty), but:

if [ "x$foo" =3D "x$bar" ]; then echo goodbye; fi

did not (since no operator begins with 'x', you have guaranteed the=20
syntax that [ will parse).  Similarly, if foo=3D! or foo=3D-a, you could ge=
t=20
syntax errors (if [ tried to treat the expansion of $foo as an operator=20
and got thrown off by the remaining arguments not matching an expected=20
pattern).

These days, POSIX says that with three arguments when the 2nd is a=20
binary operator, there is no ambiguity (the binary operator takes=20
precedence over the ( and ) around the non-empty string test), and=20
modern bash obeys the POSIX rule without needing the x prefix.  But it=20
is still better to prefix with x for copy-paste portability to older=20
shells that do not match current POSIX rules.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


