Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C2CDCBD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 10:00:31 +0200 (CEST)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHNwU-0007qO-Se
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 04:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iHNuy-0007Ci-P8
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 03:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iHNux-0005iw-Mh
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 03:58:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iHNuv-0005iM-C7; Mon, 07 Oct 2019 03:58:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 849962108;
 Mon,  7 Oct 2019 07:58:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3F1460127;
 Mon,  7 Oct 2019 07:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 448A01138648; Mon,  7 Oct 2019 09:58:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 08/11] block/crypto: implement
 blockdev-amend
References: <20190912223028.18496-1-mlevitsk@redhat.com>
 <20190912223028.18496-9-mlevitsk@redhat.com>
Date: Mon, 07 Oct 2019 09:58:44 +0200
In-Reply-To: <20190912223028.18496-9-mlevitsk@redhat.com> (Maxim Levitsky's
 message of "Fri, 13 Sep 2019 01:30:25 +0300")
Message-ID: <87a7adj8az.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 07 Oct 2019 07:58:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Maxim Levitsky <mlevitsk@redhat.com> writes:

> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
[...]
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 7900914506..4a6db98938 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4211,8 +4211,11 @@
>  # Driver specific image creation options for LUKS.
>  #
>  # @file             Node to create the image format on
> +#                   Mandatory for create
>  # @size             Size of the virtual disk in bytes
> +#                   Mandatory for create
>  # @preallocation    Preallocation mode for the new image
> +#                   Only for create
>  #                   (since: 4.2)
>  #                   (default: off; allowed values: off, metadata, falloc=
, full)
>  #
> @@ -4220,8 +4223,8 @@
>  ##
>  { 'struct': 'BlockdevCreateOptionsLUKS',
>    'base': 'QCryptoBlockCreateOptionsLUKS',
> -  'data': { 'file':             'BlockdevRef',
> -            'size':             'size',
> +  'data': { '*file':             'BlockdevRef',
> +            '*size':             'size',
>              '*preallocation':   'PreallocMode' } }
>=20=20
>  ##

Why is this change needed?

When the commit message says "implement FOO" and nothing else, then I
don't expect QAPI schema changes.  Working the answer to my question
into the commit message might avoid the surprise.

