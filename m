Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF815749E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 13:34:28 +0100 (CET)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j18Gh-0008O4-6g
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 07:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j18Fc-0007Q2-UA
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 07:33:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j18Fc-0000dc-15
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 07:33:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j18Fb-0000c6-U0
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 07:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581337999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SD9gDvtqth/m9PBLWpRPD7Flt4lz7t7JH8l2KPId8Pg=;
 b=aSdVr1Fn/SngRlPnY0Q73ZB4Vg5WTMuLFjnuBQ5ItuglJbPD/DkQq+W1AeGx5NHMwbWTFT
 aukdR849zniivO2x61gkChR2SywID4sfuM7GG023A1jvE9kf/TLbtTUxo/oWUjVXwpof+f
 OjevpLjSLQ/BH8FEQ8QchQ0Fz6qOicI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-LoLTLXy-MAyRpzESH4jTaA-1; Mon, 10 Feb 2020 07:33:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25B5800D6C;
 Mon, 10 Feb 2020 12:33:15 +0000 (UTC)
Received: from redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BBF660BF3;
 Mon, 10 Feb 2020 12:33:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 12/13] virtio-iommu: Support migration
In-Reply-To: <20200109144319.15912-13-eric.auger@redhat.com> (Eric Auger's
 message of "Thu, 9 Jan 2020 15:43:18 +0100")
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-13-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 10 Feb 2020 13:33:05 +0100
Message-ID: <87eev27hby.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LoLTLXy-MAyRpzESH4jTaA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Auger <eric.auger@redhat.com> wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. We only migrate the domain gtree. The endpoint gtree
> is re-constructed in a post-load operation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And yes, this is as confusing as it can be:
 a tree of mappings (i.e. key,value)
 a list of endpoints

I will propose this as most complex structure migrated ever.

Later, Juan.


