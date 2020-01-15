Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3013B747
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 02:56:37 +0100 (CET)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irXvA-0001Ds-M9
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 20:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fengzhimin1@huawei.com>) id 1irXu6-0000iZ-PE
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 20:55:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fengzhimin1@huawei.com>) id 1irXu5-0003Ty-5i
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 20:55:30 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2427 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fengzhimin1@huawei.com>)
 id 1irXu4-0003Sd-0u
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 20:55:28 -0500
Received: from dggemi404-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 48575DEB61B017283EAC;
 Wed, 15 Jan 2020 09:55:23 +0800 (CST)
Received: from DGGEMI529-MBX.china.huawei.com ([169.254.6.126]) by
 dggemi404-hub.china.huawei.com ([10.3.17.142]) with mapi id 14.03.0439.000;
 Wed, 15 Jan 2020 09:55:17 +0800
From: fengzhimin <fengzhimin1@huawei.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH RFC 01/12] migration: Add multiRDMA capability support
Thread-Topic: [PATCH RFC 01/12] migration: Add multiRDMA capability support
Thread-Index: AQHVyibKD2XFRY5EZ0W9CSvegFTnFqfq+Bww
Date: Wed, 15 Jan 2020 01:55:16 +0000
Message-ID: <03C2A65461456D4EBE9E6D4D0D96C583FBC7C1@DGGEMI529-MBX.china.huawei.com>
References: <20200109045922.904-1-fengzhimin1@huawei.com>
 <20200109045922.904-2-fengzhimin1@huawei.com>
 <875zhfxtkj.fsf@dusky.pond.sub.org>
In-Reply-To: <875zhfxtkj.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.198]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.187
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "jemmy858585@gmail.com" <jemmy858585@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your review. I will change it in the next version(V2).

-----Original Message-----
From: Markus Armbruster [mailto:armbru@redhat.com]=20
Sent: Monday, January 13, 2020 11:30 PM
To: fengzhimin <fengzhimin1@huawei.com>
Cc: quintela@redhat.com; dgilbert@redhat.com; eblake@redhat.com; jemmy85858=
5@gmail.com; qemu-devel@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huaw=
ei.com>
Subject: Re: [PATCH RFC 01/12] migration: Add multiRDMA capability support

Zhimin Feng <fengzhimin1@huawei.com> writes:

> From: fengzhimin <fengzhimin1@huawei.com>
>
> Signed-off-by: fengzhimin <fengzhimin1@huawei.com>
> ---
[...]
> diff --git a/qapi/migration.json b/qapi/migration.json index=20
> b7348d0c8b..c995ffdc4c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -421,6 +421,8 @@
>  # @validate-uuid: Send the UUID of the source to allow the destination
>  #                 to ensure it is the same. (since 4.2)
>  #
> +# @multirdma: Use more than one channels for rdma migration. (since=20
> +4.2) #
>  # Since: 1.2
>  ##
>  { 'enum': 'MigrationCapability',
> @@ -428,7 +430,7 @@
>             'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram'=
,
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> -           'x-ignore-shared', 'validate-uuid' ] }
> +           'x-ignore-shared', 'validate-uuid', 'multirdma' ] }
> =20
>  ##
>  # @MigrationCapabilityStatus:

Spell it multi-rdma?


