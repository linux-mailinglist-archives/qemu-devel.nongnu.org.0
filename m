Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9A6305E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 08:17:23 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkjRK-00022H-8w
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 02:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58055)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hkjPc-0001Ye-Ts
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 02:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hkjPa-0003lj-Um
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 02:15:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hkjPW-0003Yx-Nu; Tue, 09 Jul 2019 02:15:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9ABB0307D88C;
 Tue,  9 Jul 2019 06:15:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F8A5C5FC;
 Tue,  9 Jul 2019 06:15:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EAD91138648; Tue,  9 Jul 2019 08:15:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
References: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
 <20190704130949.14017-2-dplotnikov@virtuozzo.com>
Date: Tue, 09 Jul 2019 08:15:10 +0200
In-Reply-To: <20190704130949.14017-2-dplotnikov@virtuozzo.com> (Denis
 Plotnikov's message of "Thu, 4 Jul 2019 16:09:47 +0300")
Message-ID: <87ef2zag41.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 09 Jul 2019 06:15:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] qcow2: introduce compression type
 feature
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Denis Plotnikov <dplotnikov@virtuozzo.com> writes:

> The patch adds some preparation parts for incompatible compression type
> feature to QCOW2 header that indicates that *all* compressed clusters
> must be (de)compressed using a certain compression type.
>
> It is implied that the compression type is set on the image creation and
> can be changed only later by image conversion, thus compression type
> defines the only compression algorithm used for the image.
>
> The goal of the feature is to add support of other compression algorithms
> to qcow2. For example, ZSTD which is more effective on compression than ZLIB.
> It works roughly 2x faster than ZLIB providing a comparable compression ratio
> and therefore provide a performance advantage in backup scenarios.
>
> The default compression is ZLIB. Images created with ZLIB compression type
> are backward compatible with older qemu versions.
>
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

