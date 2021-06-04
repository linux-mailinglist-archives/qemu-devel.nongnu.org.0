Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B795B39BE19
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:09:06 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDJh-0007Am-QR
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lpCjb-0005MF-Fc
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:31:49 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:59853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lpCjX-0001i4-HP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:31:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-lwnMjc6FPFG8CpMNYzS1sQ-1; Fri, 04 Jun 2021 12:31:31 -0400
X-MC-Unique: lwnMjc6FPFG8CpMNYzS1sQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95B2E6123C;
 Fri,  4 Jun 2021 16:31:30 +0000 (UTC)
Received: from bahia.lan (ovpn-112-232.ams2.redhat.com [10.36.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB655620DE;
 Fri,  4 Jun 2021 16:31:29 +0000 (UTC)
Date: Fri, 4 Jun 2021 18:31:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/7] 9pfs: Twalk optimization
Message-ID: <20210604183128.23142868@bahia.lan>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 17:48:49 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This patch set reduces latency of Twalk handling by reducing the amount o=
f
> thread hops, similar to previous Treaddir optimization.
>=20
> The performance gain of this patch set is not as spectacular as previousl=
y
> with Treaddir, but there is definitely a measurable difference.
>=20
> The actualy performance optimization is patch 7. With the benchmark of
> patch 2, the runtime of the Twalk test was cut in half. In real world tes=
ts
> I measured a performance gain (i.e. running an entire guest OS, and hence
> mixed with all other kinds of 9p requests) of about 2%, again measured in=
 a
> mix, not concentrated on Twalk alone.
>=20
> v1 -> v2:
>=20
>   * Added a separate [NEW PATCH 1] for fixing not_same_qid() semantic.
>=20

Strangely, patch 1 appears between patch 3 and 4 in my email client.

>   * Code style: use sizeof(var-name) instead of sizeof(type-name)
>     [PATCH 3].
>=20
>   * Split out dropping fid_to_qid() into separate [PATCH 4].
>=20
>   * Split out replacing not_same_qid() by same_stat_id() into separate
>     [PATCH 5].
>=20
>   * Split out dropping root_qid into separate [PATCH 6].
>=20

I could have a look at all the patches except the last one. LGTM.
You can add my R-b for patches 1 and 3 to 6.

Reviewed-by: Greg Kurz <groug@kaod.org>

I'll try to find some time for patch 7 next week.

> Christian Schoenebeck (7):
>   9pfs: fix not_same_qid()
>   9pfs: Twalk benchmark
>   9pfs: capture root stat
>   9pfs: drop fid_to_qid()
>   9pfs: replace not_same_qid() by same_stat_id()
>   9pfs: drop root_qid
>   9pfs: reduce latency of Twalk
>=20
>  hw/9pfs/9p.c                 | 128 +++++++++++++++++++++++------------
>  hw/9pfs/9p.h                 |   2 +-
>  tests/qtest/virtio-9p-test.c |  30 ++++++++
>  3 files changed, 116 insertions(+), 44 deletions(-)
>=20


