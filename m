Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1817114E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:16:35 +0100 (CET)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7DPO-0004Hm-A9
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1j7DJv-0001w1-Ij
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:10:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1j7DJu-0007Cc-M5
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:10:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27804
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1j7DJu-0007BP-It
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582787454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfuPtBZ2FGA9KtmFwHynA4yfQgZRAVVO+RlcfeYAsZo=;
 b=bMNbG0AWYLfE8uGpyNjVKpKsF3t6d3BkNqMDbRgAWzRptKJiS84k6F/7/6JOByFnzPbe1K
 AeNjHL3vNabzoyGxVQY4ff2GXddBYv1FrIytEPC5Kd9KAEo0IeNSlLwwI9StpVApmHHE7w
 Pl+lWEoevWepjjA0/2I40Tvv4d3aj68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Gln04e26OhSQBpQX-A92hA-1; Thu, 27 Feb 2020 02:10:50 -0500
X-MC-Unique: Gln04e26OhSQBpQX-A92hA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E2648017DF;
 Thu, 27 Feb 2020 07:10:49 +0000 (UTC)
Received: from andariel.pipo.sk (ovpn-204-53.brq.redhat.com [10.40.204.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24CB019C58;
 Thu, 27 Feb 2020 07:10:43 +0000 (UTC)
Date: Thu, 27 Feb 2020 08:10:40 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/3] block: Add support to warn on backing file change
 without format
Message-ID: <20200227071040.GB20737@andariel.pipo.sk>
References: <20200227023928.1021959-1-eblake@redhat.com>
 <20200227023928.1021959-3-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227023928.1021959-3-eblake@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 26, 2020 at 20:39:27 -0600, Eric Blake wrote:
> For now, this is a mechanical addition; all callers pass false. But
> the next patch will use it to improve 'qemu-img rebase -u' when
> selecting a backing file with no format.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/block/block.h |  4 ++--
>  block.c               | 13 ++++++++++---
>  block/qcow2.c         |  2 +-
>  block/stream.c        |  2 +-
>  blockdev.c            |  3 ++-
>  qemu-img.c            |  4 ++--
>  6 files changed, 18 insertions(+), 10 deletions(-)

Reviewed-by: Peter Krempa <pkrempa@redhat.com>


