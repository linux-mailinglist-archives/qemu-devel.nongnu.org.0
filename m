Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97032277A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:08:28 +0100 (CET)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETgB-000767-OB
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lETeW-0006FN-Hw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lETeR-0000hW-Ip
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614071198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiofZtwhpE3W9O9kmNL48Ob0Lhr/MrTgLe4VNez7Ef8=;
 b=HG/JiuUwECVfnojtaOv+lVDKx7L7xBOC/S5A2QF3Z57x1sdfO/MGPm3cUaOjMFj2IM/nX8
 6w4t053z/GY3gYE5ibzqfdDBWIcOu5QoFzW91rKLYw0X3myf1tOK2/RCUP27xu0QpNUjNI
 eYQddCxfbxKKN8E5KYjdrmtxRTf87Cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-Zu-AqlAuNNmzyO-xxBu1xw-1; Tue, 23 Feb 2021 04:06:36 -0500
X-MC-Unique: Zu-AqlAuNNmzyO-xxBu1xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C5B18B6142;
 Tue, 23 Feb 2021 09:06:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3BC1001281;
 Tue, 23 Feb 2021 09:06:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A3CA113860F; Tue, 23 Feb 2021 10:06:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
Date: Tue, 23 Feb 2021 10:06:30 +0100
In-Reply-To: <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com> (Paolo
 Bonzini's message of "Mon, 22 Feb 2021 18:47:30 +0100")
Message-ID: <87y2fff90p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 22/02/21 16:24, Daniel P. Berrang=C3=A9 wrote:
>> This problem isn't unique to QEMU. Any app using JSON from the
>> shell will have the tedium of quote escaping. JSON is incredibly
>> widespread and no other apps felt it neccessary to introduce single
>> quoting support, because the benefit doesn't outweigh the interop
>> problem it introduces.
>
> The quotes were introduced for C code (and especially qtest), not for
> the shell.  We have something like
>
>     response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, =
"
>                    "'property': 'temperature' } }", id);
>
> These are sent to QEMU as double-quoted strings (the single-quoted
> JSON is parsed to get interpolation and printed back; commit
> 563890c7c7, "libqtest: escape strings in QMP commands, fix leak",
> 2014-07-01). However, doing the interpolation requires a parser that
> recognizes the single-quoted strings.

Doing interpolation requires a parser that recognizes %-sequences.
Single quote support isn't *required*, but quite desirable to let us
avoid leaning toothpick syndrome (LTS).

Example: compare the above to

      response =3D qmp("{ \"execute\": \"qom-get\", \"arguments\": { \"path=
\": %s, "
                     "\"property\": \"temperature\" } }", id);

We kept the interpolation extension out of the external interfaces, but
not the single quotes.

> Markus, did you rebuild the qtests after disabling single-quoted
> strings?  "make check-qtest-x86_64" would have rebuilt them, but I'm=20
> confused by the results.

I ran "make check" and looked at the failures:

* check-qjson.c

  - escaped_string() covers \'.  Naturally, this fails.

  - escaped_string() and utf8_string() try every string twice, first in
    double quotes, then in single quotes.  Naturally, the latter fails.

  - string_with_quotes() tests unquoted single quote in double-quoted
    string, and unquoted double quote in single-quoted string.
    Naturally, the latter fails.

  - large_dict() and simple_whitespace() use single quotes to avoid LTS.

  This is the test my "The unit test testing the JSON parser is of
  course excused" referred to.

* test-qobject-input-visitor.c
* qtest/qmp-test.c

  More LTS avoidance.

  This is "The remaining qtest and the unit test could perhaps be
  dismissed as atypical use of QEMU from C."

* tests/qemu-iotests/

  Unlike the tests above, these use *external* interfaces.

  In shell, we need to use double quotes to get parameter expansion.  We
  then use single quotes to avoid LTS.

  The Python code has less excuse, I think.

Still confused?


