Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56B30E4D5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:20:09 +0100 (CET)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PZI-0005VP-V8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7PWR-0004UW-GU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7PWG-0000Qv-Nr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612387019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvLDvY+xGfc43NTYW189XM6gvNfQO4mI3dxR4erYLgQ=;
 b=Kg08mDF10aQIBoMsrMOLU3cknPEeQ3AflLOG248cSLhcWU7Z7k7ClA3mRWME1BRDDjrBMq
 9pBPdeUyp3pmzn48IfEpMTmF0gBLsOFNFZi2i49qtSsJTtUWkwtdlyWLh6LRW3GIzo2Bg9
 daT6BxQPlWyRNg8+j+f2+cmBsVwr97E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-fuDOnn5zP5eOm7K77GZy8g-1; Wed, 03 Feb 2021 16:16:56 -0500
X-MC-Unique: fuDOnn5zP5eOm7K77GZy8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97B9801960;
 Wed,  3 Feb 2021 21:16:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-32.ams2.redhat.com [10.36.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C1B60BFA;
 Wed,  3 Feb 2021 21:16:53 +0000 (UTC)
Date: Wed, 3 Feb 2021 22:16:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 22/36] block: split out bdrv_replace_node_noperm()
Message-ID: <20210203211651.GI5507@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-23-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-23-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Split part of bdrv_replace_node_common() to be used separately.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> @@ -4909,7 +4936,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>                                      bool auto_skip, Error **errp)
>  {
>      int ret = -EPERM;
> -    BdrvChild *c, *next;
>      GSList *tran = NULL;
>      g_autoptr(GHashTable) found = NULL;
>      g_autoptr(GSList) refresh_list = NULL;

ret doesn't need to be initialised any more now.

Kevin


