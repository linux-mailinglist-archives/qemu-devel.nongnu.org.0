Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD2C28F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 23:40:14 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF3Ou-0001Pb-9I
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 17:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iF3NJ-0000Rt-WA
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 17:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iF3NI-0003vJ-2x
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 17:38:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iF3NC-0003rP-QZ; Mon, 30 Sep 2019 17:38:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B9D6C049E36;
 Mon, 30 Sep 2019 21:38:25 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936DC10013A1;
 Mon, 30 Sep 2019 21:38:23 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] RFC: implement reopen for nbd driver
Date: Tue,  1 Oct 2019 00:38:19 +0300
Message-Id: <20190930213820.29777-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 30 Sep 2019 21:38:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
It looks like nbd driver doesn't have support
for reopen, which doesn't allow to commit qcow2 snapshots
which have nbd export as a base file.
This is because the base is opened read-only, and only
when commit job starts it reopens the base read-write.

Now after talking with Eric Blake, I understood that
nbd doesn't have the ability to tell the server to open read/only
and then change this on the fly, thus even when opening
an export as read-only the server will still allow writes.

This means that an empty .bdrv_reopen_prepare
(well except checking that export is not read-only) is supposed
to be enough.

Sending this as RFC, since I am not sure that this is the correct
solution.

Best regards,
	Maxim Levitsky

Maxim Levitsky (1):
  nbd: add empty .bdrv_reopen_prepare

 block/nbd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.17.2


