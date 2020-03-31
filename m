Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EF199147
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 11:19:10 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJD37-0005SK-8K
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 05:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jJD1v-0004ZB-RQ
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:17:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jJD1u-0007bL-HR
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:17:55 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:20685)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jJD1u-0007YO-Ah
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:17:54 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2F83D42ED8;
 Tue, 31 Mar 2020 11:17:49 +0200 (CEST)
Date: Tue, 31 Mar 2020 11:17:47 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Sergio Lopez <slp@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>
Message-ID: <1005102592.28.1585646267717@webmail.proxmox.com>
In-Reply-To: <658260883.24.1585644382441@webmail.proxmox.com>
References: <658260883.24.1585644382441@webmail.proxmox.com>
Subject: Re: bdrv_drained_begin deadlock with io-threads
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev23
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inside exec.c, there is a race:

-------
static bool prepare_mmio_access(MemoryRegion *mr)
{
    bool unlocked = !qemu_mutex_iothread_locked();
    bool release_lock = false;

    if (unlocked && mr->global_locking) {
        qemu_mutex_lock_iothread();
------

IMHO, checking for unlocked that way is wrong. Should use some kind
of _trylock instead?


