Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1292E7D9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 00:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW6oR-0006cd-2A
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 18:12:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hW6mJ-0005Or-Ji
	for qemu-devel@nongnu.org; Wed, 29 May 2019 18:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hW6mI-0000sr-Nf
	for qemu-devel@nongnu.org; Wed, 29 May 2019 18:10:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hW6mD-0000nc-2u; Wed, 29 May 2019 18:10:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2D452CE945;
	Wed, 29 May 2019 22:10:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E6007A404;
	Wed, 29 May 2019 22:10:12 +0000 (UTC)
Date: Thu, 30 May 2019 00:10:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190529221010.GC3471@localhost.localdomain>
References: <20190524172812.27308-1-mreitz@redhat.com>
	<20190524172812.27308-2-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524172812.27308-2-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 29 May 2019 22:10:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 1/3] block: Add ImageRotationalInfo
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alberto Garcia <berto@igalia.com>,
	Anton Nefedov <anton.nefedov@virtuozzo.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2019 um 19:28 hat Max Reitz geschrieben:
> This enum indicates whether a file is stored on a rotating disk or a
> solid-state drive.  Drivers report it via the .bdrv_get_info() callback,
> and if they do not, the global bdrv_get_info() implementation
> automatically takes it from bs->file or bs->backing, if available.

Good that you wrote "bs->file or bs->backing" explicitly. Otherwise, I
might have missed that it begs one big question: What is the correct
answer for a qcow2 file that has bs->file on an SSD, but bs->backing on
a rotating disk?

I don't think there is a correct answer for the whole device, so maybe
this information shouldn't be per device in BlockDriverInfo, but per
block in bdrv_co_block_status() (optionally determined if the caller
requests it)?

Kevin

