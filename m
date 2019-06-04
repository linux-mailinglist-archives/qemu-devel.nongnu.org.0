Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC73420C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 10:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY51U-0002a6-Fg
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 04:42:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hY50V-0002EU-2c
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hY50U-00040o-6X
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:41:23 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:58745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hY50P-0003qn-KP; Tue, 04 Jun 2019 04:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=4pQLcnJcpvIw1jSzsnYj0z6R3znBXnp2ev+5s3BeyNs=; 
	b=qpp7N4V7LFzzYVmc+Q82lt6WPdmnaAmPyyGFv2bEpyb2fQ3iZLcFUKSPGNtkvpuw9yc5rhCbR2KIgPqihExKUnEIqQHFSIyjJ0BG2lBSTANAHSgboSU0w1BBMdGx22hhDZr/eC+bF4XMufLI18GZ3WOG1l6lg8UstyQK5l0pa819A/XvXB6Fje8zfp06FwF3049NkuNnBXsCrBvqkG4IAaHqvxx++avKIVZ7LlVdy4zsUOdmzAttNHTF19iE0o48DptVf06sLNQxJcmrBmP2ibeSlP5Cnsl8OeODkwDi1RRFH21c5Pt27IwwhuBnKe4bZg0d2yxUZ7ABD8zZN0tJQg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hY504-0003gx-OH; Tue, 04 Jun 2019 10:40:56 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hY504-00034r-LV; Tue, 04 Jun 2019 10:40:56 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190603202236.1342-1-mreitz@redhat.com>
References: <20190603202236.1342-1-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Tue, 04 Jun 2019 10:40:56 +0200
Message-ID: <w51pnntrbdz.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v2 0/2] blockdev: Overlays are
 not snapshots
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 03 Jun 2019 10:22:34 PM CEST, Max Reitz wrote:
> QEMU=E2=80=99s always been confused over what a snapshot is: Is it the ov=
erlay?
> Is it the backing image?
>
> Confusion is rarely a good thing.  I can=E2=80=99t think of any objective=
 reason
> why the overlay would be a snapshot.  A snapshot is something that does
> not change over time; the overlay does.
>
> (I suppose historically the reason is that =E2=80=9CTaking an overlay=E2=
=80=9D makes no
> sense, so the operations are called =E2=80=9CTaking a snapshot=E2=80=9D. =
 Somehow, this
> meaning carried over to the new file that is created during that
> operation; if =E2=80=9CCreating a snapshot=E2=80=9D creates a file, that =
file must be
> the snapshot, right?  Well, no, it isn=E2=80=99t.)
>
> Let=E2=80=99s fix this as best as we can.  Better Nate than lever.

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

