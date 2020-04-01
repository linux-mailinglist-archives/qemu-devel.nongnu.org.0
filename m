Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F366419AF89
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 18:16:56 +0200 (CEST)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJg2y-0001p9-2n
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 12:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jJg1C-0000M7-UP
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:15:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jJg1B-0000pP-SJ
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:15:06 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:20985)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1jJg19-0000m0-Kd; Wed, 01 Apr 2020 12:15:03 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A17E94594E;
 Wed,  1 Apr 2020 18:14:59 +0200 (CEST)
Date: Wed, 1 Apr 2020 17:37:45 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <997901084.0.1585755465486@webmail.proxmox.com>
In-Reply-To: <20200401103748.GA4680@linux.fritz.box>
References: <658260883.24.1585644382441@webmail.proxmox.com>
 <20200331125804.GE7030@linux.fritz.box>
 <303038276.59.1585665152860@webmail.proxmox.com>
 <787d7517-bf56-72c7-d197-2313a864e05f@virtuozzo.com>
 <713436887.61.1585668262838@webmail.proxmox.com>
 <20200331153719.GI7030@linux.fritz.box>
 <518198448.62.1585671498399@webmail.proxmox.com>
 <20200401103748.GA4680@linux.fritz.box>
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > I really nobody else able to reproduce this (somebody already tried to reproduce)?
> 
> I can get hangs, but that's for job_completed(), not for starting the
> job. Also, my hangs have a non-empty bs->tracked_requests, so it looks
> like a different case to me.

Please can you post the command line args of your VM? I use something like

./x86_64-softmmu/qemu-system-x86_64 -chardev 'socket,id=qmp,path=/var/run/qemu-server/101.qmp,server,nowait' -mon 'chardev=qmp,mode=control' -pidfile /var/run/qemu-server/101.pid  -m 1024 -object 'iothread,id=iothread-virtioscsi0' -device 'virtio-scsi-pci,id=virtioscsi0,iothread=iothread-virtioscsi0' -drive 'file=/backup/disk3/debian-buster.raw,if=none,id=drive-scsi0,format=raw,cache=none,aio=native,detect-zeroes=on' -device 'scsi-hd,bus=virtioscsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0' -machine "type=pc,accel=kvm"

Do you also run "stress-ng -d 5" indied the VM?


