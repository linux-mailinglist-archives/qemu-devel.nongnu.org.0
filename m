Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180EB3448F7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:14:22 +0100 (CET)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMG5-0000do-4S
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOLw7-0007Rs-Kv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOLw0-0001MM-9T
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616424811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rcxk5vhjH1wxrKDE2+8fIGeGj89yiOK3ZY2tSd0Frpg=;
 b=RDAcFJg3lGkZDxJH88BU122JBoIGBi1QZrEfpo0/7fYsuAz+b0snhyGcNM7Sl6d1D6TmOq
 p2TUWcsQ0a9aQSn9rJpsXe8I+mygYYuJOFfe/IUJFxuJN8itEdEfN6aXGSRw0FU+pV7t05
 yh+ruibCIyVRGTlSraiVK2gvgBPmyXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-aXs42cm0P2SKz-7S9UmQTw-1; Mon, 22 Mar 2021 10:53:27 -0400
X-MC-Unique: aXs42cm0P2SKz-7S9UmQTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC3D612A1;
 Mon, 22 Mar 2021 14:53:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B59339A5F;
 Mon, 22 Mar 2021 14:53:24 +0000 (UTC)
Date: Mon, 22 Mar 2021 15:53:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Patrik =?utf-8?B?SmFub3XFoWVr?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 0/2] block/raw: implemented persistent dirty bitmap and
 ability to dump bitmap content via qapi
Message-ID: <YFivYmPMRyqbM4zf@merkur.fritz.box>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com>
 <a87aadc1-d795-27cd-35c7-a5c4175df687@patrikjanousek.cz>
MIME-Version: 1.0
In-Reply-To: <a87aadc1-d795-27cd-35c7-a5c4175df687@patrikjanousek.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Patrik,

Am 22.03.2021 um 09:57 hat Patrik Janoušek geschrieben:
> On 3/22/21 9:29 AM, Vladimir Sementsov-Ogievskiy wrote:
> > We do have external incremental backups, based on Qemu bitmap API. But
> > it depends of course on qcow2 persistent bitmaps feature.
>
> Yes, I know. And that's the problem. The point of my bachelor thesis is
> to implement a backup solution for the raw format.

the problem with this is that raw isn't really a format, it's more the
absence of a format. You just have the content of the virtual disk in a
file and that's it. This means not having any metadata (apart from the
metadata stored in the filesystem, of course).

As soon as you add metadata in some way (in your case, by referencing
additional metadata files in runtime options), it's not raw any more. If
you write to the raw image file without updating the metadata, the
metadata becomes inconsistent with the content. In other words, both
files form a single disk image together and can only be used together or
you're breaking them.

This in turn means that you have just invented a new image format. It's
a bit unconventional in that it's spread across multiple files, and that
some of the metadata that brings everything together is even in command
line options instead of a file, but you have to combine these components
in the same way every time you start the VM, so it really is a new image
format.

We have gone through such discussions a while ago because obviously "raw
with dirty bitmaps" was a request that came soon after we discussed
persistent dirty maps. But as we came to the conclusion that any
addition to raw would create another new image format specific to QEMU,
we decided that we can as well use qcow2 for this, which is already the
fully featured QEMU image format.

I hope this background helps a bit to explain the reactions you have
received so far.

Kevin


