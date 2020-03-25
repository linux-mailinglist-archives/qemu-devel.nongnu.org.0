Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1519286D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 13:31:01 +0100 (CET)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH5BU-0006Da-Ol
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 08:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jH5AU-0005nA-PT
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 08:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jH5AT-00026d-IT
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 08:29:58 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:17422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jH5AT-00025g-BW
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 08:29:57 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C57E142AED;
 Wed, 25 Mar 2020 13:29:54 +0100 (CET)
Date: Wed, 25 Mar 2020 13:29:48 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Sergio Lopez <slp@redhat.com>, Max Reitz <mreitz@redhat.com>
Message-ID: <523142611.32.1585139388758@webmail.proxmox.com>
In-Reply-To: <20200325114639.rxwhs7h4bkxhkgsu@dritchie>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
 <1806708761.60.1585056799652@webmail.proxmox.com>
 <32c10c76-1c9f-3a6a-4410-09eebad0f6f3@redhat.com>
 <20200325081312.7wtz6crlgotsw5ul@dritchie>
 <20200325114639.rxwhs7h4bkxhkgsu@dritchie>
Subject: Re: backup transaction with io-thread core dumps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
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
Cc: kwolf@redhat.com, "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> As expected, if both BDS are running on the same IOThread (and thus,
> the same AioContext), the problem is not reproducible.
> 
> In a general sense, we could say that completion modes other than
> "individual" are not supported for a transaction that may access
> different AioContexts. I don't see a safe an easy way to fix this. We
> could opt for simply detect and forbid such completion modes when the
> BDS's are assigned to different AioContexts. Perhaps Kevin (in CC) has
> a better idea.

So the solution is to disable backups when using io-threads?


