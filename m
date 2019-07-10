Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439E63FD8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 06:13:22 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl3yr-00026I-7U
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 00:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hl3xO-0001ZZ-Pb
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 00:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hl3xM-0001yH-S9
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 00:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hl3xH-0001rC-3n; Wed, 10 Jul 2019 00:11:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12C7C308210D;
 Wed, 10 Jul 2019 04:11:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9A0B60852;
 Wed, 10 Jul 2019 04:11:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3648E1138648; Wed, 10 Jul 2019 06:11:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <20190709232550.10724-1-jsnow@redhat.com>
 <20190709232550.10724-2-jsnow@redhat.com>
 <fdd0230c-2524-7a15-d356-c37f2944cf6b@redhat.com>
Date: Wed, 10 Jul 2019 06:11:32 +0200
In-Reply-To: <fdd0230c-2524-7a15-d356-c37f2944cf6b@redhat.com> (John Snow's
 message of "Tue, 9 Jul 2019 21:36:19 -0400")
Message-ID: <87a7dmy1e3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 10 Jul 2019 04:11:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 01/18] qapi/block-core: Introduce
 BackupCommon
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 7/9/19 7:25 PM, John Snow wrote:
>> drive-backup and blockdev-backup have an awful lot of things in common
>> that are the same. Let's fix that.
>> 
>> I don't deduplicate 'target', because the semantics actually did change
>> between each structure. Leave that one alone so it can be documented
>> separately.
>
> Sorry Markus, I forgot to adjust this. Pretend I wrote:
>
> Where documentation was not identical, use the most up-to-date version.
> For "speed", use Blockdev-Backup's version. For "sync", use
> Drive-Backup's version.

With that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

[...]

