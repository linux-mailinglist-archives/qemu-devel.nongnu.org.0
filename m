Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79D178DA2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 10:41:21 +0100 (CET)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9QWm-0000ch-Qe
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 04:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j9QVi-0007hR-60
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:40:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j9QVh-0001zi-0Z
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:40:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48974
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j9QVg-0001yI-Pq
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583314812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1g2wmTulPlPqf1yjIR15Kc4rdKhfz1Mzk1qiHhqLYOc=;
 b=Xqd+In+4Tl8g/p+3gxOYp/qE+pcQN5KuRucP4QLf7B7mL7H+wc70C+8GIntxfCpcg6V4TB
 RlsGFJdhnuIzoRmsI4fv3GC0xWofukWkIPC10sEgFQJ0KINsM/MNbdyoxEKfFBuiRA4uaa
 fNximGLedaicRjm8uYELQiPAvGl49jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Oz4_bhn_P9e92CR-RK5dUA-1; Wed, 04 Mar 2020 04:40:10 -0500
X-MC-Unique: Oz4_bhn_P9e92CR-RK5dUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E000800D48;
 Wed,  4 Mar 2020 09:40:09 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 785FE272A7;
 Wed,  4 Mar 2020 09:40:05 +0000 (UTC)
Date: Wed, 4 Mar 2020 10:40:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH 0/2] block: bdrv_reopen() with backing file in different
 AioContext
Message-ID: <20200304094004.GA5477@dhcp-200-226.str.redhat.com>
References: <20200227181804.15299-1-kwolf@redhat.com>
 <20200304092926.GA1320660@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20200304092926.GA1320660@angien.pipo.sk>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: berto@igalia.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.03.2020 um 10:29 hat Peter Krempa geschrieben:
> On Thu, Feb 27, 2020 at 19:18:02 +0100, Kevin Wolf wrote:
> > Kevin Wolf (2):
> >   iotests: Refactor blockdev-reopen test for iothreads
> >   block: bdrv_reopen() with backing file in different AioContext
>=20
> Thanks for the patches. It fixes the problem we've talked about:
>=20
> Tested-by: Peter Krempa <pkrempa@redhat.com>

Thanks for testing, applied to the block branch.

Kevin


