Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA52B1AF2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:15:35 +0100 (CET)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXzK-0002Ze-Bn
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXxF-00028F-DT
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXxC-0004td-1b
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605269600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P3117fRc5vGD+LLFCVuKx5jgLq4P6zZu9np1hgnesYM=;
 b=AMnSTvg+iQZl6xEm+E0J+l5Rc8JBW0Xns9HKF4Yk2NWYkShV3gXRirNcQBZZK2rx0EfUB0
 quBYjyVcpTHiixIlAahxV/qQsf3px5IHbK73YdZ5pz3+fp+Arm/OcRRkEUGKczgBPl6WOK
 EuZNk0CMHmbJirki/F5xARkxds9M7hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-9QrQkPqlOL6Oras5n0uaSg-1; Fri, 13 Nov 2020 07:13:17 -0500
X-MC-Unique: 9QrQkPqlOL6Oras5n0uaSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A46110B9CA6;
 Fri, 13 Nov 2020 12:13:16 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40EE5D9E8;
 Fri, 13 Nov 2020 12:13:14 +0000 (UTC)
Date: Fri, 13 Nov 2020 12:13:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com
Subject: Re: [PATCH for-5.2 0/3] hmp: Fix arg evaluation crash (regression)
Message-ID: <20201113121311.GI3251@work-vm>
References: <20201113114326.97663-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113114326.97663-1-kwolf@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: lichun@ruijie.com.cn, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> When I restricted the section where the current monitor is set to only
> the command handler, I missed that monitor_parse_arguments() can use it
> indirectly, too, when evaluating register variables. These cases get
> NULL now and crash (easy to reproduce with "x $pc").
> 
> This series passes the right monitor object down instead of using
> monitor_cur(), which fixes the crash.

Why didn't the test-hmp.c find this?  It has a 'p $pc + 8'

Dave


> Kevin Wolf (3):
>   hmp: Pass monitor to mon_get_cpu()
>   hmp: Pass monitor to MonitorDef.get_value()
>   hmp: Pass monitor to mon_get_cpu_env()
> 
>  include/monitor/hmp-target.h |  7 ++++---
>  monitor/monitor-internal.h   |  2 +-
>  monitor/hmp.c                |  2 +-
>  monitor/misc.c               | 24 ++++++++++++------------
>  target/i386/monitor.c        | 11 ++++++-----
>  target/m68k/monitor.c        |  2 +-
>  target/nios2/monitor.c       |  2 +-
>  target/ppc/monitor.c         | 22 +++++++++++++---------
>  target/riscv/monitor.c       |  2 +-
>  target/sh4/monitor.c         |  2 +-
>  target/sparc/monitor.c       | 12 +++++++-----
>  target/xtensa/monitor.c      |  2 +-
>  12 files changed, 49 insertions(+), 41 deletions(-)
> 
> -- 
> 2.28.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


