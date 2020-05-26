Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F519C63D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 17:45:42 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK22H-0004tP-4F
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 11:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jK21L-0004HM-Sk
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 11:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jK21K-0003WQ-Rp
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 11:44:43 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:28861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1jK21H-0003Uz-W4; Thu, 02 Apr 2020 11:44:40 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id EC0E445977;
 Thu,  2 Apr 2020 17:44:38 +0200 (CEST)
Date: Thu, 2 Apr 2020 17:44:37 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <1734893624.60.1585842277722@webmail.proxmox.com>
In-Reply-To: <20200402142524.GD4006@linux.fritz.box>
References: <713436887.61.1585668262838@webmail.proxmox.com>
 <20200331153719.GI7030@linux.fritz.box>
 <518198448.62.1585671498399@webmail.proxmox.com>
 <20200401103748.GA4680@linux.fritz.box>
 <997901084.0.1585755465486@webmail.proxmox.com>
 <20200401181256.GB27663@linux.fritz.box>
 <1403939459.52.1585765681569@webmail.proxmox.com>
 <20200401184431.GD27663@linux.fritz.box>
 <903538836.29.1585818619688@webmail.proxmox.com>
 <20200402121403.GB4006@linux.fritz.box>
 <20200402142524.GD4006@linux.fritz.box>
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> It does looks more like your case because I now have bs.in_flight == 0
> and the BlockBackend of the scsi-hd device has in_flight == 8. 

yes, this looks very familiar.

> Of course, this still doesn't answer why it happens, and I'm not sure if we
> can tell without adding some debug code.
> 
> I'm testing on my current block branch with Stefan's fixes on top.

Note: I can trigger it with and without Stefans patches on top


