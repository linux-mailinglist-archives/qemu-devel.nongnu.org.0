Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944913FC9CA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:31:35 +0200 (CEST)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4nU-0001Y3-PM
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL4ky-00089L-FQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL4ks-00061L-Fl
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630420127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/JqZCupmxFVhbFDNClvXI7jQNvOB9vMurSc0WcKRV8=;
 b=PnL8rc58HmhWV8EnPlRfK/50EkDuR6GpCux7vw6Vx7KIqW224Yo908JFBr/Yw6wtZE+EbB
 OvQ3E6KjEbUFsyCSjvz4i10jq5mw6g7bFCJRI/6+wqXsghNYY4XMyCnuP/CYajt29J0GZh
 xy6rEq0HngEIvvnq5v/7xMOBsrj7MD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-AvppUsPnNROgoBvWuD7NZA-1; Tue, 31 Aug 2021 10:28:46 -0400
X-MC-Unique: AvppUsPnNROgoBvWuD7NZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D92287D542;
 Tue, 31 Aug 2021 14:28:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 551DC76E3C;
 Tue, 31 Aug 2021 14:28:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2E6911380A9; Tue, 31 Aug 2021 16:28:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
References: <20210831123809.1107782-1-armbru@redhat.com>
 <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
Date: Tue, 31 Aug 2021 16:28:39 +0200
In-Reply-To: <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 31 Aug 2021
 17:41:56 +0400")
Message-ID: <87mtoxwuw8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> Markus Armbruster (12):
>>   qapi: Simplify QAPISchemaIfCond's interface for generating C
>>   qapi: Simplify how QAPISchemaIfCond represents "no condition"
>>   tests/qapi-schema: Correct two 'if' conditionals
>>   tests/qapi-schema: Demonstrate broken C code for 'if'
>>   qapi: Fix C code generation for 'if'
>>   qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
>>   qapi: Avoid redundant parens in code generated for conditionals
>>   qapi: Use "not COND" instead of "!COND" for generated documentation
>>   qapi: Use re.fullmatch() where appropriate
>>   tests/qapi-schema: Hide OrderedDict in test output
>>   qapi: Tweak error messages for missing / conflicting meta-type
>>   qapi: Tweak error messages for unknown / conflicting 'if' keys
>>
>>  scripts/qapi/common.py                  | 51 ++++++++++++++-----------
>>  scripts/qapi/expr.py                    | 32 +++++++---------
>>  scripts/qapi/gen.py                     |  6 +--
>>  scripts/qapi/introspect.py              |  6 +--
>>  scripts/qapi/schema.py                  | 12 +++++-
>>  scripts/qapi/types.py                   | 22 +++++------
>>  scripts/qapi/visit.py                   | 14 +++----
>>  tests/qapi-schema/bad-if-key.err        |  2 +-
>>  tests/qapi-schema/bad-if-keys.err       |  2 +-
>>  tests/qapi-schema/doc-good.json         |  2 +-
>>  tests/qapi-schema/doc-good.out          |  6 +--
>>  tests/qapi-schema/doc-good.txt          |  8 ++--
>>  tests/qapi-schema/double-type.err       |  4 +-
>>  tests/qapi-schema/enum-if-invalid.err   |  2 +-
>>  tests/qapi-schema/missing-type.err      |  2 +-
>>  tests/qapi-schema/qapi-schema-test.json |  9 +++--
>>  tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
>>  tests/qapi-schema/test-qapi.py          | 11 +++++-
>>  18 files changed, 118 insertions(+), 104 deletions(-)
>>
>>
> The first patch, you should apply isort

Will fix.

> The first patch, you should apply isort (we should have a check for that
> and linters I suppose).

John will get us there.

> Series:
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks!


