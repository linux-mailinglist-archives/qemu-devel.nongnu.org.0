Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB32BDC35
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 12:34:02 +0200 (CEST)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD4cT-0003kL-3d
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 06:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iD4b9-00032x-Bf
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iD4b7-0005I0-RW
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:32:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iD4b7-0005Hd-KX
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:32:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AD8E30860D6
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 10:32:36 +0000 (UTC)
Received: from work-vm (ovpn-117-251.ams2.redhat.com [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3838510013D9;
 Wed, 25 Sep 2019 10:32:34 +0000 (UTC)
Date: Wed, 25 Sep 2019 11:32:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Subject: Re: [Qemu-devel] [PATCH v3 0/5] Automatic RCU read unlock
Message-ID: <20190925103232.GD21544@work-vm>
References: <20190913102538.24167-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913102538.24167-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 25 Sep 2019 10:32:36 +0000 (UTC)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This patch uses glib's g_auto mechanism to automatically free
> rcu_read_lock's at the end of the block.  Given that humans
> have a habit of forgetting an error path somewhere it's
> best to leave it to the compiler.

Queued

> v3
>   Add block-head version of macro
>   Rename
>   Add docs
>   Convert more cases using the block-head version
> 
> Dr. David Alan Gilbert (5):
>   rcu: Add automatically released rcu_read_lock variants
>   migration: Fix missing rcu_read_unlock
>   migration: Use automatic rcu_read unlock in ram.c
>   migration: Use automatic rcu_read unlock in rdma.c
>   rcu: Use automatic rc_read unlock in core memory/exec code
> 
>  docs/devel/rcu.txt      |  16 +++
>  exec.c                  | 120 +++++++---------
>  include/exec/ram_addr.h | 138 +++++++++----------
>  include/qemu/rcu.h      |  25 ++++
>  memory.c                |  15 +-
>  migration/ram.c         | 295 +++++++++++++++++++---------------------
>  migration/rdma.c        |  57 ++------
>  7 files changed, 310 insertions(+), 356 deletions(-)
> 
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

