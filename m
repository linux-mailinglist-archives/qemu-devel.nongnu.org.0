Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1242213
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 12:15:47 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb0IE-0008GD-9l
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 06:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hb0Gz-0007Y4-Bh
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hb0Gy-0007uz-HO
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:14:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hb0Gy-0007uH-Bu
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:14:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D04EF81DFB;
 Wed, 12 Jun 2019 10:14:18 +0000 (UTC)
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 625E253786;
 Wed, 12 Jun 2019 10:14:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190612014337.11255-1-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Wed, 12 Jun 2019 09:43:37 +0800")
References: <20190612014337.11255-1-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 12 Jun 2019 12:14:14 +0200
Message-ID: <871rzznma1.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 12 Jun 2019 10:14:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration/multifd: call
 multifd_send_sync_main when sending RAM_SAVE_FLAG_EOS
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> On receiving RAM_SAVE_FLAG_EOS, multifd_recv_sync_main() is called to
> synchronize receive threads. Current synchronization mechanism is to wait
> for each channel's sem_sync semaphore. This semaphore is triggered by a
> packet with MULTIFD_FLAG_SYNC flag. While in current implementation, we
> don't do multifd_send_sync_main() to send such packet when
> blk_mig_bulk_active() is true.
>
> This will leads to the receive threads won't notify
> multifd_recv_sync_main() by sem_sync. And multifd_recv_sync_main() will
> always wait there.
>
> [Note]: normal migration test works, while didn't test the
> blk_mig_bulk_active() case. Since not sure how to produce this
> situation.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Block migration is weird.
Block migration is weird.
....

