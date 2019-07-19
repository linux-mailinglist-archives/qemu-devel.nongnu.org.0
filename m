Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378AA6E656
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:27:59 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoSvW-0002oi-2i
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35313)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hoStw-0004ZU-KO
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hoStv-0008CI-Km
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:26:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hoStt-00089F-Nq; Fri, 19 Jul 2019 09:26:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1768D80F6D;
 Fri, 19 Jul 2019 13:26:17 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 497901001B03;
 Fri, 19 Jul 2019 13:26:14 +0000 (UTC)
Date: Fri, 19 Jul 2019 15:26:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190719132612.GB5036@dhcp-200-226.str.redhat.com>
References: <20190612220839.1374-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612220839.1374-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 19 Jul 2019 13:26:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] vl: Drain before (block) job cancel
 when quitting
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.06.2019 um 00:08 hat Max Reitz geschrieben:
> Quitting qemu should lead to qemu exiting pretty much immediately.  That
> means if you have a block job running on a throttled block node, the
> node should ignore its throttling and the job should be cancelled
> immediately.
> 
> Unfortunately, that is not what happens.  Currently, the node will be
> drained (with a bdrv_drain_all()), and then again unquiesced (because
> bdrv_drain_all() ends).  Then, the block job is cancelled; but at this
> point, the node is no longer drained, so it will block, as it befits a
> throttling node.
> 
> To fix this issue, we have to keep all nodes drained while we cancel all
> block jobs when quitting qemu.  This will make the throttle node ignore
> its throttling and thus let the block job cancel immediately.

Thanks, applied to the block branch.

Kevin

