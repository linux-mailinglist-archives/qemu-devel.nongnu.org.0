Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E53FC6A6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:00:46 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL2RX-00028X-OM
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL2P7-000167-FW
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:58:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL2P5-0003xm-Jl
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:58:13 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-5BbTIZ8wPBmV_0ASopaLsg-1; Tue, 31 Aug 2021 07:58:06 -0400
X-MC-Unique: 5BbTIZ8wPBmV_0ASopaLsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D06802936;
 Tue, 31 Aug 2021 11:58:05 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C79F66ACE4;
 Tue, 31 Aug 2021 11:58:03 +0000 (UTC)
Date: Tue, 31 Aug 2021 13:58:02 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Message-ID: <20210831135802.349fb447@bahia.lan>
In-Reply-To: <cover.1629982046.git.qemu_oss@crudebyte.com>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 14:47:26 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep a=
uto
> free mechanism for arrays. See commit log of patch 1 for a detailed
> explanation and motivation for introducing QArray.
>=20
> Patches 3..5 are provided (e.g. as example) for 9p being the first user o=
f
> this new QArray API. These particular patches 3..5 are rebased on my
> current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.next
> which are basically just the following two queued patches:
>=20

This looks nice indeed but I have the impression the same could be
achieved using glib's g_autoptr framework with less code being added
to QEMU (at the cost of being less generic maybe).

Anyway, we should likely sort out the SEGV issue you're hitting
before going forward with supplementary changes in v9fs_walk().

> https://github.com/cschoenebeck/qemu/commit/7772715d43908235940f5b7dec68d=
0458b1ccdf4
> https://github.com/cschoenebeck/qemu/commit/838b55e392ea7d52e714fdba1db77=
7f658aee2cc
>=20
> v2 -> v3:
>=20
>     * Refactor QArrayRef() -> QARRAY_REF() [patch 1], [patch 5].
>=20
>     * Commit log: Add more thorough explanation for the motivation of QAr=
ray,
>       along with example for advantage over GArray [patch 1].
>=20
>     * Commit log: Add reason for using MIT license for qarray.h instead o=
f
>       the standard QEMU license GPLv2+ [patch 1].
>=20
>     * API doc comments: use 'size_t' type consistently in API doc example
>       code [patch 1].
>=20
> v1 -> v2:
>=20
>     * Minor API comment changes [patch 1].
>=20
>     * Perform strong type check by using __builtin_types_compatible_p()
>       instead of a weak check using sizeof() [patch 2].
>=20
> Christian Schoenebeck (5):
>   qemu/qarray.h: introduce QArray
>   qemu/qarray.h: check scalar type in QARRAY_CREATE()
>   9pfs: make V9fsString usable via QArray API
>   9pfs: make V9fsPath usable via QArray API
>   9pfs: use QArray in v9fs_walk()
>=20
>  fsdev/9p-marshal.c    |   2 +
>  fsdev/9p-marshal.h    |   3 +
>  fsdev/file-op-9p.h    |   2 +
>  hw/9pfs/9p.c          |  19 ++---
>  include/qemu/qarray.h | 160 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 174 insertions(+), 12 deletions(-)
>  create mode 100644 include/qemu/qarray.h
>=20


