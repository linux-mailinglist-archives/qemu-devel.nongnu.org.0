Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55350C0B8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 22:41:17 +0200 (CEST)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni05c-0001QT-IL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 16:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ni043-0000iH-RV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ni041-0006df-Dc
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650659976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XCF7Z7gR2OKAUyoibeE1uBX593aKMHLcseCNxnfsp74=;
 b=SjRU+lAoZAdkzTZvPq/hjg96nr+sRf1m+PSxdXIEhv4UEkeb5m022U2s3uhTiim8wfbLw2
 6Wkq7lIBcuvOdCpKgPrmofm0C3h60ktBHuNzerb1EQWso+3q733iQnGWqqFWfUdamw2FXj
 QVXyCd4xIpxBOYzgidY8CL6QBcGK08k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-D-k9c1kPNLWf7zZtfsEJYg-1; Fri, 22 Apr 2022 16:39:33 -0400
X-MC-Unique: D-k9c1kPNLWf7zZtfsEJYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADB25800882;
 Fri, 22 Apr 2022 20:39:32 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E07740F4940;
 Fri, 22 Apr 2022 20:39:31 +0000 (UTC)
Date: Fri, 22 Apr 2022 15:39:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v2 for-7.1 0/9] nbd: actually make s->state thread-safe
Message-ID: <20220422203929.pda7xohcuwesp4cn@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220416190341.561cb3ff@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220416190341.561cb3ff@gecko.fritz.box>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, v.sementsov-og@mail.ru,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 16, 2022 at 07:03:57PM +0000, Lukas Straub wrote:
> On Thu, 14 Apr 2022 19:57:47 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > The main point of this series is patch 7, which removes the dubious and
> > probably wrong use of atomics in block/nbd.c.  This in turn is enabled
> > mostly by the cleanups in patches 3-5.  Together, they introduce a
> > QemuMutex that synchronizes the NBD client coroutines, the reconnect_delay
> > timer and nbd_cancel_in_flight() as well.
> > 
> > The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
> > and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
> > by s->send_mutex.
> > 
> > The rest is bugfixes, simplifying the code a bit, and extra documentation.

> For the whole series:
> 
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>

I've queued the series through my NBD tree for a pull request in the next week.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


