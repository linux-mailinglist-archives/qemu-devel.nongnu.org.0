Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AB8A2C4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 17:59:31 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxCjK-0006uY-Kh
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 11:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49433)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hxCib-0005j6-Sd
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hxCia-0007tq-R8
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:46396)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hxCia-0007si-KG
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:44 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hxCiV-0001HP-Ra; Mon, 12 Aug 2019 18:58:39 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 18:58:27 +0300
Message-Id: <1565625509-404969-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4 0/2] char-socket: Fix race condition
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, berto@igalia.com,
 marcandre.lureau@redhat.com, andrey.shinkevich@virtuozzo.com,
 pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a race condition in which the tcp_chr_read() ioc handler
can close a connection that is being written to from another thread.

v4:
    The functions qemu_idle_add() and tcp_chr_be_event_closed() were removed
    because the callback is invoked after the call to object_property_del_all()
    so, the "chardev" object had been deleted and the segmentation fault occurs.
    Let's please apply the Alberto's simplified series to avoid the race condition.

v3:
    See the email thread with the Message ID
    <cover.1550842915.git.berto@igalia.com>

Alberto Garcia (2):
  main-loop: Fix GSource leak in qio_task_thread_worker()
  char-socket: Lock tcp_chr_disconnect()

 chardev/char-socket.c | 16 +++++++++++++---
 io/task.c             |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
1.8.3.1


