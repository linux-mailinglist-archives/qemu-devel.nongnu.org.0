Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E574772B44
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 11:18:59 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqDQJ-0000uh-1d
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 05:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hqDQ4-0000W1-Tj
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hqDQ3-0000je-UM
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:18:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48860)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hqDQ3-0000jH-Nk
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:18:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 925732F8BE3;
 Wed, 24 Jul 2019 09:18:42 +0000 (UTC)
Received: from redhat.com (ovpn-116-17.ams2.redhat.com [10.36.116.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F7A5D9DE;
 Wed, 24 Jul 2019 09:18:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Ivan Ren <renyime@gmail.com>
In-Reply-To: <1561468699-9819-3-git-send-email-ivanren@tencent.com> (Ivan
 Ren's message of "Tue, 25 Jun 2019 21:18:18 +0800")
References: <1561468699-9819-1-git-send-email-ivanren@tencent.com>
 <1561468699-9819-3-git-send-email-ivanren@tencent.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 24 Jul 2019 11:18:40 +0200
Message-ID: <874l3b94en.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 24 Jul 2019 09:18:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] migration: fix migrate_cancel leads
 live_migration thread hung forever
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
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ivan Ren <renyime@gmail.com> wrote:
> When we 'migrate_cancel' a multifd migration, live_migration thread may
> hung forever at some points, because of multifd_send_thread has already
> exit for socket error:
> 1. multifd_send_pages may hung at qemu_sem_wait(&multifd_send_state->
>    channels_ready)
> 2. multifd_send_sync_main my hung at qemu_sem_wait(&multifd_send_state->
>    sem_sync)
>
> Signed-off-by: Ivan Ren <ivanren@tencent.com>
> ---
> +    if (ret != 0) {
> +        if (flags & MULTIFD_FLAG_SYNC) {
> +            qemu_sem_post(&multifd_send_state->sem_sync);

flags is also needed.

Sorry, Juan.


> +        }
> +        qemu_sem_post(&multifd_send_state->channels_ready);
> +    }
> +
>      qemu_mutex_lock(&p->mutex);
>      p->running = false;
>      qemu_mutex_unlock(&p->mutex);

