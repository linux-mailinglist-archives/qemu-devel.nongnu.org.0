Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FD170090
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 14:57:31 +0100 (CET)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6xBq-0003Wx-Bz
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 08:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6xAm-0002nj-4x
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6xAl-0002MQ-6C
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:56:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45197
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6xAl-0002Eb-2E
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582725379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyUK7RhlS42MkFnJV7F+S4PDBwGyQSAbxALHBNKo9Rg=;
 b=jLx8PPmFih0wk2ZSnx3FqehkI119s/na6GEXqZYyAWcxykCV7ydOjOR/E20oDzO58g+OF2
 LECNdNpgz0CgZJb7bwqtPJaWyu6xGRuEBGehO8uOdbAyfnAvxyKjr2TQ/s0H0boHcnprtO
 lLQ5VXj1cZUrBnmq5PZKha2iIs1b8Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-A5_h-cXIPCmdRABEAhkKng-1; Wed, 26 Feb 2020 08:56:15 -0500
X-MC-Unique: A5_h-cXIPCmdRABEAhkKng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A444913E4;
 Wed, 26 Feb 2020 13:56:14 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8AD5D9CD;
 Wed, 26 Feb 2020 13:56:13 +0000 (UTC)
Date: Wed, 26 Feb 2020 14:56:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] block: Fix leak in bdrv_create_file_fallback()
Message-ID: <20200226135612.GF6096@linux.fritz.box>
References: <20200225155618.133412-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200225155618.133412-1-mreitz@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2020 um 16:56 hat Max Reitz geschrieben:
> @options is leaked by the first two return statements in this function.
>=20
> Note that blk_new_open() takes the reference to @options even on
> failure, so all we need to do to fix the leak is to move the QDict
> allocation down to where we actually need it.
>=20
> Reported-by: Coverity (CID 1419884)
> Fixes: fd17146cd93d1704cd96d7c2757b325fc7aac6fd
>        ("block: Generic file creation fallback")
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


