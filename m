Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8C63F069
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:25:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ibx-00060k-VI; Thu, 01 Dec 2022 07:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0ibv-00060F-6K
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0ibt-0007bv-K9
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669897452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJH21qqwDqXGBFFNNMSW5syb3PyO+YWni/5YQbEBlHM=;
 b=EaH/XUeH0QDG5zo/5TUPaPV3gWOsh7Ihj/quQAF1MUMNdWiIJfbdZ0D/z1pIZsK8eiXg8o
 TsPkWVdh6L1wpd2EVheBZBwUU8iighjxFBCw3Aq8FO7UjwNNvPEt3h+q+7Fp7+SiuDjEMD
 VYVqhXCK0ZuH6GChZ1vSt5IxgpBA+f0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-J0Gwv1BJMVq4vDgAhi5JgQ-1; Thu, 01 Dec 2022 07:24:11 -0500
X-MC-Unique: J0Gwv1BJMVq4vDgAhi5JgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16222101AA5B;
 Thu,  1 Dec 2022 12:24:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9DED2166B2C;
 Thu,  1 Dec 2022 12:24:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A154B21E6921; Thu,  1 Dec 2022 13:24:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Lieven <pl@kamp.de>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,  Hanna
 Reitz <hreitz@redhat.com>,  libvir-list@redhat.com,  Kevin Wolf
 <kwolf@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 2/3] block: deprecate iSCSI 'password' in favour of
 'password-secret'
References: <20221201101959.419545-1-berrange@redhat.com>
 <20221201101959.419545-3-berrange@redhat.com>
Date: Thu, 01 Dec 2022 13:24:07 +0100
In-Reply-To: <20221201101959.419545-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 1 Dec 2022 05:19:58
 -0500")
Message-ID: <87tu2ffh20.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

> Support for referencing secret objects was added in
>
>   commit b189346eb1784df95ed6fed610411dbf23d19e1f
>   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>   Date:   Thu Jan 21 14:19:21 2016 +0000
>
>     iscsi: add support for getting CHAP password via QCryptoSecret API
>
> The existing 'password' option is overdue for deprecation and
> subsequent removal.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  block/iscsi.c             |  3 +++
>  docs/about/deprecated.rst | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/block/iscsi.c b/block/iscsi.c
> index a316d46d96..58c0623052 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1352,6 +1352,9 @@ static void apply_chap(struct iscsi_context *iscsi,=
 QemuOpts *opts,
>      } else if (!password) {
>          error_setg(errp, "CHAP username specified but no password was gi=
ven");
>          return;
> +    } else {
> +        warn_report("iSCSI block driver 'password' option is deprecated,=
 "
> +                    "use 'password-secret' instead");
>      }
>=20=20
>      if (iscsi_set_initiator_username_pwd(iscsi, user, password)) {
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 93affe3669..2cc8924fe9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -267,6 +267,17 @@ Options are:
>      - move backing file to NVDIMM storage and keep ``pmem=3Don``
>        (to have NVDIMM with persistence guaranties).
>=20=20
> +Block driver options
> +--------------------

I'm not sure about this headline.  For what it's worth, -help shows
-iscsi under "Block device options".

> +
> +``iscsi,password=3Dxxx`` (since 8.0)
> +''''''''''''''''''''''''''''''''''
> +
> +Specifying the iSCSI password in plain text on the command line using the
> +``password`` option is insecure. The ``password-secret`` option should be
> +used instead, to refer to a ``--object secret...`` instance that provides
> +a password via a file, or encrypted.
> +
>  Device options
>  --------------


