Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B96C2353
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 16:32:28 +0200 (CEST)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEwiw-0001VC-AH
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 10:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iEwgc-0000Vb-AO
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 10:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iEwgZ-0005nG-FF
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 10:30:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iEwgZ-0005n6-9p
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 10:29:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22D913086258;
 Mon, 30 Sep 2019 14:29:58 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D57819C6A;
 Mon, 30 Sep 2019 14:29:57 +0000 (UTC)
Date: Mon, 30 Sep 2019 15:29:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Felipe Franciosi <felipe@nutanix.com>
Subject: Re: Thoughts on VM fence infrastructure
Message-ID: <20190930142954.GA2801@work-vm>
References: <42837590-2563-412B-ADED-57B8A10A8E68@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42837590-2563-412B-ADED-57B8A10A8E68@nutanix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 30 Sep 2019 14:29:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Aditya Ramesh <aramesh@nutanix.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Felipe Franciosi (felipe@nutanix.com) wrote:
> Heyall,
> 
> We have a use case where a host should self-fence (and all VMs should
> die) if it doesn't hear back from a heartbeat within a certain time
> period. Lots of ideas were floated around where libvirt could take
> care of killing VMs or a separate service could do it. The concern
> with those is that various failures could lead to _those_ services
> being unavailable and the fencing wouldn't be enforced as it should.
> 
> Ultimately, it feels like Qemu should be responsible for this
> heartbeat and exit (or execute a custom callback) on timeout.

It doesn't feel doing it inside qemu would be any safer;  something
outside QEMU can forcibly emit a kill -9 and qemu *will* stop.

> Does something already exist for this purpose which could be used?
> Would a generic Qemu-fencing infrastructure be something of interest?
Dave


> Cheers,
> F.
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

