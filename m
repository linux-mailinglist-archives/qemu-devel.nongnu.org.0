Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30537AC7C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:53:33 +0200 (CEST)
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVdU-0006WU-G1
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lgVcY-0005pe-UY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:52:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lgVcT-0003K7-CL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:52:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q5so1380973wrs.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wM2nBn/URnnPl7igdAL5nxF6hPffUIdTypbDYPISLkg=;
 b=aBoEJgj5IoEiaGRAW/soQZVMJrzCNQimF+Jmc+YH0P7eCDKQDLf3Fxv4F9qNtXGUgN
 aRveAhpGqdX3Npw4c3QdlXS1+di81WSqYulAVUmN+EFZRllaIRSp7CK0IOSMh6eU2W1H
 KVZk3zrdC76w5pFxM7HB3ZZ3raEkYdLlXaKbUlL0dR+5ePbOLuf9y+EhCR7Rq2HDO9Cb
 x4XKgDMglEzJZAp7iSwM1XvbDS7VKQCtgS0+aRJys77zfq9l5JIT8MJaWnv7EGjGTfNo
 d3oV2XRqXQWvK7Zq3TrybWVzur2PTOPm9fReTYnT1OCH6AB5bt0beJ7pQhHqI+8Gnc/4
 umZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wM2nBn/URnnPl7igdAL5nxF6hPffUIdTypbDYPISLkg=;
 b=TRuhu9qlK1hwyZ2agIU67dYVkyrhhejRx4/CPeY2TclA8Tthob6SkU0YGqQSbu/WP7
 ItYgpHa7AziJ9u/gBOyryQJCaLle4QDudGhDO/WlkJPej+1iSUqul0UnSOqaIVCdiefT
 8sUf7vqiookLpxTmXeVfCd3h7vlonMG5RXwyzgmmnpgkv8iIERg7rG0EKN5xSXZ4V8P/
 zdyrQHAhndoVDgUh5hw2qhZEJ6p8Cocad5JYhP84s8cfwEQE1K8tU0Rm7gM+MDSKIreP
 pakAUSmWngKMCyfnSa+gUCwe0uAHSOtzXpvNl3bq6Fyo6C2nt1fWxvoR9Di5sXu96MjL
 N9PA==
X-Gm-Message-State: AOAM532gjuLZuasw9olJzfatekzu4Q86SE60G7vYDM4CGOPjUz7/uoOz
 W1GIiee1VuJRY4B3FYj994o=
X-Google-Smtp-Source: ABdhPJzHcrygn9jv3zkAlrlEW4wSk6heXVUvxAjqTqgZXqbMiLpZSWbueOjGaV2g6m7U0p+YhmbFUQ==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr6647135wry.398.1620751947745; 
 Tue, 11 May 2021 09:52:27 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id x65sm4654119wmg.36.2021.05.11.09.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:52:27 -0700 (PDT)
