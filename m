Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47171ABDA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 12:10:56 +0200 (CEST)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP1Tz-0000Ex-42
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 06:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jP1Sp-0007vt-4l
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 06:09:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jP1So-0005EY-78
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 06:09:42 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:39951)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jP1So-0005Do-0K
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 06:09:42 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 21773420BF;
 Thu, 16 Apr 2020 12:09:36 +0200 (CEST)
Date: Thu, 16 Apr 2020 12:09:34 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Kevin Wolf <kwolf@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <1548825935.27.1587031774908@webmail.proxmox.com>
In-Reply-To: <20200416082849.GA6014@linux.fritz.box>
References: <5dde1955-49db-2626-1fa5-332e4d7a0928@proxmox.com>
 <20200416082849.GA6014@linux.fritz.box>
Subject: Re: qemu_coroutine_yield switches thread?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev25
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Cc: vsementsov@virtuozzo.com, slp@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > quick question: Can a resume from a qemu_coroutine_yield happen in a
> > different thread?
> > 
> > Well, it can, since I'm seeing it happen, but is that okay or a bug?
> 
> Yes, it can happen. At least for devices like IDE where a request is
> started during a vmexit (MMIO or I/O port write), the coroutine will
> usually begin its life in the vcpu thread and then move to the main loop
> thread.
> 
> This is not a problem because the vcpu thread holds the BQL while
> running the request coroutine.

Isn't that a problem when using QemuRecMutex, for example:

qemu_rec_mutex_lock(lock)
...
qemu_coroutine_yield() // wait for something
// we are now inside a different thread
qemu_rec_mutex_unlock(lock) // Crash - wrong thread!!

?


