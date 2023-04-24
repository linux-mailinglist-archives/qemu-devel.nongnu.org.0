Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B386EE1A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:10:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHTo-0000ot-LB; Tue, 25 Apr 2023 08:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prHTn-0000oh-2W
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prHTl-0001fh-Kz
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682424544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references; 
 bh=TuJVtWUd6NhIeqDlZNFXN9PnPPr1F1IlHwguJbPU0wg=;
 b=h0da0L+3LQK1N8III6vmgX8/D8iDDWT1XZHAjKkIPqONEANVHwhLelR7dio3I1gjJuwF8C
 KHvGP9/tjvrggGvGqT+EXe+EG+q77agXOqJzLuBjOrPR3kDeCRqtq28owGoIUANWgxvhoI
 Fkr61yFL7jYS/u6TsvxO3UXYahGkGxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-iv0na24gND6E51jMEyS-_Q-1; Tue, 25 Apr 2023 08:09:03 -0400
X-MC-Unique: iv0na24gND6E51jMEyS-_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20BFE83DE39;
 Tue, 25 Apr 2023 12:09:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0008E14171BB;
 Tue, 25 Apr 2023 12:09:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECC7521E675B; Tue, 25 Apr 2023 14:09:01 +0200 (CEST)
Resent-To: berrange@redhat.com, qemu-devel@nongnu.org, het.gala@nutanix.com,
 eblake@redhat.com, michael.roth@amd.com
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Tue, 25 Apr 2023 14:09:01 +0200
Resent-Message-ID: <87cz3sw4de.fsf@pond.sub.org>
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Het Gala <het.gala@nutanix.com>,  Eric Blake
 <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 1/3] qapi: support updating expected test output via
 make
References: <20230420102619.348173-1-berrange@redhat.com>
 <20230420102619.348173-2-berrange@redhat.com>
Date: Mon, 24 Apr 2023 13:39:23 +0200
In-Reply-To: <20230420102619.348173-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 20 Apr 2023 11:26:17
 +0100")
Message-ID: <875y9la4r8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Lines: 31
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> It is possible to pass --update to tests/qapi-schema/test-qapi.py
> to make it update the output files on error. This is inconvenient
> to achieve though when test-qapi.py is run indirectly by make/meson.
>
> Instead simply allow for an env variable to be set:
>
>  $ QAPI_TEST_UPDATE=3D make check-qapi-schema
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/qapi-schema/test-qapi.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index 2160cef082..d58c31f539 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -206,6 +206,7 @@ def main(argv):
>      parser.add_argument('-d', '--dir', action=3D'store', default=3D'',
>                          help=3D"directory containing tests")
>      parser.add_argument('-u', '--update', action=3D'store_true',
> +                        default=3D'QAPI_TEST_UPDATE' in os.environ,
>                          help=3D"update expected test results")
>      parser.add_argument('tests', nargs=3D'*', metavar=3D'TEST', action=
=3D'store')
>      args =3D parser.parse_args()

Reviewed-by: Markus Armbruster <armbru@redhat.com>


