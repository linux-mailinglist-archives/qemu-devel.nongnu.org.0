Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D632D722
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVtT9-0002nl-Je
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:57:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1hVt5H-00030Y-RJ
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1hVt5G-0001zf-QQ
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:33:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1hVt5C-0001xB-Eb; Wed, 29 May 2019 03:33:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FD693092656;
	Wed, 29 May 2019 07:33:07 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E095D756;
	Wed, 29 May 2019 07:33:06 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, Jie Wang <wangjie88@huawei.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <1559048796-57016-1-git-send-email-wangjie88@huawei.com>
	<cac8ed16-7846-ca22-2463-c3c738066d61@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <f165741a-2ffd-62fd-b121-49bf1a3597f1@redhat.com>
Date: Wed, 29 May 2019 09:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cac8ed16-7846-ca22-2463-c3c738066d61@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 07:33:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] pr-manager-helper: fix pr
 process been killed when reconectting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/19 7:45 PM, Paolo Bonzini wrote:
> On 28/05/19 15:06, Jie Wang wrote:
>> if pr-helper been killed and qemu send disconnect event to libvirt
>> and libvirt started a new pr-helper process, the new pr-heleper
>> been killed again when qemu is connectting to the new pr-helper,
>> qemu will never send disconnect to libvirt, and libvirt will never
>> receive connected event.
> 
> I think this would let a guest "spam" events just by sending a lot PR
> commands.  Also, as you said, in this case QEMU has never sent a
> "connected" event, so I'm not sure why it should send a disconnection event.

So pr manager is initialized on the first PR command and not when qemu 
is starting?

If a user inside the guest could somehow kill pr-helper process in the 
host then yes, they could spam libvirt/qemu. But if a user from inside a 
guest can kill a process in the host that is much bigger problem than 
spaming libvirt.

> 
> Does libvirt monitor at all the pr-helper to check if it dies?  Or does
> it rely exclusively on QEMU's events?

Libvirt relies solely on QEMU's events. Just like with qemu process 
itself, libvirt can't rely on SIGCHILD because the daemon might be 
restarted which would reparent all qemu and pr-helper processes 
rendering libvirt wait for SIGCHILD useless.

But there is an exception to this: when libvirt is spawning pr-helper it 
does so by following these steps:

1) Try to acquire (lock) pidfile
2) unlink(socket)
3) spawn pr-helper process (this yields child's PID)
4) wait some time until socket is created
5) some follow up work (move child's PID into same cgroup as qemu's main 
thread, relabel the socket so that qemu can access it)

If any of these steps fails then child is killed. However, the PID is 
not recorded anywhere and thus is forgotten once control jumps out of 
the function.

Michal

