Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428D177BB2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:16:15 +0100 (CET)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9ADO-0003hw-5n
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j9ABK-0002Gq-KH
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:14:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j9ABJ-0002Z8-NI
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:14:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j9ABJ-0002Yv-Jz
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583252045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BLD1VCPGpTzcoEEE1Utfs0cZSSKjyDR3u0vsjzV5s4=;
 b=BFf1r7rKwDYRtrEGlAfs1UtpI9jjawBg0yaYYqrQtnpd0aEt5PUn/aDkoKZPyfJAQ7Aj4K
 mv7MF4iTzXJonCrhyLaz5U8JGz44GkY+J+D6kgr9TX1750Tx/Hql0r/Ns7l/qNZ/2esfQA
 /63yrrcjic4EhsRGOTp9DnViq1aTnAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Sy1gqI4tMj2LE1TIXlZ6LQ-1; Tue, 03 Mar 2020 11:14:00 -0500
X-MC-Unique: Sy1gqI4tMj2LE1TIXlZ6LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D0A318B9FC8;
 Tue,  3 Mar 2020 16:13:59 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-229.ams2.redhat.com [10.36.117.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07369272A3;
 Tue,  3 Mar 2020 16:13:57 +0000 (UTC)
Date: Tue, 3 Mar 2020 17:13:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH 0/2] block/qcow2: Fix bitmap reopen with 'auto-read-only'
 file child
Message-ID: <20200303161356.GD5733@linux.fritz.box>
References: <cover.1582893284.git.pkrempa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1582893284.git.pkrempa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.02.2020 um 13:44 hat Peter Krempa geschrieben:
> See patch 2/2 for explanation. Also please excuse the lack of tests
> caused by my ignorance of not figuring out where to put them.

Thanks, applied to the block branch.

A test would probably live in test/qemu-iotests/. Test case 245 is
specifically about x-blockdev-reopen, so we could consider putting it
there, or you could just create a new test case.

Kevin


