Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B910AB6A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:15 +0100 (CET)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZsNu-0000RP-4k
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 03:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iZsMy-0008NP-LO
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:08:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iZsMw-0005PS-Ne
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:08:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55242
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iZsMw-0005NC-KA
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574842092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iShhE9Y7p6074tgwz07lp47mHwIy83LVjsZsfzEuAV0=;
 b=cQI3j0Z7/YvP9LsdcP+iHJOLXt0rR5RQCvJ1EkxlxWi3caS864M/UG0XXCRrrLq7Ns3AqC
 IO9zMmopq6uLtCrmU7nCbcHn+fH006Fi/8XaKmxG0qvZb1q2MqgIfzop+dm2QmX3i7mUMn
 BbbT5ZDZqN9UMY2MlmBlNC1CYyvcwUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-PpTfHBkGM0GQwy8ejNUzHg-1; Wed, 27 Nov 2019 03:08:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C76F107ACE4;
 Wed, 27 Nov 2019 08:08:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44043608AC;
 Wed, 27 Nov 2019 08:08:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B12741138606; Wed, 27 Nov 2019 09:08:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 8/9] monitor: move hmp_info_block* to blockdev-hmp-cmds.c
References: <20191120185850.18986-1-mlevitsk@redhat.com>
 <20191120185850.18986-9-mlevitsk@redhat.com>
Date: Wed, 27 Nov 2019 09:08:06 +0100
In-Reply-To: <20191120185850.18986-9-mlevitsk@redhat.com> (Maxim Levitsky's
 message of "Wed, 20 Nov 2019 20:58:49 +0200")
Message-ID: <87blsxkahl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: PpTfHBkGM0GQwy8ejNUzHg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think it makes sense to collect *all* block HMP stuff here.

Left in monitor/hmp-cmds.c: hmp_eject(), hmp_nbd_server_start(), ...

I guess hmp_change() has to stay there, because it's both block and ui.

Left in blockdev.c: hmp_drive_add_node().

Quick grep for possible files to check:

$ git-grep -l 'monitor[a-z_-]*.h' | xargs grep -l 'block[a-z_-]*\.h'
MAINTAINERS
blockdev-hmp-cmds.c
blockdev.c
cpus.c
dump/dump.c
hw/display/qxl.c
hw/scsi/vhost-scsi.c
hw/usb/dev-storage.c
include/monitor/monitor.h
migration/migration.c
monitor/hmp-cmds.c
monitor/hmp.c
monitor/misc.c
monitor/qmp-cmds.c
qdev-monitor.c
vl.c