Date: Tue, 11 May 2021 17:52:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3 0/9] qapi: untie 'if' conditions from C preprocessor
Message-ID: <YJq2SXW1kSyDZ7WX@stefanha-x1.localdomain>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uSNoUiMeOqt2LT+Q"
Content-Disposition: inline
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uSNoUiMeOqt2LT+Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 05:40:23PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Hi,
>=20
> This series makes the 'if' conditions less liberal, by formalizing a simp=
le
> expression tree based on bare boolean logic of configure option identifie=
rs.
>=20
> (this allows to express conditions in Rust in my QAPI-Rust PoC series)
>=20
> This is based on John Snow QAPI pt4:
> https://patchew.org/QEMU/20210421192233.3542904-1-jsnow@redhat.com/
>=20
> Based-on: <20210421192233.3542904-2-jsnow@redhat.com>
>=20
> thanks
>=20
> v3:
>  - rebasing on queued pt4 (after waiting for it to land)
>  - improve documentation generation, to be more human-friendly
>  - drop typing annotations from schema.py (not yet queued)
>  - commit message tweaks
>=20
> v2:
>  - fix the normalization step to handle recursive expr
>  - replace IfCond by QAPISchemaIf (JohnS)
>  - commit message and documentation tweaks
>  - mypy/flake8/isort
>=20
> Marc-Andr=E9 Lureau (9):
>   qapi: replace List[str] by QAPISchemaIfCond
>   qapi: move gen_if/gen_endif to QAPISchemaIfCond
>   qapi: start building an 'if' predicate tree
>   qapi: introduce IfPredicateList and IfAny
>   qapi: add IfNot
>   qapi: normalize 'if' condition to IfPredicate tree
>   qapi: convert 'if' C-expressions to the new syntax tree
>   qapi: make 'if' condition strings simple identifiers
>   docs: update the documentation about schema configuration
>=20
>  docs/devel/qapi-code-gen.txt                  |  33 +++---
>  docs/sphinx/qapidoc.py                        |   6 +-
>  qapi/block-core.json                          |  16 +--
>  qapi/block-export.json                        |   6 +-
>  qapi/char.json                                |   8 +-
>  qapi/machine-target.json                      |  28 +++--
>  qapi/migration.json                           |  10 +-
>  qapi/misc-target.json                         |  37 +++---
>  qapi/qom.json                                 |  10 +-
>  qapi/sockets.json                             |   4 +-
>  qapi/ui.json                                  |  48 ++++----
>  qga/qapi-schema.json                          |   8 +-
>  tests/unit/test-qmp-cmds.c                    |   1 +
>  scripts/qapi/commands.py                      |   4 +-
>  scripts/qapi/common.py                        | 106 +++++++++++++++---
>  scripts/qapi/events.py                        |   5 +-
>  scripts/qapi/expr.py                          |  62 +++++++---
>  scripts/qapi/gen.py                           |  16 ++-
>  scripts/qapi/introspect.py                    |  33 +++---
>  scripts/qapi/schema.py                        |  99 ++++++++++++----
>  scripts/qapi/types.py                         |  43 ++++---
>  scripts/qapi/visit.py                         |  25 ++---
>  .../alternate-branch-if-invalid.err           |   2 +-
>  tests/qapi-schema/bad-if-empty.err            |   2 +-
>  tests/qapi-schema/bad-if-list.err             |   2 +-
>  tests/qapi-schema/bad-if.err                  |   3 +-
>  tests/qapi-schema/bad-if.json                 |   2 +-
>  tests/qapi-schema/doc-good.json               |   6 +-
>  tests/qapi-schema/doc-good.out                |  12 +-
>  tests/qapi-schema/doc-good.txt                |   6 +-
>  tests/qapi-schema/enum-if-invalid.err         |   3 +-
>  tests/qapi-schema/features-if-invalid.err     |   2 +-
>  tests/qapi-schema/features-missing-name.json  |   2 +-
>  tests/qapi-schema/qapi-schema-test.json       |  58 +++++-----
>  tests/qapi-schema/qapi-schema-test.out        |  67 ++++++-----
>  .../qapi-schema/struct-member-if-invalid.err  |   2 +-
>  tests/qapi-schema/union-branch-if-invalid.err |   2 +-
>  37 files changed, 482 insertions(+), 297 deletions(-)
>=20
> --=20
> 2.29.0
>=20
>=20
>=20

Please double-check that the build and tests pass after each commit (for
bisectability).

I'm not familiar with the details of the QAPI code generator but in
overall this looks like a nice step:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uSNoUiMeOqt2LT+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCatkkACgkQnKSrs4Gr
c8ihbgf+OFVfn5c2ZYANuTG+wBC9acvSrr7Ks/UikFMG3oAmocIAZGOt/jdzrvz9
5TswccMCjuKlytCQFFps/z/Jt6csSxV+rxgJA7Ule57GRaNza9ZLeqKtdgVh++my
O6I7Gms54RrWtlg30ggUMvgAe8xECgoOT4mCMPQxnlF+la0eFBtNjsBm3vppqRHx
IqKq3Hk+eglyZJQ+YrnrYsIZt8ToE9RKngCCNIe1F7fzV+13di5/Lh/CHs8+aweN
V6PXW4g28R6rcuFFwH3k0YQogQ0LW7CGnP1QMewHbJpXeoHgizGC4xoR8BoHCFhN
lysoYNAgBCrfokYtgcRzlJ6xLnTH5Q==
=X+eh
-----END PGP SIGNATURE-----

--uSNoUiMeOqt2LT+Q--

