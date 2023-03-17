Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B66BE8CC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd8qE-0000wS-2c; Fri, 17 Mar 2023 08:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd8qC-0000w4-4A
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd8qA-0004ki-Jp
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHyeJ6158wucZzAyT8+Znv2KOZTVxn/DeFI//oIGvsA=;
 b=ICoFTl52eMA4zVjXLtMsz86ivCLDaZ4Z2yz3AMx/GzBdYbNYWsK9qRCGV5asqp4S9+gNcZ
 UNpdzvOHkV8jpdQyRJ4bPmkP86MJJ8ygINMvmNeqe/WbASNW7MjfE2t2CFD/mrXLslTtv6
 pWhTnCMH/Adzi39B5mrEELcqyKDYiv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-ysSxjAw8NkmHcu7JrTanIA-1; Fri, 17 Mar 2023 08:05:42 -0400
X-MC-Unique: ysSxjAw8NkmHcu7JrTanIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98FF487A9E4;
 Fri, 17 Mar 2023 12:05:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDAF4042AC9;
 Fri, 17 Mar 2023 12:05:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D83C21E681C; Fri, 17 Mar 2023 13:05:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH v2 2/3] qapi: use env var to trigger qapi test output
 updates
References: <20230223134027.2294640-1-berrange@redhat.com>
 <20230223134027.2294640-3-berrange@redhat.com>
Date: Fri, 17 Mar 2023 13:05:40 +0100
In-Reply-To: <20230223134027.2294640-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:40:26
 +0000")
Message-ID: <87sfe3invv.fsf@pond.sub.org>
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

I have a mild dislike of abbreviations like "env var".  Perhaps:

    qapi: Support updating expected test output via make

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> It is possible to pass --update to tests/qapi-schema/test-qapi.py
> to make it update the output files on error. This is inconvient
> to achieve though when test-qapi.py is run indirectly by make/meson.
>
> Instead simply allow for an env variable to be set:
>
>  $ QAPI_TEST_UPDATE=3D1 make check-qapi-schema

Suggest to omit the value

    $ QAPI_TEST_UPDATE=3D make check-qapi-schema

The value doesn't actually matter.  A value of 1 looks as if it did, and
as if a value of 0 would disable the thing.

I'm no fan of environment variables duplicating options, but I
understand the desire for a make invocation, and I don't have a better
idea.

> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/qapi-schema/test-qapi.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index 2160cef082..75f2759fd6 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -215,7 +215,8 @@ def main(argv):
>          (dir_name, base_name) =3D os.path.split(t)
>          dir_name =3D dir_name or args.dir
>          test_name =3D os.path.splitext(base_name)[0]
> -        status |=3D test_and_diff(test_name, dir_name, args.update)
> +        update =3D args.update or "QAPI_TEST_UPDATE" in os.environ
> +        status |=3D test_and_diff(test_name, dir_name, update)
>=20=20
>      exit(status)

Let's use argparse instead:

       parser.add_argument('-u', '--update', action=3D'store_true',
  +                        default=3D'QAPI_TEST_UPDATE' in os.environ,
                           help=3D"update expected test results")


