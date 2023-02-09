Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B9690922
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6Fr-0004Hv-Py; Thu, 09 Feb 2023 07:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ6Fa-0004Ge-7Q
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ6FX-0008VS-Ap
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675946521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZH11Uplg45WFMksnBQg9XoGEas8k+prgvuSUcC377L8=;
 b=QbbdPIPJCXcR0vfNf8NEqaQgisJQ7cnRQFdqPSH42GoixiTbckpx3o7wIeC98A9b0gPMVT
 bDMMJeoMikaQ/dpZqxQBK3Tf3P+LjBnFXPJAVvE2jlpBob2TbZat2bsZiYSNeTBHRdfkkv
 aJdWJTrnkKB/HTbPb9GlYe0zD4c1N24=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Axwv0m1NOJeeI-6Hs1bKaQ-1; Thu, 09 Feb 2023 07:42:00 -0500
X-MC-Unique: Axwv0m1NOJeeI-6Hs1bKaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 098C5101A52E;
 Thu,  9 Feb 2023 12:42:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A0840B42D4;
 Thu,  9 Feb 2023 12:41:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E2A921E6A1F; Thu,  9 Feb 2023 13:41:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
Date: Thu, 09 Feb 2023 13:41:58 +0100
In-Reply-To: <20230207142535.1153722-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Feb 2023 18:25:32 +0400")
Message-ID: <87sfff3t9l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The generated code doesn't quite handle the conditional arguments.
> For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
> conditions. See generated code in qmp_marshal_test_if_cmd().
>
> Note that if there are multiple optional arguments at the last position,
> there might be compilation issues due to extra comas. I left an assert
> and FIXME for later.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Fails "make check" for me:

2/2 qemu:qapi-schema+qapi-frontend / QAPI schema regression tests        FA=
IL            0.09s   exit status 1
>>> MALLOC_PERTURB_=3D241 PYTHONPATH=3D/work/armbru/qemu/scripts /usr/bin/p=
ython3 [...]
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stdout:
--- /work/armbru/qemu/bld-clang/../tests/qapi-schema/qapi-schema-test.out
+++=20
@@ -297,6 +297,7 @@
     member foo: TestIfStruct optional=3DFalse
     member bar: TestIfEnumList optional=3DFalse
         if TEST_IF_EVT_BAR
+    member baz: int optional=3DFalse
     if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=3DFalse
stderr:
qapi-schema-test FAIL


