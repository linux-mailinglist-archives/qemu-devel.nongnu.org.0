Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D51727BB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 19:37:31 +0100 (CET)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7O2M-0006ZE-Vj
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 13:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7O1Q-0005Xe-R1
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:36:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7O1P-0002LR-Fu
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:36:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36411
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7O1P-0002KA-B8
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582828590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUpS01+e6nl1QK3mpdfHghJmTnRs5Y4WpdaiwEBB94A=;
 b=RsfC3Z5PI2plFqmLzmsY723QRnng9S0lf8ZHYBKxr63jwSAYJQomUYEzDeWEzyT4G2w9I4
 oflc0NvPhiHMjIfa0MHCEo772LwP6o4UnQ3K73FuDSqoGK1XTgEUEc8uJpKlOrgzMOn/6e
 gymRIKgZcld/zhiSfkHBrS8KVol9Jbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-Tz_X-rqHMyibLU5bdTWUwg-1; Thu, 27 Feb 2020 13:36:27 -0500
X-MC-Unique: Tz_X-rqHMyibLU5bdTWUwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D339118FF661;
 Thu, 27 Feb 2020 18:36:25 +0000 (UTC)
Received: from redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BBAB5C28E;
 Thu, 27 Feb 2020 18:36:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH V2 1/8] migration: fix COLO broken caused by a previous
 commit
In-Reply-To: <20200224065414.36524-2-zhang.zhanghailiang@huawei.com>
 (zhanghailiang's message of "Mon, 24 Feb 2020 14:54:07 +0800")
References: <20200224065414.36524-1-zhang.zhanghailiang@huawei.com>
 <20200224065414.36524-2-zhang.zhanghailiang@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 27 Feb 2020 19:36:21 +0100
Message-ID: <87zhd3c1y2.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: quintela@redhat.com
Cc: danielcho@qnap.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:
> This commit "migration: Create migration_is_running()" broke
> COLO. Becuase there is a process broken by this commit.
>
> colo_process_checkpoint
>  ->colo_do_checkpoint_transaction
>    ->migrate_set_block_enabled
>      ->qmp_migrate_set_capabilities
>
> It can be fixed by make COLO process as an exception,
> Maybe we need a better way to fix it.
>
> Cc: Juan Quintela <quintela@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

oops sorry.

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


